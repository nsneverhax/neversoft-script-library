
script ui_create_leaderboard 
	setsoundbussparams \{Crowd_Beds = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	setsoundbussparams \{Crowd_One_Shots = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	CreateScreenElement {
		parent = root_window
		id = leaderboardinterface
		Type = descinterface
		desc = 'leaderboard'
		exclusive_device = ($lb_controller)
		z_priority = -100
	}
	if leaderboardinterface :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
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
		getfriendslist \{0x2f9b6cff}
		ui_leadeboard_get_friends friendlist = <friendlist>
		current_menu :SetTags \{last_index = -1
			goto_bottom = 0
			can_scroll_down = 0}
		if GotParam \{my_data}
			current_menu :SetTags my_data = <my_data>
			if GotParam \{my_cash}
				current_menu :SetTags my_cash = <my_cash>
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
		CreateScreenElement \{parent = current_menu
			Type = descinterface
			desc = 'leaderboard_head'
			not_focusable
			autosizedims = FALSE
			dims = (0.0, 320.0)}
		switch ($LeaderboardSearchValue)
			case 0
			search_title = qs(0x954c3f72)
			case 1
			search_title = qs(0x8dc9f66d)
			case 2
			search_title = qs(0xd2cabff7)
		endswitch
		ui_leaderboard_get_instrument_icon
		header_desc = 'leaderboard_row_header'
		if (($current_leaderboard_group != career) && ($current_leaderboard_instrument = Band))
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
		current_menu :SetTags title_id = <id>
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = <header_desc>
			not_focusable
			autosizedims = FALSE
			dims = (0.0, 120.0)
		}
		<id> :se_setprops {
			rank_text = ($current_leaderboard_array [0].headers [0])
			name_text = ($current_leaderboard_array [0].headers [1])
			score_text = ($current_leaderboard_array [0].headers [2])
			icon_texture = <instrument_icon>
			not_focusable
		}
		current_menu :SetTags header_id = <id>
		if (($current_leaderboard_group = cash) || ($current_leaderboard_group = career))
			if <id> :desc_resolvealias Name = alias_difficulty_container
				<resolved_id> :Die
			endif
		endif
		item_desc = 'leaderboard_row'
		if (($current_leaderboard_group != career) && ($current_leaderboard_instrument = Band))
			item_desc = 'leaderboard_row_band'
		endif
		array = []
		i = 0
		begin
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = <item_desc>
			autosizedims = FALSE
			dims = (0.0, 75.0)
			event_handlers = [
				{focus ui_leaderboard_item_focus}
				{unfocus ui_leaderboard_item_unfocus}
			]
			tags = {index = <i>}
		}
		if isXenon
			<id> :se_setprops event_handlers = [{pad_start ui_leaderboard_show_gamercard}]
		endif
		<id> :obj_spawnscript highlight_motion params = {menu_id = <id>}
		AddArrayElement array = <array> element = <id>
		i = (<i> + 1)
		repeat 10
		current_menu :SetTags menu_items = <array>
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
	endif
	ui_leaderboard_add_helper_text
	if NOT GotParam \{keep_loading}
		destroy_loading_screen
	endif
endscript

script ui_leaderboard_item_focus \{time = 0.1}
	GetTags
	se_getprops
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendlist}
	bg_rgba = [30 , 30 , 30 , 255]
	if isXenon
		if GotParam \{friendlist}
			GetArraySize <friendlist>
			i = 0
			begin
			if ((<friendlist> [<i>].Name) = <name_text>)
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{my_data}
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
	Pos = ((0.0, 1.0) * ((<ratio> * 270) - 135))
	leaderboardinterface :se_setprops leaderboard_scrollthumb_pos = <Pos> time = <time>
endscript

script ui_leaderboard_item_unfocus 
	se_getprops
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendlist}
	bg_rgba = [30 , 30 , 30 , 150]
	if isXenon
		if GotParam \{friendlist}
			GetArraySize <friendlist>
			i = 0
			begin
			if ((<friendlist> [<i>].Name) = <name_text>)
				bg_rgba = [30 , 30 , 30 , 150]
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{my_data}
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
	current_menu :GetTags
	switch ($LeaderboardSearchValue)
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
	if 0x8658e568
		destroy_loading_screen
	endif
	ui_leaderboard_add_helper_text
endscript

