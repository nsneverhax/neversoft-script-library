
script ui_init_band_mode 
	sanity_check_fix_deleted_characters
	change \{band_mode_last_num_ready = 0}
	if ($band_mode_menu_tags = none)
		change \{band_mode_previous_leader = -1}
	endif
	if (($is_network_game = 1) && (netsessionfunc obj = party func = is_host))
		if ($net_band_mode_menu = host)
			netsessionfunc \{obj = party
				func = set_joiner_mode
				params = {
					mode = career_join
				}}
			netsessionfunc \{obj = party
				func = set_party_joinable
				params = {
					joinable = 1
				}}
		elseif ($net_band_mode_menu = join)
			netsessionfunc \{obj = party
				func = set_party_joinable
				params = {
					joinable = 0
				}}
		endif
	endif
endscript

script ui_create_band_mode 
	change \{band_mode_current_leader = -1}
	change \{menu_over_ride_exclusive_device = -1}
	change \{net_career_data_sync_done = 1}
	change \{net_num_player_settings_ack = 0}
	change \{net_encore_msg_start_sent = 0}
	change \{net_breakdown_continue_msg_sent = 0}
	set_cas_loading_setup \{setup = band}
	change \{ui_band_mode_hit_force_completion = 0}
	change \{player_drop_in_setting_sync = 0}
	spawnscriptlater \{menu_music_on}
	if NOT ($net_band_mode_menu = lobby)
		band_mode_remap_controllers_1_to_4
		clear_temp_net_id_array
		net_clear_all_remote_player_status
		change \{net_dropped_players_flag = 0}
		if ($net_band_mode_menu = invite)
			change \{band_mode_menu_tags = none}
		endif
	else
		change \{band_mode_menu_tags = none}
	endif
	spawn_player_drop_listeners \{drop_player_script = net_career_drop_player
		end_game_script = net_career_end_game}
	if ($is_network_game = 0)
		update_ingame_controllers
	endif
	fadetoblack \{off
		no_wait}
	spawnscriptnow \{ui_create_band_mode_spawned}
endscript

script band_mode_remap_controllers_1_to_4 
	character_id_controller = [none none none none none none none none]
	getmaxplayers
	i = 0
	begin
	iplayer = (<i> + 1)
	getplayerinfo (<iplayer>) controller
	getplayerinfo (<iplayer>) character_id
	if ((<controller> >= 0) && (<controller> < 8))
		setarrayelement arrayname = character_id_controller index = <controller> newvalue = <character_id>
		printf 'Player %p, controller %d used to use %c' p = <iplayer> d = <controller> c = <character_id>
	endif
	i = (<i> + 1)
	repeat <max_players>
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	i = 0
	begin
	iplayer = (<i> + 1)
	if (<character_id_controller> [<i>] != none)
		setplayerinfo (<iplayer>) character_id = (<character_id_controller> [<i>])
		printf 'Player %p, controller %d now using %c' p = <iplayer> d = <i> c = (<character_id_controller> [<i>])
	else
		setplayerinfo (<iplayer>) character_id = judy
		printf 'Player %p, controller %d had no previous character, defaulting to judy' p = <iplayer> d = <i>
	endif
	i = (<i> + 1)
	repeat 4
	sanity_check_fix_deleted_characters
endscript

script bx_create4highlightstarsforbandplay 
	if myinterfaceelement :desc_resolvealias \{name = alias_hmenu}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			if NOT (<array_size> = 0)
				<i> = 0
				begin
				cur_band_play_menu = (<children> [<i>])
				if <cur_band_play_menu> :desc_resolvealias name = alias_menu
					menu = <resolved_id>
					<menu> :se_getparentid
					<parent_id> :se_getparentid
					formattext checksumname = stars_id 'HighlightStars%c' c = <i>
					bx_createhighlightstars parent = <parent_id> stars_id = <stars_id> focuswaittime = 0
					<menu> :settags stars_id = <stars_id>
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
endscript

script ui_create_band_mode_spawned 
	frontend_load_soundcheck \{loadingscreen}
	change band_mode_current_leader = ($band_mode_previous_leader)
	cas_free_resources_camera_fix \{base_name = 'band_hub'
		alwaysfix}
	new_leader = ($band_mode_previous_leader)
	if ($is_network_game = 1)
		change \{respond_to_signin_changed = 1}
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			change \{respond_to_signin_changed_all_players = 1}
		elseif (($net_band_mode_menu = host) || ($net_band_mode_menu = join))
			change \{respond_to_signin_changed = 0}
			change \{respond_to_signin_changed_all_players = 0}
		else
			change \{respond_to_signin_changed_all_players = 0}
		endif
	else
		change \{respond_to_signin_changed = 0}
		change \{respond_to_signin_changed_all_players = 0}
	endif
	change \{respond_to_signin_changed_func = ui_band_mode_signin_changed}
	band_builder_clear_random_appearances \{cpu_only}
	band_builder_clear_setup
	cas_set_object_node_pos \{player = 1
		node = z_soundcheck_trg_waypoint_player1_start}
	cas_set_object_node_pos \{player = 2
		node = z_soundcheck_trg_waypoint_player2_start}
	cas_set_object_node_pos \{player = 3
		node = z_soundcheck_trg_waypoint_player3_start}
	cas_set_object_node_pos \{player = 4
		node = z_soundcheck_trg_waypoint_player4_start}
	reset_band_mode
	if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
		netsessionfunc \{func = match_init}
	endif
	set_focus_color rgba = (($g_menu_colors).menu_white)
	set_unfocus_color rgba = (($g_menu_colors).menu_gold)
	getactivecontrollers
	controller_num = 0
	createscreenelement \{parent = root_window
		id = myinterfaceelement
		type = descinterface
		desc = 'band_play'}
	bx_create4highlightstarsforbandplay
	myinterfaceelement :se_getprops
	array = [
		{pad_start ui_band_mode_continue}
		{pad_start ui_band_mode_save_tags}
	]
	if NOT cd
		addarrayelement array = <array> element = {pad_alt2 cas_toggle_free_cam}
	endif
	if (($is_network_game = 0))
		addarrayelement array = <array> element = {pad_option ui_band_mode_choose_leader}
	elseif ($is_network_game = 1)
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			array = []
			if ishost
				addarrayelement array = <array> element = {pad_start net_ui_band_mode_continue}
			endif
		endif
		if isps3
			addarrayelement array = <array> element = {pad_option2 ui_band_mode_ps3_invite_received}
		endif
	endif
	myinterfaceelement :setprops event_handlers = <array>
	menu_array = []
	desc_array = []
	if myinterfaceelement :desc_resolvealias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	total_guitar = 2
	total_drum = 1
	total_mic = 1
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		total_guitar = 2
		total_drum = 2
		total_mic = 2
	elseif ($game_mode = p2_battle)
		total_guitar = 2
		total_drum = 2
		total_mic = 0
	endif
	myinterfaceelement :settags {
		total_guitar = <total_guitar>
		total_drum = <total_drum>
		total_mic = <total_mic>
		current_guitar = 0
		current_drum = 0
		current_mic = 0
		net_gig_ready = 0
		net_vocals_ready = 0
		net_instruments_ready = 0
		net_lobby_ready = 0
	}
	i = 0
	begin
	resolvescreenelementid id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	current_desc_item = <resolved_id>
	addarrayelement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	if <resolved_id> :desc_resolvealias name = alias_menu
		if ($is_network_game = 1)
			switch ($net_band_mode_menu)
				case invite
				net_get_invite_menu_tags index = <i> desc_id = <current_desc_item> init
				add_gamertag_to_band_lobby index = <i> name = <name> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :settags {
					menu = <menu>
					instrument = <part>
					difficulty = none
					controller = <controller>
					allowed = <allowed>
					user_id = <user_id>
					band_leader = <band_leader>
					index = <i>
				}
				case lobby
				net_get_root_menu_tags index = <i> desc_id = <current_desc_item>
				add_gamertag_to_band_lobby index = <i> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :settags {
					menu = <menu>
					instrument = <part>
					difficulty = <difficulty>
					controller = <controller>
					allowed = <allowed>
					band_leader = <band_leader>
					index = <i>
				}
				case host
				if ($primary_controller = <i>)
					menu = net_local_join
				else
					if netsessionfunc func = iscontrolleringame params = {controller = <i>}
						menu = net_local_join
					else
						menu = join
					endif
				endif
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :settags {
					menu = <menu>
					instrument = none
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					marked_in = 0
					index = <i>
				}
				if NOT ($primary_controller = <i>)
					<resolved_id> :obj_spawnscriptlater ui_band_mode_check_disconnect
				endif
				case join
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :settags {
					menu = join
					instrument = none
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					index = <i>
				}
				<resolved_id> :obj_spawnscriptlater ui_band_mode_check_disconnect
				default
				scriptassert 'unhandled $net_band_mode_menu=%n' n = ($net_band_mode_menu)
			endswitch
		else
			ui_get_controller_parts_allowed controller = <i> filter_by_character
			<resolved_id> :settags {
				menu = join
				instrument = none
				difficulty = easy
				controller = <i>
				allowed = <allowed>
				index = <i>
			}
			<resolved_id> :obj_spawnscriptlater ui_band_mode_check_disconnect
		endif
		get_player_num_from_controller controller_index = <i>
		if NOT ($band_mode_menu_tags = none)
			getactivecontrollers
			<resolved_id> :settags {
				($band_mode_menu_tags [<i>])
			}
			if (<active_controllers> [<i>] = 0)
				<resolved_id> :settags {
					menu = join
				}
			endif
			<resolved_id> :getsingletag menu
			if (<player_num> >= 0)
				if (<menu> = join)
					cas_queue_kill_player player = <player_num>
				elseif (<menu> = net_remote_root)
					<resolved_id> :obj_killspawnedscript name = ui_band_mode_check_disconnect
				else
					ui_band_mode_show_character player = <player_num> use_existing
				endif
			endif
		else
			if (<player_num> >= 0)
				cas_queue_kill_player player = <player_num>
				<resolved_id> :getsingletag menu
				if (<menu> = net_local_join)
					ui_band_mode_show_character player = <player_num>
				endif
			endif
		endif
		<resolved_id> :setprops event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		if <resolved_id> :getsingletag menu
			addarrayelement array = <menu_array> element = <resolved_id>
			menu_array = <array>
		else
			scriptassert \{'Expected menu tag'}
		endif
		if (($is_network_game = 1) && ($net_band_leader_player_num > -1) && ($net_band_leader_player_num = (<i> + 1)))
			<current_desc_item> :se_setprops leader_indicator_alpha = 1.0
		endif
	endif
	i = (<i> + 1)
	repeat 4
	myinterfaceelement :settags {
		menus = <menu_array>
		descs = <desc_array>
	}
	if NOT ($band_mode_menu_tags = none)
		myinterfaceelement :settags {
			($band_mode_menu_tags [4])
		}
	endif
	getarraysize \{menu_array}
	if (<array_size> > 0)
		if ($allow_controller_for_all_instruments = 0)
			current_guitar = 0
			current_drum = 0
			current_mic = 0
			i = 0
			begin
			curr_id = (<menu_array> [<i>])
			<curr_id> :getsingletag menu
			if (<menu> = ready)
				<curr_id> :getsingletag controller
				if isguitarcontroller controller = <controller>
					current_guitar = (<current_guitar> + 1)
				elseif isdrumcontroller controller = <controller>
					current_drum = (<current_drum> + 1)
				else
					current_mic = (<current_mic> + 1)
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			myinterfaceelement :getsingletag \{total_guitar}
			myinterfaceelement :getsingletag \{total_drum}
			myinterfaceelement :getsingletag \{total_mic}
			if ((<current_guitar> > <total_guitar>) || (<current_drum> > <total_drum>) || (<current_mic> > <total_mic>))
				i = 0
				begin
				curr_id = (<menu_array> [<i>])
				<curr_id> :settags menu = join
				i = (<i> + 1)
				repeat 4
				current_guitar = 0
				current_drum = 0
				current_mic = 0
			endif
			myinterfaceelement :settags {
				current_guitar = <current_guitar>
				current_drum = <current_drum>
				current_mic = <current_mic>
			}
		endif
		i = 0
		begin
		curr_id = (<menu_array> [<i>])
		runscriptonscreenelement id = <curr_id> ui_band_mode_create_menu
		i = (<i> + 1)
		repeat <array_size>
	endif
	net_setup_band_lobby_ticker
	if ($is_network_game = 1)
		if ($net_band_mode_menu = host)
			update_network_ticker \{msg_checksum = menu_host}
		elseif ($net_band_mode_menu = join)
			update_network_ticker \{msg_checksum = menu_join}
		elseif ($net_band_mode_menu = invite)
			update_network_ticker \{msg_checksum = menu_invite}
		elseif ($net_band_mode_menu = lobby)
			if ishost
				myinterfaceelement :getsingletag \{net_lobby_ready}
				if (<net_lobby_ready> = 0)
					myinterfaceelement :obj_spawnscript \{net_career_wait_for_clients_uistate_ready}
				endif
			else
				if ($net_career_invite_flag = 0)
					net_career_send_to_host_msg_uistate_ready
				endif
			endif
		endif
		if isps3
			if NOT netsessionfunc \{obj = voice
					func = voice_allowed}
				update_network_ticker \{msg_checksum = ps3_chat}
			endif
		endif
		if (($net_band_mode_menu = host) || ($net_band_mode_menu = invite))
			myinterfaceelement :obj_spawnscriptlater \{career_poll_party_for_joiners}
			myinterfaceelement :obj_spawnscriptlater \{career_poll_party_data}
		endif
		if (($net_band_mode_menu = lobby) && ($career_matchmaking_complete = 0))
			change \{net_matchmaking_search_window = cancel_only}
			if ($net_career_invite_flag = 1)
				change \{net_matchmaking_search_window = invites}
			endif
			net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			if screenelementexists \{id = myinterfaceelement}
				myinterfaceelement :obj_spawnscriptnow \{check_num_matchmaking_players_loop}
			endif
		endif
	endif
	assignalias \{id = myinterfaceelement
		alias = band_mode_menu}
	ui_band_mode_helper_text
	change \{band_mode_menu_tags = none}
	ui_band_mode_choose_leader device_num = <new_leader> no_sound
	if NOT (($net_band_mode_menu = lobby) && ($career_matchmaking_complete = 0))
		launchevent \{type = focus
			target = band_mode_menu}
	endif
endscript

script ui_band_mode_signin_changed 
	printf \{qs(0xb2103122)}
	if (($primary_controller = <controller>) && ($is_network_game = 1))
		handle_signin_changed
		return
	endif
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
	get_player_num_from_controller controller_index = <controller>
	ui_band_mode_kill_character player = <player_num>
	myinterfaceelement :gettags
	controller_signin = <controller>
	index = 0
	getarraysize <menus>
	begin
	current_menu = (<menus> [<index>])
	<current_menu> :getsingletag controller
	if (<controller> = <controller_signin>)
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	current_desc = (<descs> [<index>])
	<current_desc> :se_setprops reposition_pos = (0.0, 450.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	begin
	if NOT scriptisrunning \{ui_band_mode_signin}
		break
	endif
	wait \{1
		gameframe}
	repeat
	<current_menu> :getsingletag menu
	if (($is_network_game = 1) && (<menu> = net_remote_root))
		menu = net_remote_root
	else
		menu = join
	endif
	<current_menu> :settags {menu = <menu> instrument = none difficulty = none marked_in = 0}
	ui_band_mode_helper_text
	<current_menu> :obj_spawnscriptnow ui_band_mode_update_menu
	<current_menu> :getsingletag controller_instrument
	switch <controller_instrument>
		case guitar
		myinterfaceelement :settags {current_guitar = (<current_guitar> - 1)}
		case drum
		myinterfaceelement :settags {current_drum = (<current_drum> - 1)}
		case mic
		if (($allow_controller_for_all_instruments) = 0)
			myinterfaceelement :settags {current_mic = (<current_mic> - 1)}
		endif
	endswitch
	<current_menu> :settags controller_instrument = none
endscript

script ui_destroy_band_mode 
	killspawnedscript \{name = ui_create_band_mode_spawned}
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :die
	endif
	clean_up_user_control_helpers
	setup_bg_viewport
	restore_dummy_bg_camera
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	destroy_popup_warning_menu
	cleanup_all_photo_assets
endscript

script ui_deinit_band_mode 
	change \{disallow_band_edit_char_spam = 0}
	if ($signin_glitch_protect = 0)
		cancel_all_cas_loads
	else
		change \{signin_glitch_protect = 0}
	endif
endscript

script ui_return_band_mode 
	frontend_load_soundcheck
	if ($is_network_game = 1)
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
		destroy_loading_screen
		startrendering
		if screenelementexists \{id = myinterfaceelement}
			myinterfaceelement :se_setprops \{alpha = 1.0}
			band_mode_menu :getsingletag \{menus}
			i = 0
			getarraysize <menus>
			begin
			if screenelementexists id = (<menus> [<i>])
				(<menus> [<i>]) :getsingletag menu
				if (<menu> = ready)
					get_savegame_from_controller controller = ($primary_controller)
					getplayerinfo (<i> + 1) character_id
					get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
					cas_queue_add_request appearance = (<profile_struct>.appearance) player = (<i> + 1)
				endif
				(<menus> [<i>]) :obj_spawnscript ui_band_mode_update_menu
			endif
			i = (<i> + 1)
			repeat <array_size>
			if ($net_band_mode_menu = join)
				change \{num_players_in_band = 0}
			endif
		endif
	endif
	ui_band_mode_helper_text
endscript

script is_band_character_select_up 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :gettags
		if (<menu> = character)
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_kill_character_select_menus 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		if <curr_id> :getsingletag menu
			if (<menu> = character)
				<curr_id> :obj_spawnscriptnow ui_band_mode_back
				removeparameter \{menu}
				killed_something = 1
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{killed_something}
		return \{true}
	endif
	return \{false}
endscript

script ui_band_mode_choose_leader 
	printscriptinfo \{'ui_band_mode_choose_leader'}
	myinterfaceelement :gettags
	getarraysize <menus>
	if is_band_character_select_up
		return \{false}
	elseif ($band_mode_can_choose_leader = 0)
		return \{false}
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
		<i> = 0
		getarraysize <descs>
		begin
		current_desc = (<descs> [<i>])
		<current_desc> :se_setprops leader_indicator_alpha = 0
		<i> = (<i> + 1)
		repeat <array_size>
		return \{false}
	endif
	if ((<device_num> < <array_size>) && (<device_num> > -1))
		curr_menu = (<menus> [<device_num>])
		<curr_menu> :getsingletag menu
		if (<menu> = join)
			return \{false}
		endif
	endif
	<i> = 0
	begin
	current_desc = (<descs> [<i>])
	if (<i> = <device_num>)
		<current_desc> :se_setprops leader_indicator_alpha = 1
		change band_mode_current_leader = <i>
		if NOT ($band_mode_previous_leader = <i>)
			if NOT gotparam \{no_sound}
				soundevent \{event = select_band_leader}
			endif
			change band_mode_previous_leader = <i>
		endif
	else
		<current_desc> :se_setprops leader_indicator_alpha = 0
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_band_mode_helper_text
endscript

script ui_band_mode_create_menu 
	gettags
	obj_getid
	<objid> :setprops exclusive_device = <controller> event_handlers = [{pad_back ui_band_mode_back}]
	if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite) || (<menu> = net_remote_root))
		if gotparam \{player_index}
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller> player_index = <player_index>}
		else
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller>}
		endif
	endif
	obj_getid
	<objid> :se_getparentid
	<parent_id> :gettags
	myinterfaceelement :gettags
	ui_band_mode_update_menu \{init}
endscript

script ui_band_mode_update_name 
	myinterfaceelement :gettags
	getsingletag \{index}
	current_desc = (<descs> [<index>])
	if isxenon
		begin
		if ($band_mode_active = 0)
			name = qs(0x03ac90f0)
			netsessionfunc func = get_gamertag params = {controller = <controller>}
			if gotparam \{name}
				band_gamertag_rename gamertag = <name> index = <index>
			endif
			if ($is_network_game)
				<check_cont> = $primary_controller
			else
				<check_cont> = $band_mode_current_leader
			endif
			if (<controller> = <check_cont>)
				if NOT ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
					<current_desc> :se_setprops leader_indicator_alpha = 1
				endif
			else
				<current_desc> :se_setprops leader_indicator_alpha = 0
			endif
		endif
		wait \{1
			second
			ignoreslomo}
		repeat
	else
		begin
		if ($band_mode_active = 0)
			if ($is_network_game)
				<check_cont> = $primary_controller
			else
				<check_cont> = $band_mode_current_leader
			endif
			if (<controller> = <check_cont>)
				if NOT ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
					<current_desc> :se_setprops leader_indicator_alpha = 1
				endif
			else
				<current_desc> :se_setprops leader_indicator_alpha = 0
			endif
			get_player_num_from_controller controller_index = <controller>
			if band_mode_has_player_joined player = <index>
				formattext textname = gamertag_text qs(0x90b7ca0b) a = (<controller> + 1)
				band_gamertag_rename gamertag = <gamertag_text> index = <index>
			else
				band_gamertag_rename index = <index> gamertag = qs(0x03ac90f0)
			endif
		endif
		wait \{5
			gameframes}
		repeat
	endif
endscript

script band_mode_has_player_joined 
	screenelement_get_tags \{id = myinterfaceelement}
	if structurecontains structure = <tags> menus
		menu_id = (<tags>.menus [<player>])
		if gotparam \{menu_id}
			if screenelementexists id = <menu_id>
				<menu_id> :gettags
				if (<menu> = join)
					return \{false}
				endif
			else
				return \{false}
			endif
		else
			return \{false}
		endif
		return \{true}
	else
		return \{false}
	endif
endscript

script ui_band_menu_occlude_character 
	myinterfaceelement :gettags
	if gotparam \{descs}
		requireparams \{[
				index
			]
			all}
		current_desc = (<descs> [<index>])
		if gotparam \{revert}
			<current_desc> :se_setprops menu_player_bg_alpha = 0.8 scrollbar_alpha = 0.0 scrolling_menu_dims = (200.0, 200.0)
			if <current_desc> :desc_resolvealias name = alias_scrolling_menu param = band_play_smenu
				setscreenelementprops id = <band_play_smenu> top_selection = false
			else
				scriptassert \{qs(0x400b5d01)}
			endif
		else
			<current_desc> :se_setprops menu_player_bg_alpha = 1.0 scrollbar_alpha = 1.0 scrolling_menu_dims = (200.0, 150.0)
			if <current_desc> :desc_resolvealias name = alias_scrolling_menu param = band_play_smenu
				setscreenelementprops id = <band_play_smenu> top_selection = true
			else
				scriptassert \{qs(0x400b5d01)}
			endif
		endif
		<current_desc> :se_waitprops
	endif
endscript

