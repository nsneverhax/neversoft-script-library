g_team_0 = [
]
g_team_1 = [
]

script ui_init_team_select 
	if NOT ininternetmode
		team_select_asign_teams_local
		choose_random_band_names
	endif
endscript

script choose_random_band_names 
	<array> = ($random_band_names)
	<band> = 1
	begin
	getarraysize <array>
	if (<array_size> > 0)
		getrandomvalue a = 0 b = (<array_size> - 1) name = index integer
		setbandinfo <band> name = (<array> [<index>])
		sendstructure callback = net_set_band_name data_to_send = {band = <band> name = (<array> [<index>])}
		removearrayelement array = <array> index = <index>
	endif
	<band> = (<band> + 1)
	repeat 8
endscript

script net_set_band_name 
	setbandinfo <band> name = <name>
endscript

script ui_create_team_select 
	team_select_prepare_players
	if ininternetmode
		spawn_player_drop_listeners \{drop_player_script = team_select_drop_player
			end_game_script = team_select_end_game}
	endif
	createscreenelement \{parent = root_window
		id = team_select_desc
		type = descinterface
		desc = 'online_team_select'
		z_priority = 0.0
		timer_text = qs(0x00000000)}
	if team_select_desc :desc_resolvealias \{name = alias_bkg_anim
			param = bkg_anim_id}
		<bkg_anim_id> :obj_spawnscript ui_shakey
		<bkg_anim_id> :obj_spawnscript ui_frazzmatazz_02
	else
		scriptassert \{'dschorn1'}
	endif
	if (($g_net_leader_player_num) > 0)
		getplayerinfo ($g_net_leader_player_num) gamertag
		<name> = ($<gamertag>)
	else
		<name> = qs(0x00000000)
	endif
	if innetgame
		gamemode_gettype
		if (($g_net_leader_player_num) > 0 && (<type> = career || (($g_lobby_net_state) = net_private)))
			team_select_desc :se_setprops \{net_leader_cont_alpha = 1.0}
			getplayerinfo ($g_net_leader_player_num) gamertag
			<name> = ($<gamertag>)
			team_select_desc :se_setprops leader_gamertag_text = <name>
		endif
	endif
	band_lobby_create_lobby_status_string
	getbandinfo \{1
		name
		out = band1_name}
	getbandinfo \{2
		name
		out = band2_name}
	team_select_desc :se_setprops {
		online_team_select_info_text = <text>
		title_text = ($band_lobby_strings.popup_title_teams)
		leader_gamertag_text = <name>
		left_band_name_text = ($<band1_name>)
		right_band_name_text = ($<band2_name>)
	}
	if team_select_desc :desc_resolvealias \{name = alias_team_menu
			param = menu_id}
		popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
		players_nums_array = []
		event_handlers = []
		if ininternetmode
			if ($g_lobby_net_state = net_public)
				team_select_desc :obj_spawnscriptnow \{team_select_time_out_loop}
				addarrayelement array = <event_handlers> element = {pad_back postgame_lobby_quit params = {id = current_menu}}
			else
				if ishost
					addarrayelement array = <event_handlers> element = {pad_back team_select_pad_back}
				else
					addarrayelement array = <event_handlers> element = {pad_back postgame_lobby_quit params = {id = current_menu}}
				endif
			endif
			if ishost
				<menu_id> :obj_spawnscriptnow team_select_swap_loop params = {team_0 = ($g_team_0) team_1 = ($g_team_1)}
				if ($g_lobby_net_state = net_private)
					addarrayelement array = <array> element = {pad_start team_select_continue}
				endif
			endif
			<event_handlers> = <array>
			getplayerinfo ($g_leader_player_num) controller
			addarrayelement array = <players_nums_array> element = ($g_leader_player_num)
			players_nums_array = <array>
		else
			<menu_id> :obj_spawnscriptnow team_select_swap_loop params = {team_0 = ($g_team_0) team_1 = ($g_team_1)}
			getnumplayersingame \{local}
			if (<num_players> > 0)
				getfirstplayer \{local}
				begin
				getplayerinfo <player> controller
				addarrayelement array = <players_nums_array> element = <player>
				players_nums_array = <array>
				getnextplayer player = <player> local
				repeat <num_players>
			endif
			addarrayelement array = <event_handlers> element = {pad_back team_select_pad_back}
			addarrayelement array = <array> element = {pad_start team_select_continue}
			event_handlers = <array>
		endif
		addarrayelement array = <event_handlers> element = {pad_choose team_select_toggle_team_request params = {players = <players_nums_array>}}
		<menu_id> :se_setprops event_handlers = <array> exclusive_device = <devices>
		assignalias id = <menu_id> alias = current_menu
		if innetgame
			add_gamertag_helper exclusive_device = ($primary_controller)
		endif
		add_user_control_helper text = ($band_lobby_strings.button_switch_team) button = green z = 100000
		add_user_control_helper text = ($band_lobby_strings.button_back) button = red z = 100000
		if ininternetmode
			if ishost
				if (($g_leader_player_num = $g_net_leader_player_num) && ($g_lobby_net_state = net_private))
					add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
				endif
			endif
		else
			add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
		endif
	else
		scriptassert \{qs(0x40e717ff)}
	endif
