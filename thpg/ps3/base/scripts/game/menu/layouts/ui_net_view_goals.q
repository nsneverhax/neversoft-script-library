net_last_singleplayer_level = Load_Z_Slums

script ui_create_net_view_goals 
	printf 'UI: ui_create_net_view_goals'
	change newarea = ''
	change prevarea = ''
	title = "Online Games"
	fadetoblack off time = 0 no_wait
	setnetworkmode $internet_mode
	net_reset_server_cheats
	pad_back_script = net_view_goals_normal_back
	if gotparam from_gameplay
		pad_back_script = net_view_goals_exit_to_gameplay
	endif
	if infrontend
		pad_back_script = net_view_goals_exit_to_main_menu
		if isxenon
			title = "Xbox LIVE Lobby"
		else
			title = "Online Lobby"
		endif
	endif
	pause_menu_fmv_kill
	if screenelementexists id = online_save_bg
		destroyscreenelement id = online_save_bg
	endif
	make_cas_menu {
		title = <title>
		pad_back_script = <pad_back_script>
		scrolling
		menu_id = net_view_goals_menu
		vmenu_id = net_view_goals_vmenu
		pausemenu
		PauseMap
		preserve_case
	}
	if isps3
		if NOT netsessionfunc obj = voice func = voice_allowed
			0x0a32c79f
		endif
	endif
	spawnscriptlater net_view_goals_wait_and_set_handlers
	cas_menu_hide_scroll_bar
	setscreenelementprops {
		id = pause_back_container
		pos = (0.0, -65.0)
	}
	net_view_goals_setup_map parent = net_view_goals_menu
	net_view_goals_create_city_bar
	net_view_goals_toggle_city
	net_view_goals_create_match_type_bar
	net_view_goals_match_type_toggle
	add_cas_menu_item {
		text = "Quick Match"
		id = net_view_goals_static_item_0
		pad_choose_script = net_view_goals_quickmatch
		pad_choose_params = {}
	}
	add_cas_menu_item {
		text = "Custom Match"
		id = net_view_goals_static_item_1
		pad_choose_script = xboxlive_menu_optimatch_create
		pad_choose_params = {from_net_view_goals}
	}
	add_cas_menu_item {
		text = "Create Match"
		id = net_view_goals_static_item_2
		pad_choose_script = xboxlive_menu_host_create
		pad_choose_params = {from_net_view_goals}
	}
	add_cas_menu_item {
		text = "Refresh List"
		id = net_view_goals_static_item_3
		choose_state = UIstate_net_view_goals
	}
	createscreenelement {
		type = containerelement
		parent = current_menu
		dims = (20.0, 25.0)
		scale = 0.55
		just = [left top]
		not_focusable
	}
	bar_holder = <id>
	createscreenelement {
		parent = <bar_holder>
		type = spriteelement
		texture = menu_goal_underline
		dims = (-370.0, 8.0)
		rgba = [100 100 100 255]
		pos = (-175.0, -20.0)
		just = [left top]
		z_priority = 2
	}
	change xboxlive_num_results = 0
	net_view_goals_restart_search
	i = 1
	begin
	formattext checksumname = server_item_chk 'server_item_%d' d = <i>
	add_cas_menu_item {
		text = ""
		id = <server_item_chk>
		pad_choose_script = xboxlive_menu_optimatch_create
		pad_choose_params = {from_net_view_goals}
	}
	<item_container_id> :setprops not_focusable
	i = (<i> + 1)
	repeat 35
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	if isxenon
		cas_menu_finish helper_text = {
			scale = (1.8, 1.3499999)
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m5 VIEW GAMER CARD"}
				{text = "\\m8 PLAYER/RANKED"}
				{text = "\\mb VIEW LEADERBOARDS"}
			]
		}
	else
		cas_menu_finish helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m8 WAGER/NON-WAGER"}
				{text = "\\mb VIEW LEADERBOARDS"}
			]
		}
	endif
	net_view_goals_create_searching_text {
		z_pri = 100
		bg_id = my_net_view_goals_searching_bg
	}
	net_view_goals_create_server_info_block
endscript

script net_view_goals_wait_and_set_handlers 
	printf \{"--- net_view_goals_wait_and_set_handlers"}
	killspawnedscript \{name = net_view_goals_set_handlers}
	net_view_goals_set_handlers
endscript
net_layer_ready_for_input = 1

script net_view_goals_set_handlers 
	printf "--- net_view_goals_set_handlers"
	wait 0.5 seconds
	begin
	if ($net_layer_ready_for_input = 1)
		break
	endif
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 0)
		break
	endif
	wait 1 gameframe
	repeat
	if screenelementexists id = net_view_goals_vmenu
		setscreenelementprops {
			id = net_view_goals_vmenu
			event_handlers = [
				{pad_l2 net_view_goals_toggle_city params = {left}}
				{pad_r2 net_view_goals_toggle_city params = {right}}
				{pad_option2 net_view_goals_match_type_toggle params = {toggle}}
				{pad_r1 ui_change_state params = {state = uistate_leaderboard}}
			]
		}
	endif
endscript

script net_goals_test 
	net_view_goals_add_server {
		server_id = blah
		server_name = "miiclive1"
		qos = 6
		game_type = "FIX ME"
		level = "FIX ME"
		num_players = 1
		max_players = 8
		freq = 1
	}
	wait 1 second
	net_view_goals_add_server {
		server_id = blah1
		server_name = "miiclive2"
		qos = 6
		game_type = "FIX ME"
		level = "FIX ME"
		num_players = 1
		max_players = 8
		freq = 1
	}
	wait 1 second
	net_view_goals_add_server {
		server_id = blah2
		server_name = "miiclive3"
		qos = 6
		game_type = "FIX ME"
		level = "FIX ME"
		num_players = 1
		max_players = 8
		freq = 1
	}
	wait 1 second
	net_view_goals_add_server {
		server_id = blah3
		server_name = "miiclive4"
		qos = 6
		game_type = "FIX ME"
		level = "FIX ME"
		num_players = 1
		max_players = 8
		freq = 1
	}
	wait 1 second
	net_view_goals_add_server {
		server_id = blah4
		server_name = "miiclive5"
		qos = 6
		game_type = "FIX ME"
		level = "FIX ME"
		num_players = 1
		max_players = 8
		freq = 1
	}
endscript

script net_view_goals_force_items_show 
	i = 0
	begin
	formattext checksumname = static_item 'net_view_goals_static_item_%i' i = <i>
	if screenelementexists id = <static_item>
		printf \{"forcing alpha"}
		setscreenelementprops {
			id = <static_item>
			alpha = 1
		}
		<static_item> :domorph alpha = 1 time = 0
	endif
	i = (<i> + 1)
	repeat 10
endscript

script net_view_goals_return_cleanly 
	printf \{"--- net_view_goals_return_cleanly"}
	if gotparam \{did_custom}
		change \{net_view_goals_did_custom_match = 1}
	endif
	xboxlive_please_load_levelselect_pak \{unload}
	xboxlive_set_search_params
	ui_change_state \{state = UIstate_net_view_goals}
endscript

script net_view_goals_quickmatch 
	printf "--- net_view_goals_quickmatch"
	if ($net_layer_ready_for_input = 0)
		return
	endif
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 1)
		return
	endif
	netsessionfunc obj = match func = stop_server_list
	netsessionfunc obj = match func = free_server_list
	change_gamemode_net
	setnetworkmode $internet_mode
	setup_sessionfuncs
	getpreferencechecksum pref_type = network ranked
	if checksumequals a = ranked b = <checksum>
		SetPreferencesFromUI {prefs = network field = 'ranked' string = "Ranked Match" checksum = ranked num = 0}
	else
		SetPreferencesFromUI {prefs = network field = 'ranked' string = "Player Match" checksum = player num = 1}
	endif
	getcurrentlevel
	change net_last_singleplayer_level = <level>
	xboxlive_set_search_params
	netsessionfunc obj = match func = set_server_list_mode params = {quickmatch}
	netsessionfunc obj = match func = start_server_list
	if isxenon
		xboxlive_dialog_box {
			title = "Xbox LIVE"
			text = "Finding session..."
			buttons = [
				{text = "CANCEL" pad_choose_script = net_view_goals_search_cancel}
			]
			no_bg
		}
	else
		xboxlive_dialog_box {
			title = "online"
			text = "Finding session..."
			buttons = [
				{text = "CANCEL" pad_choose_script = net_view_goals_search_cancel}
			]
			no_bg
		}
	endif
endscript

script net_view_goals_search_cancel 
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	if NOT infrontend
		change_gamemode_career
	endif
	xboxlive_dialog_box_exit
	ui_change_state \{state = UIstate_net_view_goals}
endscript

script net_view_goals_add_server 
	printf "--- net_view_goals_add_server"
	printstruct <...>
	if NOT screenelementexists id = net_view_goals_menu
		printf "User left the net_view_goals_state!!!!"
		return
	endif
	num_servers = 0
	net_view_goals_menu :getsingletag num_servers
	num_servers = (<num_servers> + 1)
	net_view_goals_menu :settags num_servers = <num_servers>
	if (<num_servers> = 6)
		cas_menu_show_scroll_bar time = 0.5
	endif
	formattext checksumname = server_item_chk 'server_item_%d' d = <num_servers>
	printf "num servers %d" d = <num_servers>
	if screenelementexists id = <server_item_chk>
		setscreenelementprops {
			id = {<server_item_chk> child = text}
			text = <server_name>
			alpha = 0
		}
		setscreenelementprops {
			id = <server_item_chk>
			event_handlers = [
				{pad_choose net_view_goals_server_choose_item params = {id = <server_id>}}
				{focus net_view_goals_server_item_focus}
				{unfocus net_view_goals_server_item_unfocus}
			]
			focusable
		}
		if isxenon
			if gotparam player_xuid
				printf "got player_xuid!"
				setscreenelementprops {
					id = <server_item_chk>
					event_handlers = [
						{pad_square show_gamer_card params = {player_xuid = <player_xuid>}}
					]
				}
			endif
		endif
		<server_item_chk> :settags {
			server_id = <server_id>
			qos = <qos>
			game_type = <game_type>
			num_players = <num_players>
			max_players = <max_players>
			freq = <feq>
			server_name = <server_name>
			level = <level>
			wager_amount = <wager_amount>
			is_server
		}
		spawnscriptlater net_view_goals_server_fade_in params = {item_id = <server_item_chk>}
	else
		printf "what the shit"
	endif
endscript
net_view_goals_did_custom_match = 0

script net_view_goals_found_all_servers 
	printf "--- net_view_goals_found_all_servers"
	if (<xboxlive_num_results> = 0)
		if ($net_view_goals_did_custom_match = 1)
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
		endif
	endif
	change net_view_goals_did_custom_match = 0
	if screenelementexists id = net_view_goals_searching_cont
		runscriptonscreenelement id = net_view_goals_searching_cont net_view_goals_searching_fade_out_and_die
	endif
endscript

script net_view_goals_server_choose_item 
	printf "--- net_view_goals_server_choose_item"
	if ($net_layer_ready_for_input = 0)
		return
	endif
	if ($DONT_ALLOW_INPUT_IN_ONLINE = 1)
		return
	endif
	printstruct <...>
	netsessionfunc {
		obj = match
		func = stop_server_list
	}
	change net_entered_from_singleplayer = 1
	getcurrentlevel
	change net_last_singleplayer_level = <level>
	xenon_singleplayer_session_begin_uninit
	setnetworkmode $internet_mode
	setup_sessionfuncs
	netsessionfunc obj = match func = choose_server params = {id = <id>}
endscript

script net_view_goals_server_fade_in 
	if NOT gotparam item_id
		softassert "Did not get item_id!"
	endif
	if screenelementexists id = <item_id>
		printf "hiding it"
		doscreenelementmorph {
			id = {<item_id> child = text}
			alpha = 0
			time = 0
		}
	endif
	if screenelementexists id = <item_id>
		printf "showing it slowly"
		doscreenelementmorph {
			id = {<item_id> child = text}
			alpha = 1
			time = 1
		}
	endif
endscript

script net_view_goals_server_item_focus 
	obj_getid
	<objid> :gettags
	parent_id = net_view_goals_server_info_block
	setscreenelementprops {
		id = {<parent_id> child = level}
		text = <level>
	}
	formattext textname = num_players "%n/%t" n = <num_players> t = <max_players>
	setscreenelementprops {
		id = {<parent_id> child = num_players}
		text = <num_players>
	}
	formattext textname = wager_text "$%d" d = <wager_amount>
	setscreenelementprops {
		id = {<parent_id> child = wager}
		text = <wager_text>
	}
	getscreenelementchildren id = {<parent_id> child = qos}
	getarraysize children
	i = 0
	printstruct <...>
	begin
	if (<i> < (<qos> / 2.0))
		qos_rgba = [0 128 0 255]
	else
		qos_rgba = [0 0 0 255]
	endif
	setscreenelementprops id = (<children> [<i>]) rgba = <qos_rgba>
	i = (<i> + 1)
	repeat <array_size>
	doscreenelementmorph {
		id = net_view_goals_server_info_block
		pos = (750.0, 370.0)
		time = 0.15
	}
endscript

script net_view_goals_server_item_unfocus 
	obj_getid
	<objid> :gettags
	parent_id = net_view_goals_server_info_block
	setscreenelementprops {
		id = {<parent_id> child = level}
		text = ""
	}
	formattext textname = num_players "%n/%t" n = <num_players> t = <max_players>
	setscreenelementprops {
		id = {<parent_id> child = num_players}
		text = ""
	}
	setscreenelementprops {
		id = {<parent_id> child = wager}
		text = ""
	}
	doscreenelementmorph {
		id = net_view_goals_server_info_block
		pos = (1300.0, 370.0)
		time = 0.15
	}
endscript

script net_view_goals_create_server_info_block 
	printf "--- net_view_goals_create_server_info_block"
	createscreenelement {
		id = net_view_goals_server_info_block
		parent = net_view_goals_menu
		type = containerelement
		just = [top left]
		pos = (1300.0, 370.0)
	}
	parent_id = net_view_goals_server_info_block
	text_color = [200 200 200 255]
	text_scale = (0.8, 0.6)
	z_priority = 10
	just = [left top]
	net_view_goals_create_grey_box {
		cont_id = net_view_goals_server_info_block_bg
		parent = <parent_id>
		z_priority = (<z_priority> -1)
	}
	scale_element_to_size {
		id = net_view_goals_server_info_block_bg
		target_width = 400
		target_height = 250
	}
	right_pos = (380.0, 35.0)
	spacing = (0.0, 50.0)
	right_just = [right top]
	createscreenelement {
		local_id = num_players
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = ""
		pos = <right_pos>
		scale = <text_scale>
		just = <right_just>
		z_priority = <z_priority>
	}
	right_pos = (<right_pos> + <spacing>)
	createscreenelement {
		local_id = level
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = ""
		pos = <right_pos>
		scale = <text_scale>
		just = <right_just>
		z_priority = <z_priority>
	}
	right_pos = (<right_pos> + <spacing>)
	createscreenelement {
		local_id = wager
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = ""
		pos = <right_pos>
		scale = <text_scale>
		just = <right_just>
		z_priority = <z_priority>
	}
	right_pos = (<right_pos> + <spacing>)
	server_name_pos = (0.0, 0.0)
	createscreenelement {
		type = hmenu
		parent = <parent_id>
		local_id = qos
		pos = (<right_pos> + (0.0, -2.0) + (<server_name_pos>.(0.0, 1.0)) * (0.0, 1.0))
		just = [right top]
		internal_just = [left bottom]
		spacing_between = 3
		z_priority = <z_priority>
	}
	qos_id = <id>
	num_qos_bars = 5
	i = 0
	begin
	createscreenelement {
		type = spriteelement
		parent = <qos_id>
		dims = ((8.0, 12.0) + (2 * <i>) * (0.0, 1.5) + (<server_name_pos>.(0.0, 1.0)) * (0.0, 1.0))
		rgba = [0 0 0 255]
		alpha = 1
		just = [left bottom]
	}
	i = (<i> + 1)
	repeat <num_qos_bars>
	left_pos = (20.0, 35.0)
	createscreenelement {
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = "# players:"
		pos = <left_pos>
		scale = <text_scale>
		just = <just>
		z_priority = <z_priority>
	}
	left_pos = (<left_pos> + <spacing>)
	createscreenelement {
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = "level:"
		pos = <left_pos>
		scale = <text_scale>
		just = <just>
		z_priority = <z_priority>
	}
	left_pos = (<left_pos> + <spacing>)
	createscreenelement {
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = "wager amount:"
		pos = <left_pos>
		scale = <text_scale>
		just = <just>
		z_priority = <z_priority>
	}
	left_pos = (<left_pos> + <spacing>)
	createscreenelement {
		parent = <parent_id>
		type = textelement
		font = text_a1
		rgba = <text_color>
		text = "connection:"
		pos = <left_pos>
		scale = <text_scale>
		just = <just>
		z_priority = <z_priority>
	}
endscript

script ui_destroy_net_view_goals 
	printf \{'UI: ui_destroy_net_view_goals'}
	generic_ui_destroy
	netsessionfunc \{obj = match
		func = stop_server_list}
	if screenelementexists \{id = pause_map_container}
		destroyscreenelement \{id = pause_map_container}
	endif
	if infrontend
		pause_menu_fmv_play
	endif
endscript

script net_view_goals_setup_map parent = main_menu_anchor
	printf "--- net_view_goals_setup_map"
	create_pause_map PauseMap
	launchevent type = focus target = pause_map
	doscreenelementmorph {
		id = pause_map_container
		alpha = 1
		time = 0
	}
	GetSkaterPosition
	if (gotparam x)
		<posx> = (<x> + 500)
		<posz> = (<z> + 500)
		calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1000.0, 1000.0)
		if screenelementexists id = pause_map
			addMapIcon {
				parent = pause_map
				icon_create_script = UI_map_icon_create
				icon_create_params = {texture = player_cursor}
				pos = <pro_pos>
				local_id = (skater)
			}
		endif
	endif
	getarraysize $online_level_select_menu_level_info
	i = 0
	begin
	if screenelementexists id = pause_map
		ui_struct = ($online_level_select_menu_level_info [<i>].ui_struct)
		addMapIcon {
			parent = pause_map
			icon_create_script = UI_map_icon_create
			icon_create_params = {rgba = [103 143 184 255]}
			pos = (<ui_struct>.map_pos)
			local_id = ($online_level_select_menu_level_info [<i>].checksum)
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	ui_struct = ($multiplayer_dont_care_struct.ui_struct)
	addMapIcon {
		parent = pause_map
		icon_create_script = UI_map_icon_create
		icon_create_params = {rgba = [103 143 184 255]}
		pos = (<ui_struct>.map_pos)
		local_id = ($multiplayer_dont_care_struct.checksum)
	}
endscript

script net_view_goals_create_searching_text {
		text = "Searching..."
		just = [right top]
		pos = (1150.0, 64.0)
		scale = 1.0
		parent = current_menu_anchor
		id = net_view_goals_searching_cont
		z_pri = 0
	}
	printf "--- net_view_goals_create_searching_text"
	z_pri = 100000
	text_scale = (0.8, 0.6)
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		just = <just>
		child_anchor = [left center]
		pos = <pos>
		z_priority = <z_pri>
		alpha = 0
		scale = <scale>
	}
	assignalias id = <id> alias = net_view_goals_searching
	parent_id = <id>
	text_type = textelement
	if gotparam use_text_block
		text_type = textblockelement
		if NOT gotparam width
			width = 300
		endif
		text_dims = (((1.0, 0.0) * <width>) + (0.0, 300.0))
	endif
	createscreenelement {
		type = <text_type>
		parent = <parent_id>
		local_id = text
		pos = <text_pos>
		text = <text>
		font = text_a1
		rgba = ($cas_color_scheme.text_color)
		scale = <text_scale>
		just = [left center]
		z_priority = <z_pri>
		dims = <text_dims>
	}
	getscreenelementdims id = <id>
	<width> = (<width> + 125)
	<height> = (<height> + 30)
	setscreenelementprops id = <parent_id> dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
	doscreenelementmorph id = {<parent_id> child = text} pos = (25.0, 4.0)
	net_view_goals_create_grey_box {
		parent = <parent_id>
		z_priority = (<z_pri> - 1)
		just = [left center]
	}
	doscreenelementmorph id = <cont_id> pos = ((0.0, -0.5) * <height>)
	scale_element_to_size {
		id = <cont_id>
		target_width = <width>
		target_height = <height>
	}
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		local_id = icon
		texture = spinning_load
		pos = ((1.0, 0.0) * (<width> - 45))
		rgba = ($cas_color_scheme.text_color)
		scale = 0.5
		just = [center center]
		z_priority = <z_pri>
	}
	runscriptonscreenelement id = <parent_id> net_view_goals_searching_fade_in
	runscriptonscreenelement id = {<parent_id> child = icon} net_view_goals_animate_searching_icon
endscript

script net_view_goals_searching_fade_in \{time = 0.3}
	obj_getid
	spawnscriptnow \{ui_messages_check_all_positions}
	<objid> :domorph alpha = 1 time = <time> ignore
endscript

script net_view_goals_searching_fade_out_and_die \{time = 0.3}
	onexitrun \{ui_messages_check_all_positions}
	if gotparam \{extra_wait}
		wait <extra_wait> seconds ignoreslomo
	endif
	obj_getid
	<objid> :domorph alpha = 0 time = <time>
	<objid> :die
endscript

script net_view_goals_animate_searching_icon 
	obj_getid
	getscreenelementprops id = <objid>
	begin
	rot_angle = (<rot_angle> + 1440)
	<objid> :domorph rot_angle = <rot_angle> time = 3.5
	repeat
endscript

script net_view_goals_add_dummy_items 
	printf "--- net_view_goals_add_dummy_items"
	i = 0
	begin
	formattext checksumname = dummy_id 'net_view_goals_dummy_%s' s = <i>
	createscreenelement {
		id = <dummy_id>
		parent = net_view_goals_vmenu
		type = textelement
		font = text_a1
		text = ""
		not_focusable
	}
	i = (<i> + 1)
	repeat 10
endscript

script net_view_goals_destroy_dummy_items 
	printf \{"--- net_view_goals_destroy_dummy_items"}
	i = 0
	begin
	formattext checksumname = dummy_id 'net_view_goals_dummy_%s' s = <i>
	if screenelementexists id = <dummy_id>
		destroyscreenelement id = <dummy_id>
	endif
	i = (<i> + 1)
	repeat 10
endscript

script net_view_goals_create_city_bar 
	printf "--- net_view_goals_create_city_bar"
	printstruct <...>
	createscreenelement {
		id = net_view_goals_city_cont
		parent = net_view_goals_menu
		type = containerelement
		just = [left top]
		pos = (98.0, 140.0)
	}
	parent_id = net_view_goals_city_cont
	pos = (0.0, 0.0)
	text_scale = (1.0, 0.8)
	text_color = [240 240 240 255]
	z_pri = 20
	spacer_tweak = (10.0, 0.0)
	text_just = [left center]
	net_view_goals_city_cont :settags spacer_tweak = <spacer_tweak>
	item_id = net_view_goals_left_arrow
	createscreenelement {
		id = <item_id>
		parent = <parent_id>
		type = textelement
		font = text_a1
		text = "\\bg"
		scale = (0.8, 0.8)
		rgba = <text_color>
		z_priority = <z_pri>
		pos = <pos>
		just = <text_just>
	}
	<item_id> :settags orig_pos = <pos>
	getscreenelementdims id = <item_id>
	pos = (<pos> + <width> * (1.0, 0.0) + <spacer_tweak>)
	item_id = net_view_goals_city_name
	createscreenelement {
		id = <item_id>
		parent = <parent_id>
		type = textelement
		font = text_a1
		text = "temp"
		scale = <text_scale>
		rgba = <text_color>
		z_priority = <z_pri>
		pos = <pos>
		just = <text_just>
	}
	getscreenelementdims id = <item_id>
	printstruct <...>
	pos = (<pos> + <width> * (1.0, 0.0) + <spacer_tweak>)
	printstruct <...>
	item_id = net_view_goals_right_arrow
	createscreenelement {
		id = <item_id>
		parent = <parent_id>
		type = textelement
		font = text_a1
		text = "\\bh"
		scale = (0.8, 0.8)
		rgba = <text_color>
		z_priority = <z_pri>
		just = <text_just>
	}
	<item_id> :settags orig_pos = <pos>
endscript
multiplayer_dont_care_struct = {
	text = "anywhere"
	area_pak = ''
	area_pak_zone = ''
	checksum = dont_care
	spawn_in = [
		z_slums
	]
	multiplayer_level
	ui_struct = $level_select_ui_whole_world
}

script net_view_goals_toggle_city 
	printf "--- net_view_goals_toggle_city"
	printstruct <...>
	soundevent event = VE_category_toggle
	index = 0
	getarraysize $online_level_select_menu_level_info
	begin
	if checksumequals a = $xboxlive_search_level_checksum b = ($online_level_select_menu_level_info [<index>].checksum)
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if checksumequals a = $xboxlive_search_level_checksum b = dont_care
		index = -1
	endif
	if (<index> > (<array_size> - 1))
		<index> = (<array_size> - 1)
	endif
	change_state = 0
	printf "index is %i" i = <index>
	if gotparam left
		index = (<index> - 1)
		if (<index> < -1)
			index = (<array_size> - 1)
		endif
		change_state = 1
	endif
	if gotparam right
		index = (<index> + 1)
		if (<index> = (<array_size>))
			index = -1
		endif
		change_state = 1
	endif
	printf "index now is %i" i = <index>
	if (<index> = -1)
		level_info = $multiplayer_dont_care_struct
	else
		level_info = ($online_level_select_menu_level_info [<index>])
	endif
	getlowercasestring (<level_info>.text)
	setscreenelementprops {
		id = net_view_goals_city_name
		text = <lowercasestring>
	}
	net_view_goals_city_cont :gettags
	getscreenelementprops id = net_view_goals_city_name
	getscreenelementdims id = net_view_goals_city_name
	pos = (<pos> + <width> * (1.0, 0.0) + <spacer_tweak>)
	setscreenelementprops {
		id = net_view_goals_right_arrow
		pos = <pos>
	}
	net_view_goals_right_arrow :settags orig_pos = <pos>
	if gotparam left
		runscriptonscreenelement id = net_view_goals_left_arrow net_view_goals_arrow_nudge params = {left}
	endif
	if gotparam right
		runscriptonscreenelement id = net_view_goals_right_arrow net_view_goals_arrow_nudge params = {right}
	endif
	hack_icon = (<level_info>.checksum)
	xboxlive_set_search_params
	if (<change_state> = 1)
		change xboxlive_search_level_checksum = (<level_info>.checksum)
		ui_change_state state = UIstate_net_view_goals
	else
		spawnscriptnow moveMapToIcon params = {parent = pause_map local_id = <hack_icon> zoom = 1.4}
	endif
endscript

script net_view_goals_arrow_nudge 
	nudge_dist = (0.0, 0.0)
	if gotparam left
		nudge_dist = (-15.0, 0.0)
	endif
	if gotparam right
		nudge_dist = (15.0, 0.0)
	endif
	obj_getid
	getscreenelementprops id = <objid>
	<objid> :getsingletag orig_pos
	<objid> :domorph pos = (<orig_pos> + <nudge_dist>) time = 0.05
	wait 0.1 seconds
	<objid> :getsingletag orig_pos
	<objid> :domorph pos = <orig_pos> time = 0
endscript

script net_view_goals_create_match_type_bar 
	printf "--- net_view_goals_create_match_type_bar"
	createscreenelement {
		id = net_view_goals_match_type_bar_cont
		parent = net_view_goals_menu
		type = containerelement
		pos = (160.0, 175.0)
		just = [top left]
	}
	parent_id = net_view_goals_match_type_bar_cont
	rgba = <rgba>
	createscreenelement {
		id = net_view_goals_match_type_text
		parent = <parent_id>
		type = textelement
		font = text_a1
		text = "temp"
		scale = (0.9, 0.67)
		rgba = [100 100 100 255]
		pos = (-15.0, 10.0)
		just = [left center]
	}
	createscreenelement {
		parent = <parent_id>
		type = spriteelement
		texture = menu_goal_underline
		dims = (-370.0, 8.0)
		rgba = [100 100 100 255]
		pos = (-30.0, 30.0)
		just = [left center]
		z_priority = 2
	}
endscript

script net_view_goals_change_match_type 
	printf \{"--- net_view_goals_change_match_type"}
	net_view_goals_match_type_toggle \{toggle}
	net_view_goals_refresh_search
endscript

script net_view_goals_match_type_toggle 
	printf "--- net_view_goals_match_type_toggle"
	if gotparam toggle
		getpreferencechecksum pref_type = network ranked
		printstruct <...>
		if checksumequals a = ranked b = <checksum>
			printf "adjusting"
			SetPreferencesFromUI prefs = network field = 'ranked' string = "Player Match" num = 1 checksum = player value = 1
			SetPreferencesFromUI prefs = network field = 'game_wager_type' string = "No Wagers" num = 1 checksum = no_wagers value = 1
		endif
		if checksumequals a = player b = <checksum>
			printf "adjusting"
			SetPreferencesFromUI prefs = network field = 'ranked' string = "Ranked Match" num = 0 checksum = ranked value = 0
			SetPreferencesFromUI prefs = network field = 'game_wager_type' string = "Wagers" num = 0 checksum = wagers value = 0
		endif
		ui_change_state state = UIstate_net_view_goals
	else
		printf "just updating the ui..."
		if isxenon
			GetPreferenceString pref_type = network ranked
			getpreferencechecksum pref_type = network ranked
			printstruct <...>
			getlowercasestring <ui_string>
			setscreenelementprops {
				id = net_view_goals_match_type_text
				text = <lowercasestring>
			}
		else
			GetPreferenceString pref_type = network game_wager_type
			getpreferencechecksum pref_type = network game_wager_type
			printstruct <...>
			getlowercasestring <ui_string>
			setscreenelementprops {
				id = net_view_goals_match_type_text
				text = <lowercasestring>
			}
		endif
	endif
endscript

script net_view_goals_create_grey_box 
	if NOT gotparam cont_id
	endif
	if NOT gotparam parent
		softassert "did not get parent!"
		return
	endif
	if NOT gotparam z_priority
		z_priority = 10
	endif
	main_color = [80 80 80 255]
	shadow_color = [0 0 0 255]
	offset_pixels = 2.2
	just = [top left]
	middle_ratio = 3
	shadow_offset = (2.5, 5.0)
	if screenelementexists id = net_view_goals_searching_bg
		destroyscreenelement id = net_view_goals_searching_bg
	endif
	createscreenelement {
		id = <cont_id>
		parent = <parent>
		type = containerelement
		just = <just>
	}
	<cont_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_left
		texture = dialog_corner
		pos = (0.0, 0.0)
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
	}
	getscreenelementprops id = <id>
	getscreenelementdims id = <id>
	corner_width = <width>
	corner_height = <height>
	top_left_pos = <pos>
	top_middle_pos = (<top_left_pos> + (1.0, 0.0) * <corner_width>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_middle
		texture = white
		pos = (<top_middle_pos> + (0.0, 1.0) * <offset_pixels>)
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * 3)
		target_height = (<corner_height> - <offset_pixels>)
	}
	top_right_pos = (<top_middle_pos> + (1.0, 0.0) * <corner_width> * <middle_ratio>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_left
		texture = dialog_corner
		pos = <top_right_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
		flip_v
	}
	middle_pos = (<top_left_pos> + (0.0, 1.0) * <corner_height>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = middle
		texture = white
		pos = (<middle_pos> + (1.1, 0.0) * <offset_pixels>)
		just = <just>
		rgba = <main_color>
		z_priority = <z_priority>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * (<middle_ratio> + 2) - 2.1499999 * <offset_pixels>)
		target_height = <corner_height>
	}
	bottom_left_pos = (<middle_pos> + (0.0, 1.0) * <corner_height>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_left
		texture = dialog_corner
		pos = <bottom_left_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
		flip_h
	}
	bottom_middle_pos = (<bottom_left_pos> + (1.0, 0.0) * <corner_width>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_middle
		texture = white
		pos = <bottom_middle_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * <middle_ratio>)
		target_height = (<corner_height> - <offset_pixels>)
	}
	bottom_right_pos = (<bottom_middle_pos> + (1.0, 0.0) * <corner_width> * 3)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_left
		texture = dialog_corner
		pos = <bottom_right_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <main_color>
		flip_v
		flip_h
	}
	z_priority = (<z_priority> - 1)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_left
		texture = dialog_corner
		pos = <shadow_offset>
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
	}
	top_left_pos = (<pos> + <shadow_offset>)
	top_middle_pos = (<top_left_pos> + (1.0, 0.0) * <corner_width>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_middle
		texture = white
		pos = (<top_middle_pos> + (0.0, 1.0) * <offset_pixels>)
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * 3)
		target_height = (<corner_height> - <offset_pixels>)
	}
	top_right_pos = (<top_middle_pos> + (1.0, 0.0) * <corner_width> * <middle_ratio>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = top_left
		texture = dialog_corner
		pos = <top_right_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
		flip_v
	}
	middle_pos = (<top_left_pos> + (0.0, 1.0) * <corner_height>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = middle
		texture = white
		pos = (<middle_pos> + (1.1, 0.0) * <offset_pixels>)
		just = <just>
		rgba = <shadow_color>
		z_priority = <z_priority>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * (<middle_ratio> + 2) - 2.1499999 * <offset_pixels>)
		target_height = <corner_height>
	}
	bottom_left_pos = (<middle_pos> + (0.0, 1.0) * <corner_height>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_left
		texture = dialog_corner
		pos = <bottom_left_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
		flip_h
	}
	bottom_middle_pos = (<bottom_left_pos> + (1.0, 0.0) * <corner_width>)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_middle
		texture = white
		pos = <bottom_middle_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<corner_width> * <middle_ratio>)
		target_height = (<corner_height> - <offset_pixels>)
	}
	bottom_right_pos = (<bottom_middle_pos> + (1.0, 0.0) * <corner_width> * 3)
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bottom_left
		texture = dialog_corner
		pos = <bottom_right_pos>
		just = <just>
		z_priority = <z_priority>
		rgba = <shadow_color>
		flip_v
		flip_h
	}
	cont_dims = ((1.0, 0.0) * (<corner_width> * (<middle_ratio> + 2)) + (0.0, 1.0) * (<corner_height> * 3))
	setscreenelementprops {
		id = <cont_id>
		dims = <cont_dims>
	}
	return cont_id = <cont_id>
endscript

script net_view_goals_remove_current_servers 
	printf \{"--- net_view_goals_remove_current_servers"}
endscript

script net_view_goals_restart_search 
	printf "--- net_view_goals_restart_search"
	netsessionfunc {
		obj = match
		func = stop_server_list
	}
	netsessionfunc {
		obj = match
		func = free_server_list
	}
	netsessionfunc func = match_init
	netsessionfunc {
		obj = match
		func = set_server_list_mode
		params = {optimatch}
	}
	netsessionfunc {
		obj = match
		func = start_server_list
		params = {
			callback = net_view_goals_add_server
			callback_complete = net_view_goals_found_all_servers
		}
	}
endscript

script net_view_goals_refresh_search 
	printf \{"--- net_view_goals_refresh_screen"}
	net_view_goals_remove_current_servers
	net_view_goals_toggle_city
	net_view_goals_match_type_toggle
	if NOT screenelementexists \{id = net_view_goals_searching_cont}
		net_view_goals_create_searching_text
	endif
	net_view_goals_restart_search
endscript

script net_view_goals_check_for_signin 
	printf \{"--- net_view_goals_check_for_signin"}
	check_for_signin \{cancel_script = ui_change_state
		cancel_params = {
			state = uistate_pausemenu
		}}
	restore_start_key_binding
endscript

script net_view_goals_cancel_join 
	printf \{"--- net_view_goals_cancel_join"}
	change_gamemode_career
	xenon_singleplayer_session_init
	ui_change_state \{state = UIstate_net_view_goals}
endscript

script ui_destroy_net_view_goals_from_gameplay 
	ui_destroy_net_view_goals
	Destroy_MenuFx
endscript

script ui_create_net_view_goals_from_gameplay 
	ui_pausemenu_push_buss
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	ui_create_net_view_goals <...>
endscript

script net_view_goals_exit_to_gameplay 
	setnetworkmode
	restore_start_key_binding
	unpause_game_and_destroy_pause_menu
endscript

script net_view_goals_normal_back 
	printf \{'net_view_goals_normal_back'}
	setnetworkmode
	restore_start_key_binding
	pause_game_and_create_pause_menu
endscript

script net_view_goals_exit_to_main_menu 
	if screenelementexists \{id = pause_map_container}
		destroyscreenelement \{id = pause_map_container}
	endif
	xboxlive_menu_back
endscript

script 0x0a32c79f 
	if screenelementexists id = net_no_voice_cont
		destroyscreenelement id = net_no_voice_cont
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = net_no_voice_cont
		just = [left top]
		pos = (575.0, 450.0)
		alpha = 0
	}
	cont_id = <id>
	0x02f9de1a = (910.0, 200.0)
	createscreenelement {
		type = textblockelement
		id = net_no_voice_helper
		parent = <cont_id>
		font = text_a1
		text = "Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions."
		allow_expansion
		dims = <0x02f9de1a>
		just = [left top]
		scale = 0.6
		rgba = [240 240 240 255]
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = white
		rgba = [0 0 0 255]
		dims = <0x02f9de1a>
		just = [left top]
		pos = (-10.0, -10.0)
	}
	doscreenelementmorph {
		id = net_no_voice_cont
		alpha = 1
		time = 0.3
	}
endscript
