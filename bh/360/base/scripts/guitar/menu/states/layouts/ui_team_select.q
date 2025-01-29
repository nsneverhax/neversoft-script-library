g_team_0 = [
]
g_team_1 = [
]

script ui_init_team_select 
	if NOT InInternetMode
		team_select_asign_teams_local
		choose_random_band_names
	endif
endscript

script choose_random_band_names 
	<array> = ($random_band_names)
	<Band> = 1
	begin
	GetArraySize <array>
	if (<array_size> > 0)
		GetRandomValue a = 0 b = (<array_size> - 1) name = index integer
		SetBandInfo <Band> name = (<array> [<index>])
		SendStructure callback = net_set_band_name data_to_send = {Band = <Band> name = (<array> [<index>])}
		RemoveArrayElement array = <array> index = <index>
	endif
	<Band> = (<Band> + 1)
	repeat 8
endscript

script net_set_band_name 
	SetBandInfo <Band> name = <name>
endscript

script ui_create_team_select 
	team_select_prepare_players
	if InInternetMode
		spawn_player_drop_listeners \{drop_player_script = team_select_drop_player
			end_game_script = team_select_end_game}
	endif
	CreateScreenElement \{parent = root_window
		id = team_select_desc
		type = DescInterface
		desc = 'online_team_select'
		z_priority = 0.0
		Timer_text = qs(0x00000000)}
	if team_select_desc :Desc_ResolveAlias \{name = alias_online_team_select_masthead_01
			param = bkg_anim_id}
		<bkg_anim_id> :Obj_SpawnScript ui_blink
	else
		ScriptAssert \{'dschorn1'}
	endif
	if team_select_desc :Desc_ResolveAlias \{name = alias_online_team_select_masthead_02
			param = bkg_anim_02_id}
		<bkg_anim_02_id> :Obj_SpawnScript ui_blink
	else
		ScriptAssert \{'dschorn1'}
	endif
	if team_select_desc :Desc_ResolveAlias \{name = alias_vs_anim
			param = vs_amim_id}
		<vs_amim_id> :Obj_SpawnScript ui_scaleout
	else
		ScriptAssert \{'dschorn1'}
	endif
	if team_select_desc :Desc_ResolveAlias \{name = alias_vs_container
			param = vs_container_id}
		<vs_container_id> :Obj_SpawnScript ui_alphablink
	else
		ScriptAssert \{'dschorn1'}
	endif
	if (($g_leader_player_num) > 0)
		get_fullname_for_player player = ($g_leader_player_num)
		<name> = <fullname>
	else
		<name> = qs(0x00000000)
	endif
	if InNetGame
		GameMode_GetType
		if (($g_net_leader_player_num) > 0 && (($g_lobby_net_state) = net_private))
			GetPlayerInfo ($g_net_leader_player_num) GamerTag
			<name> = ($<GamerTag>)
		endif
	endif
	band_lobby_create_lobby_status_string
	GetBandInfo \{1
		name
		out = band1_name}
	GetBandInfo \{2
		name
		out = band2_name}
	team_select_desc :SE_SetProps {
		online_team_select_info_text = <text>
		title_text = ($band_lobby_strings.popup_title_teams)
		leader_gamertag_text = <name>
		left_band_name_text = ($<band1_name>)
		right_band_name_text = ($<band2_name>)
	}
	if team_select_desc :Desc_ResolveAlias \{name = alias_team_menu
			param = menu_id}
		popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
		players_nums_array = []
		event_handlers = []
		if InInternetMode
			if ($g_lobby_net_state = net_public)
				printf \{qs(0xb27c1cbc)}
				team_select_desc :Obj_SpawnScriptNow \{team_select_time_out_loop}
				AddArrayElement array = <event_handlers> element = {pad_back postgame_lobby_quit params = {id = current_menu}}
			else
				printf \{qs(0xec388fa6)}
				if IsHost
					AddArrayElement array = <event_handlers> element = {pad_back team_select_pad_back}
				else
					AddArrayElement array = <event_handlers> element = {pad_back postgame_lobby_quit params = {id = current_menu}}
				endif
			endif
			if IsHost
				<menu_id> :Obj_SpawnScriptNow team_select_swap_loop params = {team_0 = ($g_team_0) team_1 = ($g_team_1)}
				if ($g_lobby_net_state = net_private)
					AddArrayElement array = <array> element = {pad_start team_select_continue}
				endif
			endif
			<event_handlers> = <array>
			GetPlayerInfo ($g_leader_player_num) controller
			AddArrayElement array = <players_nums_array> element = ($g_leader_player_num)
			players_nums_array = <array>
		else
			<menu_id> :Obj_SpawnScriptNow team_select_swap_loop params = {team_0 = ($g_team_0) team_1 = ($g_team_1)}
			GetNumPlayersInGame \{local}
			if (<num_players> > 0)
				GetFirstPlayer \{local}
				begin
				GetPlayerInfo <player> controller
				AddArrayElement array = <players_nums_array> element = <player>
				players_nums_array = <array>
				GetNextPlayer player = <player> local
				repeat <num_players>
			endif
			AddArrayElement array = <event_handlers> element = {pad_back team_select_pad_back}
			AddArrayElement array = <array> element = {pad_start team_select_continue}
			event_handlers = <array>
		endif
		AddArrayElement array = <event_handlers> element = {pad_choose team_select_toggle_team_request params = {players = <players_nums_array>}}
		<menu_id> :SE_SetProps event_handlers = <array> exclusive_device = <devices>
		AssignAlias id = <menu_id> alias = current_menu
		if InNetGame
			add_gamertag_helper exclusive_device = ($primary_controller)
		endif
		add_user_control_helper text = ($band_lobby_strings.button_switch_team) button = green z = 100000
		add_user_control_helper text = ($band_lobby_strings.button_back) button = red z = 100000
		if InInternetMode
			if IsHost
				if (($g_leader_player_num = $g_net_leader_player_num) && ($g_lobby_net_state = net_private))
					add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
				endif
			endif
		else
			add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
		endif
	else
		ScriptAssert \{qs(0x40e717ff)}
	endif