endscript

script ui_destroy_team_select 
	if screenelementexists \{id = team_select_desc}
		destroyscreenelement \{id = team_select_desc}
	endif
	clean_up_user_control_helpers
endscript

script ui_return_team_select 
	add_user_control_helper text = ($band_lobby_strings.button_switch_team) button = green z = 100000
	add_user_control_helper text = ($band_lobby_strings.button_back) button = red z = 100000
	if ininternetmode
		if (($g_leader_player_num = $g_net_leader_player_num) && ($g_lobby_net_state = net_private))
			add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
		endif
	else
		add_user_control_helper text = ($band_lobby_strings.button_play) button = start z = 100000
	endif
endscript

script team_select_pad_back 
	if ($primary_controller = <device_num>)
		if ininternetmode
			if ishost
				quit_online_now
			endif
		else
			generic_event_back \{state = uistate_band_lobby_setup}
		endif
	endif
endscript

script popup_teams_ui_update 
	requireparams \{[
			team_0
			team_1
		]
		all}
	if screenelementexists \{id = team_select_desc}
		rgba = p1_dk
		alias_name = alias_team_menu_l
		team_array = <team_0>
		<team> = 0
		begin
		if team_select_desc :desc_resolvealias name = <alias_name> param = menu
			if screenelementexists id = <menu>
				destroyscreenelement id = <menu> preserve_parent
			endif
			getarraysize <team_array>
			if (<array_size> > 0)
				getplayerinfo (<team_array> [0]) console_id
				i = 0
				begin
				if NOT playerinfoequals (<team_array> [<i>]) console_id = <console_id>
					<id> :se_setprops dims = (300.0, 20.0)
				endif
				createscreenelement {
					parent = <menu>
					type = descinterface
					desc = 'online_team_select_player'
					autosizedims = true
				}
				getplayerinfo (<team_array> [<i>]) part
				getplayerinfo (<team_array> [<i>]) console_id
				get_fullname_for_player player = (<team_array> [<i>])
				<icon_texture> = icon_instrument_guitar_top
				switch <part>
					case guitar
					<icon_texture> = icon_instrument_guitar_top
					case bass
					<icon_texture> = icon_instrument_bass_top
					case drum
					<icon_texture> = icon_instrument_drums_top
					case vocals
					<icon_texture> = icon_instrument_vox_top
				endswitch
				<rot_angle> = (<team> * -180)
				<id> :se_setprops {
					player_bg_rgba = <rgba>
					player_name_text = qs(0x00000000)
					icon_instrument_texture = <icon_texture>
					bg_container_rot_angle = <rot_angle>
				}
				<id> :settags player = (<team_array> [<i>])
				if (<alias_name> = alias_team_menu_l)
					<id> :obj_spawnscriptnow team_select_update_player_ui params = {slide_dir = left}
				else
					<id> :obj_spawnscriptnow team_select_update_player_ui params = {slide_dir = right}
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		<team> = (<team> + 1)
		rgba = p2_dk
		alias_name = alias_team_menu_r
		team_array = <team_1>
		repeat 2
	endif