script ui_destroy_leaderboard 
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol)) pitch = 0.0} time = 1}
	setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol)) pitch = 0.0} time = 1}
	clean_up_user_control_helpers
	DestroyScreenElement \{id = leaderboardinterface}
	SetButtonEventMappings \{unblock_menu_input}
	create_loading_screen
endscript

script ui_leaderboard_add_helper_text 
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100
	add_user_control_helper text = qs(0xc018ff6d) button = yellow <all_button_params> z = 100
	current_menu :GetSingleTag \{my_data}
	if GotParam \{my_data}
		add_user_control_helper text = qs(0x8dc9f66d) button = blue <all_button_params> z = 100
	endif
	if isXenon
		add_user_control_helper text = qs(0x9a7d1fe5) button = start <all_button_params> z = 100
	endif
endscript

script ui_leaderboard_show_gamercard 
	GetTags
	if NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
		if CheckForSignIn controller_index = <device_num>
			<live_enabled> = 1
		endif
	endif
	if NOT GotParam \{live_enabled}
		if (NetSessionFunc func = is_cable_unplugged)
			cable_unplugged = 1
		endif
		generic_event_replace state = uistate_leaderboard_timeout data = {gamercard = 1 cable_unplugged = <cable_unplugged>}
		return
	endif
	if GotParam \{player_xuid}
		if NOT (<player_xuid> = 0)
			NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid> controller_index = <device_num>}
		endif
	endif
endscript

script ui_leaderboard_update_rows 
	printf \{qs(0x881635c5)}
	if NOT ScreenElementExists \{id = current_menu}
		ScriptAssert \{qs(0xdbce8e79)}
		return
	endif
	current_menu :GetSingleTag \{menu_items}
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendlist}
	if GotParam \{leaderboard_data}
		current_menu :SetTags \{can_scroll_down = 1}
		<i> = 0
		GetArraySize <leaderboard_data>
		leaderboard_data_size = <array_Size>
		begin
		if (<leaderboard_data_size> <= 0)
			break
		endif
		current_id = (<menu_items> [<i>])
		GetArraySize (<leaderboard_data> [<i>].data)
		<data_index> = (<array_Size> - 1)
		cash_alpha = 0
		GetArraySize \{cash_data}
		if NOT (<array_Size> = 0)
			if ($current_leaderboard_group = cash)
				formatText TextName = earnings '%e' e = (<leaderboard_data> [<i>].data [<data_index>])
				stringtointeger \{earnings}
				cash_get_info_from_earnings earnings = <earnings>
				formatText TextName = rank qs(0x6a2b4870) r = <rank>
				cash_alpha = 1
			endif
		endif
		highlight_player_alpha = 0.0
		if GotParam \{my_data}
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				<highlight_player_alpha> = 0.6
			endif
		endif
		<current_id> :se_setprops {
			rank_text = (<leaderboard_data> [<i>].data [0])
			name_text = (<leaderboard_data> [<i>].data [1])
			data_text = (<leaderboard_data> [<i>].data [<data_index>])
			cash_alpha = <cash_alpha>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <rank>
			highlight_player_alpha = <highlight_player_alpha>
		}
		if (($current_leaderboard_group = cash) || ($current_leaderboard_group = career))
			if <current_id> :desc_resolvealias Name = alias_difficulty_container
				<resolved_id> :Die
			endif
		endif
		if ($current_leaderboard_instrument = Band)
		else
			if NOT (($current_leaderboard_instrument) = Band)
				RemoveParameter \{difficulty_icon}
				RemoveParameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon num = (<leaderboard_data> [<i>].data [2])
				<current_id> :se_setprops {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
		endif
		if isXenon
			<current_id> :SetTags player_xuid = (<leaderboard_data> [<i>].player_xuid)
		endif
		bg_rgba = [30 , 30 , 30 , 255]
		if GotParam \{my_data}
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				bg_rgba = [30 , 30 , 30 , 255]
			endif
		endif
		if isXenon
			if GotParam \{friendlist}
				GetArraySize <friendlist>
				j = 0
				begin
				if ((<friendlist> [<j>].Name) = (<leaderboard_data> [<i>].data [1]))
					bg_rgba = [30 , 30 , 30 , 255]
					break
				endif
				j = (<j> + 1)
				repeat <array_Size>
			endif
		endif
		<current_id> :se_setprops bg_rgba = <bg_rgba>
		<i> = (<i> + 1)
		repeat <leaderboard_data_size>
		if (<leaderboard_data_size> < 10)
			current_menu :SetTags \{can_scroll_down = 0}
			filler = (10 - <leaderboard_data_size>)
			begin
			current_id = (<menu_items> [<i>])
			<current_id> :se_setprops {
				rank_text = qs(0x03ac90f0)
				name_text = qs(0x03ac90f0)
				data_text = qs(0x03ac90f0)
				cash_alpha = 0
			}
			if ($current_leaderboard_instrument = Band)
			else
				RemoveParameter \{difficulty_icon}
				RemoveParameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon \{num = qs(0x6160dbf3)}
				<current_id> :se_setprops {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
			if isXenon
				<current_id> :SetTags player_xuid = 0
			endif
			<current_id> :se_setprops bg_rgba = [30 , 30 , 30 , 255]
			<i> = (<i> + 1)
			repeat <filler>
		endif
	else
		printf \{qs(0xa37d580e)}
	endif
	current_menu :GetSingleTag \{goto_bottom}
	if GotParam \{my_leaderboard}
		i = 0
		if GotParam \{my_data}
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
		current_menu :SetTags \{goto_bottom = 0}
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
	if NOT (($current_leaderboard_instrument) = Band)
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
		GetArraySize ($current_leaderboard_array)
		array_entry = 0
		begin
		if ((($current_leaderboard_array) [<array_entry>].leaderboard_id) = ($current_leaderboard_id))
			<columns> = (($current_leaderboard_array) [<array_entry>].column_ids)
			<headers> = (($current_leaderboard_array) [<array_entry>].headers)
			<title> = (($current_leaderboard_array) [<array_entry>].title)
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
	return {columns = <columns> headers = <headers> title = <title>}
endscript

script ui_leaderboard_scroll 
	Wait \{1
		gameframe}
	Obj_GetID
	SetScreenElementLock id = <objID> lock
	SetScreenElementLock id = <objID> unlock
	menu_getselectedindex
	GetSingleTag \{last_index}
	SetTags last_index = <selected_index>
	if NOT GotParam \{last_index}
		return
	endif
	if is_ui_event_running
		return
	endif
	if GotParam \{down}
		GetSingleTag \{can_scroll_down}
		if ((<can_scroll_down> = 1) && (<last_index> = <selected_index>))
			prev_offset = ($lb_offset)
			Change lb_offset = ($lb_offset + 10)
			SetTags \{last_index = 2}
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
				Change \{lb_offset = 1}
			else
				Change lb_offset = ($lb_offset - 10)
			endif
			SetTags \{last_index = 11
				goto_bottom = 1}
			generic_event_choose state = uistate_leaderboard_load data = {is_popup prev_offset = <prev_offset> offset}
		endif
		generic_menu_up_or_down_sound \{params = {
				up
			}}
	endif
endscript

script ui_leadeboard_get_friends 
	if ScreenElementExists \{id = current_menu}
		if GotParam \{friendlist}
			GetArraySize <friendlist>
			if (<array_Size> > 0)
				current_menu :SetTags friendlist = <friendlist>
			endif
		endif
	endif
endscript

script ui_leaderboard_view_current_song \{my_song = $current_song}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = my_breakdown_id}
		my_breakdown_id :se_setprops \{block_events}
	endif
	printf \{'ui_leaderboard_view_current_song'}
	if isXenon
		Change lb_controller = <device_num>
	elseif isps3
		get_all_exclusive_devices
		if GotParam \{lb_controller}
			Change lb_controller = <exclusive_device>
		else
			Change lb_controller = <device_num>
		endif
	endif
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	if NOT IsLoggedIn \{0x5f495f02}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_leaderboard_timeout
			}}
		return
	endif
	lb_offset = 1
	Change \{current_leaderboard_group = song}
	if isXenon
		Change \{current_leaderboard_array = $master_leaderboard_song_list}
	else
		Change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
	endif
	Change song_checksum = <my_song>
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
	formatText checksumName = instrument_checksum '%i' i = <instrument>
	Change current_leaderboard_instrument = <instrument_checksum>
	get_song_prefix song = ($song_checksum)
	formatText checksumName = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> AddToStringLookup = true
	Change current_leaderboard_id = <leaderboard_id>
	if isps3
		if NetSessionFunc \{func = is_lobby_available}
			ui_leaderboard_view_current_song_continue
		else
			NetSessionFunc \{func = OnlineSignIn
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