endscript

script ui_destroy_team_select 
	if ScreenElementExists \{id = team_select_desc}
		DestroyScreenElement \{id = team_select_desc}
	endif
	clean_up_user_control_helpers
endscript

script ui_return_team_select 
	add_user_control_helper text = ($band_lobby_strings.button_switch_team) button = green z = 100000
	add_user_control_helper text = ($band_lobby_strings.button_back) button = red z = 100000
	if InInternetMode
		if (($g_leader_player_num = $g_net_leader_player_num) && ($g_lobby_net_state = net_private))
			add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
		endif
	else
		add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
	endif
endscript

script team_select_pad_back 
	if ($primary_controller = <device_num>)
		if InInternetMode
			if IsHost
				quit_online_now
			endif
		else
			generic_event_back \{state = UIstate_band_lobby_setup}
		endif
	endif
endscript

script popup_teams_ui_update 
	RequireParams \{[
			team_0
			team_1
		]
		all}
	if ScreenElementExists \{id = team_select_desc}
		rgba = GH51_blue_lt
		alias_name = alias_team_menu_l
		team_array = <team_0>
		<team> = 0
		begin
		if team_select_desc :Desc_ResolveAlias name = <alias_name> param = Menu
			if ScreenElementExists id = <Menu>
				DestroyScreenElement id = <Menu> preserve_parent
			endif
			GetArraySize <team_array>
			if (<array_size> > 0)
				GetPlayerInfo (<team_array> [0]) console_id
				i = 0
				begin
				if NOT PlayerInfoEquals (<team_array> [<i>]) console_id = <console_id>
					<id> :SE_SetProps dims = (300.0, 20.0)
				endif
				CreateScreenElement {
					parent = <Menu>
					type = DescInterface
					desc = 'online_team_select_player'
					autoSizeDims = true
				}
				GetPlayerInfo (<team_array> [<i>]) part
				GetPlayerInfo (<team_array> [<i>]) console_id
				get_fullname_for_player player = (<team_array> [<i>])
				<icon_texture> = icon_instrument_guitar_top
				switch <part>
					case guitar
					<icon_texture> = icon_instrument_guitar_top
					case bass
					<icon_texture> = icon_instrument_bass_top
					case Drum
					<icon_texture> = icon_instrument_drums_top
					case vocals
					<icon_texture> = icon_instrument_vox_top
				endswitch
				<rot_angle> = (<team> * -180)
				<id> :SE_SetProps {
					player_bg_rgba = <rgba>
					player_name_text = qs(0x00000000)
					icon_instrument_texture = <icon_texture>
					bg_container_rot_angle = <rot_angle>
				}
				<id> :SetTags player = (<team_array> [<i>])
				if (<alias_name> = alias_team_menu_l)
					<id> :Obj_SpawnScriptNow team_select_update_player_ui params = {slide_dir = left}
				else
					<id> :Obj_SpawnScriptNow team_select_update_player_ui params = {slide_dir = right}
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		<team> = (<team> + 1)
		rgba = GH51_red_lt
		alias_name = alias_team_menu_r
		team_array = <team_1>
		repeat 2
	endif