endscript

script team_select_update_player_ui 
	requireparams \{[
			slide_dir
		]
		all}
	printf \{channel = band_lobby
		qs(0x1ac7f5ca)}
	<position> = normal
	<waited> = 0
	begin
	getsingletag \{player}
	getplayerinfo <player> band_request
	get_fullname_for_player player = <player>
	se_setprops player_name_text = <fullname>
	if (<band_request> > 0 && <position> = normal)
		if (<slide_dir> = left)
			se_setprops \{player_info_pos = (-60.0, 0.0)
				bg_container_alpha = 1.0
				time = 0.25}
		else
			se_setprops \{player_info_pos = (60.0, 0.0)
				bg_container_alpha = 1.0
				time = 0.25}
		endif
		<position> = out
		printf qs(0x77676100) d = <slide_dir>
		switch_teams_sfx type = request direction = <slide_dir>
		se_waitprops
		<waited> = 1
	elseif (<position> = out && <band_request> = 0)
		se_setprops \{player_info_pos = (0.0, 0.0)
			bg_container_alpha = 0.0
			time = 0.25}
		<position> = normal
		printf qs(0xc7c96084) d = <slide_dir>
		switch_teams_sfx type = resend direction = <slide_dir>
		se_waitprops
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
	requireparams \{[
			players
		]
		all}
	printf \{channel = band_lobby
		qs(0xd66b237b)}
	player = -1
	getarraysize \{players}
	if (<array_size> > 0)
		i = 0
		begin
		if playerinfoequals (<players> [<i>]) controller = <device_num>
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
		if playerinfoequals <player> band_request = 0
			if ininternetmode
				getnumplayersingame \{local}
				getfirstplayer \{local
					out = i}
				begin
				setplayerinfo <i> band_request = 1
				getnextplayer player = <i> local out = i
				repeat <num_players>
			else
				setplayerinfo <player> band_request = 1
			endif
		else
			if ininternetmode
				getnumplayersingame \{local}
				getfirstplayer \{local
					out = i}
				begin
				setplayerinfo <i> band_request = 0
				getnextplayer player = <i> local out = i
				repeat <num_players>
			else
				setplayerinfo <player> band_request = 0
			endif
		endif
	endif
endscript

script team_select_swap_loop 
	requireparams \{[
			team_0
			team_1
		]
		all}
	printf \{channel = band_lobby
		qs(0x12c6e719)}
	begin
	if teamswaploop team_0 = <team_0> team_1 = <team_1>
		getarraysize \{new_team_0}
		if (<array_size> > 0)
			i_size = <array_size>
			i = 0
			begin
			getarraysize \{team_1}
			if (<array_size> > 0)
				j_size = <array_size>
				j = 0
				begin
				if ((<team_1> [<j>]) = (<new_team_0> [<i>]))
					removearrayelement array = <team_1> index = <j>
					team_1 = <array>
					break
				endif
				j = (<j> + 1)
				repeat <j_size>
			endif
			i = (<i> + 1)
			repeat <i_size>
		endif
		change g_team_1 = (<new_team_1> + <team_1>)
		getarraysize \{new_team_1}
		if (<array_size> > 0)
			i_size = <array_size>
			i = 0
			begin
			getarraysize \{team_0}
			if (<array_size> > 0)
				j_size = <array_size>
				j = 0
				begin
				if ((<team_0> [<j>]) = (<new_team_1> [<i>]))
					removearrayelement array = <team_0> index = <j>
					team_0 = <array>
					break
				endif
				j = (<j> + 1)
				repeat <j_size>
			endif
			i = (<i> + 1)
			repeat <i_size>
		endif
		change g_team_0 = (<new_team_0> + <team_0>)
		<team_0> = ($g_team_0)
		<team_1> = ($g_team_1)
		wait \{0.2
			seconds}
		popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
		switch_teams_sfx \{type = swap}
		if ininternetmode
			playernumobjidchange player_nums = ($g_team_0)
			set0 = <objids>
			playernumobjidchange player_nums = ($g_team_1)
			set1 = <objids>
			sendstructure callback = team_select_update_players_callback data_to_send = {team_0_objids = <set0> team_1_objids = <set1>}
		endif
	endif
	wait \{1.0
		seconds}
	repeat
endscript

script team_select_update_players_callback 
	printf \{qs(0xa9f3e1b3)}
	playernumobjidchange objids = <team_0_objids>
	change g_team_0 = <player_nums>
	playernumobjidchange objids = <team_1_objids>
	change g_team_1 = <player_nums>
	wait \{0.2
		seconds}
	popup_teams_ui_update team_0 = ($g_team_0) team_1 = ($g_team_1)
endscript

script team_select_time_out_loop 
	printf \{qs(0x735f70ed)}
	i = ($band_lobby_wait_times.net_team_select)
	begin
	formattext textname = text qs(0x48c6d14c) d = <i>
	se_setprops timer_text = <text>
	wait \{1
		second}
	i = (<i> - 1)
	repeat ($band_lobby_wait_times.net_team_select)
	team_select_change_focus \{focus_type = unfocus}
	se_setprops \{timer_text = qs(0x6160dbf3)}
	if ishost
		getplayerinfo ($g_net_leader_player_num) controller
		team_select_continue device_num = <controller>
	endif
endscript

script team_select_continue 
	printf \{channel = band_lobby
		qs(0xfc76f9d4)}
	if playerinfoequals ($g_net_leader_player_num) controller = <device_num>
		if ininternetmode
			sendstructure \{callback = team_select_change_focus
				data_to_send = {
					focus_type = unfocus
				}}
		endif
		team_select_change_focus \{focus_type = unfocus}
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			setplayerinfo <player> band_request = 0
			getnextplayer player = <player>
			repeat <num_players>
		endif
		if ininternetmode
			wait ($band_lobby_wait_times.net_team_to_songlist) seconds
			sendstructure \{callback = team_select_menu_change
				data_to_send = {
				}}
		else
			generic_menu_pad_choose_sound
		endif
		team_select_menu_change
	endif
endscript

script team_select_change_focus 
	requireparams \{[
			focus_type
		]
		all}
	printf \{qs(0xb7f5e3b7)}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	ui_event_wait_for_safe
	if screenelementexists \{id = current_menu}
		launchevent type = <focus_type> target = current_menu
	endif
endscript

script team_select_menu_change 
	printf \{qs(0x637bf57f)}
	ui_event_wait_for_safe
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	if ininternetmode
		team_select_reorder_teams
		updateplayernumobjidmapper \{automatic}
		if ishost
			updateteamappearances
		endif
	else
		match_team_player_parts
	endif
	ui_event_wait_for_safe
	ui_event \{event = menu_change
		data = {
			state = uistate_songlist
		}}
endscript