script ui_band_mode_update_menu 
	destroy_loading_screen
	startrendering
	gettags
	obj_getid
	launchevent type = unfocus target = <objid>
	destroyscreenelement id = <objid> preserve_parent
	se_getparentid
	<parent_id> :se_setprops reset_window_top
	child_index = 0
	<objid> :setprops {
		replace_handlers event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		alpha = 0.0
	}
	ui_band_menu_occlude_character revert index = <index>
	printf \{qs(0xd4a09ac5)}
	myinterfaceelement :gettags
	if gotparam \{descs}
		current_desc = (<descs> [<index>])
		if ((<menu> = join) || (<menu> = character) || (<menu> = p2_character) || (<menu> = ready) || (<menu> = ready2) || (<menu> = p2_ready))
		endif
	endif
	switch <menu>
		case instrument
		ui_band_mode_create_menu_instrument
		case lefty
		ui_band_mode_create_menu_lefty
		<objid> :getsingletag instrument
		get_savegame_from_controller controller = <controller>
		focus_index = 0
		if (<instrument> = vocals)
			focus_index = 1
		else
		endif
		given_focus = <focus_index>
		case difficulty
		ui_band_mode_create_menu_difficulty
		if ($is_network_game = 0)
			difficulty = ($default_difficulty [<controller>])
		endif
		focus_index = 0
		if gotparam \{difficulty}
			switch (<difficulty>)
				case easy
				focus_index = 1
				case medium
				focus_index = 2
				case hard
				focus_index = 3
				case expert
				focus_index = 4
				if NOT gotparam \{no_expert_plus}
					get_player_num_from_controller controller_index = <controller>
					if gotparam \{player_num}
						if (<player_num> != -1)
							getplayerinfo <player_num> double_kick_drum
						endif
					endif
					if <parent_id> :getsingletag pending_drum_difficulty_double_kick
						double_kick_drum = <pending_drum_difficulty_double_kick>
					endif
					if gotparam \{double_kick_drum}
						if (<double_kick_drum> = 1)
							focus_index = 5
						endif
					endif
				endif
			endswitch
		endif
		given_focus = <focus_index>
		case character
		case p2_character
		ui_band_mode_create_menu_character
		case root
		case p2_root
		ui_band_mode_create_menu_root menu = <menu>
		if getscreenelementchildren id = <objid>
			getarraysize <children>
			child_index = (<array_size> - 1)
		endif
		case ready
		case ready2
		case p2_ready
		if NOT gotparam \{init}
			if ($is_network_game = 1)
				ui_event_get_stack
				if ((<stack> [0].base_name) = 'band_mode')
					ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
				endif
			else
				ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
			endif
		endif
		ui_band_mode_create_menu_ready
		<objid> :setprops replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case join
		ui_band_mode_create_menu_join <...>
		<objid> :setprops replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_open
		ui_band_mode_create_menu_net_remote_open
		<objid> :setprops replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_root
		ui_band_mode_create_menu_net_remote_root
		<objid> :setprops replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_local_join
		ui_band_mode_create_menu_net_local_join
		if getscreenelementchildren id = <objid>
			getarraysize <children>
			child_index = (<array_size> - 1)
		endif
		case net_local_root
		ui_band_mode_create_menu_net_local_root
		myinterfaceelement :getsingletag \{net_gig_ready}
		if ((<net_gig_ready> = 0) && (ishost) && ($primary_controller = <controller>))
			child_index = 0
		elseif (<instrument> = none)
			if isxenon
				child_index = 2
			else
				child_index = 1
			endif
		else
			if getscreenelementchildren id = <objid>
				getarraysize <children>
				child_index = (<array_size> - 1)
			endif
		endif
		case friends
		ui_band_mode_create_friends_list
		case gigs
		ui_band_mode_create_gigs
		case gamer_cards
		ui_band_mode_create_menu_gamer_cards
		case invites
		ui_band_mode_create_invite
	endswitch
	if NOT gotparam \{skip_update_wait}
		wait \{5
			gameframes}
	endif
	if NOT gotparam \{init}
		ui_band_mode_check_menus
	endif
	<objid> :setprops alpha = 1.0
	myinterfaceelement :gettags
	if gotparam \{descs}
		current_desc = (<descs> [<index>])
		if ((<menu> = character) || (<menu> = p2_character))
			ui_band_mode_show_arrows id = <current_desc>
		else
			ui_band_mode_hide_arrows id = <current_desc>
		endif
		switch <instrument>
			case guitar
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_guitar
			case bass
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_bass
			case drum
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_drums
			case vocals
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_vox
			default
			<current_desc> :se_setprops instrument_alpha = 0.0 instrument_texture = mixer_icon_guitar
		endswitch
		curr_index = <index>
		if (<menu> = join)
			band_character_rename index = <index>
		else
			if (($net_band_mode_menu = invite) || ($net_band_mode_menu = host))
				getsingletag \{user_id}
				find_party_member_menu member_id = <user_id>
				if gotparam \{party_member_menu_index}
					if is_party_member_local user_id = <user_id>
						band_character_rename index = <index> player = (<index> + 1)
					else
						band_character_rename index = <party_member_menu_index> character_name = qs(0x48294e54)
					endif
				endif
			else
				if ($band_mode_mode = career)
					if NOT progression_check_intro_complete
						skip_rename = 1
					endif
				endif
				if NOT gotparam \{skip_rename}
					getarraysize <menus>
					i = 0
					begin
					curr_menu = (<menus> [<i>])
					<curr_menu> :getsingletag index
					if (<index> = <curr_index>)
						break
					endif
					i = (<i> + 1)
					repeat <array_size>
					if NOT (<i> = <array_size>)
						band_character_rename index = <index> player = (<i> + 1)
					endif
				endif
				removeparameter \{skip_rename}
			endif
			<current_desc> :se_setprops reposition_pos = (0.0, -70.0) join_text = qs(0x03ac90f0) time = 0.1
		endif
		if ($is_network_game = 1)
			getplayerinfo (<curr_index> + 1) net_obj_id
			getplayerinfo (<curr_index> + 1) is_local_client
			if ($net_band_mode_menu = lobby)
				if (<is_local_client> = 1)
					band_character_rename index = <curr_index> player = (<curr_index> + 1)
				elseif (<net_obj_id> >= 0)
					net_get_character_name player = (<curr_index> + 1)
					band_character_rename index = <curr_index> character_name = <display_name>
				else
					band_character_rename index = <index>
				endif
				if (($career_matchmaking_complete = 1) && (<net_obj_id> < 0) && (<menu> = net_remote_open))
					(<descs> [<index>]) :se_setprops reposition_pos = (0.0, 220.0) time = 0.1 motion = ease_out
					(<descs> [<index>]) :se_waitprops
					(<descs> [<index>]) :se_setprops reposition_pos = (0.0, 450.0) time = 0.1 alpha = 0
				endif
			endif
		endif
	endif
	if ((<menu> = net_remote_open) || (<menu> = net_remote_root) || ($net_career_data_sync_done = 0))
		if ((<menu> = net_remote_root) && ($net_band_mode_menu = host))
			printf \{qs(0x71140bc3)}
		else
			return
		endif
	endif
	if gotparam \{given_focus}
		printf 'Give focus %s %d' s = <objid> d = <given_focus>
		launchevent type = focus target = <objid> data = {child_index = <given_focus>}
	else
		launchevent type = focus target = <objid> data = {child_index = <child_index>}
	endif
endscript

script ui_band_mode_show_arrows 
	requireparams \{[
			id
		]
		all}
	if screenelementexists id = <id>
		<id> :se_setprops scroll_arrow_alpha = 1.0
	endif
endscript

script ui_band_mode_hide_arrows 
	requireparams \{[
			id
		]
		all}
	if screenelementexists id = <id>
		<id> :se_setprops scroll_arrow_alpha = 0.0
	endif
endscript

script net_ui_band_mode_quit 
	printf \{qs(0x56d3a9c1)}
	if ishost
		printf \{qs(0xd9e7e49e)}
		sendstructure callback = net_ui_band_mode_quit data_to_send = {<...>}
	endif
	if gotparam \{is_host}
		printf \{qs(0x6e0e4939)}
		quit_network_game_early
		change \{net_band_mode_menu = join}
		quit_career_back_to_lobby
	else
		printf \{qs(0x3b258d22)}
		change num_players_in_band = ($num_players_in_band - 1)
		myinterfaceelement :gettags
		current_desc = (<descs> [(<player_num> - 1)])
		band_gamertag_rename index = (<player_num> - 1) gamertag = qs(0x03ac90f0)
		(<menus> [(<player_num> - 1)]) :settags {menu = net_remote_open
			instrument = none
			difficulty = none}
		(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
		ui_band_mode_helper_text
	endif
endscript

script net_ui_host_quit_lobby 
	printf \{qs(0xdf59b79a)}
	sendstructure \{callback = net_ui_band_mode_quit
		data_to_send = {
			is_host = 1
		}}
endscript

script net_ui_client_quit_lobby 
	printf \{qs(0xd98c6e80)}
	sendstructure callback = net_ui_band_mode_quit data_to_send = {player_num = <player_num>}
endscript

script correct_allowed_parts 
	if NOT arraycontains array = <allowed_parts> contains = <part>
		if structurecontains structure = <allowed> <part>
			removeparameter <part> struct_name = allowed
		endif
	endif
	return allowed = <allowed>
endscript

script filter_allowed_parts_by_character_type 
	requireparams \{[
			allowed
			controller
		]
		all}
	get_player_num_from_controller controller_index = <controller>
	printf 'filter_allowed_parts_by_character_type player=%p controller=%c' p = <player_num> c = <controller>
	if (<player_num> < 0)
		return allowed = <allowed>
	endif
	formattext checksumname = player_status 'player%p_status' p = <player_num>
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	allowed_parts = (<profile_struct>.allowed_parts)
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = drum
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = bass
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = vocals
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = guitar
	return allowed = <allowed>
endscript

script ui_band_mode_create_menu_instrument 
	obj_getid
	gettags
	fit_width = `scale each line if larger`
	fit_height = `scale down if larger`
	getactivecontrollers
	disconnect = 0
	if NOT ((<active_controllers> [<controller>]) = 1)
		disconnect = 1
		allowed = {}
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x9504b94a)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = guitar}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	if NOT structurecontains structure = <allowed> name = guitar
		<id> :setprops not_focusable rgba = [64 64 64 200]
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x7d4f9214)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = bass}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	if NOT structurecontains structure = <allowed> name = bass
		<id> :setprops not_focusable rgba = [64 64 64 200]
	endif
	if (($allow_controller_for_all_instruments) = 1 || <disconnect> = 1)
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x388cd3db)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {instrument = drum}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
		if NOT structurecontains structure = <allowed> name = drum
			<id> :setprops not_focusable rgba = [64 64 64 200]
		endif
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x1b9f6f84)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {instrument = vocals}}
			]
			tags = {has_mic = 1}
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
		if is_regular_controller controller = <controller>
			<id> :setprops tags = {has_mic = 0}
		elseif NOT structurecontains structure = <allowed> name = vocals
			<id> :setprops not_focusable rgba = [64 64 64 200]
		endif
	endif
	runscriptonscreenelement id = <id> ui_band_mode_mic_check params = {controller = <controller>}
endscript

script ui_band_mode_create_menu_lefty 
	obj_getid
	gettags
	fit_width = `scale each line if larger`
	fit_height = `scale down if larger`
	if (<instrument> = vocals)
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x305014bd)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = static}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x737839f5)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = scrolling}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
	else
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x7b0518c0)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = standard}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x2e9b1b43)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
	endif
endscript

script ui_band_mode_mic_check 
	requireparams \{[
			controller
		]
		all}
	if NOT is_regular_controller controller = <controller>
		return
	endif
	if NOT iscontrollerpluggedin controller = <controller>
		return
	endif
	if (($allow_controller_for_all_instruments) = 1)
		setprops \{tags = {
				has_mic = 1
			}}
		return
	endif
	gamemode_getproperty \{prop = faceoff}
	if (<faceoff> = true)
		get_player_num_from_controller controller_index = <controller>
		if (<player_num> = -1)
			scriptassert 'Controller %c has not been assigned to a player.' c = <controller>
		endif
	endif
	gamemode_gettype
	if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff) && ($g_head_to_head_instrument_type != vocals))
		setprops \{tags = {
				has_mic = 1
			}}
		return
	endif
	obj_getid
	begin
	<has_mic> = 0
	if (<faceoff> = true)
		if vocals_player_has_mic player = <player_num>
			<has_mic> = 1
		endif
	else
		if controller_has_headset controller = <controller>
			<has_mic> = 1
		elseif ismicrophonepluggedin
			<has_mic> = 1
		endif
	endif
	setprops tags = {has_mic = <has_mic>}
	wait \{1
		gameframe}
	repeat
endscript

script ui_band_mode_create_menu_difficulty 
	obj_getid
	if ($game_mode != p2_battle)
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 35.0)
			parent = <objid>
			text = qs(0x74d6a0a0)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {difficulty = easy_rhythm}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
	else
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 35.0)
			parent = <objid>
			text = qs(0x74d6a0a0)
			font = fontgrid_bordello
			rgba = [64 64 64 200]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			not_focusable
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 35.0)
		parent = <objid>
		text = qs(0x8d657387)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = easy}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 35.0)
		parent = <objid>
		text = qs(0x6ef11a01)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = medium}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 35.0)
		parent = <objid>
		text = qs(0x51b06d2f)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = hard}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 35.0)
		parent = <objid>
		text = qs(0x334908ac)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = expert pending_drum_difficulty_double_kick = 0}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	if getsingletag \{instrument}
		if (<instrument> = drum)
			includes_double_kick = 0
			gamemode_gettype
			if (<type> = career)
				<includes_double_kick> = 1
			elseif (<type> = faceoff || <type> = pro_faceoff || <type> = battle)
				if ($permanent_songlist_props.($current_song).double_kick = 1)
					<includes_double_kick> = 1
				endif
			else
				getarraysize ($quickplay_song_list)
				if (<array_size> > 0)
					<i> = 0
					begin
					song_entry = ($quickplay_song_list [<i>])
					if (<song_entry> != jamsession && <song_entry> != null)
						if ($permanent_songlist_props.<song_entry>.double_kick = 1)
							<includes_double_kick> = 1
							break
						endif
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			endif
			if (<includes_double_kick> = 1)
				createscreenelement {
					type = textblockelement
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 35.0)
					parent = <objid>
					text = qs(0x7a19b5f7)
					font = fontgrid_bordello
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus ui_band_mode_focus params = {offset = (0.0, 24.0) start_pos = (0.0, -125.0)}}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {difficulty = expert pending_drum_difficulty_double_kick = 1}}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
					shadow
					shadow_rgba = $ui_text_shadow_color
					shadow_offs = (3.0, 3.0)
				}
			else
				return \{no_expert_plus = 1}
			endif
		endif
	endif
endscript

script ui_band_mode_create_menu_ready 
	obj_getid
	se_getparentid
	<parent_id> :se_getparentid
	gettags
	myinterfaceelement :getsingletag \{descs}
	current_desc = (<descs> [<index>])
	if ($net_band_mode_menu = invite)
		if NOT is_party_member_local user_id = <user_id>
			ui_band_mode_kill_character player = (<index> + 1)
		endif
	endif
	if ($net_band_mode_menu = host)
		if NOT netsessionfunc func = iscontrolleringame params = {controller = <controller>}
			createscreenelement {
				type = textblockelement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				dims = (170.0, 40.0)
				parent = <objid>
				text = qs(0x679dee25)
				font = fontgrid_bordello
				rgba = [255 0 0 0]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center bottom]
				event_handlers = [
					{pad_choose ui_band_mode_choose params = {join = net_remote_root}}
				]
			}
		endif
	endif
	if ($band_mode_mode = career)
		if NOT progression_check_intro_complete
			if isxenon
				if ($band_mode_current_leader != -1)
					if checkforsignin local controller_index = ($band_mode_current_leader)
						ui_band_mode_animate_ready current_desc = <current_desc>
						return
					endif
				else
					if checkforsignin local controller_index = <controller>
						change \{band_mode_can_choose_leader = 1}
						ui_band_mode_choose_leader device_num = <controller> no_sound
						ui_band_mode_helper_text
						change \{band_mode_can_choose_leader = 0}
					endif
				endif
			else
				if ($band_mode_current_leader = -1)
					change \{band_mode_can_choose_leader = 1}
					ui_band_mode_choose_leader device_num = <controller> no_sound
					change \{band_mode_can_choose_leader = 0}
				endif
			endif
			ui_band_mode_can_choose_leader
		endif
	endif
	ui_band_mode_animate_ready current_desc = <current_desc>
endscript

script ui_band_mode_animate_ready 
	requireparams \{[
			current_desc
		]
		all}
	<current_desc> :se_setprops join_text = qs(0x03ac90f0) reposition_pos = (0.0, -70.0) time = 0.1
	<current_desc> :se_setprops ready_banner_pos = (0.0, -80.0) time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.2 time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 0.9 time = 0.1 motion = ease_in
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.1 time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.0 time = 0.1 motion = ease_in
endscript

script ui_band_mode_animate_unready 
	requireparams \{[
			current_desc
		]
		all}
	gamemode_gettype
	if (<type> = career)
		<current_desc> :se_setprops reposition_pos = (0.0, 450.0) time = 0.1
	endif
	<current_desc> :se_setprops ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	<current_desc> :se_waitprops
	<current_desc> :se_setprops time = 0.05 motion = ease_in
endscript

script ui_band_mode_ready_motion 
	if desc_resolvealias \{name = alias_ready_banner}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = false
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = false
			endif
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript

script ui_band_mode_create_menu_root 
	obj_getid
	se_getparentid
	<parent_id> :se_getparentid
	gettags
	get_savegame_from_controller controller = <controller>
	change \{rich_presence_context = presence_menus}
	set_focus_color rgba = (($g_menu_colors).menu_white)
	set_unfocus_color rgba = (($g_menu_colors).menu_gold)
	gamemode_gettype
	if (<type> = career)
	endif
	get_player_num_from_controller controller_index = <controller>
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x095895d6)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_random_character params = {player = <player_num> index = <index>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	root = character
	if (<menu> = p2_root)
		root = p2_character
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0xebd11692)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = <root>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
	}
	get_player_num_from_controller controller_index = <controller>
	formattext checksumname = player_status 'player%p_status' p = <player_num>
	if profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
		<show_edit_hero> = 1
		if NOT ($is_network_game)
			if isxenon
				if NOT checkforsignin local controller_index = <controller>
					<show_edit_hero> = 0
				endif
			endif
			if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle) || ($game_mode = p1_quickplay) || ($game_mode = p2_quickplay) || ($game_mode = p3_quickplay) || ($game_mode = p4_quickplay))
				<show_edit_hero> = 0
			endif
		endif
		if (<show_edit_hero>)
		endif
	endif
	not_signed_in = 0
	if isxenon
		if NOT islocallysignedin controller = <controller>
			not_signed_in = 1
		endif
	endif
	ready = ready
	if (<menu> = p2_root)
		ready = p2_ready
	endif
	pad_choose_params = {ready = <ready>}
	if ($band_mode_mode = career)
		if NOT progression_check_intro_complete
			pad_choose_params = {root = instrument}
			se_getparentid
			<parent_id> :getsingletag dont_randomize_character
			if NOT gotparam \{dont_randomize_character}
				formattext checksumname = player_status 'player%p_status' p = <player_num>
				get_savegame_from_player_status player_status = <player_status>
				controller = ($<player_status>.controller)
				random_band_mode_character player = <player_num>
				cas_queue_new_character_profile player = (<index> + 1) id = ($<player_status>.character_id) savegame = <savegame>
				<parent_id> :settags dont_randomize_character = 1
			endif
		endif
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `expand dims`
		fit_height = `scale down if larger`
		dims = (0.0, 40.0)
		parent = <objid>
		text = qs(0x7be2fdcb)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = <pad_choose_params>}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
		tags = {show_stars}
	}
	if NOT ($is_network_game)
		if isxenon
			if ($band_mode_current_leader != -1)
				if checkforsignin local controller_index = ($band_mode_current_leader)
					return
				endif
			else
				if checkforsignin local controller_index = <controller>
					change \{band_mode_can_choose_leader = 1}
					ui_band_mode_choose_leader device_num = <controller> no_sound
					ui_band_mode_helper_text
					change \{band_mode_can_choose_leader = 0}
				endif
			endif
		else
			if ($band_mode_current_leader = -1)
				change \{band_mode_can_choose_leader = 1}
				ui_band_mode_choose_leader device_num = <controller> no_sound
				change \{band_mode_can_choose_leader = 0}
			endif
		endif
		ui_band_mode_can_choose_leader
	endif
endscript

script ui_band_mode_save_tags 
	myinterfaceelement :getsingletag \{menus}
	change \{band_mode_menu_tags = none}
	getarraysize <menus>
	array = []
	i = 0
	begin
	curr_id = (<menus> [<i>])
	screenelement_get_tags id = <curr_id>
	removeparameter \{struct_name = tags
		tag_selected_id}
	removeparameter \{struct_name = tags
		tag_selected_index}
	removeparameter \{struct_name = tags
		tag_selected_childs_grid_index}
	if structurecontains structure = <tags> menu
		if (<tags>.menu = character)
			tags = {<tags> menu = root}
		endif
		if (<tags>.menu = invites)
			if isps3
				tags = {<tags> menu = net_local_root}
			else
				tags = {<tags> menu = friends}
			endif
		endif
	endif
	addarrayelement array = <array> index = <i> element = <tags>
	i = (<i> + 1)
	repeat <array_size>
	if (<array_size> < 4)
		begin
		addarrayelement array = <array> index = <i> element = {}
		i = (<i> + 1)
		repeat (4 - <array_size>)
	endif
	screenelement_get_tags \{id = myinterfaceelement}
	removeparameter \{struct_name = tags
		menus}
	removeparameter \{struct_name = tags
		descs}
	addarrayelement array = <array> index = <i> element = <tags>
	if NOT gotparam \{instrument}
		change band_mode_menu_tags = <array>
	else
		change band_mode_menu_tags_instrument = <array>
	endif
endscript
disallow_band_edit_char_spam = 0

script band_edit_character 
	if ($disallow_band_edit_char_spam = 0)
		change \{disallow_band_edit_char_spam = 1}
		hide_glitch \{num_frames = 10}
		external_edit_character player = <player>
	endif
endscript

script ui_band_mode_create_menu_character 
	obj_getid
	<objid> :gettags
	<objid> :se_getparentid
	printstruct <...>
	ui_band_menu_occlude_character index = <index>
	get_player_num_from_controller controller_index = <controller>
	player = <player_num>
	formattext checksumname = player_status 'player%p_status' p = <player_num>
	current_character_id = ($<player_status>.character_id)
	if band_builder_is_finalized_random character_id = <current_character_id>
		current_character_id = ($<player_status>.original_character_id)
	endif
	get_savegame_from_controller band_character_select controller = <controller> allow_guest_savegame
	get_musician_profile_size savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	i = 0
	menu_index = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			if (<current_character_id> = <character_id>)
				focus_index = <menu_index>
			endif
			createscreenelement {
				type = descinterface
				desc = 'band_play_menu_char'
				parent = <objid>
				band_play_menu_char_icon_texture = <icon>
				event_handlers = [
					{pad_choose band_character_select_choose params = {price = <price> player = <player> index = <index> character_id = <character_id> menu = <menu> savegame = <character_savegame> borrowed_from_band_leader = <borrowed_from_band_leader>}}
					{focus cas_queue_new_character_profile params = {player = (<index> + 1) id = <character_id> savegame = <savegame>}}
				]
				just = [center bottom]
				dims = (80.0, 80.0)
			}
			setscreenelementprops {
				id = <id>
				event_handlers = [
					{focus band_character_select_focus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index> player = <player_num>}}
					{unfocus band_character_select_unfocus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index>}}
				]
			}
			menu_index = (<menu_index> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			createscreenelement {
				type = descinterface
				desc = 'band_play_menu_char'
				parent = <objid>
				band_play_menu_char_icon_texture = <icon>
				just = [center bottom]
				dims = (80.0, 80.0)
				not_focusable
			}
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return given_focus = <focus_index>
endscript

script band_character_select_focus 
	if gotparam \{character_name}
		band_character_rename index = <index> character_name = <character_name>
	endif
	<id> :se_setprops scale = 1.5 pos = {relative (0.0, -10.0)} band_play_menu_char_highlight_alpha = 1.0
endscript

script band_character_rename 
	requireparams \{[
			index
		]
		all}
	myinterfaceelement :gettags
	if gotparam \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :se_getprops
		if NOT gotparam \{character_name}
			character_name = qs(0x03ac90f0)
			if gotparam \{player}
				formattext checksumname = player_status 'player%p_status' p = <player>
				get_savegame_from_player_status player_status = <player_status>
				character_id = ($<player_status>.character_id)
				if ($band_mode_mode = career)
					if NOT progression_check_intro_complete
						if NOT ((<character_id> = james_2) || (<character_id> = rob_2) || (<character_id> = kirk_2) || (<character_id> = larsulrich_2) ||
								(<character_id> = james_alt_2) || (<character_id> = rob_alt_2) || (<character_id> = kirk_alt_2) || (<character_id> = larsulrich_al2) ||
								(<character_id> = james_zomb_2) || (<character_id> = rob_zomb_2) || (<character_id> = kirk_zomb_2) || (<character_id> = larsulrich_zmb2))
							intro = 0
						endif
					endif
				endif
				if NOT gotparam \{intro}
					get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
					character_name = <fullname>
				endif
			endif
		endif
		if (<name_text> = <character_name>)
			return
		endif
		<current_desc> :obj_killspawnedscript name = band_character_name_scroll
		<current_desc> :se_setprops name_text = <character_name> name_dims = (0.0, 40.0) namemenu_dims = (0.0, 40.0) name_alpha = 1.0
		<current_desc> :se_getprops
		x = ((248 - (<name_dims> [0])) / 2)
		<current_desc> :se_setprops name_pos = ((0.0, 20.0) + ((1.0, 0.0) * <x>))
		if ((<name_dims> [0]) < 248)
			<current_desc> :se_setprops name_alpha = 0.0
			return
		endif
		<current_desc> :obj_spawnscriptnow band_character_name_scroll params = {current_desc = <current_desc>}
	endif
endscript

script band_character_name_scroll 
	wait \{2
		gameframes}
	<current_desc> :se_getprops
	width = ((<namemenu_dims> [0]) + 100)
	pos = ((0.5, 0.0) * <width>)
	time = (2.0 * (<width> / 500.0))
	begin
	se_setprops name_pos = {(-1.0 * <pos>) relative} time = <time>
	wait <time> seconds ignoreslomo
	se_setprops name_pos = {<pos> relative}
	repeat
endscript

script band_gamertag_rename 
	requireparams \{[
			gamertag
			index
		]
		all}
	myinterfaceelement :gettags
	if gotparam \{descs}
		current_desc = (<descs> [<index>])
	elseif gotparam \{desc_item}
		current_desc = <desc_item>
	endif
	<current_desc> :se_getprops
	if (<gamertag_text> = <gamertag>)
		return
	endif
	<current_desc> :obj_killspawnedscript name = band_gamertag_scroll
	<current_desc> :se_setprops gamertag_text = <gamertag> gamertag_dims = (0.0, 40.0) gamertagmenu_dims = (0.0, 40.0)
	<current_desc> :se_getprops
	x = ((248 - (<gamertag_dims> [0])) / 2)
	<current_desc> :se_setprops gamertag_pos = ((0.0, -20.0) + ((1.0, 0.0) * <x>))
	if ((<gamertag_dims> [0]) < 248)
		return
	endif
	<current_desc> :obj_spawnscriptnow band_gamertag_scroll params = {current_desc = <current_desc>}
endscript

script band_gamertag_scroll 
	wait \{2
		gameframes}
	<current_desc> :se_getprops
	width = ((<gamertagmenu_dims> [0]) + 100)
	pos = ((0.5, 0.0) * <width>)
	time = (2.0 * (<width> / 500.0))
	begin
	se_setprops gamertag_pos = {(-1.0 * <pos>) relative} time = <time>
	wait <time> seconds ignoreslomo
	se_setprops gamertag_pos = {<pos> relative}
	repeat
endscript

script band_character_select_unfocus 
	<id> :se_setprops scale = 1.0 pos = (0.0, 0.0) band_play_menu_char_highlight_alpha = 0.0
endscript

script band_resolve_guest_characters 
	requireparams \{[
			player
			character_id
			savegame
			borrowed_from_band_leader
		]
		all}
	if profile_can_be_modified id = <character_id> savegame = <savegame>
		if NOT is_completely_custom_musician id = <character_id> savegame = <savegame>
			if NOT searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <character_id>
				scriptassert '%s not found' s = <character_id>
			endif
			if globaltag_check_preset_musician_modified index = <index> savegame = <borrowed_from_band_leader>
				savegame = <borrowed_from_band_leader>
				printf 'Using guest %d' d = <character_id>
			else
				printf 'Using leader %d' d = <character_id>
			endif
		endif
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		force_set_random_appearance player = <player> appearance = (<profile_struct>.appearance)
		updatestructelement struct = $guest_character_fullnames element = <new_character_id> value = (<profile_struct>.fullname)
		change guest_character_fullnames = <newstruct>
		updatestructelement struct = $guest_character_names element = <new_character_id> value = (<profile_struct>.name)
		change guest_character_names = <newstruct>
		formattext checksumname = player_status 'player%p_status' p = <player>
		change structurename = <player_status> original_character_id = <character_id>
		character_id = <new_character_id>
	endif
	return character_id = <character_id>
endscript

script band_character_select_choose 
	formattext checksumname = player_status 'player%p_status' p = <player>
	if (($<player_status>.controller) < 4)
		setarrayelement arrayname = band_builder_random_preset_used globalarray index = ($<player_status>.controller) newvalue = <character_id>
	endif
	if gotparam \{borrowed_from_band_leader}
		if NOT (<borrowed_from_band_leader> = <savegame>)
			set_band_character_id_globaltag savegame = <savegame> controller = ($<player_status>.controller) character_id = <character_id> player = <player>
		endif
		ui_band_mode_choose_sound instrument = `default` controller = ($<player_status>.controller)
		band_resolve_guest_characters player = <player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
		change structurename = <player_status> character_id = <character_id>
	else
		ui_band_mode_choose_sound instrument = `default` controller = ($<player_status>.controller)
		change structurename = <player_status> character_id = <character_id>
		set_band_character_id_globaltag savegame = <savegame> controller = ($<player_status>.controller) character_id = <character_id> player = <player>
	endif
	cas_queue_new_character_profile player = (<index> + 1) id = <character_id> savegame = <savegame>
	character = character
	if (<menu> = p2_character)
		character = p2_character
	endif
	ui_band_mode_choose character = <character>
endscript

script band_character_select_back_out 
	requireparams \{[
			player
			controller
		]
		all}
	formattext checksumname = player_status 'player%p_status' p = <player>
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	cas_queue_new_character_profile player = (<index> + 1) id = <character_id> savegame = <savegame>
endscript

script ui_band_mode_create_menu_join 
	obj_getid
	gettags
	printf \{qs(0x5448addd)}
	change \{rich_presence_context = presence_menus}
	array = [
		{pad_choose ui_band_mode_choose params = {join}}
	]
	user_control_helper_get_buttonchar button = green controller = <controller>
	join_text = (<buttonchar> + qs(0x0e5ec1a3))
	join_text = (<join_text>)
	createscreenelement {
		type = containerelement
		parent = <objid>
		event_handlers = <array>
	}
	myinterfaceelement :getsingletag \{descs}
	current_desc = (<descs> [<index>])
	if <current_desc> :desc_resolvealias name = alias_join
		<resolved_id> :se_setprops metaremapenableauto = false metaremapdevicetouse = <controller>
	endif
	<current_desc> :se_setprops join_text = <join_text> reposition_pos = (0.0, 450.0)
	if ($is_network_game = 1)
		netsessionfunc func = removecontroller params = {controller = <controller>}
	endif
endscript

script ui_band_mode_create_menu_net_remote_open 
	obj_getid
	gettags
	ui_band_mode_kill_character player = (<index> + 1)
	createscreenelement {
		type = textblockelement
		parent = <objid>
		local_id = text
		fit_height = `scale down if larger`
		text = qs(0x496fc06c)
		font = fontgrid_bordello
		dims = (200.0, 40.0)
		allow_expansion
		rgba = ($menu_unfocus_color)
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
endscript

script ui_band_mode_create_menu_net_remote_root 
	obj_getid
	se_getparentid
	<parent_id> :se_getparentid
	gettags
	myinterfaceelement :gettags
	getsingletag \{index}
	current_desc = (<descs> [<index>])
	switch <instrument>
		case guitar
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_guitar
		case bass
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_bass
		case drum
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_drums
		case vocals
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_vox
		default
		<current_desc> :se_setprops instrument_alpha = 0.0 instrument_texture = mixer_icon_guitar
	endswitch
	if ($net_band_mode_menu = host)
		ui_band_mode_kill_character player = (<index> + 1)
		event_handlers = [
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {join = net_remote_root}}
		]
		user_control_helper_get_buttonchar button = green controller = <controller>
		if checkforsignin controller_index = <controller>
			text = (qs(0x5af62a36) + <buttonchar> + qs(0x3bf1e078))
		else
			text = (qs(0x5af62a36) + <buttonchar> + qs(0x2932ee66))
		endif
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) && (<connections> [<i>].user_id [1]) = (<user_id> [1]))
			name = (<connections> [<i>].gamertag)
		endif
		i = (<i> + 1)
		repeat <array_size>
		add_gamertag_to_band_lobby index = <index> name = <name> menu = <menu>
	else
		if ($net_band_mode_menu = invite)
			ui_band_mode_kill_character player = (<index> + 1)
		endif
		get_savegame_from_controller controller = ($primary_controller)
		getplayerinfo (<index> + 1) character_id
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		if NOT ($net_band_mode_menu = invite)
			if is_current_state_band_mode
				cas_queue_add_request appearance = (<profile_struct>.appearance) player = (<index> + 1)
			endif
		endif
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
		]
		text = qs(0x138adb74)
	endif
	createscreenelement {
		type = textblockelement
		parent = <objid>
		text = <text>
		font = fontgrid_bordello
		dims = (200.0, 0.0)
		rgba = ($menu_unfocus_color)
		event_handlers = <event_handlers>
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		allow_expansion
	}
endscript

script ui_band_mode_create_menu_net_local_join 
	printf \{qs(0xe24deabe)}
	obj_getid
	gettags
	change \{rich_presence_context = presence_menus}
	if ($net_band_mode_menu = host)
		se_getparentid
		getsingletag \{marked_in}
		if (<marked_in> = 0)
			myinterfaceelement :gettags
			if isguitarcontroller controller = <controller>
				settags \{controller_instrument = guitar}
				myinterfaceelement :settags {current_guitar = (<current_guitar> + 1)}
			elseif isdrumcontroller controller = <controller>
				settags \{controller_instrument = drum}
				myinterfaceelement :settags {current_drum = (<current_drum> + 1)}
			elseif (($allow_controller_for_all_instruments) = 0)
				settags \{controller_instrument = mic}
				myinterfaceelement :settags {current_mic = (<current_mic> + 1)}
			endif
			settags \{marked_in = 1}
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			settags user_id = <user_id>
		endif
	endif
	if ($net_band_mode_menu = invite)
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_show_character player = <player_num>
	endif
	myinterfaceelement :getsingletag \{descs}
	netsessionfunc func = get_user_id params = {controller_index = <controller>}
	if isxenon
		(<descs> [<index>]) :obj_spawnscriptlater update_headset_status params = {obj_id = (<descs> [<index>]) uid = <user_id>}
	endif
	if (($net_band_mode_menu = host) || ($net_band_mode_menu = invite))
		if isxenon
			invites_text = qs(0xf41fb4ee)
			params = {root = friends}
		else
			invites_text = qs(0x306229d7)
			params = {friends = invite}
		endif
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = <invites_text>
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = <params>}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	if isxenon
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x05dd2fa3)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {net_local_join = gamer_cards device_num = <device_num>}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	get_player_num_from_controller controller_index = <controller>
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x095895d6)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_random_character params = {player = <player_num> index = <index>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0xebd11692)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = p2_character}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (160.0, 40.0)
		parent = <objid>
		text = qs(0x7be2fdcb)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = ready device_num = <device_num>}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	get_controller_type controller_index = <controller>
	if (<controller_type> = controller)
		if controller_has_headset controller = <controller>
			controller_type = vocals
		endif
	endif
	settags instrument = <controller_type>
	return instrument = <controller_type>
endscript

script ui_band_mode_create_menu_net_local_root 
	obj_getid
	se_getparentid
	<parent_id> :se_getparentid
	gettags
	myinterfaceelement :gettags
	getsingletag \{index}
	change \{rich_presence_context = presence_menus}
	get_player_num_from_controller controller_index = <controller>
	ui_band_mode_show_character player = <player_num>
	if scriptisrunning \{net_ui_band_mode_countdown_to_gig}
		countdown_active = 1
	else
		countdown_active = 0
	endif
	current_desc = (<descs> [<index>])
	switch <instrument>
		case guitar
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_guitar
		case bass
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_bass
		case drum
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_drums
		case vocals
		<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = mixer_icon_vox
		default
		<current_desc> :se_setprops instrument_alpha = 0.0 instrument_texture = mixer_icon_guitar
	endswitch
	if ((ishost) && (<band_leader> = 1) && (<countdown_active> = 0) && ($net_popup_active = 0))
		gig_text = qs(0xdd815a67)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose net_career_goto_gig_board}
		]
	else
		gig_text = qs(0xaf4d8fe7)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = gigs}}
		]
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = <gig_text>
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = <event_handlers>
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if isxenon
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x05dd2fa3)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {net_local_join = gamer_cards device_num = <device_num>}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	if NOT ((<instrument> = vocals) || (<instrument> = drum))
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x8694014b)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = instrument}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	if (<instrument> = vocals)
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0xaedf49cb)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		createscreenelement {
			type = textblockelement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <objid>
			text = qs(0x2e9b1b43)
			font = fontgrid_bordello
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x9f281c76)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = difficulty}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <objid>
		text = qs(0x7be2fdcb)
		font = fontgrid_bordello
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = ready}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if ((ishost) && ($primary_controller = <controller>))
		myinterfaceelement :gettags
		if (<net_gig_ready> = 0)
			<id> :se_setprops not_focusable rgba = [50 44 35 255]
		endif
	endif
endscript

script ui_band_mode_create_friends_list 
	gettags
	generic_menu_pad_choose_sound
	netsessionfunc obj = friends func = begin_retrieve_friends_list params = {callback = career_friendslist_callback device_num = <controller> callback_params = {menu_index = <index>}}
endscript

script ui_band_mode_create_invite 
	obj_getid
	gettags
	createscreenelement {
		type = textblockelement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 30.0)
		parent = <objid>
		text = <friend_name>
		font = fontgrid_bordello
		rgba = [200 0 0 255]
		event_handlers = [
			{focus ui_band_mode_focus}
			{unfocus retail_menu_unfocus}
		]
		not_focusable
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center top]
	}
	if isxenon
		switch <friend_friendstate>
			case online
			status_texture = friendslist_online
			case offline
			status_texture = friendslist_offline
			case away
			status_texture = friendslist_away
			case busy
			status_texture = friendslist_busy
		endswitch
		createscreenelement {
			type = spriteelement
			parent = <objid>
			texture = <status_texture>
			dims = (32.0, 32.0)
			just = [center top]
			not_focusable
		}
		createscreenelement {
			type = textblockelement
			parent = <objid>
			text = qs(0xfcc51f45)
			font = fontgrid_bordello
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose menu_show_gamercard_from_netid params = {net_id = <friend_id>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	dont_show_invite_options = 0
	if gotparam \{cant_invite}
		if (1 = <cant_invite>)
			<dont_show_invite_options> = 1
		endif
	endif
	if NOT isps3
		if (0 = <dont_show_invite_options>)
			if (<friend_sentfriendrequest> = true)
				createscreenelement {
					type = textblockelement
					parent = <objid>
					text = qs(0xda79f6f2)
					font = fontgrid_bordello
					fit_height = `scale down if larger`
					dims = (200.0, 90.0)
					rgba = [200 0 0 255]
					event_handlers = [
						{focus ui_band_mode_focus}
						{unfocus retail_menu_unfocus}
					]
					not_focusable
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				<objid> :setprops replace_handlers event_handlers = [
					{pad_up nullscript}
					{pad_down nullscript}
				]
			else
				createscreenelement {
					type = textblockelement
					parent = <objid>
					text = qs(0xee572b68)
					font = fontgrid_bordello
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus ui_band_mode_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = guitar index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				createscreenelement {
					type = textblockelement
					parent = <objid>
					text = qs(0x6268475a)
					font = fontgrid_bordello
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus ui_band_mode_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = drum index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				createscreenelement {
					type = textblockelement
					parent = <objid>
					text = qs(0x60ccfda6)
					font = fontgrid_bordello
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus ui_band_mode_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = mic index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	else
		createscreenelement {
			type = textblockelement
			parent = <objid>
			text = qs(0xee572b68)
			font = fontgrid_bordello
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = guitar index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		createscreenelement {
			type = textblockelement
			parent = <objid>
			text = qs(0x6268475a)
			font = fontgrid_bordello
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = drum index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		createscreenelement {
			type = textblockelement
			parent = <objid>
			text = qs(0x60ccfda6)
			font = fontgrid_bordello
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus ui_band_mode_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = mic index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	removetags \{[
			friend_name
			friend_id
			friend_sentfriendrequest
			friend_sentinvite
			friend_friendstate
			cant_invite
		]}
endscript

script ui_band_mode_create_gigs 
	obj_getid
	se_getparentid
	<parent_id> :se_getparentid
	gettags
	event_handlers = [
		{focus ui_band_mode_create_gigs_focus}
		{unfocus ui_band_mode_create_gigs_unfocus}
	]
	createscreenelement {
		type = containerelement
		parent = <objid>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = name_arrow_up
		just = [center bottom]
		pos_anchor = [center bottom]
		pos = (0.0, 0.0)
		scale = 1.15
	}
	i = ($current_gig_number)
	if ((<i> < 1) || (<i> > (($gh4_career_band_songs.num_tiers) -2)))
		i = 1
	endif
	formattext checksumname = tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($gh4_career_band_songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	getglobaltags <gig_name> savegame = <savegame>
	if (<i> < 10)
		formattext checksumname = texture 'gig_poster_small_0%i' i = <i>
	else
		formattext checksumname = texture 'gig_poster_small_%i' i = <i>
	endif
	if NOT gotparam \{first_texture}
		first_texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			first_complete = 1
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = <objid>
		dims = (100.0, 125.0)
		event_handlers = <event_handlers>
		just = [center center]
		tags = {
			index = <i>
			controller = <controller>
		}
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = <texture>
		dims = (100.0, 125.0)
		just = [center center]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
	}
	diff_alpha = 0
	if (<completed> = 1 || <completed> = 2)
		diff_alpha = 1
	endif
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = gig_poster_checkmark_128
		just = [center center]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		alpha = <diff_alpha>
	}
	createscreenelement {
		type = containerelement
		parent = <objid>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = name_arrow_dn
		just = [center top]
		pos_anchor = [center top]
		scale = 1.15
		pos = (0.0, 0.0)
	}
	<objid> :setprops event_handlers = [
		{pad_up ui_band_mode_create_gigs_scroll}
		{pad_down ui_band_mode_create_gigs_scroll params = {down}}
	]
endscript

script ui_band_mode_create_gigs_scroll 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	obj_getid
	resolvescreenelementid id = {<objid> child = {1 child = 0}}
	<resolved_id> :gettags
	if (<index> < 1)
		index = 1
	elseif (<index> > (($gh4_career_band_songs.num_tiers) -2))
		index = (($gh4_career_band_songs.num_tiers) -2)
	endif
	if gotparam \{down}
		i = (<index> + 1)
		runscriptonscreenelement id = {<objid> child = {2 child = 0}} ui_band_mode_create_gigs_blink_arrow
	else
		i = (<index> - 1)
		runscriptonscreenelement id = {<objid> child = {0 child = 0}} ui_band_mode_create_gigs_blink_arrow
	endif
	begin
	if (<i> < 1)
		i = (($gh4_career_band_songs.num_tiers) -2)
	elseif (<i> > (($gh4_career_band_songs.num_tiers) -2))
		i = 1
	endif
	if (<i> = <index>)
		break
	endif
	formattext checksumname = tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($gh4_career_band_songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	getglobaltags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		if (<i> < 10)
			formattext checksumname = texture 'gig_poster_small_0%i' i = <i>
		else
			formattext checksumname = texture 'gig_poster_small_%i' i = <i>
		endif
		<resolved_id> :se_setprops texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			setscreenelementprops id = {<resolved_id> child = 0} alpha = 1.0
		else
			setscreenelementprops id = {<resolved_id> child = 0} alpha = 0.0
		endif
		break
	endif
	if gotparam \{down}
		i = (<i> + 1)
	else
		i = (<i> - 1)
	endif
	repeat
	<resolved_id> :settags index = <i>
	if gotparam \{down}
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster params = {down}
	else
		i = (<index> + 1)
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster
	endif
endscript

script ui_band_mode_create_gigs_choose 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	band_mode_menu :settags \{net_gig_ready = 1}
	generic_menu_pad_choose_sound
	change \{current_progression_flag = career_band}
	change current_gig_number = <index>
	ui_band_mode_choose \{gigs}
endscript

script ui_band_mode_create_gigs_blink_arrow 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	se_setprops \{scale = 1.3499999
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{scale = 1.15
		time = 0.1
		motion = ease_out}
endscript

script ui_band_mode_create_gigs_move_poster 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	se_setprops \{alpha = 0.0}
	if gotparam \{down}
		se_setprops \{pos = (0.0, -10.0)}
		se_setprops \{alpha = 1.0
			pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	else
		se_setprops \{pos = (0.0, 10.0)}
		se_setprops \{alpha = 1.0
			pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	endif
endscript

script ui_band_mode_create_gigs_focus 
endscript

script ui_band_mode_create_gigs_unfocus 
endscript

script ui_band_mode_create_menu_gamer_cards 
	obj_getid
	if ($is_network_game = 1)
		if NOT ($net_band_mode_menu = lobby)
			netsessionfunc \{obj = party
				func = get_party_members}
			getarraysize <connections>
			i = 0
			begin
			createscreenelement {
				type = containerelement
				parent = <objid>
				dims = (200.0, 40.0)
				just = [center bottom]
			}
			container_id = <id>
			createscreenelement {
				type = textblockelement
				fit_width = `expand dims`
				fit_height = `scale down if larger`
				parent = <id>
				text = (<connections> [<i>].gamertag)
				font = fontgrid_denim_title
				dims = (0.0, 40.0)
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus ui_band_mode_focus}
					{unfocus retail_menu_unfocus}
					{focus career_friendslist_scroll}
					{unfocus career_friendslist_stop_scroll}
				]
				internal_scale = 0.75
				just = [left bottom]
				internal_just = [left center]
				pos_anchor = [left bottom]
				pos = (0.0, 0.0)
			}
			getscreenelementdims id = <id>
			if NOT (<width> > 200)
				<id> :se_setprops {
					just = [center bottom]
					internal_just = [center center]
					pos_anchor = [center bottom]
					pos = (0.0, 0.0)
				}
			endif
			<container_id> :se_setprops {
				focusable_child = <id>
				event_handlers = [
					{pad_choose menu_show_gamercard_from_netid params = {net_id = (<connections> [<i>].user_id)}}
					{pad_choose generic_menu_pad_choose_sound}
				]
			}
			i = (<i> + 1)
			repeat <array_size>
		else
			i = 0
			begin
			net_id = [0 0]
			getplayerinfo (<i> + 1) net_id_first
			getplayerinfo (<i> + 1) net_id_second
			setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
			getplayerinfo (<i> + 1) gamertag
			name = $<gamertag>
			createscreenelement {
				type = textblockelement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				parent = <objid>
				text = <name>
				font = fontgrid_denim_title
				dims = (200.0, 40.0)
				allow_expansion
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus ui_band_mode_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <net_id>}}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
			i = (<i> + 1)
			repeat ($current_num_players)
		endif
	else
		printf \{qs(0xb375e132)}
		myinterfaceelement :gettags
		getarraysize \{menus}
		i = 0
		begin
		curr_menu = (<menus> [<i>])
		<curr_menu> :gettags
		if NOT (<menu> = join)
			netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			if (<name> = qs(0x03ac90f0))
				formattext textname = name qs(0x260b41e9) n = (<controller> + 1)
			endif
			createscreenelement {
				type = textblockelement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				parent = <objid>
				text = <name>
				font = fontgrid_denim_title
				dims = (200.0, 40.0)
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus ui_band_mode_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_band_mode_show_gamertag params = {net_id = <user_id> device_num = <controller>}}
				]
				internal_scale = 0.75
				just = [center center]
				internal_just = [center center]
			}
		else
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_band_mode_show_gamertag 
	if NOT gotparam \{device_num}
		return
	endif
	if islocallysignedin controller = <device_num>
		if gotparam \{net_id}
			netsessionfunc func = showgamercard params = {player_xuid = <net_id> controller_index = <device_num>}
		endif
	endif
endscript

script ui_band_mode_choose 
	se_getparentid
	<parent_id> :getsingletag stars_id
	<stars_id> :se_setprops alpha = 0
	controller = <device_num>
	if NOT gotparam \{instrument}
		if ($is_network_game = 0)
			launchevent type = unfocus target = <parent_id>
			ui_band_mode_choose_sound instrument = <instrument> controller = <controller>
		endif
	endif
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		myinterfaceelement :getsingletag \{menus}
		if NOT isscreenelementinfocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	if gotparam \{instrument}
		setspawninstancelimits \{max = 1
			management = ignore_spawn_request
			checkwholecallstack}
		if ($is_network_game = 1)
			<parent_id> :getsingletag controller
		else
			launchevent type = unfocus target = <parent_id>
			get_player_num_from_controller controller_index = <device_num>
			getplayerinfo <player_num> controller
		endif
		ui_get_controller_parts_allowed controller = <controller>
		if NOT structurecontains structure = <allowed> <instrument>
			ui_band_mode_save_tags \{instrument}
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
			return
		elseif getsingletag \{has_mic}
			if ((<instrument> = vocals) && (<has_mic> = 0))
				ui_band_mode_save_tags \{instrument}
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
				return
			endif
		endif
		temp_instrument = <instrument>
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
		<parent_id> :getsingletag index
		i = 0
		begin
		if NOT (<i> = <index>)
			curr_menu = (<menus> [<i>])
			<curr_menu> :getsingletag instrument
			if NOT (<instrument> = none)
				if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
					if NOT (<instrument> = <temp_instrument>)
						launchevent type = focus target = <parent_id>
						return
					endif
				else
					if (<instrument> = <temp_instrument>)
						launchevent type = focus target = <parent_id>
						return
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		instrument = <temp_instrument>
		switch <instrument>
			case guitar
			anim = guitar
			ui_band_mode_choose_sound controller = <controller>
			case bass
			anim = bass
			ui_band_mode_choose_sound controller = <controller>
			case drum
			anim = drums
			ui_band_mode_choose_sound controller = <controller>
			case vocals
			anim = vocals
			ui_band_mode_choose_sound controller = <controller>
		endswitch
		if cas_player_has_character_object player = (<device_num> + 1)
			band_playanim name = <character_object> anim = <anim> no_wait
		endif
		<parent_id> :settags {instrument = <instrument>}
		if ($is_network_game = 1)
			<parent_id> :settags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			sendstructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = <instrument> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :settags {menu = lefty}
		endif
	elseif gotparam \{lefty}
		if ($is_network_game = 1)
			<parent_id> :settags {menu = net_local_root}
		else
			<parent_id> :settags {menu = difficulty}
		endif
		get_player_num_from_controller controller_index = <device_num>
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		switch (<lefty>)
			case standard
			setplayerinfo <player_num> lefty_flip = 0
			setplayerinfo <player_num> lefthanded_gems = 0
			setplayerinfo <player_num> lefthanded_button_ups = 0
			setplayerinfo <player_num> lefthanded_button_ups_flip_save = 0
			setplayerinfo <player_num> lefthanded_gems_flip_save = 0
			case lefty
			setplayerinfo <player_num> lefty_flip = 1
			setplayerinfo <player_num> lefthanded_gems = 1
			setplayerinfo <player_num> lefthanded_button_ups = 1
			setplayerinfo <player_num> lefthanded_button_ups_flip_save = 1
			setplayerinfo <player_num> lefthanded_gems_flip_save = 1
			default
			<has_mic> = 0
			if controller_has_headset controller = <device_num>
				<has_mic> = 1
			elseif ismicrophonepluggedin
				<has_mic> = 1
			endif
			if (<has_mic> = 0)
				<parent_id> :settags {menu = lefty}
				ui_band_mode_save_tags \{instrument}
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <device_num>}
				return
			endif
			setplayerinfo <player_num> vocals_highway_view = <lefty>
		endswitch
	elseif gotparam \{difficulty}
		if <parent_id> :getsingletag instrument
			if (<instrument> = vocals)
				<has_mic> = 0
				if controller_has_headset controller = <device_num>
					<has_mic> = 1
				elseif ismicrophonepluggedin
					<has_mic> = 1
				endif
				if (<has_mic> = 0)
					ui_band_mode_save_tags \{instrument}
					generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <device_num>}
					return
				endif
			endif
		endif
		<parent_id> :removetags [pending_drum_difficulty_double_kick]
		<parent_id> :settags {difficulty = <difficulty> pending_drum_difficulty_double_kick = <pending_drum_difficulty_double_kick>}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		setarrayelement arrayname = default_difficulty globalarray index = <device_num> newvalue = <difficulty>
		if ($is_network_game = 1)
			<parent_id> :settags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			sendstructure callback = spawn_net_ui_band_mode_choose data_to_send = {difficulty = <difficulty> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :settags {menu = ready2}
			myinterfaceelement :obj_spawnscript \{ui_band_difficulty_continue}
		endif
	elseif gotparam \{root}
		if (<root> = instrument)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = instrument}
			if (($allow_controller_for_all_instruments) = 0)
				if NOT isguitarcontroller controller = <controller>
					if isdrumcontroller controller = <controller>
						<parent_id> :settags {
							menu = lefty
							instrument = drum
						}
					else
						<parent_id> :settags {
							menu = lefty
							instrument = vocals
						}
					endif
				endif
			endif
			if ($is_network_game = 1)
				<parent_id> :settags {instrument = none}
				myinterfaceelement :settags \{net_instruments_ready = 0}
				get_player_num_from_controller controller_index = <device_num>
				sendstructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = none player_num = <player_num> spawn_script_now}
			endif
		elseif (<root> = lefty)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = lefty}
		elseif (<root> = difficulty)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = difficulty}
		elseif (<root> = character)
			<parent_id> :settags {menu = character}
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
		elseif (<root> = p2_character)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = p2_character}
		elseif (<root> = friends)
			<parent_id> :settags {menu = friends}
		elseif (<root> = gigs)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = gigs}
		elseif (<root> = gamer_cards)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :settags {menu = gamer_cards}
		endif
	elseif gotparam \{ready}
		if (<ready> = ready)
			<parent_id> :settags {menu = ready}
			if ($band_mode_mode = career)
				if progression_check_intro_complete
					<parent_id> :getsingletag controller
					<parent_id> :settags {menu = instrument}
					if (($allow_controller_for_all_instruments) = 0)
						if NOT isguitarcontroller controller = <controller>
							if isdrumcontroller controller = <controller>
								<parent_id> :settags {
									menu = lefty
									instrument = drum
								}
							else
								<parent_id> :settags {
									menu = lefty
									instrument = vocals
								}
							endif
						endif
					endif
				endif
			endif
			if ($net_band_mode_menu = lobby)
				get_player_num_from_controller controller_index = <device_num>
				sendstructure callback = spawn_net_ui_band_mode_choose data_to_send = {ready = ready player_num = <player_num> spawn_script_now}
			elseif (($net_band_mode_menu = invite) || ($net_band_mode_menu = host))
				<parent_id> :getsingletag user_id
			endif
		elseif (<ready> = p2_ready)
			<parent_id> :settags {menu = p2_ready}
			myinterfaceelement :obj_spawnscript \{ui_character_hub_continue}
		endif
	elseif gotparam \{join}
		ui_band_mode_choose_sound controller = <device_num>
		if ($is_network_game = 1)
			if (($net_band_mode_menu = host) || ($net_band_mode_menu = join))
				if isxenon
					if NOT (checkforsignin controller_index = <device_num>)
						ui_band_mode_signin device_num = <device_num>
						net_career_wait_until_menu_update_is_done
						<parent_id> :obj_spawnscript ui_band_mode_update_menu
						return
					endif
				else
					printf \{qs(0x84627f2d)}
				endif
			endif
			if ($net_band_mode_menu = host)
				netsessionfunc \{obj = party
					func = get_party_members}
				getarraysize <connections>
				if (<array_size> > 3)
					update_network_ticker \{msg_checksum = full}
					return
				endif
			endif
		else
			if gotparam \{change_profile}
				if NOT isanycontrollersignedin
					ui_band_mode_signin device_num = <device_num>
					return
				endif
			endif
		endif
		<parent_id> :gettags
		myinterfaceelement :gettags
		if isguitarcontroller controller = <controller>
			if (<current_guitar> = <total_guitar>)
				update_network_ticker \{msg_checksum = max_guitars}
				launchevent type = focus target = <parent_id>
				return
			endif
			<parent_id> :settags controller_instrument = guitar
			myinterfaceelement :settags {current_guitar = (<current_guitar> + 1)}
		elseif isdrumcontroller controller = <controller>
			if (<current_drum> = <total_drum>)
				update_network_ticker \{msg_checksum = max_drum}
				launchevent type = focus target = <parent_id>
				return
			endif
			<parent_id> :settags controller_instrument = drum
			myinterfaceelement :settags {current_drum = (<current_drum> + 1)}
		elseif (($allow_controller_for_all_instruments) = 0)
			if ($is_network_game = 1)
				mic = 0
				if ismicrophonepluggedin
					mic = 1
				endif
				if is_regular_controller controller = <controller>
					if controller_has_headset controller = <controller>
						mic = 1
					endif
				endif
				if (0 = <mic>)
					update_network_ticker \{msg_checksum = no_mic}
					launchevent type = focus target = <parent_id>
					return
				endif
			endif
			if (<current_mic> = <total_mic>)
				update_network_ticker \{msg_checksum = max_vocals}
				launchevent type = focus target = <parent_id>
				return
			endif
			<parent_id> :settags controller_instrument = mic
			myinterfaceelement :settags {current_mic = (<current_mic> + 1)}
		endif
		if ($is_network_game = 1)
			netsessionfunc func = addcontrollers params = {controller = <controller>}
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			<parent_id> :settags marked_in = 1
			update_network_ticker msg_checksum = join controller = <device_num>
			if ((<menu> = net_remote_root) || (<menu> = ready))
				net_move_invite_player_to_open_menu menu_id = <parent_id>
				<parent_id> :obj_spawnscript ui_band_mode_update_name params = {controller = <device_num>}
				<parent_id> :obj_spawnscript ui_band_mode_check_disconnect
			endif
			<parent_id> :settags user_id = <user_id>
			menu = net_local_join
		else
			menu = root
		endif
		if ($band_mode_mode = career)
			if NOT progression_check_intro_complete
				menu = ready
			endif
		endif
		get_player_num_from_controller controller_index = <controller>
		if NOT (<menu> = instrument)
			ui_band_mode_show_character player = <player_num>
		endif
		<parent_id> :settags {menu = <menu>}
	elseif gotparam \{character}
		if (<character> = character)
			<parent_id> :settags {menu = root}
		elseif (<character> = p2_character)
			if ($is_network_game = 1)
				<parent_id> :settags {menu = net_local_join}
			else
				<parent_id> :settags {menu = p2_root}
			endif
		endif
	elseif gotparam \{gigs}
		if ($is_network_game = 1)
			<parent_id> :settags {menu = net_local_root}
		else
			<parent_id> :settags {menu = root}
		endif
	elseif gotparam \{net_local_join}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		<parent_id> :settags {menu = gamer_cards}
	elseif gotparam \{friends}
		ui_band_mode_choose_sound back controller = <controller>
		<parent_id> :settags {
			menu = invites
			friend_name = <name>
			friend_id = <id>
			friend_sentfriendrequest = <sentfriendrequest>
			friend_sentinvite = <sentinvite>
			friend_friendstate = <friendstate>
			cant_invite = <cant_invite>
		}
	elseif gotparam \{invites}
		if NOT isps3
			<parent_id> :settags {menu = friends}
		else
			<parent_id> :settags {menu = invites}
		endif
		invite_to_game net_id = <net_id> name = <name> instrument = <instrument_type> menu_index = <index>
	elseif gotparam \{edit_hero}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		band_edit_character player = <player>
	elseif gotparam \{band_info}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		menu_choose_band_make_selection band_index = <band_index> from_options = <from_options>
	endif
	begin
	if NOT scriptisrunning \{ui_band_mode_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
	<parent_id> :obj_spawnscript ui_band_mode_update_menu
	if ($is_network_game = 1)
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'band_mode')
			ui_band_mode_helper_text <...>
		endif
	else
		ui_band_mode_helper_text <...>
	endif
endscript

script spawn_net_ui_band_mode_choose 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :obj_spawnscriptnow net_ui_band_mode_choose params = {<...>}
	endif
endscript

script net_ui_band_mode_choose 
	i = 0
	begin
	if (<player_num> = <i>)
		getplayerinfo <player_num> is_local_client
		if (<is_local_client> = 1)
			return
		endif
	endif
	i = (<i> + 1)
	repeat 8
	myinterfaceelement :getsingletag \{menus}
	if gotparam \{instrument}
		(<menus> [(<player_num> - 1)]) :settags {instrument = <instrument>}
		data_to_send = {instrument = <instrument> player_num = <player_num> spawn_script_now}
		if (<instrument> = none)
			myinterfaceelement :settags \{net_instruments_ready = 0}
		endif
	elseif gotparam \{difficulty}
		(<menus> [(<player_num> - 1)]) :settags {difficulty = <difficulty>}
		data_to_send = {difficulty = <difficulty> player_num = <player_num> spawn_script_now}
	elseif gotparam \{ready}
		(<menus> [(<player_num> - 1)]) :settags {menu = ready}
		data_to_send = {ready = ready player_num = <player_num> spawn_script_now}
	elseif gotparam \{character}
		data_to_send = {character = <character> character_id = <character_id> player_num = <player_num> spawn_script_now}
	endif
	if ishost
		sendstructure callback = spawn_net_ui_band_mode_choose data_to_send = <data_to_send>
	endif
	begin
	if NOT scriptisrunning \{ui_band_mode_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
	(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_mode')
		ui_band_mode_helper_text
	endif
endscript

script ui_band_mode_back 
	gettags
	se_getparentid
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		myinterfaceelement :getsingletag \{menus}
		if NOT isscreenelementinfocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	switch <menu>
		case instrument
		if ($is_network_game = 1)
			settags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			if ($band_mode_mode = career)
				if progression_check_intro_complete
					ui_band_mode_choose_sound back controller = <controller>
					settags \{menu = root}
				else
					ui_band_mode_choose_sound back controller = <controller>
					settags \{menu = root}
				endif
			else
				generic_event_back \{data = {
						keep_setlist = 1
					}
					nosound}
				ui_band_mode_choose_sound back controller = <controller>
				return
			endif
		endif
		case lefty
		if ($is_network_game = 1)
			settags \{menu = net_local_root}
		else
			settags \{menu = instrument
				instrument = none}
			get_player_num_from_controller controller_index = <device_num>
			setplayerinfo <player_num> lefty_flip = 0
			setplayerinfo <player_num> lefthanded_gems = 0
			setplayerinfo <player_num> lefthanded_button_ups = 0
			setplayerinfo <player_num> lefthanded_button_ups_flip_save = 0
			setplayerinfo <player_num> lefthanded_gems_flip_save = 0
			setplayerinfo <player_num> vocals_highway_view = scrolling
			if (($allow_controller_for_all_instruments) = 0)
				gamemode_gettype
				if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
					if ($g_head_to_head_instrument_type = drums)
						ui_band_mode_back
					elseif ($g_head_to_head_instrument_type = vocals)
						ui_band_mode_back
					endif
				else
					if NOT isguitarcontroller controller = <controller>
						ui_band_mode_back
						return
					endif
				endif
			endif
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case difficulty
		if ($is_network_game = 1)
			settags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			settags \{menu = lefty}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case character
		get_player_num_from_controller controller_index = <controller>
		band_character_select_back_out player = <player_num> index = <index> controller = <controller>
		settags \{menu = root}
		ui_band_mode_choose_sound back controller = <controller>
		case p2_character
		get_player_num_from_controller controller_index = <controller>
		band_character_select_back_out player = <player_num> index = <index> controller = <controller>
		if ($is_network_game = 1)
			ui_band_mode_choose_sound back controller = <controller>
			settags \{menu = net_local_join}
		else
			settags \{menu = p2_root}
		endif
		case root
		if ($band_mode_mode = career)
			if progression_check_intro_complete
				generic_event_back \{nosound}
				ui_band_mode_choose_sound back controller = <controller>
				cas_destroy_all_characters
				return
			endif
		endif
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_kill_character player = <player_num>
		myinterfaceelement :gettags
		ui_band_mode_choose_sound back controller = <controller>
		getsingletag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			myinterfaceelement :settags {current_guitar = (<current_guitar> - 1)}
			case drum
			myinterfaceelement :settags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				myinterfaceelement :settags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		settags \{controller_instrument = none}
		intro_career = 0
		if ($band_mode_mode = career)
			if NOT progression_check_intro_complete
				intro_career = 1
			endif
		endif
		if (<intro_career> = 1)
			cas_destroy_all_characters
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
			return
		else
			settags \{menu = join
				instrument = none
				difficulty = none}
			if gotparam \{device_num}
				if (<device_num> = ($band_mode_current_leader))
					change \{band_mode_previous_leader = -1}
					change \{band_mode_current_leader = -1}
				endif
			endif
			myinterfaceelement :getsingletag \{descs}
			current_desc = (<descs> [<index>])
			myinterfaceelement :getsingletag \{descs}
			<current_desc> :se_setprops reposition_pos = (0.0, 450.0) time = 1.0
			ui_band_mode_animate_unready current_desc = <current_desc>
		endif
		case p2_root
		generic_event_back \{nosound}
		ui_band_mode_choose_sound back controller = <controller>
		return
		case join
		if ($is_network_game = 1)
			if ($primary_controller = <controller>)
				if NOT (($net_band_mode_menu = host))
					ui_band_mode_choose_sound back controller = <controller>
				endif
				cas_destroy_all_characters
				ui_event \{event = menu_back
					data = {
						state = uistate_group_play
					}}
			else
				return
			endif
		else
			cas_destroy_all_characters
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
			return
		endif
		case ready
		if ($is_network_game = 1)
			if ($net_band_mode_menu = lobby)
				settags \{menu = net_local_root}
				get_player_num_from_controller controller_index = <device_num>
				sendstructure callback = spawn_net_ui_band_mode_back data_to_send = {player_num = <player_num> spawn_script_now}
			else
				if netsessionfunc func = iscontrolleringame params = {controller = <device_num>}
					<parent_id> :getsingletag user_id
					settags \{menu = net_local_join}
				else
					return
				endif
			endif
		else
			settags \{menu = root}
			if ($band_mode_mode = career)
				if NOT progression_check_intro_complete
					if gotparam \{device_num}
						if (<device_num> = ($band_mode_current_leader))
							change \{band_mode_previous_leader = -1}
							change \{band_mode_current_leader = -1}
						endif
					endif
					intro = 0
					settags \{menu = join}
					myinterfaceelement :gettags
					getsingletag \{controller_instrument}
					switch <controller_instrument>
						case guitar
						myinterfaceelement :settags {current_guitar = (<current_guitar> - 1)}
						case drum
						myinterfaceelement :settags {current_drum = (<current_drum> - 1)}
						case mic
						if (($allow_controller_for_all_instruments) = 0)
							myinterfaceelement :settags {current_mic = (<current_mic> - 1)}
						endif
					endswitch
					myinterfaceelement :getsingletag \{descs}
					current_desc = (<descs> [<index>])
					ui_band_mode_animate_unready current_desc = <current_desc>
					ui_band_mode_choose_sound back controller = <controller>
				endif
			endif
		endif
		ui_band_mode_choose_sound back controller = <controller>
		myinterfaceelement :getsingletag \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_animate_unready current_desc = <current_desc>
		case net_local_root
		if ($net_popup_active = 0)
			if ($career_matchmaking_complete = 0)
				return
			endif
			if NOT scriptisrunning \{net_ui_band_mode_countdown_to_gig}
				ui_event_get_top
				if (<base_name> = 'band_mode')
					generic_blocking_execute_script pad_script = generic_event_choose pad_params = {data = {state = uistate_online_quit_warning is_popup player_device = <device_num>}}
				endif
			endif
		endif
		return
		case net_local_join
		if ((($net_band_mode_menu = host) && ($primary_controller = <controller>)) || ($net_band_mode_menu = invite))
			if netsessionfunc \{obj = party
					func = is_host}
				confirm_script = net_career_host_disband_party
			else
				confirm_script = net_career_leave_party_confirm
			endif
			if ($net_popup_active = 0)
				generic_event_choose state = uistate_online_quit_warning data = {is_popup confirm_script = <confirm_script> player_device = <device_num>}
			endif
			return
		endif
		ui_band_mode_choose_sound back controller = <controller>
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_kill_character player = <player_num>
		myinterfaceelement :gettags
		getsingletag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			myinterfaceelement :settags {current_guitar = (<current_guitar> - 1)}
			case drum
			myinterfaceelement :settags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				myinterfaceelement :settags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		settags \{controller_instrument = none}
		if isxenon
			(<descs> [<index>]) :obj_killspawnedscript name = update_headset_status
		endif
		(<descs> [<index>]) :se_setprops headset_icon_alpha = (0.0)
		netsessionfunc func = removecontroller params = {controller = <controller>}
		if gotparam \{device_num}
			if (<device_num> = ($band_mode_current_leader))
				change \{band_mode_previous_leader = -1}
				change \{band_mode_current_leader = -1}
			endif
		endif
		settags \{menu = join
			instrument = none
			difficulty = none
			marked_in = 0}
		update_network_ticker \{msg_checksum = signin_change}
		case friends
		ui_band_mode_choose_sound back controller = <controller>
		settags \{menu = net_local_join}
		case invites
		ui_band_mode_choose_sound back controller = <controller>
		if NOT isps3
			settags \{menu = friends}
		else
			settags \{menu = net_local_join}
		endif
		case gigs
		if ($is_network_game = 1)
			settags \{menu = net_local_root}
		else
			settags \{menu = root}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case ready2
		ui_band_mode_choose_sound back controller = <controller>
		settags \{menu = difficulty}
		myinterfaceelement :getsingletag \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_animate_unready current_desc = <current_desc>
		case p2_ready
		settags \{menu = p2_root}
		ui_band_mode_choose_sound back controller = <controller>
		myinterfaceelement :getsingletag \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_animate_unready current_desc = <current_desc>
		case gamer_cards
		ui_band_mode_choose_sound back controller = <controller>
		if ($is_network_game = 1)
			if NOT ($net_band_mode_menu = lobby)
				settags \{menu = net_local_join}
			else
				settags \{menu = net_local_root}
			endif
		else
			settags \{menu = root}
		endif
	endswitch
	ui_band_mode_helper_text
	ui_band_mode_update_menu
endscript

script spawn_net_ui_band_mode_back 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :obj_spawnscriptnow net_ui_band_mode_back params = {<...>}
	endif
endscript

script net_ui_band_mode_back 
	i = 0
	begin
	if (<player_num> = <i>)
		getplayerinfo <player_num> is_local_client
		if (<is_local_client> = 1)
			return
		endif
	endif
	i = (<i> + 1)
	repeat 8
	myinterfaceelement :getsingletag \{menus}
	(<menus> [(<player_num> - 1)]) :gettags
	switch <menu>
		case ready
		(<menus> [(<player_num> - 1)]) :settags {menu = net_remote_root}
		myinterfaceelement :getsingletag \{descs}
		current_desc = (<descs> [(<player_num> - 1)])
		<current_desc> :se_setprops reposition_pos = (0.0, -90.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :se_waitprops
		<current_desc> :se_setprops reposition_pos = (0.0, -70.0) time = 0.05 motion = ease_in
		data_to_send = {menu = ready player_num = <player_num> spawn_script_now}
		case net_local_root
		printf \{qs(0xfa66dc4b)}
		case character
		printf \{qs(0x93b07ac8)}
		case net_remote_root
		printf \{qs(0x211268a4)}
		return
	endswitch
	if ishost
		sendstructure callback = spawn_net_ui_band_mode_back data_to_send = <data_to_send>
	endif
	begin
	if NOT scriptisrunning \{ui_band_mode_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
	(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_mode')
		ui_band_mode_choose_sound back controller = <controller>
		ui_band_mode_helper_text
	endif
endscript

script ui_band_mode_continue 
	if is_ui_event_running
		return
	endif
	if (($is_network_game = 1) && ($net_band_mode_menu = host))
		if NOT checkforsignin controller_index = <device_num>
			return
		endif
		if NOT (<device_num> = ($primary_controller))
			soundevent \{event = ui_sfx_negative_select}
			update_network_ticker \{msg_checksum = non_primary_post}
			return
		endif
	endif
	if ($is_network_game = 0)
		if (<device_num> != $band_mode_current_leader)
			soundevent \{event = ui_sfx_negative_select}
			update_network_ticker \{msg_checksum = non_primary_post}
			return
		endif
	endif
	gettags
	num_ready = 0
	player = 1
	real_player = 1
	temp_devices = [-1 , -1 , -1 , -1]
	temp_devices_remove = [-1 , -1 , -1 , -1]
	array = []
	temp_characters = [arse arse arse arse]
	band_controller_types = [0 0 0 0]
	getarraysize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :gettags
	add_player = 0
	if (<menu> = ready)
		if ($net_band_mode_menu = host)
			if is_party_member_local user_id = <user_id>
				add_player = 1
			endif
		else
			add_player = 1
		endif
	endif
	if (<add_player> = 1)
		<num_ready> = (<num_ready> + 1)
		setarrayelement arrayname = temp_devices index = (<real_player> - 1) newvalue = <controller>
		if ($is_network_game)
			<check_cont> = ($primary_controller)
		else
			<check_cont> = $band_mode_current_leader
		endif
		if (<controller> = <check_cont>)
			primary_controller_ready = 1
		endif
		getplayerinfo (<i> + 1) character_id
		setarrayelement arrayname = temp_characters index = (<real_player> - 1) newvalue = <character_id>
		if NOT netsessionfunc obj = match func = get_gamertag params = {controller = <i>}
			name = qs(0x03ac90f0)
		endif
		addarrayelement array = <array> element = <name>
		if isguitarcontroller controller = <controller>
			setarrayelement arrayname = band_controller_types index = (<real_player> - 1) newvalue = 1
		elseif isdrumcontroller controller = <controller>
			setarrayelement arrayname = band_controller_types index = (<real_player> - 1) newvalue = 2
		else
			setarrayelement arrayname = band_controller_types index = (<real_player> - 1) newvalue = 3
		endif
		<real_player> = (<real_player> + 1)
	else
		setarrayelement arrayname = temp_devices_remove index = <i> newvalue = <controller>
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct <temp_devices>
	printstruct <temp_characters>
	if ($is_network_game = 1)
		getarraysize <temp_devices>
		controller_index = 0
		begin
		if ((<temp_devices> [<controller_index>]) = <device_num>)
			ok_to_start_search = 1
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
		if NOT gotparam \{ok_to_start_search}
			return
		endif
		get_player_num_from_controller controller_index = <device_num>
		if NOT isscreenelementinfocus id = (<menus> [(<player_num> - 1)])
			return
		endif
		if isxenon
			if netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
				soundevent \{event = ui_sfx_negative_select}
				spawnscriptnow \{update_network_ticker
					params = {
						msg_checksum = guest_continue
					}}
				return
			endif
		endif
		if NOT gotparam \{primary_controller_ready}
			spawnscriptnow \{update_network_ticker
				params = {
					msg_checksum = band_leader
				}}
			return
		endif
		if (<num_ready> > 0)
			change \{current_progression_flag = career_band}
		else
			return
		endif
	elseif (<num_ready> < 2)
		spawnscriptnow \{ui_band_mode_warning
			params = {
				text = qs(0xf5f5bb37)
			}}
		soundevent \{event = ui_sfx_negative_select}
		return
	elseif NOT gotparam \{primary_controller_ready}
		if NOT isxenon
			<text> = qs(0x6143626e)
		else
			<text> = qs(0x5bed4924)
		endif
		spawnscriptnow ui_band_mode_warning params = {text = <text>}
		return
	else
		change \{current_progression_flag = career_band}
	endif
	<player> = 1
	begin
	if ((<temp_devices> [(<player> - 1)]) < 0)
		scriptassert \{'Some player didnt get a controller set correctly'}
	endif
	if ((<temp_characters> [(<player> - 1)]) = arse)
		scriptassert \{'Some player didnt get a character set correctly'}
	endif
	formattext checksumname = player_device 'player%d_device' d = <player>
	change globalname = <player_device> newvalue = (<temp_devices> [(<player> - 1)])
	formattext checksumname = gamertag 'gamertag_%d' d = (<player> - 1)
	change globalname = <gamertag> newvalue = (<array> [(<player> - 1)])
	setplayerinfo <player> gamertag = <gamertag>
	setplayerinfo <player> controller = (<temp_devices> [(<player> - 1)])
	setplayerinfo <player> character_id = (<temp_characters> [(<player> - 1)])
	setplayerinfo <player> is_local_client = 1
	setplayerinfo <player> difficulty = ($default_difficulty [(<temp_devices> [(<player> - 1)])])
	if ($is_network_game = 1)
		getnetid controller_index = (<temp_devices> [(<player> - 1)])
		netsessionfunc func = get_gamertag params = {controller = (<temp_devices> [(<player> - 1)])}
		setarrayelement arrayname = temp_net_id globalarray index = (<temp_devices> [(<player> - 1)]) newvalue = {net_id_first = <net_id_first> net_id_second = <net_id_second> name = <name>}
	endif
	<player> = (<player> + 1)
	repeat (<real_player> - 1)
	if (($is_network_game = 1) && ($net_band_mode_menu = host))
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if (<array_size> > 0)
			c = 0
			begin
			if ((<connections> [<c>].is_local) = 0)
				switch (<connections> [<c>].instrument)
					case eguitar
					part = guitar
					case edrums
					part = drum
					case emicrophone
					part = vocals
				endswitch
				setplayerinfo <player> is_local_client = 0
				setplayerinfo <player> part = <part>
				setplayerinfo <player> difficulty = easy
				formattext checksumname = gamertag 'gamertag_%d' d = (<player> - 1)
				change globalname = <gamertag> newvalue = (<connections> [<c>].gamertag)
				setplayerinfo <player> gamertag = <gamertag>
				player = (<player> + 1)
				num_ready = (<num_ready> + 1)
			endif
			c = (<c> + 1)
			repeat <array_size>
		endif
	endif
	getarraysize <temp_devices_remove>
	i = 0
	begin
	if NOT ((<temp_devices_remove> [<i>]) = -1)
		netsessionfunc func = removecontroller params = {controller = (<temp_devices_remove> [<i>])}
		cas_queue_kill_player player = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (($is_network_game = 1) && (<num_ready> < 4))
		remote_player = (<num_ready> + 1)
		begin
		setplayerinfo <remote_player> is_local_client = 0
		remote_player = (<remote_player> + 1)
		repeat (4 - <num_ready>)
	endif
	if ($band_mode_mode = quickplay || $band_mode_mode = none)
		formattext checksumname = mode 'p%d_quickplay' d = <num_ready>
	elseif ($is_network_game = 1)
		mode = p4_career
		netoptions :pref_choose \{name = game_modes
			checksum = p4_career}
		netoptions :pref_choose \{name = ranked
			checksum = player}
		change num_players_in_band = <num_ready>
		set_network_preferences
	else
		formattext checksumname = mode 'p%d_career' d = <num_ready>
	endif
	change game_mode = <mode>
	change current_num_players = <num_ready>
	change \{band_mode_active = 1}
	change \{in_join_band_screens = 0}
	change band_mode_actual_devices = <temp_devices>
	cancel_all_cas_loads
	clear_exclusive_devices
	i = 0
	begin
	if NOT (<temp_devices> [<i>] = -1)
		add_exclusive_device device = (<temp_devices> [<i>])
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	printf \{qs(0x797ec402)
		channel = bxcareer}
	printf \{qs(0xbff53ae3)
		a = $band_mode_mode
		channel = bxcareer}
	if ($band_mode_mode = quickplay)
		printf \{qs(0x6afb1d89)
			channel = bxcareer}
		change primary_controller = ($band_mode_current_leader)
		change last_start_pressed_device = ($band_mode_current_leader)
		restore_globals_from_global_tags
		generic_event_choose state = uistate_setlist data = {use_all_controllers num_band_players = <num_ready> band_controller_types = <band_controller_types> all_active_players = true}
		soundevent \{event = band_mode_career_ready}
	elseif ($is_network_game = 1)
		printf \{qs(0xf61ae1d6)
			channel = bxcareer}
		change \{respond_to_signin_changed_all_players = 1}
		soundevent \{event = band_mode_career_ready}
		if ($net_band_mode_menu = join)
			printf qs(0xa9e5ed51) d = ($current_num_players)
			ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
			change_controller_disconnect_scripts_on_all_menus \{change_type = remove}
			ui_create_net_career_join_popup device_num = <device_num>
		elseif ($net_band_mode_menu = host)
			requireparams \{[
					device_num
				]
				all}
			netsessionfunc \{obj = party
				func = set_party_joinable
				params = {
					joinable = 0
				}}
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					host_only
				}}
			netsessionfunc obj = match func = start_server_list params = {controller = <device_num>}
			setservermode
			startserver
			setjoinmode \{$join_mode}
			_play
			joinserver
			change \{net_band_mode_menu = lobby}
			generic_event_choose \{no_sound
				state = uistate_band_mode}
		endif
	else
		printf \{qs(0xce6a172f)
			channel = bxcareer}
		set_primary_controller device_num = ($band_mode_current_leader) state = uistate_band_difficulty data = {continue_data = {state = uistate_gig_posters}}
		soundevent \{event = band_mode_career_ready}
	endif
endscript

script net_ui_band_mode_continue 
	printf qs(0x97b9ba50) d = ($num_players_in_band)
	if ($career_matchmaking_complete = 0)
		update_network_ticker \{msg_checksum = matchmaking_complete}
		return
	endif
	if ($num_players_in_band > 1)
		if (screenelementexists id = myinterfaceelement)
			get_player_num_from_controller controller_index = <device_num>
			myinterfaceelement :getsingletag \{menus}
			myinterfaceelement :getsingletag \{net_gig_ready}
			myinterfaceelement :getsingletag \{net_lobby_ready}
			(<menus> [(<player_num> - 1)]) :getsingletag menu
			if NOT (<menu> = ready)
				update_network_ticker \{msg_checksum = host_ready_up}
				return
			elseif (<net_lobby_ready> = 0)
				update_network_ticker \{msg_checksum = lobby_ready}
				return
			endif
			if (<net_gig_ready> = 1)
				if NOT scriptisrunning \{net_ui_band_mode_countdown_to_gig}
					if NOT (($net_career_selected_song = $current_song) || ($net_career_selected_gig = $current_gig_number))
						change current_song = ($net_career_selected_song)
						change current_gig_number = ($net_career_selected_gig)
					endif
					generic_menu_pad_choose_sound
					change \{players_in_uistate = [
							0
							0
							0
							0
							0
							0
							0
							0
						]}
					sendstructure \{callback = spawn_net_ui_band_mode_countdown_to_gig
						data_to_send = {
							none
						}}
					myinterfaceelement :obj_spawnscriptnow \{net_ui_band_mode_countdown_to_gig}
				endif
			else
				update_network_ticker \{msg_checksum = no_gig_selected}
			endif
		endif
	else
		soundevent \{event = ui_sfx_negative_select}
		update_network_ticker \{msg_checksum = more_players_needed}
	endif
endscript

script net_career_invite_continue_to_lobby 
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	array = []
	remote_players = []
	num_players = 0
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].is_local) = 1)
			num_players = (<num_players> + 1)
			find_party_member_menu member_id = (<connections> [<i>].user_id)
			if (gotparam party_member_menu_checksum)
				<party_member_menu_checksum> :getsingletag controller
				addarrayelement array = <array> element = <controller>
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		scriptassert \{qs(0xe1d3e581)}
	endif
endscript

script spawn_net_ui_band_mode_countdown_to_gig 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :obj_spawnscriptnow \{net_ui_band_mode_countdown_to_gig}
	endif
endscript

script net_ui_band_mode_countdown_to_gig 
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'band_mode')
		generic_event_back
	endif
	update_network_ticker \{msg_checksum = waiting_for_data}
	i = 10
	begin
	update_network_ticker msg_checksum = count_down index = <i>
	generic_menu_up_or_down_sound \{down}
	if (<i> = 4)
		get_local_players_in_game
		getsingletag \{menus}
		getarraysize \{menus}
		j = 0
		begin
		if screenelementexists id = (<menus> [<j>])
			getplayerinfo (<j> + 1) net_obj_id
			if (<net_obj_id> >= 0)
				(<menus> [<j>]) :settags {menu = ready}
				runscriptonobject id = (<menus> [<j>]) ui_band_mode_update_menu
				launchevent type = unfocus target = (<menus> [<j>])
			else
				(<menus> [<j>]) :settags {menu = net_remote_open}
			endif
		endif
		launchevent \{type = unfocus
			target = myinterfaceelement}
		j = (<j> + 1)
		repeat <array_size>
		clean_up_user_control_helpers
		printf qs(0x255a3dcf) d = ($num_players_in_band)
		j = 0
		begin
		(<menus> [<j>]) :getsingletag instrument
		(<menus> [<j>]) :getsingletag difficulty
		if (<instrument> = controller)
			instrument = vocals
		endif
		myinterfaceelement :getsingletag \{settings_finalized}
		if NOT gotparam \{settings_finalized}
			setplayerinfo (<j> + 1) part = <instrument>
		endif
		if NOT (<difficulty> = none)
			setplayerinfo (<j> + 1) difficulty = <difficulty>
		endif
		j = (<j> + 1)
		repeat ($num_players_in_band)
		change \{net_career_data_sync_done = 0}
		host_start_player_settings_sync
	endif
	i = (<i> -1)
	wait \{1
		second}
	repeat 11
	vocals_distribute_mics
	change \{career_matchmaking_complete = 0}
	soundevent \{event = band_mode_career_ready}
	if ($num_players_in_band = <num_local_players>)
		if ishost
			if NOT (sessionisover)
				net_career_check_instruments
				host_proceed_to_online_play
			endif
		endif
	endif
endscript

script net_career_wait_to_proceed_to_online_play 
	getnumplayers
	starting_players = (<num_players> + ($net_dropped_players_flag))
	begin
	getnumplayers
	if NOT scriptisrunning \{net_ui_band_mode_countdown_to_gig}
		break
	endif
	wait \{0.25
		seconds}
	repeat
	begin
	getnumplayers
	if (($net_num_players) = ($net_num_player_settings_ack))
		if (<num_players> < <starting_players>)
			change \{player_drop_in_setting_sync = 1}
		endif
		break
	endif
	if (<num_players> < <starting_players>)
		change \{player_drop_in_setting_sync = 1}
		break
	endif
	wait \{0.25
		seconds}
	repeat
	session_over = 0
	if (sessionisover)
		<session_over> = 1
	endif
	if ((ishost) && (<num_players> = <starting_players>) || (($player_drop_in_setting_sync = 1) && (<session_over> = 0)))
		host_proceed_to_online_play
	else
		printf \{qs(0x5d8111d1)}
		return
	endif
endscript

script ui_band_mode_show_character 
	printf 'ui_band_mode_show_character player=%d' d = <player>
	if (<player> = -1)
		printf 'WARNING: INVALID PLAYER NUMBER %p' p = <player>
		return
	endif
	formattext checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	if ($band_mode_mode = career)
		if NOT progression_check_intro_complete
			if NOT gotparam \{character_id}
				return
			endif
			use_existing = 1
			change structurename = <player_status> character_id = <character_id>
		endif
	endif
	if NOT gotparam \{use_existing}
		if (($band_mode_mode = career) || ($is_network_game = 1) || (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
			get_controller_part controller = <controller>
			get_last_band_character_recorded player = <player> part = <controller_part>
			if NOT (<character_id> = none)
				if (<controller> < 4)
					setarrayelement arrayname = band_builder_random_preset_used globalarray index = <controller> newvalue = <character_id>
				endif
				if gotparam \{borrowed_from_band_leader}
					band_resolve_guest_characters player = <player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
				endif
				change structurename = <player_status> character_id = <character_id>
				got_from_globaltags = 1
			endif
		endif
		if NOT gotparam \{got_from_globaltags}
			random_band_mode_character player = <player>
			set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> player = <player>
		endif
	elseif isxenon
		if gotparam \{borrowed_from_band_leader}
			if NOT (<borrowed_from_band_leader> = <savegame>)
				cas_queue_new_character_profile player = <player> id = ($<player_status>.character_id) savegame = <borrowed_from_band_leader>
				return
			endif
		endif
	endif
	cas_queue_new_character_profile player = <player> id = ($<player_status>.character_id) savegame = <savegame>
endscript

script random_band_mode_character 
	requireparams \{[
			player
		]}
	printf 'random_band_mode_character %d' d = <player>
	formattext checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	get_controller_part controller = <controller>
	if (<controller_part> = guitar)
		if (Random (@ 0 @ 1 )= 0)
			controller_part = bass
		endif
	endif
	if (Random (@ 0 @ 1 @ 2 )= 0)
		if NOT cas_get_random_car savegame = <savegame> controller = <controller>
			cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
		endif
	else
		cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
	endif
	set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> player = <player>
	if gotparam \{borrowed_from_band_leader}
		get_player_num_from_controller controller_index = <controller>
		band_resolve_guest_characters player = <player_num> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	endif
	change structurename = <player_status> character_id = <character_id>
	return character_id = <character_id>
endscript

script ui_band_mode_random_character 
	obj_getid
	<objid> :obj_spawnscriptnow ui_band_mode_random_character_spawned params = {<...>}
endscript

script ui_band_mode_random_character_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{30
		gameframe}
	printf \{'ui_band_mode_random_character'}
	formattext checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status player_status = <player_status>
	controller = ($<player_status>.controller)
	ui_band_mode_choose_sound instrument = `default` controller = <controller>
	random_band_mode_character player = <player>
	cas_queue_new_character_profile player = (<index> + 1) id = ($<player_status>.character_id) savegame = <savegame>
	se_getparentid
	band_character_rename index = <index> player = <player>
	if ($net_band_mode_menu = none)
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			given_focus = 0
		elseif ($band_mode_mode = quickplay)
			given_focus = 0
		else
			given_focus = 0
		endif
	else
		given_focus = 0
	endif
	<parent_id> :obj_spawnscriptnow ui_band_mode_update_menu params = {given_focus = <given_focus> skip_update_wait}
endscript

script ui_band_mode_kill_character 
	printf \{'ui_band_mode_kill_character'}
	switch <player>
		case 1
		if cas_player_has_character_object \{player = 2}
			band_playanim name = <character_object> anim = backoutr no_wait
		endif
		case 2
		if cas_player_has_character_object \{player = 1}
			band_playanim name = <character_object> anim = backoutl no_wait
		endif
		if cas_player_has_character_object \{player = 3}
			band_playanim name = <character_object> anim = backoutr no_wait
		endif
		case 3
		if cas_player_has_character_object \{player = 2}
			band_playanim name = <character_object> anim = backoutl no_wait
		endif
		if cas_player_has_character_object \{player = 4}
			band_playanim name = <character_object> anim = backoutr no_wait
		endif
		case 4
		if cas_player_has_character_object \{player = 3}
			band_playanim name = <character_object> anim = backoutl no_wait
		endif
	endswitch
	cas_queue_kill_player player = <player>
endscript

script ui_band_mode_check_menus 
	myinterfaceelement :gettags
	getarraysize <menus>
	obj_getid
	count = <array_size>
	i = 0
	begin
	if screenelementexists id = (<menus> [<i>])
		<curr_id> = (<menus> [<i>])
		<curr_id> :gettags
		if (<menu> = instrument)
			if NOT (<objid> = (<menus> [<i>]))
			endif
			getscreenelementchildren id = (<menus> [<i>])
			getarraysize <children>
			j = 0
			begin
			if isscreenelementinfocus id = {(<menus> [<i>]) child = <j>}
				rgba = ($menu_focus_color)
			else
				rgba = ($menu_unfocus_color)
			endif
			switch <j>
				case 0
				if structurecontains structure = <allowed> name = guitar
					setscreenelementprops id = {(<menus> [<i>]) child = <j>} rgba = <rgba> focusable
				endif
				case 1
				if structurecontains structure = <allowed> name = bass
					setscreenelementprops id = {(<menus> [<i>]) child = <j>} rgba = <rgba> focusable
				endif
				case 2
				if structurecontains structure = <allowed> name = drum
					setscreenelementprops id = {(<menus> [<i>]) child = <j>} rgba = <rgba> focusable
				endif
				case 3
				if structurecontains structure = <allowed> name = vocals
					setscreenelementprops id = {(<menus> [<i>]) child = <j>} rgba = <rgba> focusable
				endif
			endswitch
			j = (<j> + 1)
			repeat <array_size>
		endif
	endif
	i = (<i> + 1)
	repeat <count>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		i = 0
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :gettags
		check_instrument = <instrument>
		j = 0
		begin
		curr_id_2 = (<menus> [<j>])
		if NOT (<curr_id> = <curr_id_2>)
			<curr_id_2> :gettags
			index = -1
			if (<menu> = instrument)
				switch <check_instrument>
					case guitar
					index = 0
					case bass
					index = 1
					case drum
					index = 2
					case vocals
					index = 3
					default
				endswitch
				if (<index> != -1)
					k = 0
					begin
					if NOT (<k> = <index>)
						if screenelementexists id = {<curr_id_2> child = <k>}
							setscreenelementprops id = {<curr_id_2> child = <k>} rgba = [64 64 64 200] font = fontgrid_bordello material = null not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
					if NOT (<curr_id_2> = <objid>)
						if NOT <curr_id_2> :menu_selectedindexis <index>
							<curr_id_2> :menu_changeselection
						endif
					endif
					k = 0
					begin
					if NOT (<k> = <index>)
						if screenelementexists id = {<curr_id_2> child = <k>}
							setscreenelementprops id = {<curr_id_2> child = <k>} rgba = [64 64 64 200] font = fontgrid_bordello material = null not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
				endif
				removeparameter \{index}
				removeparameter \{menu}
			endif
		endif
		j = (<j> + 1)
		repeat <count>
		i = (<i> + 1)
		repeat <count>
		return
	endif
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :gettags
	check_instrument = <instrument>
	j = 0
	begin
	curr_id_2 = (<menus> [<j>])
	if NOT (<curr_id> = <curr_id_2>)
		<curr_id_2> :gettags
		index = -1
		if (<menu> = instrument)
			switch <check_instrument>
				case guitar
				index = 0
				case bass
				index = 1
				case drum
				index = 2
				case vocals
				index = 3
				default
			endswitch
			if (<index> != -1)
				if screenelementexists id = {<curr_id_2> child = <index>}
					setscreenelementprops id = {<curr_id_2> child = <index>} rgba = [64 64 64 200] font = fontgrid_bordello material = null not_focusable
				endif
				if <curr_id_2> :menu_selectedindexis <index>
					<curr_id_2> :menu_changeselection
				endif
				if screenelementexists id = {<curr_id_2> child = <index>}
					setscreenelementprops id = {<curr_id_2> child = <index>} rgba = [64 64 64 200] font = fontgrid_bordello material = null not_focusable
				endif
			endif
			removeparameter \{index}
			removeparameter \{menu}
		endif
	endif
	j = (<j> + 1)
	repeat <count>
	i = (<i> + 1)
	repeat <count>
	i = 0
	begin
	i = (<i> + 1)
	repeat <count>
endscript

script ui_band_mode_check_disconnect 
	myinterfaceelement :getsingletag \{menus}
	gettags
	begin
	getactivecontrollers
	begin
	if NOT scriptisrunning \{ui_band_mode_check_menus}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<active_controllers> [<index>] = 0)
		curr_menu = (<menus> [<index>])
		<curr_menu> :getsingletag menu
		if NOT (<menu> = join)
			<curr_menu> :settags {menu = root}
			<curr_menu> :obj_spawnscript ui_band_mode_back
			removeparameter \{curr_menu}
			removeparameter \{menu}
		endif
	endif
	wait \{1
		gameframes}
	repeat
endscript

script ui_band_mode_warning \{text_scale = 1
		time = 3}
	if ($is_network_game = 1)
		if gotparam \{press_start_to_proceed}
			update_network_ticker \{msg_checksum = press_start_to_proceed}
		else
			if gotparam \{text}
				update_network_ticker msg = <text> no_checksum
			else
				soundevent \{event = ui_sfx_negative_select}
				update_network_ticker \{msg_checksum = more_players_needed}
			endif
		endif
	else
		net_ticker_update_msg msg_type = vert msg = <text>
	endif
endscript

script ui_band_mode_signin 
	requireparams \{[
			device_num
		]
		all}
	myinterfaceelement :se_setprops \{block_events}
	if isxenon
		if ($band_mode_show_signin = 1)
			call_blade = 0
			if ($is_network_game = 1)
				if (checkforsignin local controller_index = <device_num>)
					if NOT (checkforsignin controller_index = <device_num>)
						netsessionfunc \{func = showsigninui
							params = {
								convert_offline_to_guest
							}}
						call_blade = 1
					endif
				else
					netsessionfunc \{func = showsigninui4pane
						params = {
							online_only
						}}
					call_blade = 1
				endif
			else
				netsessionfunc \{func = showsigninui4pane}
				call_blade = 1
			endif
			if (<call_blade> = 1)
				wait_for_blade_complete
			endif
			if ($is_network_game = 1)
				update_network_ticker \{msg_checksum = signin_change}
			endif
		endif
	endif
	myinterfaceelement :se_setprops \{unblock_events}
	band_mode_menu :getsingletag \{menus}
	getarraysize <menus>
	i = 0
	begin
	launchevent type = focus target = (<menus> [<i>])
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_band_mode_helper_text 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :gettags
		if (<menu> = ready)
			num = (<num> + 1)
		endif
		if (<menu> = join)
			if ($band_mode_current_leader = <i>)
				if isxenon
					band_kill_character_select_menus
				endif
				change \{band_mode_current_leader = -1}
				ui_band_mode_choose_leader \{device_num = -1
					no_sound}
			endif
		else
			num_joined = (<num_joined> + 1)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	clean_up_user_control_helpers
	if ($is_network_game = 1)
		if ($net_career_invite_flag = 0)
			add_user_control_helper \{all_buttons
				text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
		if ($num_players_in_band = 0)
			if (<num> >= 1)
				if ($net_band_mode_menu = host)
					add_user_control_helper \{text = qs(0xc776b8b9)
						button = start
						z = 100000}
				elseif ($net_band_mode_menu = join)
					add_user_control_helper \{text = qs(0x6968900b)
						button = start
						z = 100000}
				endif
			endif
			if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
				if isxenon
					add_user_control_helper \{all_buttons
						text = qs(0x17df5913)
						button = yellow
						z = 100000}
				endif
			endif
			if isps3
				add_user_control_helper \{all_buttons
					text = qs(0x306229d7)
					button = yellow
					z = 100000}
			endif
			add_user_control_helper \{all_buttons
				text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		else
			if NOT (scriptisrunning check_num_matchmaking_players_loop)
				if ishost
					add_user_control_helper \{text = qs(0x182f0173)
						button = start
						z = 100000}
				endif
				if isps3
					add_user_control_helper \{all_buttons
						text = qs(0x306229d7)
						button = yellow
						z = 100000}
				endif
				add_user_control_helper \{all_buttons
					text = qs(0xaf4d5dd2)
					button = red
					z = 100000}
			else
				if isps3
					add_user_control_helper \{all_buttons
						text = qs(0x306229d7)
						button = yellow
						z = 100000}
				endif
			endif
		endif
	else
		if gotparam \{root}
			if (<root> = gigs)
				if ishost
					add_user_control_helper \{all_buttons
						text = qs(0xc18d5e76)
						button = green
						z = 100000}
				endif
			else
				add_user_control_helper \{all_buttons
					text = qs(0xc18d5e76)
					button = green
					z = 100000}
			endif
		else
			add_user_control_helper \{all_buttons
				text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
		add_user_control_helper \{all_buttons
			text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if isxenon
			if NOT isanycontrollersignedin
			endif
		endif
		ui_event_get_stack
		if (<num> >= 2)
			try_leader = 1
		else
			if (<num_joined> >= 1)
				try_leader = 1
			endif
		endif
		if NOT ((<stack> [0].base_name) = 'band_mode')
			removeparameter \{try_leader}
		endif
		change \{band_mode_can_choose_leader = 0}
		if gotparam \{try_leader}
			if NOT is_band_character_select_up
				add_user_control_helper \{all_buttons
					text = qs(0x6f9fb401)
					button = blue
					z = 100000}
				change \{band_mode_can_choose_leader = 1}
			endif
		endif
		if (<num> >= 2)
			add_user_control_helper \{text = qs(0x182f0173)
				button = start
				controller = $band_mode_current_leader
				z = 100000}
			if (<num> = 2 && $band_mode_last_num_ready < 2)
				if ($band_mode_current_leader = -1)
				else
					user_control_helper_get_buttonchar \{button = start
						controller = $band_mode_current_leader}
					formattext textname = button_text qs(0x72f9ae62) b = <buttonchar>
					spawnscriptnow ui_band_mode_warning params = {press_start_to_proceed text = <button_text> text_scale = 2 time = 5}
					change band_mode_last_num_ready = <num>
				endif
			endif
		endif
	endif
endscript

script ui_band_mode_can_choose_leader 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :gettags
		if (<menu> = ready)
			num = (<num> + 1)
		endif
		if (<menu> = join)
			if ($band_mode_current_leader = <i>)
				if isxenon
					band_kill_character_select_menus
				endif
				change \{band_mode_current_leader = -1}
				ui_band_mode_choose_leader \{device_num = -1
					no_sound}
			endif
		else
			num_joined = (<num_joined> + 1)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	ui_event_get_stack
	if (<num> >= 2)
		try_leader = 1
	else
		if (<num_joined> >= 1)
			try_leader = 1
		endif
	endif
	if NOT ((<stack> [0].base_name) = 'band_mode')
		removeparameter \{try_leader}
	endif
	change \{band_mode_can_choose_leader = 0}
	if gotparam \{try_leader}
		if NOT is_band_character_select_up
			change \{band_mode_can_choose_leader = 1}
			return \{true}
		endif
	endif
	return \{false}
endscript

script isanycontrollersignedin 
	getmaxcontrollersignins
	i = 0
	begin
	if islocallysignedin controller = <i>
		return \{true}
	endif
	i = (<i> + 1)
	repeat <max_signins>
	return \{false}
endscript

script ui_band_mode_scroll_sound 
	gettags
	get_player_num_from_controller controller_index = <controller>
	soundevent event = band_screen_ui_sound sound_type = scroll <...> controller = <player_num>
	myinterfaceelement :getsingletag \{descs}
	current_desc = (<descs> [<index>])
	<current_desc> :se_setprops name_arrow_up_scale = 0.8
	<current_desc> :se_setprops name_arrow_down_scale = 0.8
	if gotparam \{up}
		<current_desc> :se_setprops name_arrow_up_scale = 1.0 time = 0.1
		wait \{0.1
			second
			ignoreslomo}
		<current_desc> :se_setprops name_arrow_up_scale = 0.8 time = 0.1
	else
		<current_desc> :se_setprops name_arrow_down_scale = 1.0 time = 0.1
		wait \{0.1
			second
			ignoreslomo}
		<current_desc> :se_setprops name_arrow_down_scale = 0.8 time = 0.1
	endif
endscript

script ui_band_mode_choose_sound \{ready = 0
		controller = 0}
	if (<ready> = 1)
		soundevent event = ui_band_mode_choose_sound_ready <...>
	else
		soundevent event = ui_band_mode_choose_sound_spawned <...>
	endif
endscript

script ui_band_mode_choose_sound_spawned \{ready = 0
		controller = 0}
	gettags
	get_player_num_from_controller controller_index = <controller>
	if (<player_num> < 0)
		player_num = 1
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	else
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = -0.15
			<pan1y> = 1
			<pan2x> = -0.15
			<pan2y> = 1
		elseif (<player_num> = 3)
			<pan1x> = 0.15
			<pan1y> = 1
			<pan2x> = 0.15
			<pan2y> = 1
		elseif (<player_num> = 4)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	endif
	if NOT gotparam \{back}
		if (<ready> = 1)
			printf \{channel = sfx
				qs(0x5e957289)}
		else
			switch <instrument>
				case drum
				playsound ui_sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case guitar
				playsound ui_sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case vocals
				playsound ui_sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case bass
				playsound ui_sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				default
				playsound ui_sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endswitch
		endif
	else gotparam \{back}
		playsound ui_sound_09 vol = -7.5 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script ui_band_mode_choose_sound_ready 
	gettags
	get_player_num_from_controller controller_index = <controller>
	if (<player_num> < 0)
		player_num = 1
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	else
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = -0.15
			<pan1y> = 1
			<pan2x> = -0.15
			<pan2y> = 1
		elseif (<player_num> = 3)
			<pan1x> = 0.15
			<pan1y> = 1
			<pan2x> = 0.15
			<pan2y> = 1
		elseif (<player_num> = 4)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	endif
	if NOT gotparam \{back}
		switch <instrument>
			case drum
			playsound drum_select_affirmation_01 vol = -0.5 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case guitar
			playsound guitar_select_affirmation_1 vol = 1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocals
			playsound mic_select_affirmation_01 vol = 15 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case bass
			playsound bass_select_affirmation_02 vol = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			default
			playsound checkbox_check_sfx_2 vol = 8 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		endswitch
	endif
endscript

script ui_get_controller_parts_allowed 
	requireparams \{[
			controller
		]
		all}
	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if isguitarcontroller controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {vocals}
		endif
	else
		allowed = {guitar bass drum vocals}
		if isguitarcontroller controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {guitar bass drum vocals}
		endif
	endif
	if is_regular_controller controller = <controller>
		if controller_has_headset controller = <controller>
			allowed = {<allowed> vocals}
		endif
	endif
	gamemode_gettype
	if (<type> = battle)
		removeparameter \{vocals
			struct_name = allowed}
	endif
	if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
		switch ($g_head_to_head_instrument_type)
			case guitar
			allowed = {guitar bass}
			case drum
			allowed = {drum}
			case vocals
			allowed = {vocals}
		endswitch
	endif
	if gotparam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript

script proceed_to_band_lobby 
	printf \{qs(0x618cce00)}
	change \{net_band_mode_menu = lobby}
	ui_destroy_net_career_join_popup
	ui_event \{event = menu_change
		data = {
			state = uistate_band_mode
		}}
endscript

script add_gamertag_to_band_lobby 
	printf \{qs(0xcfaf4832)}
	band_leader = 0
	if NOT gotparam \{name}
		getplayerinfo (<index> + 1) controller
		getplayerinfo (<index> + 1) gamertag
		name = $<gamertag>
		if (<name> = qs(0x00000000))
			name = qs(0x03ac90f0)
		endif
	else
		controller = -1
	endif
	if myinterfaceelement :desc_resolvealias \{name = alias_hmenu}
		resolvescreenelementid id = [
			{id = <resolved_id>}
			{index = <index>}
		]
		if gotparam \{name}
			band_gamertag_rename gamertag = <name> index = <index> desc_item = <desc_item>
		endif
		if ((<controller> = $primary_controller) && (ishost) && (<menu> = net_local_root))
			band_leader = 1
			<resolved_id> :se_setprops leader_indicator_alpha = 1
		endif
	endif
	return band_leader = <band_leader>
endscript

script net_add_player_to_career_ui 
	if ishost
		get_party_member_status net_id_first = <net_id_first> net_id_second = <net_id_second>
		if (<local_client> = 0)
			if (<is_party_member> = 0)
				change num_players_in_band = (($num_players_in_band) + 1)
				printf qs(0x695a6a7a) d = ($num_players_in_band)
			endif
			myinterfaceelement :getsingletag \{menus}
			myinterfaceelement :getsingletag \{descs}
			if gotparam \{descs}
				xuid = [0 0]
				setarrayelement arrayname = xuid index = 0 newvalue = <net_id_first>
				setarrayelement arrayname = xuid index = 1 newvalue = <net_id_second>
				if isxenon
					(<descs> [(<player_num> - 1)]) :obj_spawnscript update_headset_status params = {obj_id = (<descs> [(<player_num> - 1)]) uid = <xuid>}
				endif
			endif
			add_gamertag_to_band_lobby index = (<player_num> - 1) menu = net_remote_root
			net_get_character_name player = (<player_num> - 1)
			band_character_rename index = (<player_num> - 1) character_name = <fullname>
			if (<part> = guitar)
				part = none
			endif
			(<menus> [(<player_num> - 1)]) :settags {
				instrument = <part>
				difficulty = <difficulty>
				menu = net_remote_root
			}
			(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
		endif
	else
		if ($net_band_mode_menu = lobby)
			if (<local_client> = 0)
				get_party_member_status net_id_first = <net_id_first> net_id_second = <net_id_second>
				if (<is_party_member> = 0)
					change num_players_in_band = (($num_players_in_band) + 1)
					printf qs(0x695a6a7a) d = ($num_players_in_band)
				endif
			endif
		else
			if (<local_client> = 0)
				change num_players_in_band = (($num_players_in_band) + 1)
				printf qs(0x695a6a7a) d = ($num_players_in_band)
			endif
		endif
	endif
endscript

script net_career_goto_band_lobby 
	printf \{qs(0x02555b76)}
	end_singleplayer_game
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	if gotparam \{from_encore}
		kill_gem_scroller
	endif
	change \{career_matchmaking_complete = 1}
	getglobaltags \{user_options}
	if (<autosave> = 1)
		ui_memcard_autosave \{event = menu_back
			state = uistate_band_mode
			data = {
				all_active_players = true
			}}
	else
		ui_event \{event = menu_back
			data = {
				state = uistate_band_mode
			}}
	endif
endscript

script net_career_goto_gig_board 
	if screenelementexists \{id = myinterfaceelement}
		generic_menu_pad_choose_sound
		myinterfaceelement :se_setprops \{alpha = 0.0}
		clean_up_user_control_helpers
		ui_event event = menu_change data = {state = uistate_gig_posters controller = <device_num> is_popup}
	endif
endscript

script is_current_state_band_mode 
	ui_event_get_stack
	getarraysize <stack>
	if (<array_size> > 0)
		if ((<stack> [0].base_name) = 'band_mode')
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script net_setup_band_lobby_ticker 
	resolvescreenelementid \{id = [
			{
				id = myinterfaceelement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
		]}
	if screenelementexists id = <resolved_id>
	endif
	resolvescreenelementid \{id = [
			{
				id = myinterfaceelement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
			{
				local_id = online_ticker_vert_text
			}
		]}
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_getprops
		<resolved_id> :settags {
			msg_pending = 0
			orgin_pos = <pos>
		}
		<resolved_id> :obj_spawnscriptlater net_ticker_msg_loop params = {msg_type = vert}
	endif
	resolvescreenelementid \{id = [
			{
				id = myinterfaceelement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
			{
				local_id = online_ticker_horiz_text
			}
		]}
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_getprops
		<resolved_id> :settags {
			msg_pending = 0
			orgin_pos = <pos>
		}
		<resolved_id> :obj_spawnscriptlater net_ticker_msg_loop params = {msg_type = horiz}
	endif
endscript

script net_ticker_msg_loop 
	begin
	getsingletag \{msg_pending}
	if (<msg_pending>)
		settags \{msg_pending = 0}
		if (<msg_type> = vert)
			obj_killspawnedscript \{name = net_ticker_vert_scroll}
		elseif (<msg_type> = horiz)
			obj_killspawnedscript \{name = net_ticker_horiz_scroll}
		endif
		if (<msg_type> = vert)
			obj_spawnscriptnow \{net_ticker_vert_scroll}
		elseif (<msg_type> = horiz)
			obj_spawnscriptnow \{net_ticker_horiz_scroll}
		endif
	endif
	wait \{0.25
		seconds}
	repeat
endscript

script net_ticker_update_msg 
	if NOT gotparam \{msg}
		return
	endif
	if (<msg_type> = vert)
		text_id = online_ticker_vert_text
	elseif (<msg_type> = horiz)
		text_id = online_ticker_horiz_text
	endif
	resolvescreenelementid id = [
		{id = myinterfaceelement}
		{local_id = band_menu_container}
		{local_id = online_ticker_window_element}
		{local_id = <text_id>}
	]
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops text = <msg> alpha = 0.0
		<resolved_id> :settags msg_pending = 1
	endif
endscript

script net_ticker_vert_scroll 
	myinterfaceelement :se_setprops \{online_ticker_window_element_alpha = 1.0
		time = 0.1}
	if screenelementexists \{id = scrolling_msg_container}
		scrolling_msg_container :se_setprops \{alpha = 0.0}
	endif
	obj_getid
	getsingletag \{orgin_pos}
	<objid> :se_setprops alpha = 1.0 pos = <orgin_pos>
	<objid> :se_waitprops
	wait \{4
		second}
	<objid> :se_waitprops
	<objid> :se_setprops pos = <orgin_pos>
	if screenelementexists \{id = scrolling_msg_container}
		scrolling_msg_container :setprops \{alpha = 1.0
			time = 0.5}
		scrolling_msg_container :se_waitprops
	endif
	if NOT scriptisrunning \{net_ticker_horiz_scroll}
		myinterfaceelement :se_setprops \{online_ticker_window_element_alpha = 0.0
			time = 0.1}
	endif
endscript

script net_ticker_horiz_scroll \{scroll_time = 6}
	printf \{qs(0xaa1952d2)}
	myinterfaceelement :se_setprops \{online_ticker_window_element_alpha = 1.0
		time = 0.1}
	obj_getid
	<objid> :se_getprops
	createscreenelement {
		type = textelement
		parent = <objid>
		scale = <scale>
		text = qs(0x713755f7)
		font = <font>
	}
	getscreenelementdims id = <id>
	space_width = <width>
	destroyscreenelement id = <id>
	<objid> :se_getparentid
	if screenelementexists \{id = scrolling_msg_container}
		destroyscreenelement \{id = scrolling_msg_container}
	endif
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		id = scrolling_msg_container
	}
	getscreenelementchildren id = <objid>
	getarraysize (<children>)
	i = 0
	orgin_end_pos = (0.0, -6.0)
	begin
	(<children> [<i>]) :text_getstring
	printf <string>
	formattext checksumname = ticker_text 'ticker_text_%i' i = <i>
	createscreenelement {
		type = textelement
		parent = scrolling_msg_container
		id = <ticker_text>
		just = [left top]
		scale = <scale>
		text = <string>
		font = <font>
		rgba = <rgba>
		z_priority = <z_priority>
	}
	getscreenelementdims id = <id>
	new_width = (<width> + <space_width>)
	orgin_end_pos = (<orgin_end_pos> - (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	orgin_start_pos = (1280.0, -6.0)
	time_factor = (1280 / <scroll_time>)
	scroll_time = ((1280 - (<orgin_end_pos>.(1.0, 0.0))) / <time_factor>)
	begin
	start_pos = <orgin_start_pos>
	end_pos = <orgin_end_pos>
	<i> = 0
	begin
	formattext checksumname = ticker_text 'ticker_text_%i' i = <i>
	<objid> :obj_spawnscriptnow scroll_ticker_each_line params = {id = <ticker_text> start_pos = <start_pos> end_pos = <end_pos> scroll_time = <scroll_time>}
	getscreenelementdims id = <ticker_text>
	<new_width> = (<width> + <space_width>)
	start_pos = (<start_pos> + (<new_width> * (1.0, 0.0)))
	end_pos = (<end_pos> + (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	wait <scroll_time> seconds
	repeat
	if NOT scriptisrunning \{net_ticker_vert_scroll}
		myinterfaceelement :se_setprops \{online_ticker_window_element_alpha = 0.0
			time = 0.1}
	endif
endscript

script scroll_ticker_each_line 
	if screenelementexists id = <id>
		<id> :se_setprops pos = <start_pos>
		<id> :se_setprops pos = <end_pos> time = <scroll_time>
		<id> :se_waitprops
	endif
endscript

script update_network_ticker 
	printf \{qs(0x83820b7f)}
	if NOT gotparam \{no_checksum}
		if NOT (gotparam msg_checksum)
			return
		endif
	else
		msg_type = vert
		replace = 1
	endif
	switch <msg_checksum>
		case waiting_for_data
		msg_type = horiz
		msg = qs(0x3cc23f45)
		replace = 1
		case menu_invite
		msg_type = horiz
		msg = qs(0x54c0d409)
		append = 1
		case max_guitars
		msg_type = vert
		msg = qs(0x715f83ca)
		replace = 1
		case max_vocals
		msg_type = vert
		if isxenon
			msg = qs(0x1ffdf92f)
		else
			msg = qs(0xe4ecd396)
		endif
		replace = 1
		case max_drum
		msg_type = vert
		msg = qs(0x8cda971e)
		replace = 1
		case no_mic
		msg_type = vert
		if isxenon
			msg = qs(0xc81bf63c)
		else
			msg = qs(0xa0a4ab6b)
		endif
		replace = 1
		case band_leader
		msg_type = vert
		msg = qs(0x9f054016)
		replace = 1
		case menu_host
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = start}
		formattext textname = msg qs(0x9115c4fd) d = <buttonchar>
		append = 1
		case menu_join
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = green}
		green = <buttonchar>
		user_control_helper_get_buttonchar \{button = start}
		formattext textname = msg qs(0xf55e812a) d = <green> e = <buttonchar>
		append = 1
		case guitarist_roles
		msg_type = vert
		msg = qs(0xecb5e393)
		replace = 1
		case ps3_chat
		msg_type = horiz
		msg = qs(0xbc1b25f8)
		append = 1
		case full
		msg_type = horiz
		msg = qs(0xe5668284)
		replace = 1
		case non_primary_post
		msg_type = vert
		if NOT ($net_band_mode_menu = none)
			msg = qs(0xbbe54193)
		else
			msg = qs(0xce4db331)
		endif
		replace = 1
		case guest_continue
		msg_type = vert
		if ($net_band_mode_menu = host)
			msg = qs(0xff17a488)
		elseif ($net_band_mode_menu = join)
			msg = qs(0x17a405da)
		endif
		replace = 1
		case matchmaking_complete
		msg_type = vert
		msg = qs(0x9efc7426)
		replace = 1
		case host_ready_up
		msg_type = vert
		msg = qs(0x98bf8dc2)
		replace = 1
		case lobby_ready
		msg_type = vert
		msg = qs(0xedb3e150)
		replace = 1
		case count_down
		msg_type = vert
		get_progression_globals \{career_band}
		formattext \{checksumname = tiername
			'tier%d'
			d = $current_gig_number}
		level_checksum = ($<tier_global>.<tiername>.level)
		if structurecontains structure = $levelzones <level_checksum>
			if (<level_checksum> = load_z_tool)
				formattext textname = msg qs(0x5a26279f) v = ($levelzones.<level_checksum>.title) d = <index>
			elseif (<level_checksum> = load_z_newyork || <level_checksum> = load_z_ballpark || <level_checksum> = load_z_scifi || <level_checksum> = load_z_metalfest)
				formattext textname = msg qs(0x57eca7a3) v = ($levelzones.<level_checksum>.title) d = <index>
			else
				formattext textname = msg qs(0x39d1ec9b) v = ($levelzones.<level_checksum>.title) d = <index>
			endif
		else
			formattext textname = msg qs(0xe175cbb7) d = <index>
		endif
		replace = 1
		case count_down_no_quit
		msg_type = vert
		msg = qs(0x60c100ac)
		replace = 1
		case gig_selected
		msg_type = horiz
		msg = qs(0xd893031e)
		replace = 1
		case no_gig_selected
		msg_type = vert
		replace = 1
		msg = qs(0xac8fa306)
		case signin_request
		msg_type = vert
		replace = 1
		formattext textname = msg qs(0x194c3652) d = (<device_num> + 1)
		case more_players_needed
		msg_type = vert
		replace = 1
		msg = qs(0xf5f5bb37)
		case press_start_to_proceed
		msg_type = vert
		replace = 1
		user_control_helper_get_buttonchar \{button = start
			controller = $band_mode_current_leader}
		formattext textname = msg qs(0x72f9ae62) b = <buttonchar>
		case join
		msg_type = horiz
		append = 1
		if (isxenon)
			if NOT (checkforsignin controller_index = <controller>)
				msg = qs(0xa7e21434)
			endif
		endif
		case signin_change
		msg_type = horiz
		replace = 1
		if (isxenon)
			myinterfaceelement :getsingletag \{menus}
			getarraysize <menus>
			count = 0
			i = 0
			begin
			(<menus> [<i>]) :getsingletag menu
			if NOT (<menu> = join)
				if NOT (checkforsignin controller_index = <i>)
					count = (<count> + 1)
					msg = qs(0xa7e21434)
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			if (<count> = 0)
				msg = qs(0x00000000)
			endif
		endif
	endswitch
	if (gotparam msg)
		if (<msg_type> = vert)
			msg_text_id = online_ticker_vert_text
		elseif (<msg_type> = horiz)
			msg_text_id = online_ticker_horiz_text
		else
			msg_text_id = online_ticker_vert_text
		endif
		resolvescreenelementid id = [
			{id = myinterfaceelement}
			{local_id = band_menu_container}
			{local_id = online_ticker_window_element}
			{local_id = <msg_text_id>}
		]
		if screenelementexists id = <resolved_id>
			if (gotparam append)
				<resolved_id> :se_getprops
				formattext textname = new_msg qs(0x307c5a2f) d = <text> t = <msg>
			elseif (gotparam replace)
				formattext textname = new_msg qs(0x0204c31d) t = <msg>
			elseif (gotparam clear)
				new_msg = qs(0x00000000)
			endif
			net_ticker_update_msg msg_type = <msg_type> msg = <new_msg>
		endif
	endif
endscript

script net_get_root_menu_tags 
	if (<index> < ($num_players_in_band))
		getplayerinfo (<index> + 1) is_local_client
		if (<is_local_client> = 1)
			getplayerinfo (<index> + 1) controller
			get_controller_type controller_index = <controller>
			if (<controller_type> = controller)
				controller_type = vocals
			endif
			part = <controller_type>
			ui_get_controller_parts_allowed controller = <controller> filter_by_character
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			xuid = <user_id>
			menu = net_local_root
		else
			getplayerinfo (<index> + 1) part
			controller = 10
			allowed = {}
			xuid = [0 0]
			getplayerinfo (<index> + 1) net_id_first
			getplayerinfo (<index> + 1) net_id_second
			setarrayelement arrayname = xuid index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = xuid index = 1 newvalue = <net_id_second>
			menu = net_remote_root
		endif
		if isxenon
			<desc_id> :obj_spawnscript update_headset_status params = {obj_id = <desc_id> uid = <xuid>}
		endif
		if (<part> = guitar || <part> = controller)
			part = none
		endif
		getplayerinfo (<index> + 1) difficulty
	else
		is_local_client = 0
		controller = 10
		part = none
		allowed = {}
		difficulty = none
		menu = net_remote_open
	endif
	if (<is_local_client> = 0)
		cas_queue_kill_player player = (<index> + 1)
	endif
	return {
		is_local_client = <is_local_client>
		controller = <controller>
		part = <part>
		allowed = <allowed>
		difficulty = <difficulty>
		menu = <menu>
	}
endscript

script net_get_invite_menu_tags 
	printf \{qs(0xf807785e)}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	if (<index> < <array_size>)
		if ((<connections> [<index>].is_local) = 1)
			net_career_shift_invite_player_status_structs index = <index>
			menu = net_local_join
			controller = (<connections> [<index>].controller_index)
			netsessionfunc func = addcontrollers params = {controller = <controller>}
			setarrayelement arrayname = temp_net_id globalarray index = <controller> newvalue = {net_id_first = (<connections> [<index>].user_id [0]) net_id_second = (<connections> [<index>].user_id [1]) name = (<connections> [<index>].gamertag)}
		else
			net_career_shift_invite_player_status_structs index = <index>
			menu = net_remote_root
			controller = 10
		endif
		switch (<connections> [<index>].instrument)
			case eguitar
			part = guitar
			case edrums
			part = drum
			case emicrophone
			part = vocals
		endswitch
		name = (<connections> [<index>].gamertag)
		user_id = (<connections> [<index>].user_id)
		player_array = [{user_id = (<connections> [<index>].user_id) is_local = (<connections> [<index>].is_local) controller_index = (<connections> [<index>].controller_index)}]
		change net_band_members = (($net_band_members) + <player_array>)
		if gotparam \{init}
			change net_num_joiners = (($net_num_joiners) + 1)
		endif
		if isxenon
			<desc_id> :obj_spawnscript update_headset_status params = {obj_id = <desc_id> uid = <user_id>}
		endif
	else
		menu = net_remote_open
		part = none
		name = qs(0x03ac90f0)
		user_id = [0 0]
		controller = <index>
	endif
	return {
		part = <part>
		menu = <menu>
		name = <name>
		user_id = <user_id>
		controller = <controller>
	}
endscript

script career_create_party_data 
	requireparams \{[
			ready
			player_id
		]
		all}
	formattext checksumname = player_data 'player_%d' d = <player_id>
	data = {}
	appendstruct {
		struct = data
		field = <player_data>
		params = {
			ready = <ready>
		}
	}
	return data = <data>
endscript

script career_poll_party_data 
	begin
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (0 < <array_size>)
		i = 0
		begin
		find_party_member_menu member_id = (<connections> [<i>].user_id)
		if gotparam \{party_member_menu_checksum}
			if ((<connections> [<i>].is_local) = 1)
				<party_member_menu_checksum> :getsingletag menu
				if (<menu> = ready)
					career_create_party_data ready = 1 player_id = (<connections> [<i>].party_id)
				else
					career_create_party_data ready = 0 player_id = (<connections> [<i>].party_id)
				endif
				netsessionfunc obj = party func = append_shared_data params = {data = <data>}
			endif
			if ((<connections> [<i>].is_local) = 0)
				netsessionfunc \{obj = party
					func = get_shared_data}
				formattext checksumname = player_data 'player_%d' d = (<connections> [<i>].party_id)
				if structurecontains structure = <party_shared_data> <player_data>
					<party_member_menu_checksum> :getsingletag menu
					if ((<party_shared_data>.<player_data>.ready) = 1)
						if NOT (<menu> = ready)
							<party_member_menu_checksum> :settags {menu = ready}
							<party_member_menu_checksum> :obj_spawnscript ui_band_mode_update_menu
						endif
					elseif ((<party_shared_data>.<player_data>.ready) = 0)
						if (<menu> = ready)
							<party_member_menu_checksum> :settags {menu = net_remote_root}
							<party_member_menu_checksum> :obj_spawnscript ui_band_mode_update_menu
						endif
					endif
				endif
			endif
			removeparameter \{menu}
			removeparameter \{party_shared_data}
			removeparameter \{party_member_menu_checksum}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	wait \{1
		second}
	repeat
endscript

script career_poll_party_for_joiners 
	getsingletag \{menus}
	begin
	if ((isxenon) && ($wait_for_sysnotify_unpause_flag = 0))
		wait_for_sysnotify_unpause
	endif
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> > ($net_num_joiners))
		joiner = 1
	elseif (<array_size> < ($net_num_joiners))
		quitter = 1
	endif
	change net_num_joiners = <array_size>
	if gotparam \{joiner}
		net_add_party_joiner menus = <menus>
		removeparameter \{joiner}
	endif
	if gotparam \{quitter}
		net_remove_party_joiner menus = <menus>
		removeparameter \{quitter}
	endif
	wait \{1
		second}
	repeat
endscript

script net_add_party_joiner 
	printf \{qs(0x285aace0)}
	requireparams \{[
			menus
		]
		all}
	netsessionfunc \{obj = party
		func = get_party_members}
	i = 0
	begin
	is_new_player user_id = (<connections> [<i>].user_id) controller_index = (<connections> [<i>].controller_index)
	if (<new_player> = 1)
		if ((<connections> [<i>]).is_local = 0)
			getarraysize <menus>
			if ($net_band_mode_menu = invite)
				goal_menu = net_remote_open
			elseif ($net_band_mode_menu = host)
				goal_menu = join
			endif
			m = 0
			begin
			(<menus> [<m>]) :getsingletag menu
			if (<goal_menu> = <menu>)
				open_menu = <m>
				break
			endif
			m = (<m> + 1)
			repeat <array_size>
			if gotparam \{open_menu}
				myinterfaceelement :getsingletag \{descs}
				net_get_invite_menu_tags index = <i> desc_id = (<descs> [<open_menu>])
				(<menus> [<open_menu>]) :obj_killspawnedscript name = ui_band_mode_update_name
				(<menus> [<open_menu>]) :obj_killspawnedscript name = ui_band_mode_check_disconnect
				add_gamertag_to_band_lobby index = <open_menu> name = <name> menu = <menu>
				(<menus> [<open_menu>]) :settags {
					menu = <menu>
					instrument = <part>
					difficulty = none
					user_id = <user_id>
				}
				(<menus> [<open_menu>]) :obj_spawnscript ui_band_mode_update_menu
				switch (<part>)
					case guitar
					case bass
					myinterfaceelement :getsingletag \{current_guitar}
					myinterfaceelement :settags current_guitar = (<current_guitar> + 1)
					case drum
					myinterfaceelement :getsingletag \{current_drum}
					myinterfaceelement :settags current_drum = (<current_drum> + 1)
					case vocals
					myinterfaceelement :getsingletag \{current_mic}
					myinterfaceelement :settags current_mic = (<current_mic> + 1)
				endswitch
			else
				printstruct ($net_band_members)
				scriptassert \{qs(0xa5bd3017)}
			endif
		elseif ((<connections> [<i>]).is_local = 1)
			player_array = [{user_id = (<connections> [<i>].user_id) is_local = (<connections> [<i>].is_local) controller_index = (<connections> [<i>].controller_index)}]
			change net_band_members = (($net_band_members) + <player_array>)
		endif
	endif
	i = (<i> + 1)
	repeat ($net_num_joiners)
endscript

script net_remove_party_joiner 
	printf \{qs(0xda27331a)}
	requireparams \{[
			menus
		]
		all}
	netsessionfunc \{obj = party
		func = get_party_members}
	array = []
	getarraysize ($net_band_members)
	net_num_band_memebers = <array_size>
	j = 0
	begin
	is_quitter user_id = ($net_band_members [<j>].user_id) controller_index = ($net_band_members [<j>].controller_index)
	if (<quitter> = 1)
		addarrayelement array = <array> element = <j>
		find_party_member_menu member_id = ($net_band_members [<j>].user_id)
		if gotparam \{party_member_menu_index}
			quitter_menu = <party_member_menu_index>
			(<menus> [<quitter_menu>]) :getsingletag menu
			(<menus> [<quitter_menu>]) :getsingletag instrument
			switch (<instrument>)
				case guitar
				case bass
				myinterfaceelement :getsingletag \{current_guitar}
				myinterfaceelement :settags current_guitar = (<current_guitar> - 1)
				case drum
				myinterfaceelement :getsingletag \{current_drum}
				myinterfaceelement :settags current_drum = (<current_drum> - 1)
				case vocals
				myinterfaceelement :getsingletag \{current_mic}
				myinterfaceelement :settags current_mic = (<current_mic> - 1)
			endswitch
			if ($net_band_mode_menu = invite)
				(<menus> [<quitter_menu>]) :settags {
					menu = net_remote_open
					instrument = none
					difficulty = none
					controller = 10
					user_id = [0 0]
				}
				ui_band_mode_kill_character player = (<quitter_menu> + 1)
				band_character_rename index = <quitter_menu>
				add_gamertag_to_band_lobby index = <quitter_menu> name = qs(0x00000000) menu = net_remote_open
				(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_menu
			elseif ($net_band_mode_menu = host)
				(<menus> [<quitter_menu>]) :settags {
					menu = join
					instrument = none
					difficulty = none
					controller = <quitter_menu>
					user_id = [0 0]
				}
				if (($net_band_members [<j>].is_local) = 0)
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_name params = {controller = <quitter_menu>}
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_check_disconnect
					ui_band_mode_kill_character player = (<quitter_menu> + 1)
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_menu
				endif
			endif
		else
			printstruct ($net_band_members)
			scriptassert \{qs(0x9e76980c)}
		endif
	endif
	j = (<j> + 1)
	repeat <net_num_band_memebers>
	index_array = <array>
	getarraysize \{index_array}
	if (<array_size> > 0)
		a = (<array_size> - 1)
		begin
		removearrayelement array = ($net_band_members) index = (<index_array> [<a>])
		change net_band_members = <array>
		a = (<a> - 1)
		repeat <array_size>
	endif
endscript

script find_party_member_menu 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize \{menus}
		i = 0
		begin
		(<menus> [<i>]) :getsingletag user_id
		if ((<member_id> [0]) = (<user_id> [0]) &&
				(<member_id> [1]) = (<user_id> [1]))
			return party_member_menu_index = <i> party_member_menu_checksum = (<menus> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script get_party_member_status 
	if ((gotparam net_id_first) && (gotparam net_id_second))
		array = []
		addarrayelement array = <array> element = <net_id_first>
		addarrayelement array = <array> element = <net_id_second>
		member_id = <array>
	endif
	is_local = 0
	is_party_member = 0
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> > 0)
		i = 0
		begin
		if (((<connections> [<i>].user_id [0]) = (<member_id> [0]))
				&& ((<connections> [<i>].user_id [1]) = (<member_id> [1])))
			is_party_member = 1
			if ((<connections> [<i>].is_local) = 1)
				is_local = 1
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return is_local = <is_local> is_party_member = <is_party_member>
endscript

script is_new_player 
	requireparams \{[
			user_id
		]
		all}
	getarraysize ($net_band_members)
	new_player = 1
	if (<array_size> > 0)
		i = 0
		begin
		if (($net_band_members [<i>].user_id [0]) = (<user_id> [0]) &&
				($net_band_members [<i>].user_id [1]) = (<user_id> [1]))
			if isps3
				if (($net_band_members [<i>].controller_index) = <controller_index>)
					new_player = 0
					break
				endif
			else
				new_player = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return new_player = <new_player>
endscript

script is_quitter 
	requireparams \{[
			user_id
		]
		all}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	quitter = 1
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) &&
				(<connections> [<i>].user_id [1]) = (<user_id> [1]))
			if isps3
				if ((<connections> [<i>].controller_index) = <controller_index>)
					quitter = 0
					break
				endif
			else
				quitter = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return quitter = <quitter>
endscript

script net_get_invite_controller_by_user_id 
	requireparams \{[
			user_id
		]
		all}
	getarraysize ($temp_net_id)
	controller = 0
	if (<array_size> > 0)
		begin
		if (($temp_net_id [<controller>].net_id_first) = (<user_id> [0])
				&& ($temp_net_id [<controller>].net_id_second) = (<user_id> [1]))
			break
		endif
		controller = (<controller> + 1)
		repeat <array_size>
	endif
	return controller = <controller>
endscript

script cancel_career_search_early 
	if netsessionfunc \{obj = match
			func = cancel_join_server}
		onexitrun \{destroy_flaming_wait}
		if screenelementexists \{id = band_mode_searching_menu}
			launchevent \{type = unfocus
				target = band_mode_searching_menu}
		endif
		wait \{5
			gameframes}
		change \{num_players_in_band = 0}
		change \{net_band_members = [
			]}
		change \{net_num_joiners = 0}
		change \{career_matchmaking_complete = 0}
		if gotparam \{menu_mode}
			change net_band_mode_menu = <menu_mode>
		else
			change \{net_band_mode_menu = host}
		endif
		if ($net_band_mode_menu = host)
			netsessionfunc \{obj = party
				func = set_party_joinable
				params = {
					joinable = 1
				}}
		endif
		generic_event_back
	endif
endscript

script career_proceed_with_current_reservations 
	netsessionfunc \{obj = match
		func = get_num_matchmaking_players}
	if (<num_matchmaking_players> > 1)
		change \{ui_band_mode_hit_force_completion = 1}
		netsessionfunc \{obj = match
			func = force_completion}
	endif
	ui_band_mode_helper_text
endscript

script check_num_matchmaking_players_loop 
	getsingletag \{menus}
	begin
	if NOT scriptisrunning \{ui_band_mode_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	current_players = ($num_players_in_band)
	getactivecontrollers
	getarraysize <active_controllers>
	starting_controllers = <active_controllers>
	begin
	if ($career_matchmaking_complete = 1)
		destroy_popup_warning_menu
		change \{net_career_invite_flag = 0}
		ui_band_mode_helper_text
		break
	endif
	netsessionfunc \{obj = match
		func = get_num_matchmaking_players}
	getactivecontrollers
	if gotparam \{num_matchmaking_players}
		if ($net_career_invite_flag = 0)
			if ((<num_matchmaking_players> > 1) && ($net_matchmaking_search_window = cancel_only))
				change \{net_matchmaking_search_window = both_options}
				net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			endif
			if ((<num_matchmaking_players> = 1) && ($net_matchmaking_search_window = both_options))
				change \{net_matchmaking_search_window = cancel_only}
				net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			endif
		endif
		net_update_remote_menu_text current_players = <current_players>
		current_players = <num_matchmaking_players>
	endif
	controller_index = 0
	begin
	if NOT ((<active_controllers> [<controller_index>]) = (<starting_controllers> [<controller_index>]))
		if ($net_career_invite_flag = 0)
			netsessionfunc \{obj = party
				func = disband_party_session}
			cancel_career_search_early \{menu_mode = host}
		else
			netsessionfunc \{obj = party
				func = leave_party}
			cancel_career_search_early \{menu_mode = join}
		endif
	endif
	controller_index = (<controller_index> + 1)
	repeat <array_size>
	wait \{1
		second}
	repeat
endscript

script net_update_remote_menu_text 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		if (netsessionfunc {obj = match
					func = get_num_matchmaking_players})
			if ($num_players_in_band < 4)
				i = ($num_players_in_band)
				begin
				if ((<num_matchmaking_players> - <i>) > 0)
					msg = qs(0xb81382c3)
				else
					msg = qs(0x496fc06c)
				endif
				resolvescreenelementid id = [
					{id = (<menus> [<i>])}
					{local_id = text}
				]
				if screenelementexists id = <resolved_id>
					<resolved_id> :se_setprops text = <msg>
				endif
				i = (<i> + 1)
				repeat (4 - ($num_players_in_band))
				if (<current_players> < <num_matchmaking_players>)
					generic_menu_pad_choose_sound
				elseif (<current_players> > <num_matchmaking_players>)
					generic_menu_pad_back_sound
				endif
			endif
		endif
	endif
endscript

script ui_band_mode_change_menu_focus_all 
	requireparams \{[
			focus_type
		]
		all}
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
		i = 0
		begin
		if gotparam \{local_only}
			(<menus> [<i>]) :getsingletag menu
			if ((<menu> = net_local_root) || (<menu> = net_local_join))
				launchevent target = (<menus> [<i>]) type = <focus_type>
			endif
		else
			launchevent target = (<menus> [<i>]) type = <focus_type>
		endif
		i = (<i> + 1)
		repeat <array_size>
		launchevent target = myinterfaceelement type = <focus_type>
	endif
endscript

script net_ui_band_mode_create_searching_menu 
	requireparams \{[
			options_type
		]
		all}
	title = qs(0x9b97c7b2)
	options = [
		{
			func = cancel_career_search_early
			text = qs(0xf7723015)
		}
	]
	msg_txt_blck = {
		text = qs(0x3e65697f)
	}
	if (<options_type> = both_options)
		options = [
			{
				func = career_proceed_with_current_reservations
				text = qs(0x182f0173)
			}
			{
				func = cancel_career_search_early
				text = qs(0xf7723015)
			}
		]
		msg_txt_blck = {
			text = qs(0xc6ba87af)
		}
	elseif (<options_type> = invites)
		removeparameter \{options}
		title = qs(0xd121e6da)
		msg_txt_blck = {
			text = qs(0x352fb8a5)
		}
	endif
	destroy_popup_warning_menu
	if gotparam \{options}
		create_popup_warning_menu {
			title = <title>
			textblock = <msg_txt_blck>
			options = <options>
			no_background
			popup_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		assignalias id = <menu_id> alias = band_mode_searching_menu
		gradient_parent = dlog_master_container
	else
		create_popup_warning_menu {
			title = <title>
			textblock = <msg_txt_blck>
			no_background
			popup_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		gradient_parent = alert_master_container
	endif
	ui_band_mode_helper_text
	resolvescreenelementid id = [
		{id = popupelement}
		{local_id = <gradient_parent>}
		{local_id = gradient_256}
	]
	if screenelementexists \{id = popup_warning_container}
		popup_warning_container :se_setprops \{scale = (0.87, 0.7)
			pos = (80.0, 15.0)}
	endif
	if screenelementexists \{id = popupelement}
		popupelement :se_setprops \{scale = (0.87, 0.7)
			pos = (80.0, 15.0)}
	endif
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 0.0
	endif
endscript

script get_controller_part 
	requireparams \{[
			controller
		]
		all}
	if isguitarcontroller controller = <controller>
		return \{controller_part = guitar}
	elseif isdrumcontroller controller = <controller>
		return \{controller_part = drum}
	else
		return \{controller_part = vocals}
	endif
endscript

script career_friendslist_callback 
	printf \{qs(0x786596cd)}
	requireparams \{[
			params
		]
		all}
	if gotparam \{friendlist}
		if screenelementexists \{id = myinterfaceelement}
			myinterfaceelement :getsingletag \{menus}
			if screenelementexists id = (<menus> [(<params>.menu_index)])
				(<menus> [(<params>.menu_index)]) :getsingletag menu
				if (<menu> = friends)
					getarraysize <friendlist>
					if (<array_size> > 0)
						i = 0
						begin
						if (0 != <friendlist> [<i>].localplayer)
							cant_invite = 1
						elseif (0 != <friendlist> [<i>].alreadyingame)
							cant_invite = 1
						else
							cant_invite = 0
						endif
						createscreenelement {
							type = containerelement
							parent = (<menus> [(<params>.menu_index)])
							dims = (200.0, 40.0)
							just = [center bottom]
						}
						container_id = <id>
						createscreenelement {
							type = textblockelement
							fit_width = `expand dims`
							fit_height = `scale down if larger`
							parent = <id>
							text = (<friendlist> [<i>].name)
							font = fontgrid_bordello
							dims = (0.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus ui_band_mode_focus}
								{unfocus retail_menu_unfocus}
								{focus career_friendslist_scroll}
								{unfocus career_friendslist_stop_scroll}
							]
							internal_scale = 0.75
							just = [left bottom]
							internal_just = [left center]
							pos_anchor = [left bottom]
							pos = (0.0, 0.0)
						}
						getscreenelementdims id = <id>
						if NOT (<width> > 200)
							<id> :se_setprops {
								just = [center bottom]
								internal_just = [center center]
								pos_anchor = [center bottom]
								pos = (0.0, 0.0)
							}
						endif
						<container_id> :se_setprops {
							focusable_child = <id>
							event_handlers = [
								{pad_choose ui_band_mode_choose params = {
										friends = invite
										name = (<friendlist> [<i>].name)
										id = (<friendlist> [<i>].id)
										sentfriendrequest = (<friendlist> [<i>].sentfriendrequest)
										sentinvite = (<friendlist> [<i>].sentinvite)
										friendstate = (<friendlist> [<i>].friendstate)
										cant_invite = <cant_invite>
									}
								}
							]
						}
						<i> = (<i> + 1)
						repeat <array_size>
					else
						createscreenelement {
							type = textblockelement
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							parent = (<menus> [(<params>.menu_index)])
							text = qs(0xf5e6fa4e)
							font = fontgrid_bordello
							dims = (170.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus ui_band_mode_focus}
								{unfocus retail_menu_unfocus}
							]
							internal_scale = 0.75
							just = [center bottom]
							internal_just = [center center]
						}
					endif
				endif
			endif
		endif
	endif
endscript

script career_friendslist_scroll 
	obj_getid
	getscreenelementdims id = <objid>
	if (<width> <= 200)
		return
	endif
	x = (<width> - 200)
	begin
	wait \{0.5
		seconds}
	se_setprops pos = ((-1.0, 0.0) * <x>) time = (10 * <x> / 200)
	se_waitprops
	wait \{0.5
		seconds}
	se_setprops pos = (0.0, 0.0) time = (10 * <x> / 200)
	se_waitprops
	repeat
endscript

script career_friendslist_stop_scroll 
	obj_killspawnedscript \{name = career_friendslist_scroll}
	se_setprops \{pos = (0.0, 0.0)}
endscript

script net_move_invite_player_to_open_menu 
	requireparams \{[
			menu_id
		]
		all}
	<menu_id> :gettags
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		m = 0
		getarraysize \{menus}
		begin
		(<menus> [<m>]) :getsingletag menu
		if (join = <menu>)
			open_menu = <m>
			break
		endif
		m = (<m> + 1)
		repeat <array_size>
		if gotparam \{open_menu}
			(<menus> [<open_menu>]) :obj_killspawnedscript name = ui_band_mode_update_name
			(<menus> [<open_menu>]) :obj_killspawnedscript name = ui_band_mode_check_disconnect
			netsessionfunc \{obj = party
				func = get_party_members}
			getarraysize <connections>
			i = 0
			begin
			if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) && (<connections> [<i>].user_id [1]) = (<user_id> [1]))
				name = (<connections> [<i>].gamertag)
			endif
			i = (<i> + 1)
			repeat <array_size>
			add_gamertag_to_band_lobby index = <open_menu> name = <name> menu = net_remote_root
			band_character_rename index = <open_menu> character_name = qs(0x48294e54)
			(<menus> [<open_menu>]) :settags {
				menu = net_remote_root
				instrument = <instrument>
				difficulty = none
				user_id = <user_id>
			}
			(<menus> [<open_menu>]) :obj_spawnscript ui_band_mode_update_menu
			return open_menu = <open_menu>
		else
			scriptassert \{qs(0xa5bd3017)}
		endif
	endif
endscript

script net_career_memcard_drop_player 
	printf \{qs(0x62a85a96)}
	spawnscriptnow wait_for_net_career_drop_player params = {<...>}
endscript

script wait_for_net_career_drop_player 
	printf \{qs(0x7fb478bc)}
	begin
	if ($memcard_state_active = 0)
		ui_event_get_top
		if (<base_name> = 'band_mode')
			if screenelementexists \{id = myinterfaceelement}
				break
			endif
		elseif (<base_name> = 'group_play')
			return
		endif
	endif
	wait \{1
		second}
	repeat
	net_career_drop_player <...>
endscript

script net_career_memcard_end_game 
	printf \{qs(0x4e6b3c84)}
	spawnscriptnow wait_for_net_career_end_game params = {<...>}
endscript

script wait_for_net_career_end_game 
	printf \{qs(0x0307fc4c)}
	begin
	if ($memcard_state_active = 0)
		ui_event_get_top
		if (<base_name> = 'band_mode')
			if screenelementexists \{id = myinterfaceelement}
				break
			endif
		elseif (<base_name> = 'group_play')
			return
		endif
	endif
	wait \{1
		second}
	repeat
	net_career_end_game <...>
endscript

script net_career_drop_player 
	printf \{qs(0x615e8129)}
	printstruct <...>
	if (<is_game_over> = 0)
		change net_num_players = (($net_num_players) - 1)
		change current_num_players = (($current_num_players) - 1)
		change num_players_in_band = (($num_players_in_band) - 1)
		formattext checksumname = mode 'p%d_career' d = ($current_num_players)
		change game_mode = <mode>
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> team = 0
		setplayerinfo <dropped_player_num> party_id = -1
		change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = drop_msg qs(0xafcc55cd) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = drop_msg qs(0xc11e11da) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		if screenelementexists \{id = myinterfaceelement}
			net_create_player_drop_message_box parent_element = myinterfaceelement drop_msg = <drop_msg>
			myinterfaceelement :gettags
			(<menus> [(<dropped_player_num> - 1)]) :settags {
				menu = net_remote_open
				instrument = none
				difficulty = none
			}
			ui_band_mode_kill_character player = <dropped_player_num>
			(<descs> [(<dropped_player_num> - 1)]) :se_setprops reposition_pos = (0.0, 220.0) time = 0.1 motion = ease_out
			(<descs> [(<dropped_player_num> - 1)]) :se_waitprops
			(<descs> [(<dropped_player_num> - 1)]) :se_setprops reposition_pos = (0.0, 450.0) time = 0.1 alpha = 0
		endif
	endif
endscript

script net_career_end_game 
	printf \{qs(0x51763a0d)}
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	switch <drop_reason>
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
	if screenelementexists \{id = popupelement}
		popupelement :se_setprops \{z_priority = 1500.2}
	endif
	wait \{3
		seconds}
	destroy_net_popup
	if ishost
		change \{net_band_mode_menu = host}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	else
		change \{net_band_mode_menu = join}
	endif
	change \{num_players_in_band = 0}
	change \{net_band_members = [
		]}
	change \{net_num_joiners = 0}
	change \{career_matchmaking_complete = 0}
	change \{game_mode = p4_career}
	quit_network_game
	ui_event_get_stack
	if ((<stack> [1].base_name) = 'band_mode')
		if (((<stack> [0].base_name) = 'online_quit_warning') || ((<stack> [0].base_name) = 'gig_posters') || ((<stack> [0].base_name) = 'select_instrument_warning'))
			generic_event_back \{data = {
					num_states = 2
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		ui_event \{event = menu_refresh}
	endif
endscript

script fix_deleted_character_player_status 
	formattext checksumname = player_status 'player%d_status' d = <player>
	if ($<player_status>.is_local_client = 0)
		return
	endif
	if ($<player_status>.controller > 4)
		return
	endif
	get_savegame_from_player_status player_status = <player_status>
	if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
		change structurename = <player_status> character_id = judy
	endif
endscript

script sanity_check_fix_deleted_characters 
	fix_deleted_character_player_status \{player = 1}
	fix_deleted_character_player_status \{player = 2}
	fix_deleted_character_player_status \{player = 3}
	fix_deleted_character_player_status \{player = 4}
	fix_deleted_character_player_status \{player = 5}
	fix_deleted_character_player_status \{player = 6}
	fix_deleted_character_player_status \{player = 7}
	fix_deleted_character_player_status \{player = 8}
endscript

script hacky_fix_band_celebrity_character 
	requireparams \{[
			player
		]
		all}
	printf 'hacky_fix_band_celebrity_character p=%p' p = <player>
	getplayerinfo <player> character_id
	getplayerinfo <player> controller
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 1)
		get_savegame_from_controller band_character_select controller = <controller>
		get_controller_part controller = <controller>
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <savegame> part = <controller_part>
			printf qs(0x39675789) a = <character_id> b = <controller_part>
			setplayerinfo <player> character_id = <character_id>
			if (<controller> <= 4)
				cas_queue_new_character_profile id = <character_id> player = (<controller> + 1) savegame = <savegame>
				band_character_rename index = (<player> -1) player = <player>
			endif
		endif
	endif
endscript

script net_career_get_band_leader_difficulty 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
		i = 0
		begin
		(<menus> [<i>]) :gettags
		if (<band_leader> = 1)
			return band_difficulty = <difficulty>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	scriptassert \{qs(0x00c66753)}
endscript

script net_career_wait_until_menu_update_is_done 
	begin
	if NOT scriptisrunning \{ui_band_mode_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script net_career_asign_band_leader_icon 
	requireparams \{[
			player_num
		]
		all}
	begin
	if screenelementexists \{id = myinterfaceelement}
		break
	endif
	wait \{1
		second}
	repeat
	change net_band_leader_player_num = <player_num>
	myinterfaceelement :getsingletag \{descs}
	(<descs> [(<player_num> - 1)]) :se_setprops leader_indicator_alpha = 1.0
endscript

script net_career_check_instruments 
	printf \{qs(0x3eb05458)}
	gamemode_gettype
	if (<type> = career)
		loop_count = 4
	else
		loop_count = 8
		return
	endif
	guitar_count = 0
	bass_count = 0
	drum_count = 0
	vocals_count = 0
	non_asigned_count = 0
	array = []
	i = 1
	begin
	getplayerinfo <i> net_obj_id
	if (<net_obj_id> >= 0)
		getplayerinfo <i> part
		switch <part>
			case guitar
			guitar_count = (<guitar_count> + 1)
			addarrayelement array = <array> element = <i>
			case bass
			bass_count = (<bass_count> + 1)
			addarrayelement array = <array> element = <i>
			case drum
			drum_count = (<drum_count> + 1)
			case vocals
			vocals_count = (<vocals_count> + 1)
			default
			non_asigned_count = (<non_asigned_count> + 1)
			addarrayelement array = <array> element = <i>
		endswitch
	endif
	i = (<i> + 1)
	repeat <loop_count>
	if (<type> = career)
		getarraysize <array>
		if (<array_size> > 0)
			if ((<guitar_count> > 1) || (<bass_count> > 1))
				net_career_set_instruments player_num_array = <array>
			elseif (<non_asigned_count> = 2)
				net_career_set_instruments player_num_array = <array>
			elseif (<non_asigned_count> = 1)
				getarraysize <array>
				if (<array_size> = 2)
					getplayerinfo (<array> [0]) part
					player1_part = <part>
					getplayerinfo (<array> [1]) part
					player2_part = <part>
					if (<player1_part> = guitar)
						setplayerinfo (<array> [1]) part = bass
					elseif (<player1_part> = bass)
						setplayerinfo (<array> [1]) part = guitar
					elseif (<player2_part> = guitar)
						setplayerinfo (<array> [0]) part = bass
					elseif (<player2_part> = bass)
						setplayerinfo (<array> [0]) part = guitar
					endif
				else
					setplayerinfo (<array> [0]) part = guitar
				endif
			endif
		endif
	endif
endscript

script net_career_set_instruments 
	requireparams \{[
			player_num_array
		]
		all}
	part = guitar
	getarraysize <player_num_array>
	i = 0
	begin
	setplayerinfo (<player_num_array> [<i>]) part = <part>
	if (<part> = guitar)
		part = bass
	elseif (<part> = bass)
		part = guitar
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_band_mode_ps3_invite_received 
	if gotparam \{device_num}
		if ($primary_controller = <device_num>)
			ps3_display_invites_received
		endif
	endif
endscript

script net_career_host_finalize_menu_ui 
	wait \{1
		second}
	getsingletag \{menus}
	i = 0
	begin
	getplayerinfo (<i> + 1) net_obj_id
	if (<net_obj_id> < 0)
		(<menus> [<i>]) :obj_spawnscriptlater ui_band_mode_update_menu
	endif
	i = (<i> + 1)
	repeat 4
endscript

script net_career_send_to_host_msg_uistate_ready 
	gamemode_getnumplayers
	i = 1
	begin
	getplayerinfo <i> net_obj_id
	getplayerinfo <i> is_local_client
	if ((<net_obj_id> >= 0) && (<is_local_client> = 1))
		sendstructure callback = mark_client_as_in_lobby data_to_send = {player_num = <i>}
	endif
	i = (<i> + 1)
	repeat <num_players>
endscript

script mark_client_as_in_lobby 
	setarrayelement globalarray arrayname = players_in_uistate index = (<player_num> - 1) newvalue = 1
endscript

script net_career_wait_for_clients_uistate_ready 
	i = 1
	begin
	getplayerinfo <i> net_obj_id
	getplayerinfo <i> is_local_client
	if ((<net_obj_id> >= 0) && (<is_local_client> = 1))
		setarrayelement globalarray arrayname = players_in_uistate index = (<i> - 1) newvalue = 1
	endif
	i = (<i> + 1)
	repeat 4
	getarraysize ($players_in_uistate)
	begin
	valid_players = 0
	players_in_uistate = 0
	i = 1
	begin
	getplayerinfo <i> net_obj_id
	if (<net_obj_id> >= 0)
		valid_players = (<valid_players> + 1)
		if (($players_in_uistate [(<i> -1)]) = 1)
			players_in_uistate = (<players_in_uistate> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<valid_players> = <players_in_uistate>)
		myinterfaceelement :settags \{net_lobby_ready = 1}
		break
	endif
	wait \{1
		second}
	repeat
endscript

script net_career_shift_invite_player_status_structs 
	requireparams \{[
			index
		]
		all}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> > 0)
		if ((<connections> [<index>].is_local) = 1)
			get_player_num_from_controller controller_index = (<connections> [<index>].controller_index)
			formattext checksumname = player_status 'player%d_status' d = <player_num>
			setplayerinfo (<index> + 1) character_id = ($<player_status>.character_id)
			getplayerinfo (<index> + 1) gamertag
			change globalname = <gamertag> newvalue = (<connections> [<index>].gamertag)
			switch (<connections> [<index>].instrument)
				case eguitar
				part = guitar
				case edrums
				part = drum
				case emicrophone
				part = vocals
			endswitch
			setplayerinfo (<index> + 1) part = <part>
			setplayerinfo (<index> + 1) controller = (<connections> [<index>].controller_index)
			setplayerinfo (<index> + 1) is_local_client = 1
		else
			setplayerinfo (<index> + 1) is_local_client = 0
		endif
	endif
endscript

script is_party_member_local 
	requireparams \{[
			user_id
		]
		all}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) && (<connections> [<i>].user_id [1]) = (<user_id> [1]))
			if ((<connections> [<i>].is_local) = 1)
				return \{true}
			else
				return \{false}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script change_controller_disconnect_scripts_on_all_menus 
	requireparams \{[
			change_type
		]
		all}
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :getsingletag \{menus}
		getarraysize <menus>
		i = 0
		begin
		if (<change_type> = remove)
			(<menus> [<i>]) :obj_killspawnedscript name = ui_band_mode_check_disconnect
		elseif (<change_type> = add)
			(<menus> [<i>]) :obj_spawnscriptlater ui_band_mode_check_disconnect
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_band_mode_focus \{offset = (0.0, 34.0)
		start_pos = (0.0, -120.0)}
	retail_menu_focus
	obj_getid
	<objid> :se_getparentid
	<parent_id> :gettags
	gettags
	if gotparam \{stars_id}
		if gotparam \{show_stars}
			bx_focushighlightstarson objid = <objid> stars_id = <stars_id>
		else
			<stars_id> :se_setprops alpha = 0
		endif
	endif
endscript

script ui_band_mode_highlight_motion 
endscript