endscript

script team_select_update_player_ui 
	RequireParams \{[
			slide_dir
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x1ac7f5ca)}
	<position> = Normal
	<waited> = 0
	begin
	GetSingleTag \{player}
	GetPlayerInfo <player> band_request
	get_fullname_for_player player = <player>
	SE_SetProps player_name_text = <fullname>
	if (<band_request> > 0 && <position> = Normal)
		if (<slide_dir> = left)
			SE_SetProps \{player_info_pos = (-60.0, 0.0)
				bg_container_alpha = 1.0
				time = 0.25}
		else
			SE_SetProps \{player_info_pos = (60.0, 0.0)
				bg_container_alpha = 1.0
				time = 0.25}
		endif
		<position> = out
		printf qs(0x77676100) d = <slide_dir>
		switch_teams_sfx type = request direction = <slide_dir>
		SE_WaitProps
		<waited> = 1
	elseif (<position> = out && <band_request> = 0)
		SE_SetProps \{player_info_pos = (0.0, 0.0)
			bg_container_alpha = 0.0
			time = 0.25}
		<position> = Normal
		printf qs(0xc7c96084) d = <slide_dir>
		switch_teams_sfx type = resend direction = <slide_dir>
		SE_WaitProps
		<waited> = 1
	endif
	if (<waited> = 0)
		wait \{0.5
			seconds}
	else
		<waited> = 0
	endif
	repeat
endscript

script team_select_toggle_team_request 
	RequireParams \{[
			players
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xd66b237b)}
	player = -1
	GetArraySize \{players}
	if (<array_size> > 0)
		i = 0
		begin
		if PlayerInfoEquals (<players> [<i>]) controller = <device_num>
			player = (<players> [<i>])
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		return
	endif
	if (<player> > -1)
		printstruct <...>
		if PlayerInfoEquals <player> band_request = 0
			if InInternetMode
				GetNumPlayersInGame \{local}
				GetFirstPlayer \{local
					out = i}
				begin
				SetPlayerInfo <i> band_request = 1
				GetNextPlayer player = <i> local out = i
				repeat <num_players>
			else
				SetPlayerInfo <player> band_request = 1
			endif
		else
			if InInternetMode
				GetNumPlayersInGame \{local}
				GetFirstPlayer \{local
					out = i}
				begin
				SetPlayerInfo <i> band_request = 0
				GetNextPlayer player = <i> local out = i
				repeat <num_players>
			else
				SetPlayerInfo <player> band_request = 0
			endif
		endif
	endif
endscript

script team_select_swap_loop 
	RequireParams \{[
			team_0
			team_1
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x12c6e719)}
	begin
	if TeamSwapLoop team_0 = <team_0> team_1 = <team_1>
		GetArraySize \{new_team_0}
		if (<array_size> > 0)
			i_size = <array_size>
			i = 0
			begin
			GetArraySize \{team_1}
			if (<array_size> > 0)
				j_size = <array_size>
				j = 0
				begin
				if ((<team_1> [<j>]) = (<new_team_0> [<i>]))
					RemoveArrayElement array = <team_1> index = <j>
					team_1 = <array>
					break
				endif
				j = (<j> + 1)
				repeat <j_size>
			endif
			i = (<i> + 1)
			repeat <i_size>
		endif
		Change g_team_1 = (<new_team_1> + <team_1>)
		GetArraySize \{new_team_1}
		if (<array_size> > 0)
			i_size = <array_size>
			i = 0
			begin
			GetArraySize \{team_0}
			if (<array_size> > 0)
				j_size = <array_size>
				j = 0
				begin
				if ((<team_0> [<j>]) = (<new_team_1> [<i>]))
					RemoveArrayElement array = <team_0> index = <j>
					team_0 = <array>
					break
				endif
				j = (<j> + 1)
				repeat <j_size>
			endif
			i = (<i> + 1)
			repeat <i_size>
		endif
		Change g_team_0 = (<new_team_0> + <team_0>)
		<team_0> = ($g_team_0)
		<team_1> = ($g_team_1)
		wait \{0.2
			seconds}
		popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
		switch_teams_sfx \{type = swap}
		if InInternetMode
			PlayerNumObjIdChange player_nums = ($g_team_0)
			set0 = <objids>
			PlayerNumObjIdChange player_nums = ($g_team_1)
			set1 = <objids>
			SendStructure callback = team_select_update_players_callback data_to_send = {team_0_objids = <set0> team_1_objids = <set1>}
		endif
	endif
	wait \{1.0
		seconds}
	repeat