script team_select_asign_teams_local 
	team_0 = []
	team_1 = []
	getnumplayersingame
	getfirstplayer \{out = i}
	begin
	if NOT is_player_on_a_team player = <i> team_0 = <team_0> team_1 = <team_1>
		addarrayelement array = <team_0> element = <i>
		team_0 = <array>
		getplayerinfo <i> part
		getfirstplayer \{out = j}
		begin
		if NOT is_player_on_a_team player = <j> team_0 = <team_0> team_1 = <team_1>
			if playerinfoequals <j> part = <part>
				addarrayelement array = <team_1> element = <j>
				team_1 = <array>
				break
			endif
		endif
		getnextplayer player = <j> out = j
		repeat <num_players>
	endif
	getnextplayer player = <i> out = i
	repeat <num_players>
	band = 1
	array = <team_0>
	begin
	getarraysize <array>
	i = 0
	begin
	printf qs(0xfdc1ab1c) d = (<array> [<i>]) c = <band>
	setplayerinfo (<array> [<i>]) band = <band>
	i = (<i> + 1)
	repeat <array_size>
	band = 2
	array = <team_1>
	repeat 2
	getnumplayersingame
	getfirstplayer
	begin
	setplayerinfo <player> console_id = <player>
	getnextplayer player = <player>
	repeat <num_players>
endscript

script is_player_on_a_team 
	requireparams \{[
			player
			team_0
			team_1
		]
		all}
	team_array = <team_0>
	found = 0
	begin
	getarraysize \{team_array}
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
	printf \{channel = band_lobby
		qs(0x2370fcc1)}
	team_0 = []
	team_1 = []
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> band = 1
			addarrayelement array = <team_0> element = <player>
			team_0 = <array>
		else
			addarrayelement array = <team_1> element = <player>
			team_1 = <array>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	else
		scriptassert \{qs(0xff8a2642)}
	endif
	team = <team_0>
	<i> = 1
	begin
	getarraysize <team>
	if (<array_size> > 0)
		if (<array_size> > 2)
			item_to_match_index = 0
			search_index = 1
			begin
			getplayerinfo (<team> [<item_to_match_index>]) console_id out = match_value
			getplayerinfo (<team> [<search_index>]) console_id out = search_value
			if (<match_value> = <search_value>)
				insertarrayelement array = <team> element = (<team> [<search_index>]) index = (<item_to_match_index> + 1)
				removearrayelement array = <array> index = (<search_index> + 1)
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
		change g_team_0 = <team>
		team = <team_1>
		<i> = 2
	else
		change g_team_1 = <team>
	endif
	repeat 2
endscript

script team_select_reorder_teams 
	printf \{qs(0x6bff9518)}
	getmaxplayers
	if (<max_players> > 0)
		i = 0
		begin
		playerinfostore (<i> + 1) secondary
		i = (<i> + 1)
		repeat <max_players>
		team_select_dump_players
		getfirstplayer \{local}
		getplayerinfo <player> band
		local_band = <band>
		team_0 = []
		team_1 = []
		num_bass = [0 0]
		num_guitar = [0 0]
		getnumplayersingame
		if (<num_players> > 0)
			<local_bands> = []
			<swap_teams> = 0
			getnumplayersingame \{local
				out = num_local_players}
			getfirstplayer \{local}
			begin
			if playerinfoequals <player> band = <local_band>
				addarrayelement array = <team_0> element = <player>
				team_0 = <array>
			else
				addarrayelement array = <team_1> element = <player>
				team_1 = <array>
			endif
			getplayerinfo <player> band
			if NOT arraycontains array = <local_bands> contains = <band>
				addarrayelement array = <local_bands> element = <band>
				<local_bands> = <array>
			endif
			removeparameter \{band}
			getnextplayer local player = <player>
			repeat <num_local_players>
			getarraysize \{team_0}
			<team_0_size> = <array_size>
			getarraysize \{team_1}
			<team_1_size> = <array_size>
			if (<team_1_size> > <team_0_size>)
				<swap_teams> = 1
			endif
			getnumplayersingame \{remote
				out = num_remote_players}
			getfirstplayer \{remote}
			begin
			if playerinfoequals <player> band = <local_band>
				addarrayelement array = <team_0> element = <player>
				team_0 = <array>
			else
				addarrayelement array = <team_1> element = <player>
				team_1 = <array>
			endif
			getnextplayer remote player = <player>
			repeat <num_remote_players>
			if (<swap_teams> = 1)
				<array> = <team_0>
				<team_0> = <team_1>
				<team_1> = <array>
			endif
			printstruct <...>
			getarraysize \{team_0}
			i = 0
			begin
			restore_player = (<i> + 1)
			printf qs(0xb4b0b997) d = <restore_player> e = (<team_0> [<i>])
			playerinforestore player = <restore_player> restore_from = (<team_0> [<i>]) secondary
			formattext checksumname = server_id 'player%i_server' i = <restore_player>
			setplayerinfo <restore_player> server_id = <server_id>
			team_select_dump_players
			getplayerinfo <restore_player> part
			if (<part> = bass)
				setarrayelement arrayname = num_bass index = 0 newvalue = (<num_bass> [0] + 1)
			elseif (<part> = guitar)
				setarrayelement arrayname = num_guitar index = 0 newvalue = (<num_guitar> [0] + 1)
			endif
			i = (<i> + 1)
			repeat <array_size>
			team_0_size = <array_size>
			printf qs(0x20f2b171) d = <team_0_size>
			getarraysize \{team_1}
			i = 0
			begin
			restore_player = (<i> + <team_0_size> + 1)
			printf qs(0xb4b0b997) d = <restore_player> e = (<team_1> [<i>])
			playerinforestore player = <restore_player> restore_from = (<team_1> [<i>]) secondary
			formattext checksumname = server_id 'player%i_server' i = <restore_player>
			setplayerinfo <restore_player> server_id = <server_id>
			if playerinfoequals <restore_player> is_local_client = 0
				setplayerinfo <restore_player> is_onscreen = 0
			endif
			team_select_dump_players
			getplayerinfo <restore_player> part
			if (<part> = bass)
				setarrayelement arrayname = num_bass index = 1 newvalue = (<num_bass> [1] + 1)
			elseif (<part> = guitar)
				setarrayelement arrayname = num_guitar index = 1 newvalue = (<num_guitar> [1] + 1)
			endif
			i = (<i> + 1)
			repeat <array_size>
			getnumplayersingame \{on_screen}
			if (<num_players_shown> < 4)
				getnumplayersingame
				if (<num_players> = 4)
					getfirstplayer
					begin
					if (<player> <= 4)
						setplayerinfo <player> is_onscreen = 1
					endif
					getnextplayer player = <player>
					repeat <num_players>
				elseif (<num_players> > 0)
					getfirstplayer
					begin
					if (<player> <= 4)
						getplayerinfo <player> band
						if arraycontains array = <local_bands> contains = <band>
							if playerinfoequals <player> is_onscreen = 0
								if (<num_players_shown> < 4)
									<num_players_shown> = (<num_players_shown> + 1)
									setplayerinfo <player> is_onscreen = 1
								endif
							endif
						endif
						removeparameter \{band}
					endif
					getnextplayer player = <player>
					repeat <num_players>
				endif
			endif
			<player> = 1
			begin
			formattext checksumname = musician_value 'musician%p' p = <player>
			formattext checksumname = hud_value 'player%p_hud' p = <player>
			setplayerinfo <player> band_member = <musician_value>
			setplayerinfo <player> hud_id = <hud_value>
			<player> = (<player> + 1)
			repeat 4
			if checksumequals a = ($competitive_rules) b = p8_pro_faceoff
				lock_player_parts
			elseif (<num_bass> [0] != <num_bass> [1] || <num_guitar> [0] != <num_guitar> [1])
				match_team_player_parts
			endif
		else
			scriptassert \{qs(0xff8a2642)}
		endif
	endif
endscript

script team_select_drop_player 
	printf \{qs(0x19f4d451)}
	if screenelementexists \{id = team_select_desc}
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> net_obj_id
		getplayerinfo <player> is_local_client
		getplayerinfo <player> band
		printf qs(0xed5f0196) a = <player> b = <band> c = <is_local_client> d = <net_obj_id>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript
