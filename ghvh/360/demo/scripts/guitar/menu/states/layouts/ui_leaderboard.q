
script ui_create_leaderboard 
	setsoundbussparams \{crowd_beds = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	setsoundbussparams \{crowd_one_shots = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	createscreenelement {
		parent = root_window
		id = leaderboardinterface
		type = descinterface
		desc = 'leaderboard'
		exclusive_device = ($lb_controller)
		z_priority = -100
	}
	if leaderboardinterface :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up ui_leaderboard_scroll}
				{pad_down ui_leaderboard_scroll params = {down}}
				{pad_back generic_event_back}
				{pad_option2 generic_event_choose params = {state = uistate_leaderboard_filter data = {is_popup}}}
				{pad_option generic_event_choose params = {state = uistate_leaderboard_me data = {is_popup}}}
			]
			exclusive_device = ($lb_controller)
			alpha = 0
		}
		netsessionfunc \{func = friends_init}
		netsessionfunc obj = friends func = begin_retrieve_friends_list params = {callback = ui_leadeboard_get_friends device_num = ($lb_controller) callback_params = {none}}
		current_menu :settags \{last_index = -1
			goto_bottom = 0
			can_scroll_down = 0}
		if gotparam \{my_data}
			current_menu :settags my_data = <my_data>
			if gotparam \{my_cash}
				current_menu :settags my_cash = <my_cash>
			endif
		else
			current_menu :se_setprops \{event_handlers = [
					{
						pad_option
						nullscript
					}
				]
				replace_handlers}
		endif
		createscreenelement \{parent = current_menu
			type = descinterface
			desc = 'leaderboard_head'
			not_focusable
			autosizedims = false
			dims = (0.0, 220.0)}
		switch ($leaderboardsearchvalue)
			case 0
			search_title = qs(0x954c3f72)
			case 1
			search_title = qs(0x8dc9f66d)
			case 2
			search_title = qs(0xd2cabff7)
		endswitch
		ui_leaderboard_get_instrument_icon
		header_desc = 'leaderboard_row_header'
		if ($current_leaderboard_instrument = band)
			header_desc = 'leaderboard_row_header_band'
			instrument_text = qs(0x038d137e)
		endif
		if ($current_leaderboard_group = song)
			get_song_title song = ($song_checksum)
			get_song_artist song = ($song_checksum)
			<id> :se_setprops {
				leaderboard_head_text = <instrument_text>
				leaderboard_artist_text = <song_artist>
				leaderboard_song_text = <song_title>
				leaderboard_type_text = <search_title>
			}
		else
			if ($current_leaderboard_id = lb_career_cash)
				<id> :se_setprops {
					leaderboard_head_text = qs(0x9b5a6365)
					leaderboard_artist_text = qs(0x3952c590)
					leaderboard_song_text = qs(0x03ac90f0)
					leaderboard_type_text = <search_title>
				}
			else
				ui_leaderboard_get_headers
				<id> :se_setprops {
					leaderboard_head_text = qs(0xb19bb4c5)
					leaderboard_artist_text = qs(0x5a4f279f)
					leaderboard_song_text = <title>
					leaderboard_type_text = <search_title>
				}
			endif
		endif
		current_menu :settags title_id = <id>
		createscreenelement {
			parent = current_menu
			type = descinterface
			desc = <header_desc>
			not_focusable
			autosizedims = false
			dims = (0.0, 120.0)
		}
		<id> :se_setprops {
			rank_text = ($current_leaderboard_array [0].headers [0])
			name_text = ($current_leaderboard_array [0].headers [1])
			score_text = ($current_leaderboard_array [0].headers [2])
			icon_texture = <instrument_icon>
			not_focusable
		}
		current_menu :settags header_id = <id>
		if (($current_leaderboard_group = cash) || ($current_leaderboard_group = career))
			if <id> :desc_resolvealias name = alias_difficulty_container
				<resolved_id> :die
			endif
		endif
		item_desc = 'leaderboard_row'
		if ($current_leaderboard_instrument = band)
			item_desc = 'leaderboard_row_band'
		endif
		array = []
		i = 0
		begin
		createscreenelement {
			parent = current_menu
			type = descinterface
			desc = <item_desc>
			autosizedims = false
			dims = (0.0, 75.0)
			event_handlers = [
				{focus ui_leaderboard_item_focus}
				{unfocus ui_leaderboard_item_unfocus}
			]
			tags = {index = <i>}
		}
		if isxenon
			<id> :se_setprops event_handlers = [{pad_start ui_leaderboard_show_gamercard}]
		endif
		<id> :obj_spawnscript highlight_motion params = {menu_id = <id> motion = random_highlight}
		addarrayelement array = <array> element = <id>
		i = (<i> + 1)
		repeat 10
		current_menu :settags menu_items = <array>
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
	endif
	ui_leaderboard_add_helper_text
	if NOT gotparam \{keep_loading}
		destroy_loading_screen
	endif
endscript

script ui_leaderboard_item_focus \{time = 0.1}
	gettags
	se_getprops
	current_menu :getsingletag \{my_data}
	current_menu :getsingletag \{friendlist}
	bg_rgba = [30 , 30 , 30 , 255]
	if isxenon
		if gotparam \{friendlist}
			getarraysize <friendlist>
			i = 0
			begin
			if ((<friendlist> [<i>].name) = <name_text>)
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam \{my_data}
		if ((<my_data> [1]) = <name_text>)
			bg_rgba = [30 , 30 , 30 , 255]
		endif
	endif
	i = 1
	begin
	getplayerinfo <i> gamertag
	if (<gamertag> = <name_text>)
		bg_rgba = [30 , 30 , 30 , 255]
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	se_setprops bg_rgba = <bg_rgba> highlight_bars_alpha = 0.6
	<ratio> = (<index> / 9.0)
	pos = ((0.0, 1.0) * ((<ratio> * 270) - 135))
	leaderboardinterface :se_setprops leaderboard_scrollthumb_pos = <pos> time = <time>
endscript

script ui_leaderboard_item_unfocus 
	se_getprops
	current_menu :getsingletag \{my_data}
	current_menu :getsingletag \{friendlist}
	bg_rgba = [30 , 30 , 30 , 150]
	if isxenon
		if gotparam \{friendlist}
			getarraysize <friendlist>
			i = 0
			begin
			if ((<friendlist> [<i>].name) = <name_text>)
				bg_rgba = [30 , 30 , 30 , 150]
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam \{my_data}
		if ((<my_data> [1]) = <name_text>)
			bg_rgba = [30 , 30 , 30 , 150]
		endif
	endif
	i = 1
	begin
	getplayerinfo <i> gamertag
	if (<gamertag> = <name_text>)
		bg_rgba = [30 , 30 , 30 , 150]
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	se_setprops bg_rgba = <bg_rgba> highlight_bars_alpha = 0.0
endscript

script ui_return_leaderboard 
	current_menu :gettags
	switch ($leaderboardsearchvalue)
		case 0
		search_title = qs(0x954c3f72)
		case 1
		search_title = qs(0x8dc9f66d)
		case 2
		search_title = qs(0xd2cabff7)
	endswitch
	<title_id> :se_setprops {
		leaderboard_type_text = <search_title>
	}
	ui_leaderboard_add_helper_text
endscript

script ui_destroy_leaderboard 
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol)) pitch = 0.0} time = 1}
	setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol)) pitch = 0.0} time = 1}
	clean_up_user_control_helpers
	destroyscreenelement \{id = leaderboardinterface}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script ui_leaderboard_add_helper_text 
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 10000
	add_user_control_helper text = qs(0xc018ff6d) button = yellow <all_button_params> z = 10000
	current_menu :getsingletag \{my_data}
	if gotparam \{my_data}
		add_user_control_helper text = qs(0x8dc9f66d) button = blue <all_button_params> z = 10000
	endif
	if isxenon
		add_user_control_helper text = qs(0x9a7d1fe5) button = start <all_button_params> z = 10000
	endif
endscript

script ui_leaderboard_show_gamercard 
	gettags
	if netsessionfunc func = isliveenabled params = {controller_index = <device_num>}
		signin_params = {network_platform_only}
		if isps3
			signin_params = {}
		endif
		if checkforsignin <signin_params> controller_index = <device_num>
			<live_enabled> = 1
		endif
	endif
	if NOT gotparam \{live_enabled}
		if (netsessionfunc func = is_cable_unplugged)
			cable_unplugged = 1
		endif
		generic_event_replace state = uistate_leaderboard_timeout data = {gamercard = 1 cable_unplugged = <cable_unplugged>}
		return
	endif
	if gotparam \{player_xuid}
		if NOT (<player_xuid> = 0)
			netsessionfunc func = showgamercard params = {player_xuid = <player_xuid> controller_index = <device_num>}
		endif
	endif
endscript

script ui_leaderboard_update_rows 
	printf \{qs(0x881635c5)}
	if NOT screenelementexists \{id = current_menu}
		scriptassert \{qs(0xdbce8e79)}
		return
	endif
	current_menu :getsingletag \{menu_items}
	current_menu :getsingletag \{my_data}
	current_menu :getsingletag \{friendlist}
	if gotparam \{leaderboard_data}
		current_menu :settags \{can_scroll_down = 1}
		<i> = 0
		getarraysize <leaderboard_data>
		leaderboard_data_size = <array_size>
		begin
		if (<leaderboard_data_size> <= 0)
			break
		endif
		current_id = (<menu_items> [<i>])
		getarraysize (<leaderboard_data> [<i>].data)
		<data_index> = (<array_size> - 1)
		if (($current_leaderboard_instrument) = band)
			data_index = 2
		endif
		cash_alpha = 0
		getarraysize \{cash_data}
		if NOT (<array_size> = 0)
			j = 0
			begin
			if (((<leaderboard_data> [<i>].player_xuid [0]) = (<cash_data> [<j>].player_xuid [0])) && ((<leaderboard_data> [<i>].player_xuid [1]) = (<cash_data> [<j>].player_xuid [1])))
				formattext textname = earnings '%e' e = (<cash_data> [<j>].data [2])
				stringtointeger \{earnings}
				cash_get_info_from_earnings earnings = <earnings>
				formattext textname = rank qs(0x6a2b4870) r = <rank>
				cash_alpha = 1
				break
			endif
			j = (<j> + 1)
			repeat <array_size>
		endif
		<current_id> :se_setprops {
			rank_text = (<leaderboard_data> [<i>].data [0])
			name_text = (<leaderboard_data> [<i>].data [1])
			data_text = (<leaderboard_data> [<i>].data [<data_index>])
			cash_alpha = <cash_alpha>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <rank>
		}
		if (($current_leaderboard_group = cash) || ($current_leaderboard_group = career))
			if <current_id> :desc_resolvealias name = alias_difficulty_container
				<resolved_id> :die
			endif
		endif
		if ($current_leaderboard_instrument = band)
			if <current_id> :desc_resolvealias name = alias_difficulty_container
				if getscreenelementchildren id = <resolved_id>
					getarraysize <children>
					j = 0
					begin
					removeparameter \{difficulty_icon}
					removeparameter \{difficulty_alpha}
					ui_leaderboard_get_difficulty_icon num = (<leaderboard_data> [<i>].data [(<j> + 3)])
					if NOT gotparam \{difficulty_icon}
						difficulty_icon = icon_difficulty_easy
					endif
					child_id = (<children> [<j>])
					<child_id> :se_setprops {
						texture = <difficulty_icon>
						alpha = <difficulty_alpha>
					}
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
		else
			if (<data_index> = 3)
				removeparameter \{difficulty_icon}
				removeparameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon num = (<leaderboard_data> [<i>].data [2])
				<current_id> :se_setprops {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
		endif
		if isxenon
			<current_id> :settags player_xuid = (<leaderboard_data> [<i>].player_xuid)
		endif
		bg_rgba = [30 , 30 , 30 , 255]
		if gotparam \{my_data}
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				bg_rgba = [30 , 30 , 30 , 255]
			endif
		endif
		entry_is_friend = false
		if isxenon
			if gotparam \{friendlist}
				getarraysize <friendlist>
				j = 0
				begin
				if ((<friendlist> [<j>].name) = (<leaderboard_data> [<i>].data [1]))
					bg_rgba = [30 , 30 , 30 , 255]
					entry_is_friend = true
					break
				endif
				j = (<j> + 1)
				repeat <array_size>
			endif
		endif
		entry_is_player = false
		if (gotparam my_data)
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				entry_is_player = true
			endif
		endif
		if (<entry_is_player> = true)
			leaderboard_highlight entry_type = player current_id = <current_id>
		elseif (<entry_is_friend> = true)
			leaderboard_highlight entry_type = friend current_id = <current_id>
		else
			leaderboard_highlight entry_type = none current_id = <current_id>
		endif
		<current_id> :se_setprops bg_rgba = <bg_rgba>
		<i> = (<i> + 1)
		repeat <leaderboard_data_size>
		if (<leaderboard_data_size> < 10)
			current_menu :settags \{can_scroll_down = 0}
			filler = (10 - <leaderboard_data_size>)
			begin
			current_id = (<menu_items> [<i>])
			<current_id> :se_setprops {
				rank_text = qs(0x03ac90f0)
				name_text = qs(0x03ac90f0)
				data_text = qs(0x03ac90f0)
				cash_alpha = 0
				highlight_player_alpha = 0.0
			}
			if ($current_leaderboard_instrument = band)
				if <current_id> :desc_resolvealias name = alias_difficulty_container
					if getscreenelementchildren id = <resolved_id>
						getarraysize <children>
						j = 0
						begin
						removeparameter \{difficulty_icon}
						removeparameter \{difficulty_alpha}
						ui_leaderboard_get_difficulty_icon \{num = qs(0x6160dbf3)}
						child_id = (<children> [<j>])
						<child_id> :se_setprops {
							texture = <difficulty_icon>
							alpha = <difficulty_alpha>
						}
						j = (<j> + 1)
						repeat <array_size>
					endif
				endif
			else
				removeparameter \{difficulty_icon}
				removeparameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon \{num = qs(0x6160dbf3)}
				<current_id> :se_setprops {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
			if isxenon
				<current_id> :settags player_xuid = 0
			endif
			<current_id> :se_setprops bg_rgba = [30 , 30 , 30 , 255]
			<i> = (<i> + 1)
			repeat <filler>
		endif
	else
		printf \{qs(0xa37d580e)}
	endif
	current_menu :getsingletag \{goto_bottom}
	if gotparam \{my_leaderboard}
		i = 0
		if gotparam \{my_data}
			begin
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				break
			endif
			i = (<i> + 1)
			repeat 10
		endif
		ui_event_wait event = menu_back data = {selected_index = (<i> + 2)}
	elseif (<goto_bottom> = 0)
		ui_event_wait \{event = menu_back
			data = {
				selected_index = 0
			}}
	else
		current_menu :settags \{goto_bottom = 0}
		ui_event_wait \{event = menu_back
			data = {
				selected_index = 11
			}}
	endif
	current_menu :se_setprops \{alpha = 1.0
		time = 0.1}
endscript

script ui_leaderboard_get_difficulty_icon \{num = qs(0x6160dbf3)}
	difficulty_icon = icon_difficulty_easy
	difficulty_alpha = 1
	if NOT (($current_leaderboard_instrument) = band)
		switch <num>
			case qs(0x6160dbf3)
			difficulty_icon = icon_difficulty_easy
			difficulty_alpha = 0
			case qs(0x787beab2)
			difficulty_icon = icon_difficulty_easy
			case qs(0x5356b971)
			difficulty_icon = icon_difficulty_medium
			case qs(0x4a4d8830)
			difficulty_icon = icon_difficulty_hard
			case qs(0x050c1ef7)
			difficulty_icon = icon_difficulty_expert
		endswitch
	else
		switch <num>
			case qs(0x6160dbf3)
			difficulty_icon = icon_difficulty_easy
			difficulty_alpha = 0
			case qs(0x787beab2)
			difficulty_icon = icon_difficulty_beginner
			case qs(0x5356b971)
			difficulty_icon = icon_difficulty_easy
			case qs(0x4a4d8830)
			difficulty_icon = icon_difficulty_medium
			case qs(0x050c1ef7)
			difficulty_icon = icon_difficulty_hard
			case qs(0x1c172fb6)
			difficulty_icon = icon_difficulty_expert
		endswitch
	endif
	return {difficulty_icon = <difficulty_icon> difficulty_alpha = <difficulty_alpha>}
endscript

script ui_leaderboard_get_instrument_icon 
	switch ($current_leaderboard_instrument)
		case guitar
		return \{instrument_icon = mixer_icon_guitar
			instrument_text = qs(0xeabf65f8)}
		case backup
		return \{instrument_icon = mixer_icon_bass
			instrument_text = qs(0xef9ff915)}
		case drums
		return \{instrument_icon = mixer_icon_drums
			instrument_text = qs(0x5121e5b2)}
		case mic
		return \{instrument_icon = mixer_icon_vox
			instrument_text = qs(0xa1f34e3c)}
	endswitch
endscript

script ui_leaderboard_get_headers 
	columns = [0]
	if ($current_leaderboard_group = song)
		<columns> = ($current_leaderboard_array [0].column_ids)
		<headers> = ($current_leaderboard_array [0].headers)
		get_song_title song = ($song_checksum)
		<title> = <song_title>
	else
		getarraysize ($current_leaderboard_array)
		array_entry = 0
		begin
		if ((($current_leaderboard_array) [<array_entry>].leaderboard_id) = ($current_leaderboard_id))
			<columns> = (($current_leaderboard_array) [<array_entry>].column_ids)
			<headers> = (($current_leaderboard_array) [<array_entry>].headers)
			<title> = (($current_leaderboard_array) [<array_entry>].title)
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
	return {columns = <columns> headers = <headers> title = <title>}
endscript

script ui_leaderboard_scroll 
	wait \{1
		gameframe}
	obj_getid
	setscreenelementlock id = <objid> lock
	setscreenelementlock id = <objid> unlock
	menu_getselectedindex
	getsingletag \{last_index}
	settags last_index = <selected_index>
	if NOT gotparam \{last_index}
		return
	endif
	if is_ui_event_running
		return
	endif
	if gotparam \{down}
		getsingletag \{can_scroll_down}
		if ((<can_scroll_down> = 1) && (<last_index> = <selected_index>))
			prev_offset = ($lb_offset)
			change lb_offset = ($lb_offset + 10)
			settags \{last_index = 2}
			generic_event_choose state = uistate_leaderboard_load data = {is_popup prev_offset = <prev_offset> offset}
		endif
		if (<last_index> != <selected_index>)
			generic_menu_up_or_down_sound \{params = {
					down
				}}
		endif
	else
		if (<last_index> = <selected_index>)
			prev_offset = ($lb_offset)
			if ($lb_offset <= 1)
				printf \{qs(0x84df137b)}
				return
			elseif ($lb_offset < 11)
				change \{lb_offset = 1}
			else
				change lb_offset = ($lb_offset - 10)
			endif
			settags \{last_index = 11
				goto_bottom = 1}
			generic_event_choose state = uistate_leaderboard_load data = {is_popup prev_offset = <prev_offset> offset}
		endif
		generic_menu_up_or_down_sound \{params = {
				up
			}}
	endif
endscript

script ui_leadeboard_get_friends 
	if screenelementexists \{id = current_menu}
		if gotparam \{friendlist}
			getarraysize <friendlist>
			if (<array_size> > 0)
				current_menu :settags friendlist = <friendlist>
			endif
		endif
	endif
endscript

script ui_leaderboard_view_current_song \{my_song = $current_song}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if screenelementexists \{id = my_breakdown_id}
		my_breakdown_id :se_setprops \{block_events}
	endif
	printf \{'ui_leaderboard_view_current_song'}
	if isxenon
		change lb_controller = <device_num>
	elseif isps3
		get_all_exclusive_devices
		if gotparam \{lb_controller}
			change lb_controller = <exclusive_device>
		else
			change lb_controller = <device_num>
		endif
	endif
	signin_params = {network_platform_only}
	if isps3
		signin_params = {}
	endif
	if NOT checkforsignin <signin_params> controller_index = <device_num>
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_leaderboard_timeout
			}}
		return
	endif
	lb_offset = 1
	change \{current_leaderboard_group = song}
	if isxenon
		change \{current_leaderboard_array = $master_leaderboard_song_list}
	else
		change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
	endif
	change song_checksum = <my_song>
	if ($current_num_players > 1 && $boss_battle != 1)
		<instrument> = 'band'
	else
		get_player_num_from_controller controller_index = <device_num>
		getplayerinfo <player_num> part
		if (<part> = vocals)
			instrument = 'mic'
		elseif (<part> = bass)
			instrument = 'backup'
		elseif (<part> = drum)
			instrument = 'drums'
		else
			<instrument> = ($part_list_props.<part>.text_nl)
		endif
	endif
	formattext checksumname = instrument_checksum '%i' i = <instrument>
	change current_leaderboard_instrument = <instrument_checksum>
	get_song_prefix song = ($song_checksum)
	formattext checksumname = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> addtostringlookup = true
	change current_leaderboard_id = <leaderboard_id>
	if isps3
		if netsessionfunc \{func = is_lobby_available}
			ui_leaderboard_view_current_song_continue
		else
			netsessionfunc \{func = onlinesignin
				params = {
					callback = ui_leaderboard_view_current_song_continue
				}}
		endif
	else
		ui_leaderboard_view_current_song_continue
	endif
endscript

script ui_leaderboard_view_current_song_continue 
	generic_event_choose \{state = uistate_leaderboard_load
		data = {
			my_status
		}}
endscript

script leaderboard_highlight \{entry_type = none}
	requireparams \{[
			current_id
		]
		all}
	if resolvescreenelementid id = [{id = <current_id>} {local_id = row_container} {local_id = menu}] param = line_menu
		if (<entry_type> = player)
			if NOT resolvescreenelementid id = [{id = <line_menu>} {local_id = data_container} {local_id = data}] param = score_data
				resolvescreenelementid id = [{id = <line_menu>} {local_id = data}] param = score_data
			endif
			if gotparam \{score_data}
				<score_data> :se_setprops shadow
			endif
			if NOT resolvescreenelementid id = [{id = <line_menu>} {local_id = gamertag} {local_id = name}] param = name_text
				resolvescreenelementid id = [{id = <line_menu>} {local_id = name}] param = name_text
			endif
			if gotparam \{name_text}
				<name_text> :se_setprops shadow
				<name_text> :se_setprops rgba = [146 7 10 255]
			endif
			if resolvescreenelementid id = [{id = <line_menu>} {local_id = gamertag} {local_id = rank_number} {local_id = cash_rank}] param = cash_rank
				<cash_rank> :se_setprops shadow
			endif
			<current_id> :se_setprops highlight_player_alpha = 0.6
		else
			if NOT resolvescreenelementid id = [{id = <line_menu>} {local_id = data_container} {local_id = data}] param = score_data
				resolvescreenelementid id = [{id = <line_menu>} {local_id = data}] param = score_data
			endif
			if gotparam \{score_data}
				<score_data> :se_setprops no_shadow
			endif
			if NOT resolvescreenelementid id = [{id = <line_menu>} {local_id = gamertag} {local_id = name}] param = name_text
				resolvescreenelementid id = [{id = <line_menu>} {local_id = name}] param = name_text
			endif
			if (<entry_type> = friend)
				if gotparam \{name_text}
					<name_text> :se_setprops shadow shadow_rgba = [230 230 230 255]
					<name_text> :se_setprops rgba = [146 7 10 255]
				endif
			else
				if gotparam \{name_text}
					<name_text> :se_setprops no_shadow
					<name_text> :se_setprops rgba = [0 0 0 255]
				endif
			endif
			if resolvescreenelementid id = [{id = <line_menu>} {local_id = gamertag} {local_id = rank_number} {local_id = cash_rank}] param = cash_rank
				<cash_rank> :se_setprops no_shadow
			endif
			<current_id> :se_setprops highlight_player_alpha = 0
		endif
	endif
endscript
