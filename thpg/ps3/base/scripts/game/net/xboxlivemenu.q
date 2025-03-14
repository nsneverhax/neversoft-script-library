xboxlive_shown_esrb_logo = 0
xboxlive_pulled_the_old_switcheroo = 0
xboxlive_num_results = 0
xboxlive_levelselect_pak_loaded = 0
xbox_live_menu_with_options_button = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
		{
			text = "\\b0 Xbox LIVE OPTIONS"
		}
	]
	additional_event_handlers = [
		{
			pad_space
			xboxlive_menu_options_push
		}
	]
}
xbox360_live_menu_with_options_button = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
xbox_live_menu_with_feedback = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 FEEDBACK"
		}
	]
}
ps3_live_menu_with_feedback = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}

script xbox_live_start_quickmatch 
	printf "--- xbox_live_start_quickmatch"
	netsessionfunc obj = match func = stop_server_list
	netsessionfunc obj = match func = free_server_list
	if gotparam ranked
		SetPreferencesFromUI {prefs = network field = 'ranked' string = "Ranked" checksum = ranked num = 0}
	else
		SetPreferencesFromUI {prefs = network field = 'ranked' string = "Player" checksum = player num = 1}
	endif
	xboxlive_set_search_params
	netsessionfunc obj = match func = set_server_list_mode params = {quickmatch}
	netsessionfunc obj = match func = start_server_list
	menu_stack_push menu_script = xbox_live_launch_session_find_dialog
endscript

script xbox_live_launch_session_find_dialog 
	if isxenon
		title_text = "Xbox LIVE"
	else
		title_text = "Online"
	endif
	xboxlive_dialog_box {
		title = <title_text>
		text = "Finding session..."
		buttons = [
			{text = "CANCEL" pad_choose_script = xboxlive_menu_search_cancel}
		]
		no_bg
	}
endscript

script xbox_live_start_optimatch 
	printf \{"xbox_live_start --- %d"
		d = UseSessionAPI}
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	netsessionfunc \{obj = match
		func = set_server_list_mode
		params = {
			optimatch
		}}
	netsessionfunc \{obj = match
		func = start_server_list}
endscript

script xboxlive_host_game 
	printf "--- xboxlive_host_game"
	net_wager_can_host_game
	if (<can_wager> = 0)
		return
	endif
	menu_stack_clear
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if gotparam from_net_view_goals
		printf "from_net_view_goals additional setup"
		xenon_singleplayer_session_begin_uninit
		netsessionfunc obj = session func = unpost_game
		change_gamemode_net
		setnetworkmode $internet_mode
		setup_sessionfuncs
		change net_entered_from_singleplayer = 1
		getcurrentlevel
		change net_last_singleplayer_level = <level>
	else
		change_gamemode_net
		setnetworkmode $internet_mode
		setup_sessionfuncs
		change net_entered_from_singleplayer = 0
	endif
	chosen_host_game
endscript

script xboxlive_dialog_box 
	create_dialog_box {
		pos = (322.0, 240.0)
		destroy_on_event = 0
		<...>
	}
endscript

script xboxlive_dialog_box_exit 
	dialog_box_exit \{no_pad_start}
endscript

script xboxlive_menus_active 
	if menu_stack_can_pop_menu
		return \{true}
	endif
	if infrontend
		if gamemodeequals \{is_net}
			<special_case_net_flow_dialogs> = [
				select_skater_anchor
				select_skater_ready_anchor
				edit_tricks_sub_menu_anchor
				edit_tricks_pre_menu
			]
			getarraysize \{special_case_net_flow_dialogs}
			<i> = 0
			begin
			if screenelementexists id = (<special_case_net_flow_dialogs> [<i>])
				return \{true}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script xboxlive_lost_connection_ui_cleanup 
	rv = false
	if xboxlive_menus_active
		rv = true
	endif
	menu_stack_clear
	xboxlive_logon_status_kill
	xboxlive_menu_friends_close
	killspawnedscript name = async_update_friends_list
	killspawnedscript name = xboxlive_menu_async_retrieve_message
	killspawnedscript name = async_check_for_any_accounts
	killspawnedscript name = async_check_for_changed_accounts
	change xboxlive_shown_esrb_logo = 0
	if checksumequals a = <rv> b = true
		xboxlive_voice_attachment_finished
		xboxlive_menu_friends_close
		xboxlive_dialog_box_exit
		menus = [
			create_menu
			optimatch_menu
			current_menu_anchor
		]
		getarraysize menus
		i = 0
		begin
		kill_panel_message_if_it_exists id = (<menus> [<i>])
		i = (<i> + 1)
		repeat <array_size>
		if infrontend
			create_main_menu
		else
			pause_game_and_create_pause_menu
		endif
	endif
	return <rv>
endscript
xbox_live_launch_params = {
}

script launch_xbox_live 
	printf "--- launch_xbox_live"
	generic_ui_destroy
	change xbox_live_launch_params = {($xbox_live_launch_params) <...>}
	if NOT screenelementexists id = dialog_box_container
		if NOT game_progress_has_valid_save
			change RetryScript = launch_xbox_live
			change abortscript = launch_xbox_live_continue
			check_card load filetype = progress
			memcard_validate_known_device
			mc_waitasyncopsfinished
			mc_enumeratefolders
			if gotparam folderlisting
				if NOT screenelementexists id = dialog_xbox_anchor
					create_dialog_box {
						anchor_id = dialog_xbox_anchor
						title = "No story loaded!"
						text = "Would you like to load your story save so you can play as your custom skater and use unlocked abilities?"
						pos = (320.0, 240.0)
						just = [center center]
						buttons = [{font = text_a1 text = "YES" pad_choose_script = launch_xbox_live_load_game_sequence}
							{font = text_a1 text = "NO" pad_choose_script = launch_xbox_live_continue}
						]
					}
				endif
				return
			endif
		endif
	endif
	launch_xbox_live_continue <...>
endscript

script launch_xbox_live_continue_abort 
	fadetoblack \{off
		time = 0
		no_wait}
	back_from_internet_menu
endscript

script launch_xbox_live_continue 
	if NOT checkforsignin
		printf 'WARNING: launch_xbox_live_continue exiting, player not signed in'
		launch_xbox_live_continue_abort
		return
	endif
	addparams ($xbox_live_launch_params)
	if screenelementexists id = dialog_xbox_anchor
		destroyscreenelement id = dialog_xbox_anchor
	endif
	setnetworkmode ($internet_mode)
	if istrue $AutoLaunchHostNetLevel
		change dont_unhide_loading_screen = 0
		wait 30 frames
		hideloadingscreen
		if istrue $AutoLaunchClient
			net_autotest_timeout_script_spawner message = "Net Debug: timeout finding a game"
			chosen_client_game
			return
		else
			net_autotest_timeout_script_spawner message = "Net Debug: timeout starting a game"
			chosen_host_game
			return
		endif
	endif
	change xbox_live_launch_params = {}
	xboxlive_menu_create <...>
endscript

script back_from_internet_menu 
	printf \{"--- back_from_internet_menu"}
	console_destroy
	netsessionfunc \{obj = match
		func = leave_lobby}
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	netsessionfunc \{obj = match
		func = logoff}
	generic_menu_pad_back_sound
	back_from_internet_options
endscript

script back_from_internet_options 
	printf "--- back_from_internet_options"
	netsessionfunc func = match_uninit
	netsessionfunc func = content_uninit
	if (isxenon)
		if gotparam sign_out
			netsessionfunc func = stats_uninit
			netsessionfunc func = voice_uninit
			netsessionfunc func = presence_uninit
			netsessionfunc func = auth_uninit
		endif
	else
		netsessionfunc func = stats_uninit
		netsessionfunc func = voice_uninit
		netsessionfunc func = presence_uninit
		netsessionfunc func = auth_uninit
	endif
	change needstodownloadstats = 1
	setnetworkmode
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	ui_change_state state = uistate_mainmenu
endscript

script back_from_network_select_menu 
	setnetworkmode
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
		wait \{1
			frame}
	endif
endscript

script disconnect_from_internet 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	DisconnectFromInternet \{callback = failed_internet_connection}
endscript

script xboxlive_exit_internet_menu 
	printf \{"--- xboxlive_exit_internet_menu"}
	back_from_internet_menu
endscript

script xboxlive_menu_create 
	printf "--- xboxlive_menu_create"
	GetCurrentSkaterProfileIndex
	GetSkaterProfileInfo player = <currentskaterprofileindex>
	printf "%d" d = $internet_mode
	setnetworkmode ($internet_mode)
	menu_stack_push {
		menu_script = xboxlive_exit_internet_menu
		no_create
	}
	netsessionfunc func = match_uninit
	netsessionfunc func = match_init
	netsessionfunc func = voice_uninit
	netsessionfunc func = voice_init
	netsessionfunc obj = voice func = enable
	if isxenon
		netsessionfunc obj = match func = get_gamertag
		SetPreferencesFromUI prefs = network field = 'network_id' string = <name>
		SetPreferencesFromUI prefs = network field = 'server_name' string = <name>
	endif
	if AcceptedGameInvite
		if NOT joininviteserver
			launch_xbox_live_continue_abort
			return
		endif
	else
		xboxlive_menu_lobby_push
	endif
endscript

script xboxlive_menu_back 
	printf \{"--- xboxlive_menu_back"}
	menu_stack_pop
	menu_stack_clear
	netsessionfunc \{func = match_uninit}
	netsessionfunc \{func = voice_uninit}
endscript

script xboxlive_menu_sign_off 
	xboxlive_dialog_box_exit
	back_from_internet_options \{sign_out}
	change \{signedin = 0}
	change \{xboxlive_shown_esrb_logo = 0}
	xboxlive_logon_status_update \{text = ""}
	xboxlive_logon_status_kill
	menu_stack_clear
endscript

script xboxlive_menu_back_from_dialog 
	xboxlive_dialog_box_exit
	if screenelementexists \{id = current_menu_anchor}
		setscreenelementlock \{id = current_menu_anchor
			off}
		create_helper_text \{xbox360_live_menu_with_options_button}
	endif
	launchevent \{type = focus
		target = current_menu}
endscript

script xboxlive_menu_sign_off_confirm back_script = xboxlive_menu_back_from_dialog
	launchevent type = unfocus target = current_menu
	xboxlive_dialog_box {
		title = "SIGN OUT?"
		text = "Are you sure you want to sign out?"
		text_dims = (400.0, 0.0)
		pad_back_script = <back_script>
		no_bg
		buttons = [
			{text = "YES" pad_choose_script = xboxlive_menu_sign_off}
			{text = "NO" pad_choose_script = <back_script>}
		]
	}
endscript

script xboxlive_menu_ignore_invited_session 
	netsessionfunc \{func = ignore_invited_session}
	xboxlive_dialog_box_exit
	menu_stack_pop
endscript

script xboxlive_menu_find_invited_session 
	netsessionfunc \{obj = match
		func = join_invited_session}
	netsessionfunc \{func = clear_invited_session}
	xboxlive_dialog_box_exit
	xbox_live_launch_session_find_dialog
endscript

script xboxlive_menu_lobby_push 
	printf \{"--- xboxlive_menu_lobby_push"}
	printstruct <...>
	change \{xboxlive_num_results = 0}
	pause_menu_fmv_play
	if NOT isxenon
		tmpText = "OPTIMATCH"
	else
		tmpText = "CUSTOM MATCH"
	endif
	setbuttoneventmappings \{unblock_menu_input}
	menu_stack_push \{menu_script = ui_create_net_view_goals}
endscript

script xboxlive_lobby_exit_to_skater_select 
	ui_change_state \{state = UIstate_net_skaterselect}
endscript

script xboxlive_lobby_exit_to_remaptricks 
	ui_change_state \{state = UIstate_remaptricks}
endscript

script xboxlive_menu_leaderboard_push 
	printf \{"--- xboxlive_menu_leaderboard_push"}
	menu_stack_push menu_script = ui_create_leaderboard <...>
endscript

script xbox_live_launch_invitamatch_dialog 
	netsessionfunc obj = auth func = get_user_device_index
	menu_text = ("Would you like to join " + <inviter> + "'s game?")
	xboxlive_dialog_box {
		title = "JOIN GAME?"
		text = <menu_text>
		exclusive_device = <user_index>
		buttons = [
			{text = "YES" pad_choose_script = xboxlive_menu_find_invited_session}
			{text = "NO" pad_choose_script = xboxlive_menu_ignore_invited_session}
		]
		no_bg
	}
endscript

script xboxlive_menu_optimatch_results_push 
	printf \{"--- xboxlive_menu_optimatch_results_push"}
	menu_stack_push \{menu_script = xboxlive_menu_optimatch_results_create}
endscript

script xboxlive_menu_optimatch_results_create {
		menu_id = optimatch_results_menu
		vmenu_id = optimatch_results_vmenu
		pad_back_script = menu_stack_pop
		pos = (100.0, 120.0)
		dims = (350.0, 480.0)
		parent = root_window
		internal_text_just = left
		internal_text_offset = (0.0, 0.0)
		spacing = 1
		arrow_up = arrow_up
		arrow_down = arrow_down
		arrow_rgba = ($cas_color_scheme.arrow_color)
		pad_back_sound = generic_pause_exit_sound
		add_tab = 1
		title_rotation = 0
		title_rgba = ($cas_color_scheme.title_color)
		vert_bg_scale = (0.75, 0.75)
	}
	printf "--- xboxlive_menu_optimatch_results_create"
	if screenelementexists id = optimatch_results_menu
		destroyscreenelement id = optimatch_results_menu
	endif
	change xboxlive_num_results = 0
	current_color_scheme = $ss_color_scheme
	main_title = "SESSIONS"
	make_cas_menu {
		title = <main_title>
		pad_back_script = <pad_back_script>
		menu_id = optimatch_results_menu
		vmenu_id = optimatch_results_vmenu
		color_scheme = <current_color_scheme>
		pausemenu
	}
	current_menu_anchor :settags current_color_scheme = <current_color_scheme>
	setscreenelementprops {
		id = optimatch_results_vmenu
		event_handlers = [
			{pad_option menu_stack_create_latest}
		]
	}
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		local_id = <server_id>
		pos = (142.0, 93.0)
	}
	parent_id = <id>
	createscreenelement {
		parent = <parent_id>
		type = spriteelement
		texture = white
		scale = (132 * (1.0, 0.0) + (0.0, 6.3))
		just = [left top]
		pos = (-65.0, 0.0)
		rgba = (<current_color_scheme>.title_bg)
		z_priority = 1
	}
	curPos = (0.0, 0.0)
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = name
		pos = <curPos>
		text = "GAMERTAG"
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	<curPos> = (<curPos> + (175.0, 0.0))
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = game_type
		pos = <curPos>
		text = "GAME TYPE"
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	<curPos> = (<curPos> + (100.0, 0.0))
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = area
		pos = <curPos>
		text = "AREA"
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	<curPos> = (<curPos> + (75.0, 0.0))
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = freq
		pos = <curPos>
		text = "FREQ."
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	<curPos> = (<curPos> + (45.0, 0.0))
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = players
		pos = <curPos>
		text = "PLAYERS"
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	if isxenon
		title_text = "Xbox LIVE"
	else
		title_text = "Online"
	endif
	xboxlive_dialog_box {
		title = <title_text>
		text = "Finding sessions..."
		buttons = [
			{text = "STOP" pad_choose_script = xboxlive_menu_optimatch_results_stop}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_search_cancel}
		]
		no_bg
	}
	xboxlive_set_search_params
	xbox_live_start_optimatch
	current_menu :getsingletag highlight_parent
	if screenelementexists id = {<highlight_parent> child = cas_menu_highlight}
		doscreenelementmorph id = {<highlight_parent> child = cas_menu_highlight} pos = (0.0, -500.0)
	endif
	doscreenelementmorph id = {current_menu_anchor child = 0} alpha = 1 time = 0.2
endscript

script xboxlive_set_search_params 
	printf "--- xboxlive_set_search_params"
	getpreferencechecksum pref_type = network game_type_optimatch
	gamemode = <checksum>
	level = ($xboxlive_search_level_checksum)
	getpreferencechecksum pref_type = network num_players_optimatch
	maxplayers = <checksum>
	getpreferencevalue pref_type = network num_players
	num_players_value = <value>
	getpreferencechecksum pref_type = network skill_level_optimatch
	skilllevel = <checksum>
	getpreferencechecksum pref_type = network ranked
	ranked = <checksum>
	getpreferencevalue pref_type = network ranked
	ranked_value = <value>
	getpreferencechecksum pref_type = network game_wager_type
	wagers = <checksum>
	net_wager_get_largest_wager_amount
	printstruct <...>
	netsessionfunc obj = match func = set_search_params params = <...>
endscript

script xboxlive_menu_host_push 
	printf \{"--- xboxlive_menu_host_push"}
	menu_stack_push menu_script = xboxlive_menu_host_create <...>
endscript

script edit_tricks_push 
	printf \{"--- edit_tricks_push"}
	menu_stack_push menu_script = xboxlive_menu_host_create <...>
endscript

script xboxlive_menu_optimatch_push 
	printf \{"--- xboxlive_menu_optimatch_push"}
	menu_stack_push menu_script = xboxlive_menu_optimatch_create <...>
endscript

script xboxlive_please_load_levelselect_pak 
	printf "--- xboxlive_please_load_levelselect_pak"
	if NOT gotparam unload
		if ($xboxlive_levelselect_pak_loaded = 0)
			loadpak 'pak/levelselect/levelselect.pak' heap = scratch
			change xboxlive_levelselect_pak_loaded = 1
		endif
	else
		if ($xboxlive_levelselect_pak_loaded = 1)
			printf "Unload"
			change xboxlive_levelselect_pak_loaded = 0
			unloadpak 'pak/levelselect/levelselect.pak' heap = scratch
			waitunloadpak 'pak/levelselect/levelselect.pak' heap = scratch
		endif
	endif
endscript

script xboxlive_menu_optimatch_create 
	printf "--- xboxlive_menu_optimatch_create"
	if ($net_layer_ready_for_input = 0)
		return
	endif
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 1)
		return
	endif
	done_script = xboxlive_menu_optimatch_results_push
	done_params = {}
	back_script = xboxlive_menu_unload_levelselect_pop
	back_params = {}
	if gotparam from_net_view_goals
		done_script = net_view_goals_return_cleanly
		done_params = {did_custom}
		back_script = net_view_goals_return_cleanly
	endif
	make_cas_menu {
		title = "CUSTOM MATCH"
		right_bracket_alpha = 0.0
		menu_id = net_create_match_menu
		vmenu_id = net_create_match_vmenu
		pad_back_script = <back_script>
		pad_back_params = <back_params>
		pausemenu
		width = 525
		highlight_add = (50.0, 0.0)
	}
	setscreenelementprops {
		id = pause_back_container
		pos = (0.0, -65.0)
	}
	setscreenelementprops {
		id = net_create_match_vmenu
		pos = (160.0, 160.0)
	}
	net_view_goals_setup_map parent = net_create_match_menu
	prefs = network
	GetPreferenceString pref_type = <prefs> ranked
	if isxenon
		option_arrows_callback_params = {
			id = net_game_type
			type = network
			pref_field = ranked
			string_field = 'ranked'
			array = $ranked_info
			setnum
			additonal_script = wagers_do_proper_setting
		}
	else
		option_arrows_callback_params = {
			id = net_game_type
			type = network
			pref_field = ranked
			string_field = 'ranked'
			array = $ps3_ranked_info
			setnum
			additonal_script = wagers_do_proper_setting
		}
	endif
	add_cas_menu_item {
		text = "MATCH"
		extra_text = <ui_string>
		id = net_game_type
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <option_arrows_callback_params>
	}
	adjust_create_match_option_array <option_arrows_callback_params>
	GetPreferenceString pref_type = <prefs> num_players_optimatch
	option_arrows_callback_params = {
		id = net_num_players
		type = network
		pref_field = num_players_optimatch
		string_field = 'num_players_optimatch'
		array = $num_players_info
		thisId = net_create_match_menu
		inviteid = net_num_invite_slots
		setnum
		showDontCare
	}
	add_cas_menu_item {
		text = "# OF PLAYERS"
		extra_text = <ui_string>
		id = net_num_players
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <option_arrows_callback_params>
	}
	adjust_create_match_option_array <option_arrows_callback_params>
	getpreferencevalue pref_type = network num_players
	net_create_match_menu :settags maxplayers = <value>
	GetPreferenceString pref_type = <prefs> level_optimatch
	add_cas_menu_item {
		text = "AREA"
		extra_text = <ui_string>
		id = net_area_select
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = {
			id = net_area_select
			type = network
			pref_field = level_optimatch
			string_field = 'level_optimatch'
			array = $online_level_select_menu_level_info
			level
			showDontCare
		}
	}
	area_container = <item_container_id>
	add_cas_menu_item {
		text = "DONE"
		id = menu_network_host_options_score_mode
		pad_choose_script = <done_script>
		pad_choose_params = {<done_params>}
	}
	xboxlive_menu_host_create_extra_helper_ui search
	xboxlive_menu_create_cash_to_blow
	adjust_create_match_option_array {
		id = net_area_select
		type = network
		pref_field = level
		string_field = 'level'
		array = $online_level_select_menu_level_info
		level
		showDontCare
	}
	cas_menu_finish
	cas_item_resize id = <area_container> cas_item_resize_extras
endscript

script wagers_do_proper_setting 
	printf "--- wagers_do_proper_setting"
	getpreferencechecksum pref_type = network ranked
	switch <checksum>
		case player
		SetPreferencesFromUI prefs = network field = 'game_wager_type' string = "No Wagers" checksum = no_wagers
		case ranked
		SetPreferencesFromUI prefs = network field = 'game_wager_type' string = "Wagers" checksum = wagers
	endswitch
endscript

script get_max_level_index 
	getpreferencechecksum \{pref_type = network
		allow_cap_pieces}
	max_index = 4
	if checksumequals a = no_pieces b = <checksum>
		max_index = 3
	endif
	return max_index = <max_index>
endscript

script adjust_create_match_option_array 
	printf "--- adjust_create_match_option_array"
	myid = <id>
	if gotparam limit
		<thisId> :gettags
	endif
	if gotparam setLimit
		<thisId> :gettags
	endif
	getpreferencechecksum pref_type = <type> <pref_field>
	pref_checksum = <checksum>
	if gotparam level
		<name> = text
		<checksum> = checksum
		pref_checksum = ($xboxlive_search_level_checksum)
	else
		<name> = name
		<checksum> = checksum
	endif
	getarraysize <array>
	if gotparam level
		printf "got level"
		get_max_level_index
	endif
	getarraysize <array>
	if gotparam max_index
		<array_size> = (<max_index> + 1)
	endif
	foundIndex = 0
	<currIndex> = 0
	begin
	printf "comparing %d and %e" d = <pref_checksum> e = (<array> [<currIndex>].<checksum>)
	if checksumequals a = <pref_checksum> b = (<array> [<currIndex>].<checksum>)
		printf "found it!"
		foundIndex = 1
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat <array_size>
	if (<foundIndex> = 0)
		<currIndex> = 0
	endif
	<minIndex> = 0
	if gotparam showDontCare
		<minIndex> = -1
		if (<foundIndex> = 0)
			currIndex = -1
		endif
		if checksumequals a = <pref_checksum> b = dont_care
			<currIndex> = <minIndex>
		endif
	endif
	if gotparam left
		if (<currIndex> > <minIndex>)
			<currIndex> = (<currIndex> - 1)
			if gotparam setnum
				if (<currIndex> > -1)
					theNum = (<array> [<currIndex>].num)
				else
					theNum = 0
				endif
			else
				theNum = 0
			endif
			if gotparam limit
				<thisId> :getsingletag inviteSlots
				<thisId> :settags inviteSlots = (<array> [<currIndex>].num)
			endif
			if isxenon
				if gotparam setLimit
					<thisId> :settags maxplayers = <theNum>
					if (<theNum> < <inviteSlots>)
						SetNetInviteNum num = (<theNum> -1) id = <inviteid>
					endif
				endif
			endif
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if (<currIndex> < (<array_size> - 1))
				<currIndex> = (<currIndex> + 1)
				if gotparam setnum
					theNum = (<array> [<currIndex>].num)
				else
					theNum = 0
				endif
				if isxenon
					if gotparam limit
						<thisId> :getsingletag inviteSlots
						<thisId> :settags inviteSlots = (<array> [<currIndex>].num)
						if (<array> [<currIndex>].num = <maxplayers>)
							return
						endif
					endif
				endif
				if gotparam setLimit
					<thisId> :settags maxplayers = <theNum>
				endif
				soundevent event = Pause_Menu_Scroll_RIGHT_SFX
			endif
		endif
	endif
	if gotparam level
		tempIndex = <currIndex>
		if (<currIndex> = -1)
			tempIndex = 0
		endif
		printf "temp index %a" a = <tempIndex>
		current_menu_anchor :settags currIndex = <currIndex>
		change prevarea = ''
		change newarea = (<array> [<tempIndex>].area_pak)
		printf "new area %a" a = (<array> [<tempIndex>].area_pak)
		new_text = (<array> [<tempIndex>].<name>)
		map_icon = (<array> [<tempIndex>].checksum)
		if (<currIndex> = -1)
			map_icon = dont_care
			new_text = "anywhere"
		endif
		xboxlive_menu_host_create_extra_helper_ui_update new_text = <new_text>
		spawnscriptnow moveMapToIcon params = {parent = pause_map local_id = <map_icon> zoom = 1.4}
	endif
	possibly_hide_cas_arrows container_id = <myid> index = (<currIndex> - <minIndex>) size = (<array_size> - <minIndex>)
	if (<currIndex> = -1)
		newChecksum = dont_care
		newName = "Don't Care"
		netLevel = dont_care
	else
		if gotparam level
			newChecksum = (<array> [<currIndex>].level)
			netLevel = (<array> [<currIndex>].<checksum>)
		else
			newChecksum = (<array> [<currIndex>].<checksum>)
		endif
		newName = (<array> [<currIndex>].<name>)
	endif
	if NOT gotparam theNum
		if gotparam setnum
			if NOT (<currIndex> = -1)
				theNum = (<array> [<currIndex>].num)
			endif
		endif
	endif
	if NOT gotparam level
		SetPreferencesFromUI prefs = network field = <string_field> string = <newName> num = <theNum> checksum = <newChecksum> value = <theNum>
	else
		SetPreferencesFromUI prefs = network field = <string_field> string = <newName> num = <theNum> checksum = <newChecksum> value = <theNum>
	endif
	setscreenelementprops {
		id = {<myid> child = extra_text}
		text = <newName>
	}
	if gotparam level
		if checksumequals a = <netLevel> b = dont_care
			change xboxlive_search_level_checksum = dont_care
		else
			change xboxlive_search_level_checksum = (<array> [<currIndex>].checksum)
		endif
	endif
	if gotparam setRank
		PossiblyDisableInvites inviteid = net_num_invite_slots
	endif
	if gotparam additional_script
		<additional_script> <additional_params>
	endif
	if gotparam setWagers
		PossiblyDisableWagers wagerId = <wagerId>
	endif
	if gotparam level
		PossiblyDisableRigger riggerId = <riggerId>
	endif
endscript
xboxlive_search_level_checksum = dont_care

script possibly_hide_cas_arrows 
	<container_id> :getsingletag left_orig_scale
	<container_id> :getsingletag right_orig_scale
	left_arrow_id = {<container_id> child = arrow_left}
	if (<index> = 0)
		if NOT gotparam left_orig_scale
			getscreenelementprops id = <left_arrow_id>
			<container_id> :settags left_orig_scale = <scale>
		endif
		doscreenelementmorph id = <left_arrow_id> scale = 0
	else
		doscreenelementmorph id = <left_arrow_id> scale = <left_orig_scale>
	endif
	right_arrow_id = {<container_id> child = arrow_right}
	if (<index> = (<size> - 1))
		if NOT gotparam right_orig_scale
			getscreenelementprops id = <right_arrow_id>
			<container_id> :settags right_orig_scale = <scale>
		endif
		doscreenelementmorph id = <right_arrow_id> scale = 0
	else
		<container_id> :getsingletag right_orig_scale
		doscreenelementmorph id = <right_arrow_id> scale = <right_orig_scale>
	endif
endscript

script SetNetInviteNum 
	<currIndex> = 0
	InvitesAllowed
	printf "SetNetInviteNum"
	printstruct <...>
	if (<allowed> = 0)
		return
	endif
	begin
	if (<num> = ($num_private_slots [<currIndex>].num))
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat
	SetPreferencesFromUI prefs = network field = 'private_slots' string = ($num_private_slots [<currIndex>].name) checksum = ($num_private_slots [<currIndex>].checksum) value = <theNum> num = <theNum>
	setscreenelementprops {
		id = {<id> child = extra_text}
		text = ($num_private_slots [<currIndex>].name)
	}
endscript

script InvitesAllowed 
	getpreferencechecksum \{pref_type = network
		ranked}
	if checksumequals a = <checksum> b = ranked
		return \{allowed = 0}
	endif
	return \{allowed = 1}
endscript

script PossiblyDisableInvites 
	getpreferencechecksum pref_type = network ranked
	if checksumequals a = <checksum> b = ranked
		if screenelementexists id = {<inviteid> child = extra_text}
			<currIndex> = 0
			begin
			if (0 = ($num_private_slots [<currIndex>].num))
				break
			endif
			<currIndex> = (<currIndex> + 1)
			repeat
			printstruct <...>
			printf "PossiblyDisableInvites : num = %d" d = ($num_private_slots [<currIndex>].num)
			SetPreferencesFromUI prefs = network field = 'private_slots' string = ($num_private_slots [<currIndex>].name) checksum = ($num_private_slots [<currIndex>].checksum) num = ($num_private_slots [<currIndex>].num) value = ($num_private_slots [<currIndex>].num)
			setscreenelementprops {
				id = {<inviteid> child = text}
				rgba = [50 50 50 128]
			}
			setscreenelementprops {
				id = {<inviteid> child = extra_text}
				text = ($num_private_slots [<currIndex>].name)
				rgba = [50 50 50 128]
			}
			setscreenelementprops {
				id = <inviteid>
				not_focusable
			}
		endif
	else
		if screenelementexists id = {<inviteid> child = extra_text}
			setscreenelementprops {
				id = {<inviteid> child = text}
				rgba = ($cas_color_scheme.text_color)
			}
			setscreenelementprops {
				id = {<inviteid> child = extra_text}
				rgba = ($cas_color_scheme.text_color_2)
			}
			setscreenelementprops {
				id = <inviteid>
				focusable
			}
		endif
	endif
endscript

script PossiblyDisableWagers 
	if gotparam wagerId
		if screenelementexists id = <wagerId>
			getpreferencechecksum pref_type = network game_wager_type
			if checksumequals a = <checksum> b = no_wagers
				setscreenelementprops {
					id = {<wagerId> child = text}
					rgba = [50 50 50 128]
				}
				setscreenelementprops {
					id = {<wagerId> child = extra_text}
					rgba = [50 50 50 128]
				}
				setscreenelementprops {
					id = <wagerId>
					not_focusable
				}
			else
				setscreenelementprops {
					id = {<wagerId> child = text}
					rgba = ($cas_color_scheme.text_color)
				}
				setscreenelementprops {
					id = {<wagerId> child = extra_text}
					rgba = ($cas_color_scheme.text_color_2)
				}
				setscreenelementprops {
					id = <wagerId>
					focusable
				}
			endif
		endif
	endif
endscript

script PossiblyDisableRigger 
	printf "--- PossiblyDisableRigger"
	if gotparam riggerId
		if screenelementexists id = <riggerId>
			getpreferencechecksum pref_type = network level
			printstruct <...>
			if checksumequals a = <checksum> b = load_z_crib
				setscreenelementprops {
					id = {<riggerId> child = text}
					rgba = [50 50 50 128]
				}
				setscreenelementprops {
					id = {<riggerId> child = extra_text}
					rgba = [50 50 50 128]
				}
				setscreenelementprops {
					id = <riggerId>
					not_focusable
				}
			else
				setscreenelementprops {
					id = {<riggerId> child = text}
					rgba = ($cas_color_scheme.text_color)
				}
				setscreenelementprops {
					id = {<riggerId> child = extra_text}
					rgba = ($cas_color_scheme.text_color_2)
				}
				setscreenelementprops {
					id = <riggerId>
					focusable
				}
			endif
		endif
	endif
endscript

script xboxlive_menu_host_create 
	printf "--- xboxlive_menu_host_create"
	if ($net_layer_ready_for_input = 0)
		return
	endif
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 1)
		return
	endif
	back_script = xboxlive_menu_unload_levelselect_pop
	back_params = {}
	done_params = {}
	if gotparam from_net_view_goals
		done_script = net_view_goals_return_cleanly
		back_script = net_view_goals_return_cleanly
		done_params = {from_net_view_goals}
	endif
	printstruct <...>
	make_cas_menu {
		title = "MATCH"
		menu_id = net_create_match_menu
		vmenu_id = net_create_match_vmenu
		pad_back_script = <back_script>
		pad_back_params = <back_parms>
		pausemenu
		width = 525
		highlight_add = (50.0, 0.0)
	}
	if isxenon
		createscreenelement {
			type = textblockelement
			id = net_no_crib_helper
			parent = current_menu_anchor
			font = text_a1
			text = "NOTE: Enable rigger pieces to host a game in the skater lounge"
			allow_expansion
			dims = (600.0, 100.0)
			pos = (200.0, 560.0)
			just = [left top]
			scale = 0.6
			alpha = 0
			rgba = ($mainmenu_color_scheme.text_color)
		}
	endif
	setscreenelementprops {
		id = pause_back_container
		pos = (0.0, -65.0)
	}
	setscreenelementprops {
		id = net_create_match_vmenu
		pos = (160.0, 160.0)
	}
	net_view_goals_setup_map parent = net_create_match_menu
	prefs = network
	GetPreferenceString pref_type = <prefs> ranked
	if isxenon
		match_option_arrows_callback_params = {
			id = net_game_type
			type = network
			pref_field = ranked
			string_field = 'ranked'
			array = $ranked_info
			setRank
			setnum
			additional_script = wagers_do_proper_setting
			setWagers
			wagerId = net_wager_amount
		}
	else
		match_option_arrows_callback_params = {
			id = net_game_type
			type = network
			pref_field = ranked
			string_field = 'ranked'
			array = $ps3_ranked_info
			setRank
			setnum
			additional_script = wagers_do_proper_setting
			setWagers
			wagerId = net_wager_amount
		}
	endif
	add_cas_menu_item {
		text = "MATCH"
		extra_text = <ui_string>
		id = net_game_type
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <match_option_arrows_callback_params>
	}
	GetPreferenceString pref_type = <prefs> num_players
	option_arrows_callback_params = {
		id = net_num_players
		type = network
		pref_field = num_players
		string_field = 'num_players'
		array = $num_players_info
		setLimit
		thisId = net_create_match_menu
		inviteid = net_num_invite_slots
		setnum
	}
	add_cas_menu_item {
		text = "# OF PLAYERS"
		extra_text = <ui_string>
		id = net_num_players
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <option_arrows_callback_params>
	}
	adjust_create_match_option_array <option_arrows_callback_params>
	if isxenon
		GetPreferenceString pref_type = <prefs> private_slots
		getpreferencevalue pref_type = <prefs> private_slots
		net_create_match_menu :settags inviteSlots = <value>
		invites_option_arrows_callback_params = {
			id = net_num_invite_slots
			type = network
			pref_field = private_slots
			string_field = 'private_slots'
			array = $num_private_slots
			limit
			thisId = net_create_match_menu
			setnum
		}
		add_cas_menu_item {
			text = "INVITED SLOTS"
			extra_text = <ui_string>
			id = net_num_invite_slots
			option_arrows
			option_arrows_callback = adjust_create_match_option_array
			option_arrows_callback_params = <invites_option_arrows_callback_params>
		}
	endif
	GetPreferenceString pref_type = <prefs> game_wager_amount
	getpreferencevalue pref_type = <prefs> game_wager_amount
	wager_amount_option_arrows_callback_params = {
		id = net_wager_amount
		type = network
		pref_field = game_wager_amount
		string_field = 'game_wager_amount'
		array = $wager_amount_info
		thisId = net_create_match_menu
		setnum
	}
	add_cas_menu_item {
		text = "WAGER AMOUNT"
		extra_text = <ui_string>
		id = net_wager_amount
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <wager_amount_option_arrows_callback_params>
	}
	area_callback_params = {
		id = net_area_select
		type = network
		pref_field = level
		string_field = 'level'
		array = $online_level_select_menu_level_info
		level
		riggerId = net_allow_cap_pieces
	}
	if isxenon
		GetPreferenceString pref_type = <prefs> allow_cap_pieces
		getpreferencevalue pref_type = <prefs> allow_cap_pieces
		allow_cap_option_arrows_callback_params = {
			id = net_allow_cap_pieces
			type = network
			pref_field = allow_cap_pieces
			string_field = 'allow_cap_pieces'
			array = $use_cap_pieces_info
			thisId = net_create_match_menu
			setnum
			additional_script = net_additional_cap_adjust_script
			additional_params = <area_callback_params>
		}
		add_cas_menu_item {
			text = "RIGGER PIECES"
			extra_text = <ui_string>
			id = net_allow_cap_pieces
			option_arrows
			option_arrows_callback = adjust_create_match_option_array
			option_arrows_callback_params = <allow_cap_option_arrows_callback_params>
		}
	endif
	getpreferencevalue pref_type = network num_players
	net_create_match_menu :settags maxplayers = <value>
	GetPreferenceString pref_type = <prefs> level
	add_cas_menu_item {
		text = "AREA"
		extra_text = <ui_string>
		id = net_area_select
		option_arrows
		option_arrows_callback = adjust_create_match_option_array
		option_arrows_callback_params = <area_callback_params>
	}
	area_container = <item_container_id>
	add_cas_menu_item {
		text = "DONE"
		id = menu_network_host_options_score_mode
		pad_choose_script = xboxlive_host_game
		pad_choose_params = <done_params>
	}
	if isxenon
		PossiblyDisableInvites inviteid = net_num_invite_slots
	endif
	xboxlive_menu_host_create_extra_helper_ui
	xboxlive_menu_create_cash_to_blow
	adjust_create_match_option_array {
		id = net_area_select
		type = network
		pref_field = level
		string_field = 'level'
		array = $online_level_select_menu_level_info
		level
	}
	if isxenon
		PossiblyDisableRigger riggerId = net_allow_cap_pieces
	endif
	adjust_create_match_option_array <match_option_arrows_callback_params>
	if isxenon
		adjust_create_match_option_array <invites_option_arrows_callback_params>
	endif
	adjust_create_match_option_array <wager_amount_option_arrows_callback_params>
	if isxenon
		adjust_create_match_option_array <allow_cap_option_arrows_callback_params>
	endif
	adjust_create_match_option_array <area_callback_params>
	cas_menu_finish
	cas_item_resize id = <area_container> cas_item_resize_extras
endscript

script net_additional_cap_adjust_script 
	getpreferencechecksum \{pref_type = network
		allow_cap_pieces}
	if checksumequals a = <checksum> b = no_pieces
		doscreenelementmorph \{id = net_no_crib_helper
			alpha = 1
			time = 0.3}
	else
		doscreenelementmorph \{id = net_no_crib_helper
			alpha = 0
			time = 0.3}
	endif
endscript

script xboxlive_menu_create_cash_to_blow 
	printf "--- xboxlive_menu_create_cash_to_blow"
	careerfunc func = GetCash
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = cash_to_burn_anchor
		pos = (200.0, 110.0)
	}
	cont_id = <id>
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = icon_cash
		just = [left top]
		rgba = [255 255 255 255]
		rot_angle = 30
		scale = 1.8
		z_priority = 1
	}
	careerfunc func = GetCash
	formattext textname = cash_string "cash to blow $%d" d = <cash>
	createscreenelement {
		type = textblockelement
		parent = <cont_id>
		local_id = text
		text = <cash_string>
		font = text_a1
		rgba = [255 255 255 255]
		pos = (130.0, -60.0)
		scale = 0.75
		just = [center top]
		z_priority = 2
		dims = (300.0, 300.0)
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [128 128 128 255]
	}
endscript

script xboxlive_menu_host_create_extra_helper_ui 
	printf "--- xboxlive_menu_host_create_extra_helper_ui"
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = create_match_extra_helper_ui_cont
		pos = (720.0, 500.0)
	}
	cont_id = <id>
	if gotparam search
		<cont_id> :settags mode = search
	else
		<cont_id> :settags mode = host
	endif
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = cap_controlsbg
		just = [left top]
		rgba = [0 0 0 170]
		scale = (3.0, 0.4)
		z_priority = 1
	}
	createscreenelement {
		type = textelement
		parent = <cont_id>
		local_id = text
		text = "TEMP"
		font = text_a1
		rgba = [255 255 255 255]
		pos = (50.0, 30.0)
		scale = 0.75
		just = [left top]
		z_priority = 2
	}
	xboxlive_menu_host_create_extra_helper_ui_update
endscript

script xboxlive_menu_host_create_extra_helper_ui_update new_text = "null"
	printf "--- xboxlive_menu_host_create_extra_helper_ui_update"
	create_match_extra_helper_ui_cont :getsingletag mode
	formattext textname = the_string "host a server in %b" b = <new_text>
	if (<mode> = search)
		formattext textname = the_string "find a server in %b" b = <new_text>
	endif
	if screenelementexists id = {create_match_extra_helper_ui_cont child = text}
		setscreenelementprops {
			id = {create_match_extra_helper_ui_cont child = text}
			text = <the_string>
		}
	endif
endscript

script xboxlive_menu_unload_levelselect_pop 
	menu_stack_pop
endscript

script xboxlive_menu_scoreboard_push 
	create_online_stats_menu
endscript

script xboxlive_menu_back_to_pause 
	menu_stack_clear
	pause_game_and_create_pause_menu
endscript

script xboxlive_menu_options_push \{back_script = menu_stack_pop}
	if gotparam \{from_pause_menu}
		xboxlive_menu_notify_kill
		<back_script> = xboxlive_menu_back_to_pause
	endif
	menu_stack_push {
		menu_script = xboxlive_menu_options_create
		menu_params = {
			back_script = <back_script>
		}
	}
endscript

script xbox360live_menu_options_push \{back_script = menu_stack_pop}
	xboxlive_menu_notify_kill
	<back_script> = temp_back_to_pause_state
	menu_stack_push {
		menu_script = xbox360live_menu_players_create
		menu_params = {
			back_script = <back_script>
		}
	}
endscript

script temp_back_to_pause_state 
	printf \{"temp_back_to_pause_state"}
	printstruct <...>
	ui_change_state \{state = uistate_pausemenu}
endscript

script xboxlive_menu_voice_options_get_text 
	if netsessionfunc \{obj = voice
			func = hasvoicethroughspeakers}
		return \{voice_option_text = "Speakers"}
	else
		return \{voice_option_text = "Headset"}
	endif
endscript

script xboxlive_menu_voice_options_toggle 
	if netsessionfunc \{obj = voice
			func = hasvoicethroughspeakers}
		netsessionfunc \{obj = voice
			func = VoiceThroughHeadset}
	else
		netsessionfunc \{obj = voice
			func = voicethroughspeakers}
	endif
	xboxlive_menu_voice_options_get_text
	obj_getid
	setscreenelementprops id = {<objid> child = extra_text} text = <voice_option_text>
endscript

script xboxlive_update_options_menu 
	if screenelementexists \{id = live_options_menu}
		xboxlive_menu_options_create
	endif
endscript

script xboxlive_menu_appear_online_get_text 
	if netsessionfunc \{obj = presence
			func = is_appearing_online}
		return \{online_text = "YES"}
	else
		return \{online_text = "NO"}
	endif
endscript

script xboxlive_menu_appear_online_toggle 
	if netsessionfunc \{obj = presence
			func = is_appearing_online}
		netsessionfunc \{obj = presence
			func = set_appear_online
			params = {
				on = 0
			}}
	else
		netsessionfunc \{obj = presence
			func = set_appear_online
			params = {
				on = 1
			}}
	endif
	xboxlive_menu_appear_online_get_text
	obj_getid
	setscreenelementprops id = {<objid> child = extra_text} text = <online_text>
endscript
xboxlive_last_options_pad_back = nullscript

script xboxlive_menu_options_create 
	netsessionfunc \{func = voice_init}
	netsessionfunc \{obj = voice
		func = enable}
	xboxlive_menu_voice_options_get_text
	xboxlive_menu_appear_online_get_text
	netsessionfunc \{obj = auth
		func = get_user_device_index}
	if netsessionfunc \{obj = voice
			func = haslocalheadset}
		voice_focus_params = {}
	else
		voice_focus_params = {not_focusable}
	endif
	if NOT gotparam \{back_script}
		<back_script> = (xboxlive_last_options_pad_back)
	else
		change xboxlive_last_options_pad_back = <back_script>
	endif
endscript

script xbox360live_launch_friends 
	netsessionfunc \{func = launch_friends}
endscript

script xbox360live_launch_players 
	netsessionfunc \{func = launch_players}
endscript

script xboxlive_menu_friends_push 
	menu_stack_push \{menu_script = xboxlive_menu_friends_create}
endscript

script async_update_friends_list 
	begin
	if NOT screenelementexists \{id = dialog_box_anchor}
		if NOT screenelementexists \{id = voice_attachment_anchor}
			netsessionfunc \{obj = presence
				func = pump_friends_list}
		endif
	endif
	wait \{1
		frame}
	repeat
endscript

script xboxlive_menu_friends_create 
	netsessionfunc obj = presence func = retrieve_friends_list params = {friends}
	spawnscriptlater async_update_friends_list
	xboxlive_menu_friends_refresh {
		item_props = {
			font = text_a1
			scale = (0.71999997, 0.8)
			highlight_rgba = [123 4 93 128]
			unhighlight_rgba = [123 128 128 128]
			bg_dims = (600.0, 25.0)
			container_dims = (640.0, 23.0)
			status_pos = (595.0, 3.0)
			pad_choose_script = xboxlive_menu_friends_item_choose
		}
		player_set = friends
		dialog_callback = xboxlive_dialog_box
	}
	create_helper_text $generic_helper_text helper_pos = (320.0, 426.0)
	current_menu :setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
endscript

script xboxlive_menu_players_push 
	menu_stack_push \{menu_script = xboxlive_menu_players_create}
endscript

script xboxlive_menu_players_create 
	netsessionfunc obj = presence func = retrieve_friends_list params = {players}
	spawnscriptlater async_update_friends_list
	xboxlive_menu_friends_refresh {
		item_props = {
			font = text_a1
			scale = (0.71999997, 0.8)
			highlight_rgba = [123 4 93 128]
			unhighlight_rgba = [123 128 128 128]
			bg_dims = (565.0, 25.0)
			container_dims = (640.0, 23.0)
			status_pos = (560.0, 3.0)
			pad_choose_script = xboxlive_menu_players_item_choose
		}
		title_props = {
			text = "Players List"
			pos = (50.0, 50.0)
			rgba = [9 120 25 128]
			scale = 2
			font = text_a1
		}
		tags = {
			start_index = 0
			items_on_page = 9
		}
		player_set = players
		pos = (35.0, 100.0)
	}
	if isxenon
		create_helper_text $xbox_live_menu_with_feedback
	else
		create_helper_text $ps3_live_menu_with_feedback
	endif
	current_menu :setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
endscript

script xbox360live_menu_players_create 
	if NOT gotparam back_script
		<back_script> = (xboxlive_last_options_pad_back)
	else
		change xboxlive_last_options_pad_back = <back_script>
	endif
	printf "xbox360live_menu_players_create"
	printstruct <...>
	xboxlive_menu_friends_refresh {
		item_props = {
			font = text_a1
			scale = (0.71999997, 0.8)
			highlight_rgba = [123 4 93 128]
			unhighlight_rgba = [123 128 128 128]
			bg_dims = (565.0, 25.0)
			container_dims = (640.0, 23.0)
			status_pos = (560.0, 3.0)
			pad_choose_script = xboxlive_menu_players_item_choose
		}
		title_props = {
			text = "CURRENT PLAYERS"
			pos = (50.0, 50.0)
			rgba = [9 120 25 128]
			scale = 2
			font = text_a1
		}
		tags = {
			start_index = 0
			items_on_page = 9
		}
		pad_back_script = <back_script>
		player_set = players
		pos = (35.0, 100.0)
	}
	if isxenon
		create_helper_text $xbox_live_menu_with_feedback
	else
		create_helper_text $ps3_live_menu_with_feedback
	endif
endscript

script xboxlive_menu_voice_options_push 
	netsessionfunc obj = auth func = get_user_device_index
	menu_stack_push {
		menu_script = menu_template_create
		menu_params = {
			$menu_template_style_ticker
			parent = root_window
			menu_id = voice_options_menu
			exclusive_device = <user_index>
			pad_back_script = menu_stack_pop
			title = "Voice Options"
			title_pos = (50.0, 50.0)
			items = [
				{text = "Option 1" pad_choose_script = nullscript rot = 0 label_offset = (10.0, 20.0) length = 180}
				{text = "Option 2" pad_choose_script = nullscript rot = 0 label_offset = (20.0, 5.0) length = 200}
			]
			$generic_helper_text
		}
	}
endscript

script xboxlive_menu_optimatch_results_item_choose 
	printf \{"xboxlive_menu_optimatch_results_item_choose"}
	change \{net_entered_from_singleplayer = 0}
	choose_selected_server <...>
endscript

script xboxlive_menu_optimatch_results_item_focus 
	obj_getid
	current_menu_anchor :getsingletag \{current_color_scheme}
	setscreenelementprops id = {<objid> child = game_type} rgba = (<current_color_scheme>.text_focus_color)
	setscreenelementprops id = {<objid> child = area} rgba = (<current_color_scheme>.text_focus_color)
	setscreenelementprops id = {<objid> child = players} rgba = (<current_color_scheme>.text_focus_color)
	settags \{has_focus}
	gettags
endscript

script xboxlive_menu_optimatch_results_item_unfocus 
	obj_getid
	current_menu_anchor :getsingletag \{current_color_scheme}
	setscreenelementprops id = {<objid> child = game_type} rgba = (<current_color_scheme>.text_color)
	setscreenelementprops id = {<objid> child = area} rgba = (<current_color_scheme>.text_color)
	setscreenelementprops id = {<objid> child = players} rgba = (<current_color_scheme>.text_color)
	removetags \{[
			has_focus
		]}
endscript

script xboxlive_menu_optimatch_results_details_refresh 
	setscreenelementprops {
		id = {optimatch_results_details child = game_type}
		text = <game_type>
	}
	setscreenelementprops {
		id = {optimatch_results_details child = level}
		text = <level>
	}
	if NOT gotparam \{players}
		formattext textname = players "%a / %b" a = <num_players> b = <max_players>
	endif
	setscreenelementprops {
		id = {optimatch_results_details child = players}
		text = <players>
	}
endscript

script xboxlive_menu_optimatch_results_item_add {
	}
	change xboxlive_num_results = (($xboxlive_num_results) + 1)
	if NOT screenelementexists id = optimatch_results_vmenu
		printf "Warning! tried to add a server when results menu not up"
		return
	endif
	num_qos_bars = 5
	dims = ((0.0, 25.0))
	printf "--- xboxlive_menu_optimatch_results_item_add"
	if NOT screenelementexists id = {current_menu child = <server_id>}
		printf "server not in list, adding new result"
		setscreenelementlock id = current_menu off
		add_cas_menu_item {
			local_id = <server_id>
			text = "temp"
			pad_choose_script = xboxlive_menu_optimatch_results_item_choose
			pad_choose_params = {id = <server_id>}
		}
		setscreenelementprops {
			id = {current_menu child = <server_id>}
			event_handlers = [
				{focus xboxlive_menu_optimatch_results_item_focus}
				{unfocus xboxlive_menu_optimatch_results_item_unfocus}
			]
		}
		parent_id = <item_container_id>
		getscreenelementprops id = {<parent_id> child = text}
		server_name_pos = <pos>
		text_scale = <scale>
		text_z = <z_priority>
		setscreenelementprops {
			id = {<parent_id> child = text}
			pos = (<server_name_pos> + (50.0, 0.0))
		}
		createscreenelement {
			type = hmenu
			parent = <parent_id>
			local_id = qos
			pos = ((-60.0, 5.0) + (<server_name_pos>.(0.0, 1.0)) * (0.0, 1.0))
			just = [left bottom]
			internal_just = [left bottom]
			spacing_between = 3
			z_priority = <text_z>
		}
		qos_id = <id>
		i = 0
		begin
		createscreenelement {
			type = spriteelement
			parent = <qos_id>
			dims = ((5.0, 10.0) + (2 * <i>) * (0.0, 1.0) + (<server_name_pos>.(0.0, 1.0)) * (0.0, 1.0))
			rgba = [0 0 0 255]
			alpha = 1
			just = [left bottom]
		}
		i = (<i> + 1)
		repeat <num_qos_bars>
		<curPos> = (175.0, 0.0)
		createscreenelement {
			type = textelement
			parent = <parent_id>
			local_id = game_type
			pos = <curPos>
			text = ""
			font = text_a1
			rgba = ($cas_color_scheme.text_color)
			scale = <text_scale>
			just = [left center]
			z_priority = <text_z>
		}
		<curPos> = (<curPos> + (100.0, 0.0))
		createscreenelement {
			type = textelement
			parent = <parent_id>
			local_id = area
			pos = <curPos>
			text = ""
			font = text_a1
			rgba = ($cas_color_scheme.text_color)
			scale = <text_scale>
			just = [left center]
			z_priority = <text_z>
		}
		<curPos> = (<curPos> + (75.0, 0.0))
		<freqPos> = (<curPos> + (15.0, 0.0))
		<curPos> = (<curPos> + (45.0, 0.0))
		createscreenelement {
			type = textelement
			parent = <parent_id>
			local_id = players
			pos = <curPos>
			text = ""
			font = text_a1
			rgba = ($cas_color_scheme.text_color)
			scale = <text_scale>
			just = [left center]
			z_priority = <text_z>
		}
	endif
	setscreenelementprops {
		id = {current_menu child = {<server_id> child = text}}
		text = <server_name>
	}
	setscreenelementprops {
		id = {current_menu child = {<server_id> child = game_type}}
		text = <game_type>
	}
	setscreenelementprops {
		id = {current_menu child = {<server_id> child = area}}
		text = <level>
	}
	printstruct <...>
	if NOT gotparam freq
		freq = 1
	endif
	if screenelementexists id = {current_menu child = {<server_id> child = freq}}
		destroyscreenelement id = {current_menu child = {<server_id> child = freq}}
	endif
	star_type = <freq>
	printf "star_type %a" a = <star_type>
	switch <star_type>
		case 1
		star = icon_small_am
		case 2
		star = icon_small_pro
		case 3
		star = icon_small_sick
		default
	endswitch
	if screenelementexists id = <item_container_id>
		createscreenelement {
			type = spriteelement
			local_id = freq
			texture = <star>
			scale = 0.5
			parent = <item_container_id>
			just = [center center]
			pos = (<freqPos>)
			z_priority = <text_z>
		}
	endif
	formattext textname = players "%a / %b" a = <num_players> b = <max_players>
	setscreenelementprops {
		id = {current_menu child = {<server_id> child = players}}
		text = <players>
	}
	getscreenelementchildren id = {current_menu child = {<server_id> child = qos}}
	getarraysize children
	i = 0
	begin
	if (<i> < (<qos> / 2.0))
		qos_rgba = [0 128 0 255]
	else
		qos_rgba = [0 0 0 255]
	endif
	setscreenelementprops id = (<children> [<i>]) rgba = <qos_rgba>
	i = (<i> + 1)
	repeat <array_size>
	resolvescreenelementid id = {current_menu child = <server_id>}
	setscreenelementprops {
		id = <resolved_id>
		tags = {
			game_type = <game_type>
			level = <level>
			num_players = <num_players>
			private_slots = <private_slots>
			ranked = <ranked>
			max_players = <max_players>
		}
	}
	if screenelementexists id = optimatch_results_vmenu
		setscreenelementlock id = optimatch_results_vmenu on
		setscreenelementlock id = optimatch_results_vmenu off
	endif
	if <resolved_id> :getsingletag has_focus
	endif
endscript

script xboxlive_menu_players_kick_confirm 
	xboxlive_dialog_box {title = "KICK PLAYER"
		text = ("Are you sure you want to remove " + <player_name> + "?")
		buttons = [
			{text = "REMOVE" pad_choose_script = xboxlive_menu_players_kick pad_choose_params = <...>}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_players_item_choose_back}
		]
	}
endscript

script xboxlive_menu_players_kick 
	netsessionfunc func = kick_player params = <...>
	xbox360live_menu_players_create
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_ban_confirm 
	xboxlive_dialog_box {title = "BAN PLAYER"
		text = ("Are you sure you want to ban " + <player_name> + "?")
		buttons = [
			{text = "BAN" pad_choose_script = xboxlive_menu_players_ban pad_choose_params = <...>}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_players_item_choose_back}
		]
	}
endscript

script xboxlive_menu_players_ban 
	netsessionfunc func = ban_player params = <...>
	xbox360live_menu_players_create
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_item_choose 
	generic_menu_pad_choose_sound
	player_structure = <...>
	launchevent type = unfocus target = current_menu
	if OnServer
		buttons = {
			text = "REMOVE"
			pad_choose_script = xboxlive_menu_players_kick_confirm
			pad_choose_params = <player_structure>
		}
		push buttons
		buttons = {
			text = "BAN"
			pad_choose_script = xboxlive_menu_players_ban_confirm
			pad_choose_params = <player_structure>
		}
		push buttons
	endif
	if isxenon
		buttons = {
			text = "SUBMIT PLAYER REVIEW"
			pad_choose_script = submit_player_review
			pad_choose_params = {player_xuid = <player_id>}
		}
		push buttons
		printstruct <...>
		buttons = {
			text = "GAMER CARD"
			pad_choose_script = show_gamer_card
			pad_choose_params = {player_xuid = <player_id>}
		}
		push buttons
	endif
	xboxlive_dialog_box {
		title = "PLAYER ACTION"
		text = ("Please select an action for\\n'" + <player_name> + "'")
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_players_item_choose_back
		no_bg
		buttons = (<param_stacks>.buttons)
	}
endscript

script xboxlive_menu_players_is_player_muted 
	return \{false}
endscript

script xboxlive_menu_players_mute 
	netsessionfunc obj = presence func = mute_player params = <...>
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_record_voice_message 
	xboxlive_menu_record_voice_menu_process_state \{state = recording}
	netsessionfunc \{obj = voice
		func = start_recording_msg}
endscript

script xboxlive_menu_play_voice_message 
	xboxlive_menu_record_voice_menu_process_state \{state = playing}
	netsessionfunc \{obj = voice
		func = playback_msg}
endscript

script xboxlive_voice_attachment_stop_notify 
	xboxlive_menu_record_voice_menu_process_state \{state = stopped}
endscript

script xboxlive_menu_stop_playing_voice_message 
	xboxlive_menu_stop_recording_voice_message
endscript

script xboxlive_menu_stop_recording_voice_message 
	xboxlive_voice_attachment_stop_notify
	netsessionfunc \{obj = voice
		func = stop_recording_msg}
endscript

script xboxlive_menu_send_voice_message 
	voice_attachment_popup :getsetoftags \{[
			accept_script
			accept_params
		]}
	disassociatefromobject
	xboxlive_voice_attachment_finished
	if screenelementexists \{id = current_menu_anchor}
		launchevent \{type = focus
			target = current_menu_anchor}
	endif
	<accept_script> <accept_params>
endscript

script xboxlive_menu_cancel_voice_message 
	voice_attachment_popup :getsingletag \{state}
	if NOT (<state> = stopped)
		return
	endif
	voice_attachment_popup :getsetoftags \{[
			cancel_script
			cancel_params
		]}
	disassociatefromobject
	xboxlive_voice_attachment_finished
	if screenelementexists \{id = current_menu_anchor}
		launchevent \{type = focus
			target = current_menu_anchor}
	endif
	<cancel_script> <cancel_params>
endscript

script xboxlive_menu_players_add_friend_prompt 
	allow_message = 0
	if netsessionfunc obj = voice func = voice_allowed
		if netsessionfunc obj = voice func = voice_enabled
			if netsessionfunc obj = voice func = haslocalheadset
				<allow_message> = 1
			endif
		endif
	endif
	netsessionfunc obj = auth func = get_user_device_index
	if (<allow_message> = 1)
		xboxlive_dialog_box {title = "ATTACH VOICE"
			text = "Would you like to attach a voice message to this request?"
			exclusive_device = <user_index>
			buttons = [
				{text = "ATTACH VOICE" pad_choose_script = xboxlive_menu_record_voice_menu_create pad_choose_params = {accept_script = xboxlive_menu_players_add_friend accept_params = {<...> voice_msg} cancel_script = xboxlive_menu_players_item_choose_back}}
				{text = "CONTINUE" pad_choose_script = xboxlive_menu_players_add_friend pad_choose_params = <...>}
				{text = "CANCEL" pad_choose_script = xboxlive_menu_players_item_choose_back}
			]
		}
	else
		xboxlive_menu_players_add_friend <...>
	endif
endscript

script xboxlive_menu_players_add_friend 
	netsessionfunc obj = presence func = add_friend params = <...>
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_cancel_friend_request 
	netsessionfunc obj = presence func = cancel_friend_request params = <...>
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_unmute 
	netsessionfunc obj = presence func = unmute_player params = <...>
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_players_feedback 
	player_structure = <...>
	xboxlive_dialog_box {
		title = "FEEDBACK"
		text = ("Please select your feedback for\\n'" + <player_name> + "'")
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_players_item_choose
		pad_back_params = <player_structure>
		no_bg
		buttons = [
			{
				text = "-----FEEDBACK-----"
				not_focusable = not_focusable
			}
			{
				text = "Great Session"
				pad_choose_script = xboxlive_menu_players_send_feedback
				pad_choose_params = {
					feedback = pos_session
					<player_structure>
				}
			}
			{
				text = "Good Attitude"
				pad_choose_script = xboxlive_menu_players_send_feedback
				pad_choose_params = {
					feedback = pos_attitude
					<player_structure>
				}
			}
			{
				text = "-----COMPLAINTS-----"
				not_focusable = not_focusable
			}
			{
				text = "Bad Name"
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_name
					<player_structure>
				}
			}
			{
				text = "Cursing or Lewdness"
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_lewdness
					<player_structure>
				}
			}
			{
				text = "Screaming"
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_screaming
					<player_structure>
				}
			}
			{
				text = "Cheating"
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_gameplay
					<player_structure>
				}
			}
			{
				text = "Threats or Harassment"
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_harassment
					<player_structure>
				}
			}
		]
	}
endscript

script xboxlive_menu_players_item_choose_back 
	generic_menu_pad_back_sound
	disassociatefromobject
	dialog_box_exit
	setscreenelementlock \{id = current_menu_anchor
		off}
	if isxenon
		create_helper_text \{$xbox_live_menu_with_feedback}
	else
		create_helper_text \{$ps3_live_menu_with_feedback}
	endif
	launchevent \{type = focus
		target = current_menu}
endscript

script xboxlive_menu_players_send_feedback_confirm 
	netsessionfunc obj = auth func = get_user_device_index
	xboxlive_dialog_box {title = "SEND COMPLAINT"
		text = ("Are you sure you want to send this complaint about " + <player_name> + "?")
		exclusive_device = <user_index>
		buttons = [
			{text = "SEND COMPLAINT" pad_choose_script = xboxlive_menu_players_send_feedback pad_choose_params = <...>}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_players_item_choose_back}
		]
	}
endscript

script xboxlive_menu_players_send_feedback 
	netsessionfunc obj = presence func = send_feedback params = {feedback = <feedback> <...>}
	xboxlive_menu_players_item_choose_back
endscript

script xboxlive_menu_prefs_field_create add_dont_care_option = 0
	if gotparam field
		pad_choose_params = {
			field = <field>
			menu_id = <parent>
			add_dont_care_option = <add_dont_care_option>
		}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_start <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
		formattext checksumname = pref_field_checksum <field>
		GetPreferenceString pref_type = network <pref_field_checksum>
		<text_pos> = (0.0, 0.0)
		<y_val> = (<text_pos>.(0.0, 1.0))
		<y_val> = (<y_val> * (0.0, 1.0))
		createscreenelement {
			type = textelement
			parent = <container_id>
			local_id = pref_text
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = $ui_text_shadow_offset
			font = text_a1
			text = <ui_string>
			rgba = <rgba>
			scale = <scale>
			pos = (<y_val> + (280.0, 0.0))
			just = [left center]
			z_priority = 10
		}
		getscreenelementdims id = <id>
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			local_id = pref_text_bg
			pos = (<y_val> + (270.0, -15.0))
			dims = ((<width> * (1.0, 0.0)) + (20.0, 30.0))
			rgba = [0 0 0 128]
			alpha = 1
			just = [left top]
			z_priority = -2
		}
	endif
endscript

script xboxlive_menu_pref_menu_create 
	launchevent type = unfocus target = <menu_id>
	launchevent type = unfocus target = current_menu_anchor
	xboxlive_menu_morph_all_but_selected_child {
		menu_id = <menu_id>
		morph_params = {
			alpha = 0
		}
	}
	obj_getid
	doscreenelementmorph id = {<objid> child = pref_text} alpha = 0
	doscreenelementmorph id = {<objid> child = pref_text_bg} alpha = 0
	setscreenelementlock id = root_window off
	make_cas_menu {
		menu_id = pref_menu
		vmenu_id = pref_vmenu
		parent = root_window
		keep_current
		pad_back_script = xboxlive_menu_pref_menu_back
		pad_back_params = {menu_id = <menu_id>}
		dims = (150.0, 250.0)
		pos = (360.0, 120.0)
		scrolling
		just = [center center]
		pausemenu
	}
	formattext checksumname = pref_field_checksum <field>
	switch <pref_field_checksum>
		case game_type
		case game_type_optimatch
		src_array = net_game_type_info
		action_script = xboxlive_menu_pref_item_add_generic
		case level
		case level_optimatch
		src_array = level_select_menu_level_info
		action_script = xboxlive_menu_pref_item_add_level
		case num_players
		case num_players_optimatch
		src_array = $num_players_info
		action_script = xboxlive_menu_pref_item_add_generic
		case private_slots
		getpreferencevalue pref_type = network num_players
		constrain = (<value> + 1)
		src_array = $num_private_slots
		action_script = xboxlive_menu_pref_item_add_generic
		case ranked
		if isxenon
			src_array = $ranked_info
		else
			src_array = $ps3_ranked_info
		endif
		action_script = xboxlive_menu_pref_item_add_generic
		case skill_level
		case skill_level_optimatch
		src_array = skill_level_info
		action_script = xboxlive_menu_pref_item_add_generic
		default
		scriptassert "Unhandled pref field"
	endswitch
	item_params = {
		menu_id = <menu_id>
		parent = pref_vmenu
		field = <field>
	}
	if (<add_dont_care_option> = 1)
		<action_script> {
			<item_params>
			name = "Don't Care"
			checksum = dont_care
		}
	endif
	if NOT gotparam constrain
		foreachin {
			(<src_array>)
			do = <action_script>
			params = <item_params>
		}
	else
		i = 0
		begin
		tmpStructure = (<src_array> [<i>])
		<action_script> {
			<tmpStructure>
			<item_params>
		}
		i = (<i> + 1)
		repeat <constrain>
	endif
	cas_menu_finish
endscript

script xboxlive_menu_pref_item_add_generic \{parent = pref_vmenu}
	add_cas_menu_item {
		parent = <parent>
		text = <name>
		pad_choose_script = xboxlive_menu_pref_menu_back
		pad_choose_params = {
			<...>
			apply
		}
	}
endscript

script xboxlive_menu_pref_item_add_level 
	if gotparam \{career_only}
		return
	endif
	if cd
		if gotparam \{DEVKIT_ONLY}
			return
		endif
	endif
	if gotparam \{special_case_flag}
		if NOT getglobalflag flag = <special_case_flag>
			return
		endif
	endif
	xboxlive_menu_pref_item_add_generic {
		<...>
		name = <text>
		checksum = <level>
	}
endscript

script xboxlive_menu_pref_item_add_optimatch_level 
	if gotparam \{career_only}
		return
	endif
	if cd
		if gotparam \{DEVKIT_ONLY}
			return
		endif
	endif
	if gotparam \{special_case_flag}
		if NOT getglobalflag flag = <special_case_flag>
			return
		endif
	endif
	xboxlive_menu_pref_item_add_generic {
		<...>
		name = <text>
		checksum = <checksum>
	}
endscript

script xboxlive_menu_pref_menu_back 
	if gotparam \{apply}
		if NOT gotparam \{prefs}
			prefs = network
		endif
		SetPreferencesFromUI {
			<...>
			prefs = <pref_type>
			field = <pref_field>
			string = <name>
		}
	endif
	disassociatefromobject
	destroyscreenelement \{id = pref_menu}
	menu_stack_create_latest
endscript

script xboxlive_menu_morph_all_but_selected_child \{morph_params = {
			alpha = 0
		}}
	<menu_id> :getsingletag tag_selected_index
	if gotparam \{tag_selected_index}
		if getscreenelementchildren id = <menu_id>
			getarraysize \{children}
			i = 0
			begin
			if NOT (<i> = <tag_selected_index>)
				doscreenelementmorph id = (<children> [<i>]) <morph_params>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script xboxlive_menu_optimatch_results_stop 
	netsessionfunc \{obj = match
		func = stop_server_list}
	if gotparam \{xboxlive_num_results}
		xboxlive_menu_optimatch_results_end xboxlive_num_results = <xboxlive_num_results>
	else
		xboxlive_menu_optimatch_results_end \{xboxlive_num_results = 0}
	endif
endscript

script xboxlive_menu_create_match_after_failed_search 
	xboxlive_dialog_box_exit
	if infrontend
		xboxlive_menu_host_create \{from_net_view_goals}
	else
		restore_start_key_binding
		change_gamemode_career
		xboxlive_menu_host_create \{from_net_view_goals}
	endif
endscript

script xboxlive_menu_optimatch_results_end 
	printf "--- xboxlive_menu_optimatch_results_end"
	xboxlive_dialog_box_exit
	printstruct <...>
	printf "xboxlive_menu_optimatch_results_end : %d" d = <xboxlive_num_results>
	if screenelementexists id = optimatch_results_menu
		extra_padding = (10)
		if (<extra_padding> > 0)
			begin
			createscreenelement {
				type = textelement
				parent = current_menu
				font = text_a1
				scale = 0.45000002
				text = ""
				not_focusable
			}
			repeat <extra_padding>
		endif
	endif
	spawnscript xboxlive_menu_optimatch_results_wait_and_focus
	if (<xboxlive_num_results> = 0)
		if checkforsignin
			if isxenon
				title_text = "Xbox LIVE"
			else
				title_text = "Online"
			endif
			xboxlive_dialog_box {
				title = <title_text>
				text = "No sessions are available. Would you like to Create a Match?"
				pad_back_script = xboxlive_menu_search_cancel
				buttons = [
					{text = "CREATE MATCH" pad_choose_script = xboxlive_menu_create_match_after_failed_search}
					{text = "CANCEL" pad_choose_script = xboxlive_menu_search_cancel}
				]
				no_bg
			}
		endif
		if istrue $AutoLaunchClient
			printf "Net Debug: Could not find xboxlive matches!"
			scriptassert "Net test unsuccessful"
		endif
	endif
endscript

script xboxlive_menu_optimatch_results_wait_and_focus 
	wait 1 gameframes
	if screenelementexists id = optimatch_results_menu
		launchevent type = focus target = optimatch_results_menu data = {grid_index = 0}
		launchevent type = focus target = {optimatch_results_vmenu child = 0}
		setscreenelementlock id = optimatch_results_menu off
		create_helper_text {
			helper_text_elements = [{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m5 REFRESH LIST"}
			]
		}
	endif
endscript

script xboxlive_menu_quickmatch_results_none 
	printf "--- xboxlive_menu_quickmatch_results_none"
	xboxlive_dialog_box_exit
	if isxenon
		title_text = "Xbox LIVE"
	else
		title_text = "Online"
	endif
	xboxlive_dialog_box {
		title = <title_text>
		text = "No sessions are available. Would you like to Create a Match?"
		pad_back_script = xboxlive_menu_search_cancel
		buttons = [
			{text = "CREATE MATCH" pad_choose_script = xboxlive_menu_create_match_after_failed_search}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_search_cancel}
		]
		no_bg
	}
endscript

script xboxlive_menu_invitamatch_results_none 
	xboxlive_dialog_box_exit
	if isxenon
		title_text = "Xbox LIVE"
	else
		title_text = "Online"
	endif
	xboxlive_dialog_box {
		title = <title_text>
		text = "Could not find session. Would you like to Create a Match?"
		pad_back_script = xboxlive_menu_search_cancel
		buttons = [
			{text = "CREATE MATCH" pad_choose_script = xboxlive_menu_create_match_after_failed_search}
			{text = "CANCEL" pad_choose_script = xboxlive_menu_search_cancel}
		]
		no_bg
	}
endscript

script xboxlive_menu_search_cancel 
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	xboxlive_dialog_box_exit
	if infrontend
		ui_change_state \{state = UIstate_net_view_goals}
	else
		restore_start_key_binding
		change_gamemode_career
		ui_change_state \{state = UIstate_net_view_goals}
	endif
endscript

script xboxlive_menu_optimatch_results_clear 
	if isscreenelementinfocus \{id = optimatch_results_menu}
		need_focus = 1
		launchevent \{type = unfocus
			target = optimatch_results_menu}
	endif
	destroyscreenelement \{id = optimatch_results_vmenu
		preserve_parent}
	if gotparam \{need_focus}
		launchevent \{type = focus
			target = optimatch_results_menu}
	endif
endscript

script xboxlive_menu_message_container_create_if_needed 
	if NOT screenelementexists \{id = live_message_container}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{type = containerelement
			parent = root_window
			id = live_message_container
			z_priority = 100}
	else
		setscreenelementlock \{id = live_message_container
			off}
	endif
endscript

script xboxlive_message_container_show 
	if screenelementexists \{id = live_message_container}
		doscreenelementmorph \{id = live_message_container
			alpha = 1}
	endif
endscript

script xboxlive_message_container_hide 
	if screenelementexists \{id = live_message_container}
		doscreenelementmorph \{id = live_message_container
			alpha = 0}
	endif
endscript

script xboxlive_menu_notify id = xbox_notification invite = 5
	if menu_stack_can_pop_menu
		return
	endif
	xboxlive_menu_notify_kill <...>
	xboxlive_menu_message_container_create_if_needed
	texture = white2
	xboxlive_menu_friends_get_invite_sprites
	getarraysize sprites
	i = 0
	begin
	if ((<sprites> [<i>].val) = <invite>)
		texture = (<sprites> [<i>].texture)
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	createscreenelement {
		type = spriteelement
		parent = live_message_container
		id = <id>
		texture = <texture>
		pos = (50.0, 400.0)
		just = [center center]
		scale = 0
		rgba = [128 128 128 128]
	}
	runscriptonscreenelement id = <id> xboxlive_menu_notify_flash
endscript

script xboxlive_menu_notify_clone_sprite clone_pos = (0.0, 0.0)
	if NOT screenelementexists id = <id>
		return
	endif
	if NOT screenelementexists id = <parent>
		return
	endif
	getscreenelementprops id = <id>
	if NOT gotparam texture
		return
	endif
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = <texture>
		pos = <clone_pos>
		just = [center center]
		scale = 1
		rgba = [128 128 128 128]
		z_priority = <z_priority>
	}
endscript

script xboxlive_menu_notify_kill \{id = xbox_notification}
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script xboxlive_menu_notify_flash 
	begin
	domorph \{scale = 1.0}
	wait \{0.7
		seconds}
	domorph \{scale = 0}
	wait \{0.4
		seconds}
	repeat 4
endscript

script xboxlive_logon_status_create 
	if screenelementexists id = xboxlive_status
		xboxlive_logon_status_kill
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = xboxlive_status
		pos = (315.0, 385.0)
		just = [left top]
		z_priority = 2000
	}
	doscreenelementmorph id = xboxlive_status alpha = 0
	doscreenelementmorph id = xboxlive_status alpha = 1 time = 0.5
	createscreenelement {
		type = spriteelement
		parent = xboxlive_status
		pos = (0.0, 0.0)
		scale = (10.5, 0.2)
		texture = white3
		rgba = [0 0 0 100]
		alpha = 1
		just = [left center]
		z_priority = 2001
	}
	createscreenelement {
		type = textelement
		parent = xboxlive_status
		id = xboxlive_status_text
		pos = (300.0, 0.0)
		text = "Signing in..."
		font = text_a1
		rgba = [128 128 128 128]
		alpha = 1
		scale = 0.8
		just = [right center]
		z_priority = 2002
	}
endscript

script xboxlive_logon_status_kill 
	if screenelementexists \{id = xboxlive_status}
		destroyscreenelement \{id = xboxlive_status}
	endif
endscript

script xboxlive_logon_status_update 
	if NOT gotparam \{text}
		scriptassert \{"no text?"}
	endif
	netsessionfunc func = save_logon_status params = <...>
	if NOT screenelementexists \{id = xboxlive_status}
		return
	endif
	xboxlive_status_text :obj_killspawnedscript \{name = xboxlive_logon_status_update_spawned}
	xboxlive_status_text :obj_spawnscriptlater {
		xboxlive_logon_status_update_spawned
		params = {
			text = <text>
		}
	}
endscript

script xboxlive_logon_status_update_spawned 
	domorph \{alpha = 0
		time = 0.2}
	obj_getid
	setscreenelementprops {
		id = <objid>
		text = <text>
	}
	domorph \{alpha = 1
		time = 0.2}
	begin
	domorph \{alpha = 0.8
		time = 1}
	domorph \{alpha = 1
		time = 1}
	repeat
endscript

script xboxlive_voice_attachment_finished 
	if screenelementexists \{id = voice_attachment_anchor}
		xboxlive_menu_stop_recording_voice_message
		destroyscreenelement \{id = voice_attachment_anchor}
	endif
endscript

script xboxlive_menu_record_voice_menu_set_button_state 
	if gotparam \{off}
		focusable = {not_focusable}
		alpha = 0.3
	else
		focusable = {focusable}
		alpha = 1.0
	endif
	setscreenelementprops id = {voice_attachment_buttons child = <button>} <focusable>
	doscreenelementmorph id = {voice_attachment_buttons child = {<button> child = sprite}} alpha = <alpha>
	doscreenelementmorph id = {voice_attachment_buttons child = {<button> child = text}} alpha = <alpha>
endscript

script xboxlive_menu_record_voice_menu_process_state 
	if NOT screenelementexists id = voice_attachment_anchor
		return
	endif
	launchevent type = unfocus target = voice_attachment_anchor
	if gotparam state
		voice_attachment_popup :settags state = <state>
	else
		voice_attachment_popup :getsingletag state
	endif
	switch <state>
		case stopped
		setscreenelementprops id = {voice_attachment_popup child = text} text = "Stopped"
		voice_attachment_popup :getsingletag mode
		if (<mode> = playback)
			xboxlive_menu_record_voice_menu_set_button_state {button = record off}
			xboxlive_menu_record_voice_menu_set_button_state {button = play on}
			xboxlive_menu_record_voice_menu_set_button_state {button = send on}
		else
			xboxlive_menu_record_voice_menu_set_button_state {button = record on}
			if voice_attachment_popup :getsingletag has_recorded
				xboxlive_menu_record_voice_menu_set_button_state {button = play on}
				xboxlive_menu_record_voice_menu_set_button_state {button = send on}
			else
				xboxlive_menu_record_voice_menu_set_button_state {button = play off}
				xboxlive_menu_record_voice_menu_set_button_state {button = send off}
			endif
		endif
		case playing
		setscreenelementprops id = {voice_attachment_popup child = text} text = "Playing..."
		xboxlive_menu_record_voice_menu_set_button_state {button = record off}
		xboxlive_menu_record_voice_menu_set_button_state {button = play off}
		xboxlive_menu_record_voice_menu_set_button_state {button = send off}
		case recording
		setscreenelementprops id = {voice_attachment_popup child = text} text = "Recording..."
		xboxlive_menu_record_voice_menu_set_button_state {button = record off}
		xboxlive_menu_record_voice_menu_set_button_state {button = play off}
		xboxlive_menu_record_voice_menu_set_button_state {button = send off}
		voice_attachment_popup :settags has_recorded
	endswitch
	launchevent type = focus target = voice_attachment_anchor
endscript

script xboxlive_menu_record_voice_menu_create {
		parent = root_window
		cancel_script = xboxlive_voice_attachment_finished
		accept_script = nullscript
		mode = record
	}
	if screenelementexists id = voice_attachment_anchor
		destroyscreenelement id = voice_attachment_anchor
	endif
	xboxlive_dialog_box_exit
	setscreenelementlock id = <parent> off
	netsessionfunc obj = auth func = get_user_device_index
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = voice_attachment_anchor
		focusable_child = voice_attachment_popup
	}
	createscreenelement {
		type = containerelement
		parent = voice_attachment_anchor
		id = voice_attachment_popup
		pos = (320.0, 200.0)
		tags = {
			cancel_script = <cancel_script>
			cancel_params = <cancel_params>
			accept_script = <accept_script>
			accept_params = <accept_params>
			mode = <mode>
		}
		event_handlers = [
			{
				pad_back
				generic_menu_pad_back_sound
			}
			{
				pad_back
				xboxlive_menu_cancel_voice_message
			}
		]
		exclusive_device = <exclusive_device>
		focusable_child = voice_attachment_buttons
		just = [center center]
	}
	createscreenelement {
		type = spriteelement
		parent = voice_attachment_popup
		local_id = bg2
		texture = de_highlight_bar
		pos = (-4.0, -1.0)
		scale = (2.7, 2.9)
		rgba = [0 0 0 96]
		just = [center center]
		z_priority = 901.1
	}
	color = [128 128 128 240]
	createscreenelement {
		type = spriteelement
		parent = voice_attachment_popup
		local_id = box
		texture = white2
		pos = (0.0, 29.0)
		scale = (36.0, 3.0)
		rgba = <color>
		just = [center center]
		z_priority = 1001.5
		alpha = 0.2
	}
	createscreenelement {
		type = hmenu
		parent = voice_attachment_popup
		id = voice_attachment_buttons
		pos = (25.0, 4.0)
		dims = (640.0, 20.0)
		just = [center center]
		internal_just = [center center]
		z_priority = 1002
		event_handlers = [
			{
				pad_left
				generic_menu_scroll_sideways_sound
			}
			{
				pad_right
				generic_menu_scroll_sideways_sound
			}
		]
		regular_space_amount = 80
	}
	createscreenelement {
		type = textelement
		parent = voice_attachment_popup
		local_id = text
		text = ""
		font = text_a1
		pos = (0.0, 29.0)
		scale = (0.9, 1.0)
		rgba = [128 128 128 128]
		just = [center center]
		z_priority = 1020
	}
	runscriptonscreenelement id = <id> xboxlive_voice_attachment_status_style
	buttons = [
		{
			icon_build = record
			pad_choose_script = xboxlive_menu_record_voice_message
			notify_text = "RECORD"
		}
		{
			icon_build = stop
			pad_choose_script = xboxlive_menu_stop_recording_voice_message
			notify_text = "STOP"
		}
		{
			icon_build = play
			pad_choose_script = xboxlive_menu_play_voice_message
			notify_text = "PLAY"
		}
		{
			icon_build = send
			pad_choose_script = xboxlive_menu_send_voice_message
			notify_text = "SEND"
			notify_text_play = "FEEDBACK"
		}
	]
	foreachin <buttons> do = xboxlive_voice_attachment_button_add
	create_helper_text {
		parent = voice_attachment_anchor
		helper_text_elements = [
			{text = "\\m1 CANCEL"}
			{text = "\\m0 CHOOSE"}
		]
	}
	if screenelementexists id = current_menu_anchor
		launchevent type = unfocus target = current_menu_anchor
	endif
	xboxlive_menu_record_voice_menu_process_state state = stopped
endscript

script xboxlive_voice_attachment_button_add 
	voice_attachment_popup :getsingletag mode
	if (<mode> = playback)
		if gotparam notify_text_play
			<notify_text> = <notify_text_play>
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = voice_attachment_buttons
		local_id = <icon_build>
		dims = (50.0, 50.0)
		event_handlers = [
			{
				pad_choose
				generic_menu_pad_choose_sound
			}
			{
				pad_choose
				<pad_choose_script>
			}
			{
				focus
				xboxlive_voice_attachment_button_focus
			}
			{
				unfocus
				xboxlive_voice_attachment_button_unfocus
			}
		]
		tags = {
			notify_text = <notify_text>
		}
		just = [center center]
	}
	<parent> = <id>
	color = [128 123 20 255]
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = box
		texture = white2
		rgba = <color>
		scale = 5.2
		just = [center center]
		z_priority = 1004.0
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = box_mask
		texture = white2
		scale = 4.5
		rgba = [0 0 0 128]
		just = [center center]
		z_priority = 1005.0
		alpha = 0.0
	}
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = text
		text = <notify_text>
		font = text_a1
		pos = (0.0, 27.0)
		scale = 0.7
		rgba = [128 128 128 128]
		just = [center center]
		z_priority = 1020
		alpha = <icon_alpha>
	}
	switch <icon_build>
		case record
		createscreenelement {
			type = spriteelement
			parent = <parent>
			local_id = sprite
			texture = circle
			scale = 1.9
			rgba = [90 0 0 128]
			just = [center center]
			z_priority = 1030
			alpha = 1.0
		}
		case stop
		createscreenelement {
			type = spriteelement
			parent = <parent>
			local_id = sprite
			texture = white2
			scale = 2.7
			rgba = [80 80 80 128]
			just = [center center]
			z_priority = 1030
			alpha = 1.0
		}
		case play
		createscreenelement {
			type = spriteelement
			parent = <parent>
			local_id = sprite
			texture = right_arrow
			scale = (1.2, 0.9)
			rgba = [0 105 20 128]
			just = [center center]
			z_priority = 1030
			alpha = 1.0
		}
		case send
		if (<mode> = playback)
			<texture> = friend
			<scale> = 1.3
		else
			<texture> = friendsent
			<scale> = 1.0
		endif
		createscreenelement {
			type = spriteelement
			parent = <parent>
			local_id = sprite
			texture = <texture>
			scale = <scale>
			rgba = [128 128 128 128]
			just = [center center]
			z_priority = 1030
			alpha = 1.0
		}
		case `default`
	endswitch
endscript

script xboxlive_voice_attachment_button_focus 
	obj_getid
	doscreenelementmorph id = {<objid> child = box} alpha = 1.0
	doscreenelementmorph id = {<objid> child = box_mask} alpha = 0.85
endscript

script xboxlive_voice_attachment_button_unfocus 
	obj_getid
	doscreenelementmorph id = {<objid> child = box} alpha = 0.0
	doscreenelementmorph id = {<objid> child = box_mask} alpha = 0.0
endscript

script xboxlive_voice_attachment_status_style 
	begin
	domorph \{alpha = 1.0
		time = 0.7}
	domorph \{alpha = 0.6
		time = 0.7}
	repeat
endscript

script gameinvite_already_in_game 
	create_panel_message {text = ("You are already in game with " + <inviter> + ".")
		time = 5000
	}
endscript

script gameinvite_server_unavailable 
	create_error_box {title = "GAME INVITE"
		text = ("Unable to complete the accepted invite. The game no longer exists.")
		buttons = [{text = "OK" pad_choose_script = xboxlive_menu_create}
		]
		no_animate
	}
endscript

script failedtocreategame 
	printf \{"--- FailedToCreateGame"}
	spawnscriptlater \{FailedToCreateGame_Spawned}
endscript

script FailedToCreateGame_Spawned 
	wait \{10
		gameframes}
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 0)
		cancel_join_server
		if NOT screenelementexists \{id = link_lost_dialog_anchor}
			create_error_box {
				title = "JOIN GAME"
				text = ("Unable to join the selected game.")
				buttons = [
					{text = "OK"}
				]
				no_animate
			}
		endif
	endif
endscript

script xbox360_live_not_allowed 
	if NOT gotparam guest
		if isxenon
			create_error_box {title = "Xbox LIVE"
				text = "The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play or the network connection has been lost."
				buttons = [{text = "OK" pad_choose_script = xbox360_handle_live_not_allowed}
				]
				no_animate
				delay_input
				preserve_case
			}
		else
			if gotparam age_restricted
				create_error_box {title = "Online"
					text = "Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions."
					buttons = [{text = "OK" pad_choose_script = xbox360_handle_live_not_allowed}
					]
					no_animate
					delay_input
					preserve_case
				}
			else
				create_error_box {title = "Online"
					text = "You are currently unable to connect to the PLAYSTATION®Network."
					buttons = [{text = "OK" pad_choose_script = xbox360_handle_live_not_allowed}
					]
					no_animate
					delay_input
					preserve_case
				}
			endif
		endif
	else
		create_error_box {title = "Xbox LIVE"
			text = "Proving Grounds does not support Guest access to Xbox LIVE."
			buttons = [{text = "OK" pad_choose_script = xbox360_handle_live_not_allowed}
			]
			no_animate
			delay_input
			preserve_case
		}
	endif
endscript

script xbox360_handle_live_not_allowed 
	printf \{"--- xbox360_go_to_main_menu"}
	getcurrentlevel
	if (<level> = load_z_mainmenu)
		launch_main_menu
	else
		dialog_box_exit
	endif
endscript