endscript

script team_select_update_players_callback 
	printf \{qs(0xa9f3e1b3)}
	PlayerNumObjIdChange objids = <team_0_objids>
	Change g_team_0 = <player_nums>
	PlayerNumObjIdChange objids = <team_1_objids>
	Change g_team_1 = <player_nums>
	wait \{0.2
		seconds}
	popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
endscript

script team_select_time_out_loop 
	printf \{qs(0x735f70ed)}
	i = ($band_lobby_wait_times.net_team_select)
	begin
	FormatText TextName = text qs(0x48c6d14c) d = <i>
	SE_SetProps Timer_text = <text>
	wait \{1
		second}
	i = (<i> - 1)
	repeat ($band_lobby_wait_times.net_team_select)
	team_select_change_focus \{focus_type = unfocus}
	SE_SetProps \{Timer_text = qs(0x6160dbf3)}
	if IsHost
		GetPlayerInfo ($g_net_leader_player_num) controller
		team_select_continue device_num = <controller>
	endif
endscript

script team_select_continue 
	printf \{channel = Band_Lobby
		qs(0xfc76f9d4)}
	if PlayerInfoEquals ($g_net_leader_player_num) controller = <device_num>
		if InInternetMode
			SendStructure \{callback = team_select_change_focus
				data_to_send = {
					focus_type = unfocus
				}}
		endif
		team_select_change_focus \{focus_type = unfocus}
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			SetPlayerInfo <player> band_request = 0
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
		if InInternetMode
			wait ($band_lobby_wait_times.net_team_to_songlist) seconds
			SendStructure \{callback = team_select_menu_change
				data_to_send = {
				}}
		else
			generic_menu_pad_choose_sound
		endif
		team_select_menu_change
	endif
endscript

script team_select_change_focus 
	RequireParams \{[
			focus_type
		]
		all}
	printf \{qs(0xb7f5e3b7)}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	ui_event_wait_for_safe
	if ScreenElementExists \{id = current_menu}
		LaunchEvent type = <focus_type> target = current_menu
	endif
endscript

script team_select_menu_change 
	printf \{qs(0x637bf57f)}
	ui_event_wait_for_safe
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	if InInternetMode
		team_select_reorder_teams
		UpdatePlayerNumObjIdMapper \{automatic}
		if IsHost
			UpdateTeamAppearances
		endif
	else
		match_team_player_parts
	endif
	UpdateBandsPlayerList
	ui_event_wait_for_safe
	ui_event \{event = menu_change
		data = {
			state = uistate_songlist
		}}
endscript

script team_select_asign_teams_local 
	team_0 = []
	team_1 = []
	GetNumPlayersInGame
	GetFirstPlayer \{out = i}
	begin
	if NOT is_player_on_a_team player = <i> team_0 = <team_0> team_1 = <team_1>
		AddArrayElement array = <team_0> element = <i>
		team_0 = <array>
		GetPlayerInfo <i> part
		GetFirstPlayer \{out = j}
		begin
		if NOT is_player_on_a_team player = <j> team_0 = <team_0> team_1 = <team_1>
			if PlayerInfoEquals <j> part = <part>
				AddArrayElement array = <team_1> element = <j>
				team_1 = <array>
				break
			endif
		endif
		GetNextPlayer player = <j> out = j
		repeat <num_players>
	endif
	GetNextPlayer player = <i> out = i
	repeat <num_players>
	Band = 1
	array = <team_0>
	begin
	GetArraySize <array>
	i = 0
	begin
	printf qs(0xfdc1ab1c) d = (<array> [<i>]) c = <Band>
	SetPlayerInfo (<array> [<i>]) Band = <Band>
	i = (<i> + 1)
	repeat <array_size>
	Band = 2
	array = <team_1>
	repeat 2
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	SetPlayerInfo <player> console_id = <player>
	GetNextPlayer player = <player>
	repeat <num_players>
endscript

script is_player_on_a_team 
	RequireParams \{[
			player
			team_0
			team_1
		]
		all}
	team_array = <team_0>
	found = 0
	begin
	GetArraySize \{team_array}
	if (<array_size> > 0)
		i = 0
		begin
		if (<player> = (<team_array> [<i>]))
			found = 1
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	team_array = <team_1>
	repeat 2
	if (<found> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script team_select_prepare_players 
	printf \{channel = Band_Lobby
		qs(0x2370fcc1)}
	team_0 = []
	team_1 = []
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		if PlayerInfoEquals <player> Band = 1
			AddArrayElement array = <team_0> element = <player>
			team_0 = <array>
		else
			AddArrayElement array = <team_1> element = <player>
			team_1 = <array>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	else
		ScriptAssert \{qs(0xff8a2642)}
	endif
	team = <team_0>
	<i> = 1
	begin
	GetArraySize <team>
	if (<array_size> > 0)
		if (<array_size> > 2)
			item_to_match_index = 0
			search_index = 1
			begin
			GetPlayerInfo (<team> [<item_to_match_index>]) console_id out = match_value
			GetPlayerInfo (<team> [<search_index>]) console_id out = search_value
			if (<match_value> = <search_value>)
				InsertArrayElement array = <team> element = (<team> [<search_index>]) index = (<item_to_match_index> + 1)
				RemoveArrayElement array = <array> index = (<search_index> + 1)
				team = <array>
				if ((<item_to_match_index> + 2) < <array_size>)
					item_to_match_index = (<item_to_match_index> + 1)
					search_index = (<item_to_match_index> + 1)
				else
					break
				endif
			else
				if ((<search_index> + 1) < <array_size>)
					search_index = (<search_index> + 1)
				else
					if ((<item_to_match_index> + 2) < <array_size>)
						item_to_match_index = (<item_to_match_index> + 1)
						search_index = (<item_to_match_index> + 1)
					else
						break
					endif
				endif
			endif
			repeat
		endif
	endif
	if (<i> = 1)
		Change g_team_0 = <team>
		team = <team_1>
		<i> = 2
	else
		Change g_team_1 = <team>
	endif
	repeat 2
endscript

script team_select_reorder_teams 
	printf \{qs(0x6bff9518)}
	GetMaxPlayers
	if (<max_players> > 0)
		i = 0
		begin
		PlayerInfoStore (<i> + 1) secondary
		i = (<i> + 1)
		repeat <max_players>
		team_select_dump_players
		GetFirstPlayer \{local}
		GetPlayerInfo <player> Band
		local_band = <Band>
		team_0 = []
		team_1 = []
		num_bass = [0 0]
		num_guitar = [0 0]
		GetNumPlayersInGame
		if (<num_players> > 0)
			<local_bands> = []
			<swap_teams> = 0
			GetNumPlayersInGame \{local
				out = num_local_players}
			GetFirstPlayer \{local}
			begin
			if PlayerInfoEquals <player> Band = <local_band>
				AddArrayElement array = <team_0> element = <player>
				team_0 = <array>
			else
				AddArrayElement array = <team_1> element = <player>
				team_1 = <array>
			endif
			GetPlayerInfo <player> Band
			if NOT ArrayContains array = <local_bands> contains = <Band>
				AddArrayElement array = <local_bands> element = <Band>
				<local_bands> = <array>
			endif
			RemoveParameter \{Band}
			GetNextPlayer local player = <player>
			repeat <num_local_players>
			GetArraySize \{team_0}
			<team_0_size> = <array_size>
			GetArraySize \{team_1}
			<team_1_size> = <array_size>
			if (<team_1_size> > <team_0_size>)
				<swap_teams> = 1
			endif
			GetNumPlayersInGame \{remote
				out = num_remote_players}
			GetFirstPlayer \{remote}
			begin
			if PlayerInfoEquals <player> Band = <local_band>
				AddArrayElement array = <team_0> element = <player>
				team_0 = <array>
			else
				AddArrayElement array = <team_1> element = <player>
				team_1 = <array>
			endif
			GetNextPlayer remote player = <player>
			repeat <num_remote_players>
			if (<swap_teams> = 1)
				<array> = <team_0>
				<team_0> = <team_1>
				<team_1> = <array>
			endif
			printstruct <...>
			GetArraySize \{team_0}
			i = 0
			begin
			restore_player = (<i> + 1)
			printf qs(0xb4b0b997) d = <restore_player> e = (<team_0> [<i>])
			PlayerInfoRestore player = <restore_player> restore_from = (<team_0> [<i>]) secondary
			FormatText checksumname = server_id 'player%i_server' i = <restore_player>
			SetPlayerInfo <restore_player> server_id = <server_id>
			team_select_dump_players
			GetPlayerInfo <restore_player> part
			if (<part> = bass)
				SetArrayElement arrayName = num_bass index = 0 newValue = (<num_bass> [0] + 1)
			elseif (<part> = guitar)
				SetArrayElement arrayName = num_guitar index = 0 newValue = (<num_guitar> [0] + 1)
			endif
			i = (<i> + 1)
			repeat <array_size>
			team_0_size = <array_size>
			printf qs(0x20f2b171) d = <team_0_size>
			GetArraySize \{team_1}
			i = 0
			begin
			restore_player = (<i> + <team_0_size> + 1)
			printf qs(0xb4b0b997) d = <restore_player> e = (<team_1> [<i>])
			PlayerInfoRestore player = <restore_player> restore_from = (<team_1> [<i>]) secondary
			FormatText checksumname = server_id 'player%i_server' i = <restore_player>
			SetPlayerInfo <restore_player> server_id = <server_id>
			if PlayerInfoEquals <restore_player> is_local_client = 0
				SetPlayerInfo <restore_player> is_onscreen = 0
			endif
			team_select_dump_players
			GetPlayerInfo <restore_player> part
			if (<part> = bass)
				SetArrayElement arrayName = num_bass index = 1 newValue = (<num_bass> [1] + 1)
			elseif (<part> = guitar)
				SetArrayElement arrayName = num_guitar index = 1 newValue = (<num_guitar> [1] + 1)
			endif
			i = (<i> + 1)
			repeat <array_size>
			GetNumPlayersInGame \{on_screen}
			if (<num_players_shown> < 4)
				GetNumPlayersInGame
				if (<num_players> = 4)
					GetFirstPlayer
					begin
					if (<player> <= 4)
						SetPlayerInfo <player> is_onscreen = 1
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				elseif (<num_players> > 0)
					GetFirstPlayer
					begin
					if (<player> <= 4)
						GetPlayerInfo <player> Band
						if ArrayContains array = <local_bands> contains = <Band>
							if PlayerInfoEquals <player> is_onscreen = 0
								if (<num_players_shown> < 4)
									<num_players_shown> = (<num_players_shown> + 1)
									SetPlayerInfo <player> is_onscreen = 1
								endif
							endif
						endif
						RemoveParameter \{Band}
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				endif
			endif
			<player> = 1
			begin
			FormatText checksumname = musician_value 'musician%p' p = <player>
			FormatText checksumname = hud_value 'player%p_hud' p = <player>
			SetPlayerInfo <player> band_member = <musician_value>
			SetPlayerInfo <player> hud_id = <hud_value>
			<player> = (<player> + 1)
			repeat 4
			if checksumequals a = ($competitive_rules) b = p8_pro_faceoff
				lock_player_parts
			elseif (<num_bass> [0] != <num_bass> [1] || <num_guitar> [0] != <num_guitar> [1])
				match_team_player_parts
			endif
		else
			ScriptAssert \{qs(0xff8a2642)}
		endif
	endif
endscript

script team_select_drop_player 
	printf \{qs(0x19f4d451)}
	if ScreenElementExists \{id = team_select_desc}
		<parent> = team_select_desc
	endif
	songlist_drop_player <...>
endscript

script team_select_end_game 
	killspawnedscript \{name = team_select_continue}
	killspawnedscript \{name = team_select_time_out_loop}
	killspawnedscript \{name = team_select_menu_change}
	songlist_end_game <...>
endscript

script team_select_dump_players 
	printf \{qs(0xde45cc90)}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> net_obj_id
		GetPlayerInfo <player> is_local_client
		GetPlayerInfo <player> Band
		printf qs(0xed5f0196) a = <player> b = <Band> c = <is_local_client> d = <net_obj_id>
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript
