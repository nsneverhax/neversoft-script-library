0xbc850019 = 0

script 0xc3120e50 
	Change 0xbc850019 = ($0xbc850019 + 1)
endscript

script 0xf7bab4b0 
	Change 0xbc850019 = ($0xbc850019 - 1)
endscript

script 0xc396230c 
	RequireParams \{[
			state
		]
		all}
	0xc3120e50
	SpawnScriptNow 0xf974d129 params = {state = <state>}
endscript

script 0xf974d129 
	RequireParams \{[
			state
		]
		all}
	setscriptcannotpause
	OnExitRun \{0xf7bab4b0}
	begin
	if ui_event_exists_in_stack Name = <state>
		break
	endif
	WaitOneGameFrame
	repeat
endscript
invite_index = -1
num_players_info = [
	{
		Name = qs(0xe39e174e)
		checksum = num_2
		num = 2
	}
	{
		Name = qs(0x0ccca1af)
		checksum = num_3
		num = 3
	}
	{
		Name = qs(0xede2abcb)
		checksum = num_4
		num = 4
	}
	{
		Name = qs(0xe836c048)
		checksum = num_6
		num = 6
	}
	{
		Name = qs(0xf11bd2c1)
		checksum = num_8
		num = 8
	}
]
num_private_slots = [
	{
		Name = qs(0xe64a7ccd)
		checksum = num_0
		num = 0
	}
	{
		Name = qs(0x0918ca2c)
		checksum = num_1
		num = 1
	}
]
ranked_info = [
	{
		Name = qs(0x3489402d)
		checksum = Player
		num = 1
	}
	{
		Name = qs(0xd6e06d82)
		checksum = Ranked
		num = 0
	}
]
join_in_progress_info = [
	{
		Name = qs(0xefa31a4a)
		num = 0
		checksum = no
	}
	{
		Name = qs(0xe5fd67fa)
		num = 1
		checksum = yes
	}
]
FilterTypes = {
	diff = {
		values = [
			qs(0x9a8b4e86)
			qs(0x8d657387)
			qs(0x6ef11a01)
			qs(0x51b06d2f)
			qs(0x334908ac)
		]
		checksum = [
			dont_care
			easy
			medium
			hard
			expert
		]
	}
	mode = {
		values = [
			qs(0x9a8b4e86)
			qs(0x0952b48b)
			qs(0x46577877)
			qs(0x33b59779)
			qs(0x5bbbf8bc)
		]
		checksum = [
			dont_care
			p2_faceoff
			p2_pro_faceoff
			p2_battle
			p2_coop
		]
	}
	Type = {
		values = [
			qs(0xd6268827)
			qs(0x444599e3)
		]
		checksum = [
			Player
			Ranked
		]
	}
	num_songs = {
		values = [
			qs(0x9a8b4e86)
			qs(0x22ee76e7)
			qs(0x1985c05b)
			qs(0x4fdf67dd)
			qs(0x7de9055f)
		]
		checksum = [
			dont_care
			num_1
			num_3
			num_5
			num_7
		]
	}
	tie = {
		values = [
			qs(0x9a8b4e86)
			qs(0x99c4796b)
			qs(0x8b0a4ef9)
			qs(0x0b6c701b)
		]
		checksum = [
			dont_care
			HOST
			CLIENT
			song_rand
		]
	}
	search = {
		values = [
			qs(0x9f61d184)
			qs(0x8dc9f66d)
			qs(0xd2cabff7)
		]
	}
	song_type = {
		values = [
			qs(0xab226a7d)
			qs(0xdc5d0ed4)
		]
	}
	vport = {
		values = [
			qs(0xdb64e332)
			qs(0xdfe62bc8)
		]
	}
	lb_diff = {
		values = [
			qs(0x8d657387)
			qs(0x6ef11a01)
			qs(0x51b06d2f)
			qs(0x334908ac)
		]
	}
	Ranked = {
		values = [
			qs(0x58e0a1fb)
			qs(0xd2915c27)
		]
		checksum = [
			Ranked
			notranked
		]
	}
}
Leaderboard_Difficulty_Lookup_Table = {
	easy = 'easy'
	medium = 'medium'
	hard = 'hard'
	expert = 'expert'
}
controller_lookup_table = {
	controller = 'Vocal'
	guitar = 'Guitar'
	drum = 'Drum'
	bass = 'Bass'
	vocals = 'Vocal'
}
online_light_purple = [
	190
	180
	205
	250
]
online_dark_purple = [
	70
	40
	70
	250
]
online_light_blue = [
	180
	230
	250
	250
]
online_medium_blue = [
	35
	130
	175
	250
]
online_dark_blue = [
	0
	70
	100
	250
]
online_score_bars = [
	60
	50
	70
	128
]
online_trans_grey = [
	0
	0
	0
	200
]
online_grey = [
	75
	75
	75
	250
]
online_light_grey = [
	75
	75
	75
	150
]
online_red = [
	255
	0
	0
	255
]
online_yellow = [
	210
	210
	0
	255
]
online_orange = [
	255
	165
	0
	255
]
online_green = [
	0
	150
	0
	255
]
online_general_menu_pos = (640.0, 75.0)
online_general_menu_hi_lite_ypos = [
	0.0
	0.0
	0.0
	0.0
]
net_new_matchmaking_ui_flag = 0
net_permision_to_select_song = 0
net_can_send_approval = 1
net_safe_to_enter_net_play = 1
net_pause = 0
net_num_players_data_ack = 0
net_num_players_data_needed = 0
net_dropped_players_flag = 0
recovered_dropped_players = 0
player1_song_selections = [
	NULL
	NULL
	NULL
]
player2_song_selections = [
	NULL
	NULL
	NULL
]
tie_breaker_song = bullsonparade
match_type = Player
private_match = public
net_grouping = Band
online_song_count = 0
player2_present = 0
player1_max_song_selections = 0
player1_current_song_selections = 0
player2_max_song_selections = 0
player2_current_song_selections = 0
player1_selected_guitar = Instrument_Les_Paul_Black
player1_selected_bass = Instrument_LP_VBRST
player2_selected_guitar = Instrument_Les_Paul_Black
player2_selected_bass = Instrument_LP_VBRST
retrieved_message_of_the_day = 0
message_of_the_day = qs(0x00000000)
online_song_choice_id = 0
agora_failed_attempts = 0
0x41d5263e = 0x5a77a279
ranked_match = notranked
OptionsGameModeValue = 0
OptionsDifficultyValue = 0
OptionsNumSongsValue = 0
OptionsTieBreakerValue = 0
OptionsHighwayValue = 0
LeaderboardSearchValue = 0
LeaderboardSongTypeValue = 0
LeaderboardDiffValue = 3
CopyOfGlobal = 0
SearchMatchTypeValue = 0
SearchGameModeValue = 0
SearchDifficultyValue = 0
SearchNumSongsValue = 0
SearchTieBreakerValue = 0
TempGameModeValue = 0
TempDifficultyValue = 0
TempNumSongsValue = 0
TempTieBreakerValue = 0
TempHighwayValue = 0
ps3_invite_postion = (255.0, 96.0)
net_game_type_info = [
	{
		Name = qs(0x46577877)
		description = qs(0xb96bc46d)
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff
	}
	{
		Name = qs(0x0952b48b)
		description = qs(0xb5b1d856)
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = p2_faceoff
	}
	{
		Name = qs(0x98fa7ed6)
		description = qs(0x2d3d2fa9)
		checksum = p4_quickplay
		func = is_gamemode_visible
		search_chk = p4_quickplay
	}
	{
		Name = qs(0x148d4f57)
		description = qs(0x2d3d2fa9)
		checksum = p2_quickplay
		func = is_gamemode_visible
		search_chk = p2_coop
	}
	{
		Name = qs(0x67d8da9b)
		description = qs(0xb96bc46d)
		checksum = p4_pro_faceoff
		func = is_gamemode_visible
		search_chk = p4_pro_faceoff
	}
	{
		Name = qs(0xbae36279)
		description = qs(0x323709dd)
		checksum = p8_pro_faceoff
		func = is_gamemode_visible
		search_chk = p8_pro_faceoff
	}
	{
		Name = qs(0x33b59779)
		description = qs(0x82ab3ffb)
		checksum = p2_battle
		func = is_gamemode_visible
		search_chk = p2_battle
	}
	{
		Name = qs(0x46577877)
		description = qs(0xb96bc46d)
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff_bass
	}
	{
		Name = qs(0x0952b48b)
		description = qs(0x62c7ead3)
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = p2_faceoff_bass
	}
	{
		Name = qs(0x46577877)
		description = qs(0xb96bc46d)
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff_drums
	}
	{
		Name = qs(0x0952b48b)
		description = qs(0x04bdd449)
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = mode_extra_1
	}
	{
		Name = qs(0xdf90fff4)
		description = qs(0x655c34df)
		checksum = p4_career
		func = is_gamemode_visible
		search_chk = p4_career
	}
]
beta_net_game_type_info = [
	{
		Name = qs(0x899a96c8)
		description = qs(0xb96bc46d)
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
	}
	{
		Name = qs(0x425b9950)
		description = qs(0xb96bc46d)
		checksum = p4_pro_faceoff
		func = is_gamemode_visible
	}
]
net_guitar_part_info = [
	{
		Name = qs(0x0cc7d9b2)
		checksum = guitar
	}
	{
		Name = qs(0x7d4f9214)
		checksum = bass
	}
]
xenon_invite_confirm_title = qs(0xf3c9603f)
xenon_invite_confirm_dialog = qs(0xb202cc8b)
xenon_invite_confirm_yes = qs(0x58e0a1fb)
xenon_invite_confirm_no = qs(0xd2915c27)
xenon_session_confirm_title = qs(0xe121c6a6)
xenon_session_confirm_dialog = qs(0xa4094f8c)
xenon_session_confirm_yes = qs(0x58e0a1fb)
xenon_session_confirm_no = qs(0xd2915c27)
xenon_invite_confirm_inactive_title = qs(0x277d1c55)
xenon_invite_confirm_inactive_dialog = qs(0x84c7ac32)
xenon_invite_confirm_inactive_ok = qs(0x0e41fe46)
xenon_session_confirm_inactive_title = qs(0xe121c6a6)
xenon_session_confirm_inactive_dialog = qs(0x7929b0a3)
xenon_session_confirm_inactive_ok = qs(0x0e41fe46)
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
new_net_logic = 0
net_autolaunch_role = None
net_popup_active = 0

script net_autolaunch_spawned 
	mode = ($game_mode)
	ui_event_block \{event = menu_change
		data = {
			state = uistate_mainmenu
			base_name = 'mainmenu'
			selected_index = 3
			clear_previous_stack
		}}
	Change game_mode = <mode>
	netoptions :pref_choose Name = game_modes checksum = ($game_mode)
	main_menu_select_online
	Block \{Type = online_menu_created}
	start_matchmaking device_num = ($primary_controller)
endscript

script al_refresh 
	ui_event \{event = menu_replace
		data = {
			state = uistate_net_debug_lobby
			mode = CLIENT
		}}
	al_get_server_list
endscript

script al_get_server_list 
	printf \{qs(0x6c672f1c)}
	al_get_preferences
	get_server_list \{callback = autolaunch_add_server
		callback_complete = autoloaunch_results_stop}
endscript

script get_server_list \{callback = empty_script
		callback_complete = empty_script}
	Change \{xboxlive_num_results = 0}
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	net_dummy_get_needed_search_params
	NetSessionFunc Obj = match func = set_search_params params = <...>
	NetSessionFunc \{Obj = match
		func = set_server_list_mode
		params = {
			optimatch
		}}
	NetSessionFunc {
		Obj = match
		func = start_server_list
		params = {
			callback = <callback>
			callback_complete = <callback_complete>
		}
	}
endscript

script al_get_preferences 
	return {
		difficulty = ($net_autolaunch_parms.difficulty)
		gamemode = ($net_autolaunch_parms.gamemode)
		num_songs = ($net_autolaunch_parms.num_songs)
	}
endscript

script autolaunch_add_server 
	printf \{qs(0x1cb462bf)}
	Change xboxlive_num_results = (($xboxlive_num_results) + 1)
	add_menu_item text = <server_name> pad_choose_script = net_al_choose_server pad_choose_params = {server_name = <server_name> server_id = <server_id>}
endscript

script autolaunch_results_stop 
	if GotParam \{xboxlive_num_results}
		Change xboxlive_num_results = <xboxlive_num_results>
	endif
	printf qs(0xef0ddf26) d = ($xboxlive_num_results)
endscript

script net_al_choose_server 
	printf qs(0x4c82f9cb) s = <server_name> d = <server_id>
	NetSessionFunc Obj = match func = choose_server params = {id = <server_id>}
	ui_event event = menu_change data = {state = uistate_net_debug_lobby_join server_name = <server_name>}
endscript

script setup_and_post_game 
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	<rand> = 0
	GetRandomValue \{Name = rand
		integer
		a = 0
		b = 1}
	get_number_of_songs
	if ((<rand> = 0) || ($game_mode = p2_coop) || (<num_songs> = 1))
		Change \{tie_breaker = HOST}
	else
		Change \{tie_breaker = CLIENT}
	endif
	if IsHost
		ResetHubStates
	endif
	post_network_game controller = <device_num>
endscript

script quit_network_game 
	printf \{qs(0xffb8716a)}
	LeaveServer
	RemoveTimeSyncTask
	clear_wait_for_net_match_available_items
	NetSessionFunc \{Obj = session
		func = unpost_game}
	EndGameNetScriptPump
	Change \{battle_do_or_die = 0}
	Change \{battle_do_or_die_speed_scale = 1.0}
	Change \{battle_do_or_die_attack_scale = 1.0}
	if ($game_mode = p2_battle)
		Change \{save_current_powerups_p1 = [
				0
				0
				0
			]}
		Change \{save_current_powerups_p2 = [
				0
				0
				0
			]}
		Change \{structurename = player1_status
			save_num_powerups = 0}
		Change \{structurename = player2_status
			save_num_powerups = 0}
		Change \{structurename = player1_status
			save_health = 0.0}
		Change \{structurename = player2_status
			save_health = 0.0}
	endif
	netoptions :pref_choose \{Name = private_slots
		value = 0}
	netoptions :pref_choose \{Name = Ranked
		checksum = Player}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{g_tie_breaker_song = 0}
	Change \{net_can_send_approval = 1}
	reset_setlist
	reset_net_stats_menu
	Change \{net_song_num = 0}
	if (isngc)
		0xf643c6a5
	endif
endscript

script net_clear_player_status 
	RequireParams \{[
			player_index
		]}
	printf qs(0x7500e57a) d = <player_index>
	setplayerinfo <player_index> is_local_client = 1
	setplayerinfo <player_index> net_id_first = 0
	setplayerinfo <player_index> net_id_second = 0
	setplayerinfo <player_index> net_obj_id = -1
	setplayerinfo <player_index> team = 0
	formatText checksumName = gamertag 'gamertag_%d' d = (<player_index> - 1)
	Change GlobalName = <gamertag> NewValue = qs(0x00000000)
	controller = (<player_index> -1)
	if (<controller> > 3)
		controller = 3
	endif
	setplayerinfo <player_index> controller = <controller>
endscript

script net_clear_all_remote_player_status 
	Player = 1
	begin
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		net_clear_player_status player_index = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat 8
endscript

script shut_down_net_play 
	Change \{is_network_game = 0}
	Change \{new_net_logic = 0}
	SetNetworkMode
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{func = voice_uninit}
	NetSessionFunc \{func = stats_uninit}
	destroy_gamertags
	destroy_net_popup
	cleanup_sessionfuncs
	setup_sessionfuncs
	net_clear_all_remote_player_status
	Change \{structurename = player1_status
		highway_layout = default_highway}
	Change \{structurename = player2_status
		highway_layout = default_highway}
	destroy_player_drop_events
endscript

script select_quit_network_game 
	if ScreenElementExists \{id = yourock_text}
		DestroyScreenElement \{id = yourock_text}
	endif
	if ScreenElementExists \{id = yourock_text_2}
		DestroyScreenElement \{id = yourock_text_2}
	endif
	if ($net_popup_active = 0)
		gamemode_gettype
		if (<Type> = career)
			if ($special_event_stage != 0)
				reset_current_special_event_percentages
			endif
		endif
		if GotParam \{from_fail_menu}
			generic_event_choose state = uistate_online_quit_warning data = {player_device = <device_num>}
		else
			generic_event_choose state = uistate_online_quit_warning data = {is_popup player_device = <device_num>}
		endif
	endif
endscript

script quit_network_game_early 
	Change \{disable_attacks = 1}
	if NOT ($is_network_game)
		return
	endif
	PauseGame
	quit_network_game
	if GotParam \{signin_change}
		shut_down_net_play
	else
		if ($playing_song = 1)
			kill_gem_scroller
		endif
	endif
endscript

script cancel_join_server 
	printf \{qs(0x8a62650c)}
	LeaveServer
	NetSessionFunc \{Obj = session
		func = unpost_game}
	NetSessionFunc \{Obj = match
		func = free_server_list}
endscript

script post_network_game \{0x41d5263e = 0x5a77a279
		friend_index = -1}
	NetSessionFunc Obj = session func = post_game params = {controller_index = <controller> 0x78d0f704 = <0x41d5263e> 0x7232dd65 = <friend_index>}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script set_match_values 
	set_network_preferences \{dont_set}
	net_dummy_get_needed_search_params
	netoptions :pref_get \{Name = Ranked}
	Ranked = <checksum>
	ranked_value = <value>
	get_instrument_tags \{check_online = 1}
	printstruct <tags>
	return {
		difficulty = ($player1_status.difficulty)
		gamemode = <gamemode>
		num_songs = ($num_songs)
		scoring_mode = <scoring_mode>
		Ranked = <Ranked>
		<tags>
	}
endscript

script 0x40635e6c 
	return {
		difficulty = ($player1_status.difficulty)
	}
endscript

script get_instrument_tags \{check_online = 1}
	GetActiveControllers
	<0x256a28df> = 0
	<0x57c93a9b> = 0
	<0xcc74c0d0> = 0
	<0xb234f0cf> = 0
	0x679a61cc = [0 0 0 0]
	GetArraySize <active_controllers>
	controller_index = 0
	num_players = 0
	tags = {}
	begin
	if (<active_controllers> [<controller_index>] = 1)
		if (<check_online> = 1)
			is_controller_online controller_index = <controller_index>
			<0xc83e2f5c> = <online>
		else
			<0xc83e2f5c> = 1
		endif
		if (<0xc83e2f5c> = 1)
			get_controller_type controller_index = <controller_index>
			switch (<controller_type>)
				case guitar
				if (<0xcc74c0d0>)
					if (<0xb234f0cf> = 0)
						<0xb234f0cf> = 1
						<tags> = {<tags> guitar2 = <controller_index>}
					endif
				else
					<0xcc74c0d0> = 1
					<tags> = {<tags> guitar1 = <controller_index>}
				endif
				case vocals
				<0x57c93a9b> = 1
				<tags> = {<tags> vocals = <controller_index>}
				case drum
				<0x256a28df> = 1
				<tags> = {<tags> drums = <controller_index>}
				case controller
				if ($allow_controller_for_all_instruments = 1)
					SetArrayElement ArrayName = 0x679a61cc index = <controller_index> NewValue = 1
				endif
			endswitch
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
	i = 0
	begin
	if (<0x679a61cc> [<i>] = 1)
		printf qs(0xd49b2fb8) d = <i>
		if (<0xcc74c0d0> = 0)
			<0xcc74c0d0> = 1
			<tags> = {<tags> guitar1 = <i>}
		elseif (<0xb234f0cf> = 0)
			<0xb234f0cf> = 1
			<tags> = {<tags> guitar2 = <i>}
		elseif (<0x256a28df> = 0)
			<0x256a28df> = 1
			<tags> = {<tags> drums = <i>}
		elseif (<0x57c93a9b> = 0)
			<0x57c93a9b> = 1
			<tags> = {<tags> vocals = <i>}
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	return tags = <tags>
endscript

script set_network_preferences 
	netoptions :pref_getstruct \{Name = game_modes}
	netoptions :pref_get \{Name = game_modes}
	if NOT GotParam \{dont_set}
		Change game_mode = <checksum>
		AppendSuffixToChecksum Base = <checksum> SuffixString = '_props'
		printstruct $<appended_id>
		printf qs(0x8429c652) s = ($<appended_id>.num_players)
		netoptions :pref_choose Name = num_players value = ($<appended_id>.num_players)
	endif
	return {
		gamemode = (<pref_struct>.search_chk)
		difficulty = ($player1_status.difficulty)
		num_songs = dont_care
	}
endscript

script set_netgame_globals 
	printf \{qs(0xc7b8dbb0)}
	printstruct <...>
	Change game_mode = <game_mode>
	Change current_level = <level>
	gamemode_getnumplayers
	Change current_num_players = <num_players>
endscript

script prepare_lobby_message 
	switch ($game_mode)
		case p2_faceoff
		<game_mode_index> = 1
		case p2_pro_faceoff
		<game_mode_index> = 2
		case p2_battle
		<game_mode_index> = 3
		case p2_coop
		<game_mode_index> = 4
	endswitch
	switch ($player1_status.difficulty)
		case easy
		<difficulty_index> = 1
		case medium
		<difficulty_index> = 2
		case hard
		<difficulty_index> = 3
		case expert
		<difficulty_index> = 4
	endswitch
	switch ($num_songs)
		case num_1
		<number_of_songs_index> = 1
		case num_3
		<number_of_songs_index> = 3
		case num_5
		<number_of_songs_index> = 5
		case num_7
		<number_of_songs_index> = 7
	endswitch
	switch ($tie_breaker)
		case HOST
		<tie_breaker_index> = 1
		case CLIENT
		<tie_breaker_index> = 2
	endswitch
	<flow_state> = 1
	return {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		flow_state = <flow_state>
	}
endscript

script cleanup_sessionfuncs 
	printf \{qs(0x7abbf921)}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = 0xf53a6e5a}
endscript

script setup_sessionfuncs 
	printf \{qs(0x6deffbba)}
	NetSessionFunc \{func = match_init}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = motd_init}
	NetSessionFunc \{func = 0xf808c81c}
	NetSessionFunc \{Obj = voice
		func = enable}
	if NetSessionFunc \{Obj = match
			func = get_gamertag}
	endif
endscript

script get_current_level_name 
	return level_name = ($LevelZones.($current_level).title) level = 1
endscript

script GetCurrentAreaStringAndChecksum 
	<area_string> = 'z_online_venue'
	<area_checksum> = dummy_value
endscript

script launch_game 
	gamemode_gettype
	if (<Type> = career)
		ui_event event = menu_change data = {state = uistate_play_song progression_flag = ($current_progression_flag) gig_num = ($current_gig_number) song_checksum = ($current_song) song_index = ($net_career_song_index)}
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script load_and_sync_timing \{start_delay = 3000}
	EndGameNetScriptPump
	printf \{qs(0x73081805)}
	Load_Venue
	printf \{qs(0x5b6fd41c)
		i = $current_level}
	gamemode_gettype
	if (<Type> != career)
		Change \{current_transition = fastintro}
		restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) starttime = 0 endtime = 999999999 device_num = ($player1_status.controller)
	else
		restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) starttime = 0 endtime = 999999999 device_num = ($player1_status.controller) loading_transition = 0
		($default_loading_screen.Destroy)
	endif
endscript

script launch_network_game 
	printf \{qs(0xedfc966f)}
	Change \{net_ready_to_start = 1}
	printf \{qs(0x1b77148d)}
	printf ($net_ready_to_start)
endscript

script ranked_quit_fix_scores 
	get_number_of_songs
	song_index = 0
	begin
	if ($game_mode = p2_battle)
		SetArrayElement ArrayName = g_p1_scores globalarray index = <song_index> NewValue = 8
		SetArrayElement ArrayName = g_p2_scores globalarray index = <song_index> NewValue = -1
	else
		SetArrayElement ArrayName = g_p2_scores globalarray index = <song_index> NewValue = 0
	endif
	<song_index> = (<song_index> + 1)
	repeat <num_songs>
endscript

script net_check_buttons 
	get_song_prefix song = <song_name>
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	0x4793a0b3 {
		Player = <Player>
		player_status = <player_status>
		guitar_stream = <guitar_stream>
		time_offset = <time_offset>
	}
	ExtendCrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	<player_text> = ($<player_status>.text)
	GetArraySize \{$gem_colors}
	begin
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	button_lip_name = (($button_up_models [(<Player> -1)]).<Color>.Name)
	ExtendCrc <button_lip_name> '_lip' out = button_lip_name
	ExtendCrc <button_lip_name> <player_text> out = button_lip_name
	button_mid_name = (($button_up_models [(<Player> -1)]).<Color>.Name)
	ExtendCrc <button_mid_name> '_mid' out = button_mid_name
	ExtendCrc <button_mid_name> <player_text> out = button_mid_name
	button_neck_name = (($button_up_models [(<Player> -1)]).<Color>.Name)
	ExtendCrc <button_neck_name> '_neck' out = button_neck_name
	ExtendCrc <button_neck_name> <player_text> out = button_neck_name
	button_head_name = (($button_up_models [(<Player> -1)]).<Color>.Name)
	ExtendCrc <button_head_name> '_head' out = button_head_name
	ExtendCrc <button_head_name> <player_text> out = button_head_name
	pos_table = ($highway_pos_table [(<Player> -1)])
	now_scale = (((<pos_table>.nowbar_scale_x) * (1.0, 0.0)) + ((<pos_table>.nowbar_scale_y) * (0.0, 1.0)))
	if ($<player_status>.lefthanded_button_ups = 1)
		<pos2d> = (($button_up_models [(<Player> -1)]).<Color>.left_pos_2d)
	else
		<pos2d> = (($button_up_models [(<Player> -1)]).<Color>.pos_2d)
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
	else
		<playline_scale> = <now_scale>
	endif
	<y_scale> = ((<pixels> + $neck_lip_add) / $neck_sprite_size)
	<neck_scale> = (((<playline_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
	<head_pos> = (<pos2d> - (<pixels> * (0.0, 1.0)))
	if ScreenElementExists id = <button_lip_name>
		SetScreenElementProps id = <button_lip_name> z_priority = 4.9
	endif
	if ScreenElementExists id = <button_mid_name>
		SetScreenElementProps id = <button_mid_name> z_priority = 4.6
	endif
	if ScreenElementExists id = <button_neck_name>
		SetScreenElementProps id = <button_neck_name> z_priority = 4.7 Scale = <neck_scale>
	endif
	if ScreenElementExists id = <button_head_name>
		SetScreenElementProps id = <button_head_name> z_priority = 4.8 Pos = <head_pos>
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	array_count = 0
	GetDeltaTime
	sub_amount = (($button_up_pixels * <delta_time>) / $button_sink_time)
	begin
	pixels = ($<pixel_array> [<array_count>])
	pixels = (<pixels> - <sub_amount>)
	if (<pixels> < 0.0)
		<pixels> = 0.0
	endif
	SetArrayElement ArrayName = <pixel_array> globalarray index = <array_count> NewValue = <pixels>
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Wait \{1
		gameframe}
	repeat
endscript

script net_check_note_hold 
	CheckNoteHoldInit Player = <Player> player_status = <player_status> array_entry = <array_entry> time = <time> guitar_stream = <guitar_stream> song = <song> pattern = <pattern>
	begin
	if NOT CheckNoteHoldWait Player = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CheckNoteHoldStart Player = <Player>
	SpawnScriptLater net_control_whammy_pitch_loop params = {song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> time = <time>}
	begin
	if NOT CheckNoteHoldPerFrame Player = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	KillSpawnedScript \{Name = net_control_whammy_pitch_loop}
	CheckNoteHoldEnd Player = <Player>
endscript

script net_control_whammy_pitch_loop 
	Change \{pitch_dirty = 1}
	formatText checksumName = net_update_event 'net_button_check_p%d' d = ($<player_status>.Player) AddToStringLookup = true
	begin
	GetSongTime
	start_time = <songtime>
	Block Type = <net_update_event>
	GetSongTime
	delta_time = (<songtime> - <start_time>)
	<time> = (<time> - (<delta_time> * 1000))
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	SpawnScriptNow net_whammy_pitch_shift params = {song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = (<event_data>.net_whammy_length) time = <time>}
	repeat
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
endscript
pitch_dirty = 1
prev_len = 0

script net_whammy_pitch_shift 
	if ($pitch_dirty = 1)
		Change \{pitch_dirty = 0}
		Change prev_len = <net_whammy_length>
		begin
		control_whammy_pitchshift song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = <net_whammy_length> time = <time>
		Wait \{1
			gameframe}
		repeat
	else
		<len_delta> = (<net_whammy_length> - $prev_len)
		<len_base> = ($prev_len)
		Change prev_len = <net_whammy_length>
		<frames> = 5
		<Scale> = (1.0 / <frames>)
		<scale_step> = <Scale>
		begin
		<len> = (<len_base> + (<len_delta> * <Scale>))
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> Player = ($<player_status>.Player)
		<Scale> = (<Scale> + <scale_step>)
		Wait \{1
			gameframe}
		repeat <frames>
		begin
		set_whammy_pitchshift control = <net_whammy_length> player_status = <player_status>
		<whammy_scale> = (((<net_whammy_length> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> Player = ($<player_status>.Player)
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script set_net_client_highway 
	Change structurename = <player_status> highway_layout = <layout>
endscript

script set_net_client_lefty 
	Change structurename = player2_status lefthanded_gems = <lefty_flip_p2>
	Change structurename = player2_status lefthanded_button_ups = <lefty_flip_p2>
endscript

script net_copy_intial_params 
	Change GlobalName = <copy_to> NewValue = $<copy_from>
endscript

script net_commit_or_reset_params 
	if GotParam \{commit}
		Change GlobalName = <copy_to> NewValue = $<copy_from>
	else
		if (<Type> = loc)
			<text> :se_setprops text = ($LevelZones.($LevelZoneArray [$<Global>]).title)
		else
			<text> :se_setprops text = ($FilterTypes.<Type>.values [$<Global>])
		endif
	endif
	change_coop_value_if_ranked
endscript

script net_custom_up_down \{direction = up}
	if (<Type> = loc)
		GetArraySize ($LevelZoneArray)
	else
		GetArraySize ($FilterTypes.<Type>.values)
	endif
	if (<direction> = up)
		if ((<array_Size> -1) = $<Global>)
			Change GlobalName = <Global> NewValue = 0
		else
			Change GlobalName = <Global> NewValue = ($<Global> + 1)
		endif
	else
		if (0 = $<Global>)
			Change GlobalName = <Global> NewValue = (<array_Size> -1)
		else
			Change GlobalName = <Global> NewValue = (<Global> - 1)
		endif
	endif
	if (<Type> = loc)
		<text> :se_setprops text = ($LevelZones.($LevelZoneArray [$<Global>]).title) Scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	else
		<text> :se_setprops text = ($FilterTypes.<Type>.values [$<Global>]) Scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	endif
	if (($SearchMatchTypeValue = 1) && (<Type> = mode) && ($<Global> = 4) && ($ui_flow_manager_state [0] = custom_match_fs))
		net_custom_up_down <...>
	endif
	if (($<Global> = 2) && (<Type> = search))
		if NOT isXenon
			net_custom_up_down <...>
		endif
	endif
endscript

script change_coop_value_if_ranked 
	if (($SearchMatchTypeValue = 1) && ($SearchGameModeValue = 4))
		net_custom_up_down \{direction = up
			Type = mode
			Global = SearchGameModeValue
			text = game_mode_selection_text}
	endif
endscript

script block_unblock_difficulty_actions \{diff_focus = OFF
		menu = search}
	if GotParam \{diff_focus}
		<change_color> = ($online_light_blue)
	else
		<change_color> = ($online_dark_purple)
	endif
	if (<menu> = search)
		<gamemode> = ($SearchGameModeValue)
		<new_text> = ($FilterTypes.diff.values [($SearchDifficultyValue)])
	else
		<gamemode> = ($OptionsGameModeValue)
		<new_text> = ($FilterTypes.diff.values [($OptionsDifficultyValue)])
	endif
	if ((<gamemode> = 0) || (<gamemode> = 2))
		if ScreenElementExists \{id = difficulty}
			difficulty :se_setprops rgba = <change_color> unblock_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :se_setprops rgba = <change_color> text = <new_text> unblock_events
		endif
	else
		if ScreenElementExists \{id = difficulty}
			difficulty :se_setprops rgba = ($online_grey) block_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :se_setprops rgba = ($online_grey) text = qs(0xe50e8cdd) block_events
		endif
	endif
endscript

script net_init 
	Change \{is_network_game = 1}
	SetNetworkMode \{$INTERNET_MODE}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionFunc \{func = GetNumPlayers}
	spawn_player_drop_listeners
endscript

script wait_for_dw_init 
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		Frame}
	repeat
	add_active_controllers
	menu_net_matchmaking_init
	destroy_popup_warning_menu
endscript

script add_active_controllers 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		if IsLoggedIn
			NetSessionFunc func = addcontrollers params = {controller = <controller_index>}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
endscript

script update_ingame_controllers 
	printf \{'Warning: update_ingame_controllers is not used.'}
	return
endscript

script setup_online_player_settings 
	GetGlobalTags \{user_options}
	switch (<online_highway>)
		case 0
		Change \{structurename = player1_status
			highway_layout = default_highway}
		case 1
		Change \{structurename = player1_status
			highway_layout = solo_highway}
	endswitch
endscript

script get_random_song 
	first_song_index = (-1)
	last_song_index = (-1)
	array_entry = 0
	GetArraySize \{$gh_songlist}
	begin
	song_checksum = ($gh_songlist [<array_entry>])
	get_song_version song = <song_checksum>
	if (<song_version> = $current_song_version)
		if (<first_song_index> = (-1))
			<first_song_index> = <array_entry>
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	<last_song_index> = (<array_entry> - 1)
	GetRandomValue Name = random_value integer a = <first_song_index> b = <last_song_index>
	return random_song = ($gh_songlist [<random_value>])
endscript

script start_network_game 
	if IsHost
		StartNetworkGame
	endif
endscript

script check_for_final_song_selection 
	if (($tie_breaker) = song_rand)
		return \{can_select_final_song = FALSE}
	elseif (($tie_breaker) = HOST)
		if IsHost
			return \{can_select_final_song = true}
		else
			return \{can_select_final_song = FALSE}
		endif
	elseif (($tie_breaker) = CLIENT)
		if IsHost
			return \{can_select_final_song = FALSE}
		else
			return \{can_select_final_song = true}
		endif
	endif
endscript

script online_fail_song 
	printf \{qs(0x34e995d3)}
	Change \{disable_attacks = 1}
	if (GameIsOver)
		return
	endif
	netfailsong
endscript

script online_win_song 
	if ($net_pause = 1)
		net_unpausegh
	endif
	disable_pause
	printf \{qs(0x311200b2)}
	Change \{disable_attacks = 1}
	Change structurename = <player_status> best_run = <note_streak>
	Change structurename = <player_status> total_notes = <total_notes>
	Change structurename = <player_status> notes_hit = <notes_hit>
	if (<quit_early>)
		Change \{player2_present = 0}
		if ($match_type = Ranked)
			ranked_quit_fix_scores
		endif
		if ($game_mode = p2_battle)
			Change \{structurename = player1_status
				current_health = 1.0}
			Change \{structurename = player2_status
				current_health = 0.0}
		else
			Change \{structurename = player2_status
				score = 0.0}
		endif
		wait_for_net_popup
	endif
	player_text = ($<player_status>.text)
endscript

script broadcast_received_winner_stats 
	Change structurename = <player_status> best_run = <note_streak>
	Change structurename = <player_status> total_notes = <total_notes>
	Change structurename = <player_status> notes_hit = <notes_hit>
	if ($game_mode = p2_battle)
		record_net_statistics
	endif
endscript

script set_rich_presence_searching 
	Change \{rich_presence_context = presence_online_searching}
endscript

script set_rich_presence_game_mode \{online = 0}
	if ScreenElementExists \{id = metallifacts_container}
		Change \{rich_presence_context = presence_gigboard_and_setlist}
		return
	endif
	if (<online>)
		Change \{rich_presence_context = presence_online}
	elseif ($rich_presence_context != presence_music_studio)
		switch ($game_mode)
			case p1_career
			Change \{rich_presence_context = presence_career}
			case p2_career
			case p3_career
			case p4_career
			Change \{rich_presence_context = presence_band_career}
			case p1_quickplay
			case p2_quickplay
			case p3_quickplay
			case p4_quickplay
			Change \{rich_presence_context = presence_quickplay}
			case p2_pro_faceoff
			case p2_faceoff
			case p2_battle
			Change \{rich_presence_context = presence_head_to_head}
			case training
			Change \{rich_presence_context = presence_practice}
			case tutorial
			Change \{rich_presence_context = presence_tutorial}
		endswitch
	endif
endscript

script get_custom_match_search_params 
	netoptions :pref_get \{Name = Ranked}
	Ranked = <checksum>
	ranked_value = <value>
	if (($SearchGameModeValue = 0) || ($SearchGameModeValue = 2))
		difficulty_checksum = ($FilterTypes.diff.checksum [($SearchDifficultyValue)])
	else
		difficulty_checksum = dont_care
	endif
	netoptions :pref_get \{Name = game_modes}
	game_mode = <checksum>
	return {
		difficulty = <difficulty_checksum>
		gamemode = <game_mode>
		num_songs = ($FilterTypes.num_songs.checksum [($SearchNumSongsValue)])
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript

script get_quick_match_search_params 
	GetGlobalTags \{user_options}
	netoptions :pref_get \{Name = Ranked}
	Ranked = <checksum>
	ranked_value = <value>
	if ((<online_game_mode> = 0) || (<online_game_mode> = 2))
		difficulty_checksum = ($FilterTypes.diff.checksum [<online_difficulty>])
	else
		difficulty_checksum = dont_care
	endif
	return {
		difficulty = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.checksum [<online_game_mode>])
		num_songs = ($FilterTypes.num_songs.checksum [<online_num_songs>])
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript
bPS3SingleSignOnCheckComplete = 0

script xenon_singleplayer_session_init \{ps3_signin_callback = xenon_singleplayer_session_init}
endscript

script begin_singleplayer_game 
	if ($is_network_game = 1)
		if IsHost
			if NetSessionFunc \{Obj = session
					func = has_active_session}
				NetSessionFunc \{Obj = session
					func = begin_singleplayer_game}
			endif
		endif
	else
		if NetSessionFunc \{Obj = session
				func = has_active_session}
			NetSessionFunc \{Obj = session
				func = begin_singleplayer_game}
		endif
	endif
endscript

script end_singleplayer_game 
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = end_singleplayer_game}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	if isXenon
		if NetSessionFunc \{Obj = session
				func = is_singleplayer_session}
			NetSessionFunc \{func = stop_singleplayer_session
				Obj = session}
		endif
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	Change \{net_safe_to_enter_net_play = 0}
	if NOT GotParam \{song_failed}
		Wait \{3
			Seconds}
	endif
	NetSessionFunc \{Obj = session
		func = unpost_game}
	Change \{net_safe_to_enter_net_play = 1}
endscript

script send_leader_board_message 
	RequireParams \{[
			song_checksum
		]
		all}
	<guitar_rating> = 0
	<bass_rating> = 0
	<drum_rating> = 0
	<vocals_rating> = 0
	<band_rating> = 5
	gamemode_getnumplayers
	players_on_team = (<num_players> / 2)
	if gamemode_iscooperative
		<players_on_team> = <num_players>
	endif
	if (<players_on_team> > 0)
		i = 1
		begin
		getplayerinfo <i> part
		getplayerinfo <i> difficulty
		switch (<difficulty>)
			case easy_rhythm
			<rating> = 1
			case easy
			<rating> = 2
			case medium
			<rating> = 3
			case hard
			<rating> = 4
			case expert
			<rating> = 5
		endswitch
		switch (<part>)
			case guitar
			<guitar_rating> = <rating>
			case bass
			<bass_rating> = <rating>
			case drum
			<drum_rating> = <rating>
			case vocals
			<vocals_rating> = <rating>
		endswitch
		if (<rating> < <band_rating>)
			<band_rating> = <rating>
		endif
		<i> = (<i> + 1)
		repeat (<players_on_team>)
	endif
	if (<bass_rating> = 0 || <drum_rating> = 0 || <vocals_rating> = 0 || <guitar_rating> = 0)
		<band_rating> = 0
	endif
	if ($game_mode = p1_career)
		get_single_career_lb_stats <...>
	elseif (($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career) && ($coop_dlc_active = 0))
		get_multiplayer_career_lb_stats <...>
	else
		get_non_career_lb_stats <...>
	endif
	if NOT GotParam \{Player_list}
		if NOT GotParam \{end_session}
			return
		elseif (<end_session> = 1)
			xenon_singleplayer_session_begin_uninit
			return
		else
			return
		endif
	endif
	printstruct channel = net <...>
	if NOT GotParam \{end_session}
		NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list>}
	else
		if (<end_session> = 1)
			NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list>}
		else
			NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list> DontEndSessionAfterWrite}
		endif
	endif
endscript

script get_single_career_lb_stats 
	printf \{channel = net
		qs(0xe7829c12)}
	player1_xuid = [0 0]
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		if (<end_session> = 1)
			xenon_singleplayer_session_begin_uninit
		endif
		return
	endif
	getplayerinfo <player_num> difficulty
	if checksumequals a = <difficulty> b = easy_rhythm
		if (<end_session> = 1)
			xenon_singleplayer_session_begin_uninit
		endif
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
	controller = ($primary_controller)
	if IsLoggedIn \{0x5f495f02}
		GetNetID controller_index = <controller>
		SetArrayElement ArrayName = player1_xuid index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = player1_xuid index = 1 NewValue = <net_id_second>
		getplayerinfo <player_num> part
		switch (<part>)
			case guitar
			career_leaderboard_id = lb_career_guitar
			case bass
			career_leaderboard_id = lb_career_bass
			case drum
			career_leaderboard_id = lb_career_drum
			case vocals
			career_leaderboard_id = lb_career_vocals
		endswitch
		get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
		summation_career_score tier_global = <tier_global>
		getplayerinfo <player_num> score
		CastToInteger \{score}
		switch (<difficulty>)
			case easy
			<rating> = 1
			<easy_score> = <score>
			<medium_score> = 0
			<hard_score> = 0
			<expert_score> = 0
			case medium
			<rating> = 2
			<easy_score> = 0
			<medium_score> = <score>
			<hard_score> = 0
			<expert_score> = 0
			case hard
			<rating> = 3
			<easy_score> = 0
			<medium_score> = 0
			<hard_score> = <score>
			<expert_score> = 0
			case expert
			<rating> = 4
			<easy_score> = 0
			<medium_score> = 0
			<hard_score> = 0
			<expert_score> = <score>
			default
			printf \{qs(0x8dd38a7c)}
		endswitch
		if (<score> > 0)
			Player_list = [
				{
					player_xuid = <player1_xuid>
					team = 0
					leaderboards = [
						{
							leaderboard_id = <leaderboard_id>
							rating = <rating>
							score = <score>
							write_type = Max
							columns = [
								{score = <easy_score>}
								{score = <medium_score>}
								{score = <hard_score>}
								{score = <expert_score>}
							]
						}
						{
							leaderboard_id = <career_leaderboard_id>
							rating = 0
							score = <career_score>
							write_type = Max
							columns = [
								{score = <career_score>}
								{score = <career_score>}
								{score = <career_score>}
								{score = <career_score>}
							]
						}
						{
							leaderboard_id = lb_career_cash
							rating = 0
							score = <career_earnings>
							write_type = Max
							columns = [
								{score = <career_earnings>}
								{score = <career_earnings>}
								{score = <career_earnings>}
								{score = <career_earnings>}
							]
						}
					]
				}
			]
			return Player_list = <Player_list>
		endif
	endif
endscript

script get_multiplayer_career_lb_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{channel = net
		qs(0xc6e29d1e)}
	career_leaderboard_id = lb_career_band
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	player_xuid = [0 0]
	Player_list = []
	band_score = ($band1_status.score)
	CastToInteger \{band_score}
	index = 1
	gamemode_getnumplayers
	begin
	<player_xuid> = [0 0]
	<rating> = 0
	<easy_score> = 0
	<medium_score> = 0
	<hard_score> = 0
	<expert_score> = 0
	getplayerinfo <index> is_local_client
	if ($is_network_game = 0 || ($is_network_game = 1 && <is_local_client> = 1))
		getplayerinfo <index> difficulty
		if NOT checksumequals a = <difficulty> b = easy_rhythm
			getplayerinfo <index> controller
			if IsLoggedIn \{0x5f495f02}
				GetNetID controller_index = <controller>
				SetArrayElement ArrayName = player_xuid index = 0 NewValue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 NewValue = <net_id_second>
				summation_career_score tier_global = <tier_global>
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
				getplayerinfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				get_song_struct song = <song_checksum>
				formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = <part_text>
				formatText checksumName = lb_band_song_id '%s_band' s = (<song_struct>.Name)
				getplayerinfo <index> score
				CastToInteger \{score}
				switch (<difficulty>)
					case easy
					<rating> = 1
					<easy_score> = <score>
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = 0
					case medium
					<rating> = 2
					<easy_score> = 0
					<medium_score> = <score>
					<hard_score> = 0
					<expert_score> = 0
					case hard
					<rating> = 3
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = <score>
					<expert_score> = 0
					case expert
					<rating> = 4
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = <score>
				endswitch
				printf qs(0xf06e3e10) i = <index> p = <part> s = <score>
				if (<score> > 0)
					new_player_info = {
						player_xuid = <player_xuid>
						team = 0
						leaderboards = [
							{
								leaderboard_id = <career_leaderboard_id>
								rating = 0
								score = <career_score>
								write_type = Max
								columns = [
									{score = <career_score>}
									{score = <career_score>}
									{score = <career_score>}
									{score = <career_score>}
								]
							}
							{
								leaderboard_id = <lb_band_song_id>
								rating = <band_rating>
								score = <band_score>
								write_type = Max
								columns = [
									{score = <guitar_rating>}
									{score = <bass_rating>}
									{score = <drum_rating>}
									{score = <vocals_rating>}
								]
							}
							{
								leaderboard_id = lb_career_cash
								rating = 0
								score = <career_earnings>
								write_type = Max
								columns = [
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
								]
							}
						]
					}
					AddArrayElement array = <Player_list> element = <new_player_info>
					<Player_list> = <array>
				endif
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	return Player_list = <Player_list>
endscript

script get_non_career_lb_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{channel = net
		qs(0x70f1fd94)}
	Player_list = []
	<player_xuid> = [0 0]
	index = 1
	gamemode_getnumplayers
	begin
	<player_xuid> = [0 0]
	<rating> = 0
	<easy_score> = 0
	<medium_score> = 0
	<hard_score> = 0
	<expert_score> = 0
	getplayerinfo <index> is_local_client
	if ($is_network_game = 0 || ($is_network_game = 1 && <is_local_client> = 1))
		getplayerinfo <index> difficulty
		if NOT checksumequals a = <difficulty> b = easy_rhythm
			getplayerinfo <index> controller
			if IsLoggedIn \{0x5f495f02}
				GetNetID controller_index = <controller>
				SetArrayElement ArrayName = player_xuid index = 0 NewValue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 NewValue = <net_id_second>
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
				getplayerinfo <index> score
				CastToInteger \{score}
				switch (<difficulty>)
					case easy
					<rating> = 1
					<easy_score> = <score>
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = 0
					case medium
					<rating> = 2
					<easy_score> = 0
					<medium_score> = <score>
					<hard_score> = 0
					<expert_score> = 0
					case hard
					<rating> = 3
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = <score>
					<expert_score> = 0
					case expert
					<rating> = 4
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = <score>
				endswitch
				get_song_struct song = <song_checksum>
				getplayerinfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = <part_text>
				formatText checksumName = lb_band_song_id '%s_band' s = (<song_struct>.Name)
				printf qs(0xf06e3e10) i = <index> p = <part> s = <score>
				gamemode_gettype
				if (<num_players> > 1 && <Type> = quickplay)
					band_score = ($band1_status.score)
					CastToInteger \{band_score}
					new_player_info = {
						player_xuid = <player_xuid>
						team = 0
						leaderboards = [
							{
								leaderboard_id = <lb_band_song_id>
								rating = <band_rating>
								score = <band_score>
								write_type = Max
								columns = [
									{score = <guitar_rating>}
									{score = <bass_rating>}
									{score = <drum_rating>}
									{score = <vocals_rating>}
								]
							}
							{
								leaderboard_id = lb_career_cash
								rating = 0
								score = <career_earnings>
								write_type = Max
								columns = [
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
								]
							}
						]
					}
				else
					new_player_info = {
						player_xuid = <player_xuid>
						team = 0
						leaderboards = [
							{
								leaderboard_id = <lb_song_id>
								rating = <rating>
								score = <score>
								write_type = Max
								columns = [
									{score = <easy_score>}
									{score = <medium_score>}
									{score = <hard_score>}
									{score = <expert_score>}
								]
							}
							{
								leaderboard_id = lb_career_cash
								rating = 0
								score = <career_earnings>
								write_type = Max
								columns = [
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
								]
							}
						]
					}
				endif
				AddArrayElement array = <Player_list> element = <new_player_info>
				<Player_list> = <array>
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	return Player_list = <Player_list>
endscript

script net_write_single_player_stats 
	printf \{channel = net
		qs(0xca49d267)}
	RequireParams \{[
			song_checksum
		]
		all}
	net_retrieve_controller_scores
	if (<total_score> > 0)
		if achievements_ischeatingautokick
			autokick_cheating = 1
		else
			autokick_cheating = 0
		endif
		if NOT (($game_mode = p2_battle) || ($game_mode = practice) || $cheat_alwaysslide = 1 || (<autokick_cheating> = 1) || ($game_mode = p2_faceoff))
			if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
				CastToInteger \{total_score}
				get_song_struct song = <song_checksum>
				formatText checksumName = band_song_checksum '%s_band' s = (<song_struct>.Name)
				send_leader_board_message score = <total_score> leaderboard_id = <band_song_checksum> end_session = <end_session> song_checksum = <song_checksum>
			else
				primary_player_score = (<scores> [<primary_index>])
				CastToInteger \{primary_player_score}
				if (<primary_player_score> > 0)
					net_retrieve_primary_controller_part
					primary_player_part = <primary_part>
					switch (<primary_player_part>)
						case guitar
						part = 'guitar'
						case bass
						part = 'backup'
						case drum
						part = 'drums'
						case vocals
						part = 'mic'
						case rhythm
						part = 'backup'
						default
						part = 'none'
					endswitch
					get_song_struct song = <song_checksum>
					formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = <part>
					send_leader_board_message score = <primary_player_score> leaderboard_id = <lb_song_id> end_session = <end_session> song_checksum = <song_checksum>
				endif
			endif
		else
			xenon_singleplayer_session_begin_uninit
		endif
	else
		xenon_singleplayer_session_begin_uninit
	endif
endscript

script net_retrieve_controller_scores 
	gamemode_getnumplayers
	total_score = 0
	index = 1
	primary_index = 0
	<array> = []
	begin
	getplayerinfo <index> score
	CastToInteger \{score}
	getplayerinfo <index> controller
	if (<controller> = $primary_controller)
		<primary_index> = (<index> - 1)
	endif
	AddArrayElement array = <array> element = <score>
	<total_score> = (<total_score> + <score>)
	printstruct <...>
	<index> = (<index> + 1)
	repeat <num_players>
	player_scores = <array>
	return {
		scores = <player_scores>
		total_score = <total_score>
		primary_index = <primary_index>
	}
endscript

script net_retrieve_primary_controller_part 
	if (($player1_status.controller) = ($primary_controller))
		return primary_part = ($player1_status.part)
	elseif (($player2_status.controller) = ($primary_controller))
		return primary_part = ($player2_status.part)
	else
		return \{primary_part = guitar}
	endif
endscript

script summation_career_score 
	printf \{channel = net
		qs(0x05b1d75d)}
	setlist_prefix = ($<tier_global>.prefix)
	printstruct channel = net <...>
	career_score = 0
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	<best_score> = 0
	diff_index = 0
	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>]) difficulty_index = <diff_index>
	GetGlobalTags <song_checksum> params = score
	if (<score> > <best_score>)
		<best_score> = <score>
	endif
	<diff_index> = (<diff_index> + 1)
	repeat 5
	printf channel = net qs(0x50cabb73) s = <best_score> a = <song_checksum> c = <career_score>
	<career_score> = (<career_score> + <best_score>)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	CastToInteger \{career_score}
	printf qs(0xd5a77f29) c = <career_score>
	return career_score = <career_score>
endscript

script online_song_end_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{qs(0x2b1ceec3)}
	player_xuid = [0 0]
	Player_list = []
	guitar_rating = 0
	bass_rating = 0
	drum_rating = 0
	vocals_rating = 0
	band_rating = 5
	gamemode_getnumplayers
	players_on_team = (<num_players> / 2)
	if gamemode_iscooperative
		<players_on_team> = <num_players>
	endif
	i = 1
	begin
	getplayerinfo <i> part
	getplayerinfo <i> difficulty
	switch (<difficulty>)
		case easy_rhythm
		<rating> = 1
		case easy
		<rating> = 2
		case medium
		<rating> = 3
		case hard
		<rating> = 4
		case expert
		<rating> = 5
	endswitch
	switch (<part>)
		case guitar
		<guitar_rating> = <rating>
		case bass
		<bass_rating> = <rating>
		case drum
		<drum_rating> = <rating>
		case vocals
		<vocals_rating> = <rating>
	endswitch
	if (<rating> < <band_rating>)
		<band_rating> = <rating>
	endif
	<i> = (<i> + 1)
	repeat (<players_on_team>)
	if (<bass_rating> = 0 || <drum_rating> = 0 || <vocals_rating> = 0 || <guitar_rating> = 0)
		<band_rating> = 0
	endif
	if NOT (($game_mode = p2_battle) || ($game_mode = p2_faceoff))
		band_score = ($band1_status.score)
		CastToInteger \{band_score}
		index = 1
		begin
		<player_xuid> = [0 0]
		<rating> = 0
		<easy_score> = 0
		<medium_score> = 0
		<hard_score> = 0
		<expert_score> = 0
		getplayerinfo <index> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <index> difficulty
			if NOT checksumequals a = <difficulty> b = easy_rhythm
				getplayerinfo <index> net_id_first
				getplayerinfo <index> net_id_second
				SetArrayElement ArrayName = player_xuid index = 0 NewValue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 NewValue = <net_id_second>
				getplayerinfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				get_song_struct song = <song_checksum>
				formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = <part_text>
				formatText checksumName = lb_band_song_id '%s_band' s = (<song_struct>.Name)
				getplayerinfo <index> score
				CastToInteger \{score}
				switch (<difficulty>)
					case easy
					<rating> = 1
					<easy_score> = <score>
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = 0
					case medium
					<rating> = 2
					<easy_score> = 0
					<medium_score> = <score>
					<hard_score> = 0
					<expert_score> = 0
					case hard
					<rating> = 3
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = <score>
					<expert_score> = 0
					case expert
					<rating> = 4
					<easy_score> = 0
					<medium_score> = 0
					<hard_score> = 0
					<expert_score> = <score>
				endswitch
				if (<score> > 0)
					gamemode_gettype
					if (<num_players> > 1 && ($game_mode = p8_pro_faceoff || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p2_quickplay))
						if (<Type> = quickplay)
							getplayerinfo <index> controller
							get_savegame_from_controller controller = <controller>
							get_current_band_info
							GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
							new_player_info = {
								player_xuid = <player_xuid>
								team = 0
								leaderboards = [
									{
										leaderboard_id = <lb_band_song_id>
										rating = <band_rating>
										score = <band_score>
										write_type = Max
										columns = [
											{score = <guitar_rating>}
											{score = <bass_rating>}
											{score = <drum_rating>}
											{score = <vocals_rating>}
										]
									}
									{
										leaderboard_id = lb_career_cash
										rating = 0
										score = <career_earnings>
										write_type = Max
										columns = [
											{score = <career_earnings>}
											{score = <career_earnings>}
											{score = <career_earnings>}
											{score = <career_earnings>}
										]
									}
								]
							}
						else
							new_player_info = {
								player_xuid = <player_xuid>
								team = 0
								leaderboards = [
									{
										leaderboard_id = <lb_band_song_id>
										rating = <band_rating>
										score = <band_score>
										write_type = Max
										columns = [
											{score = <guitar_rating>}
											{score = <bass_rating>}
											{score = <drum_rating>}
											{score = <vocals_rating>}
										]
									}
								]
							}
						endif
					else
						if (<Type> = quickplay)
							getplayerinfo <index> controller
							get_savegame_from_controller controller = <controller>
							get_current_band_info
							GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
							new_player_info = {
								player_xuid = <player_xuid>
								team = 0
								leaderboards = [
									{
										leaderboard_id = <lb_song_id>
										rating = <rating>
										score = <score>
										write_type = Max
										columns = [
											{score = <easy_score>}
											{score = <medium_score>}
											{score = <hard_score>}
											{score = <expert_score>}
										]
									}
									{
										leaderboard_id = lb_career_cash
										rating = 0
										score = <career_earnings>
										write_type = Max
										columns = [
											{score = <career_earnings>}
											{score = <career_earnings>}
											{score = <career_earnings>}
											{score = <career_earnings>}
										]
									}
								]
							}
						else
							new_player_info = {
								player_xuid = <player_xuid>
								team = 0
								leaderboards = [
									{
										leaderboard_id = <lb_song_id>
										rating = <rating>
										score = <score>
										write_type = Max
										columns = [
											{score = <easy_score>}
											{score = <medium_score>}
											{score = <hard_score>}
											{score = <expert_score>}
										]
									}
								]
							}
						endif
					endif
					AddArrayElement array = <Player_list> element = <new_player_info>
					<Player_list> = <array>
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <num_players>
	endif
	if GotParam \{Player_list}
		NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list>}
	else
		NetSessionFunc \{Obj = session
			func = end_active_session}
	endif
endscript

script online_match_end_write_stats 
	write_stats = 0
	if isXenon
		if (NetSessionFunc func = isranked Obj = match)
			write_stats = 1
		endif
	else
		if ($game_mode = p2_coop)
			write_stats = 0
		else
			write_stats = 1
		endif
	endif
	if (<write_stats> = 1)
		GetGlobalTags \{net}
		net_get_game_mode_leaderboard_id
		switch ($game_mode)
			case p2_faceoff
			<total_win_lose_leaderboard_id> = lb_faceoff_winratio
			<streak_leaderboard_id> = lb_faceoff_win_streak
			<streak_score> = <face_off_streak>
			<wins> = <faceoff_wins>
			<loses> = <faceoff_loses>
			case p2_pro_faceoff
			<total_win_lose_leaderboard_id> = lb_pro_faceoff_winratio
			<streak_leaderboard_id> = lb_pro_faceoff_win_streak
			<streak_score> = <pro_face_off_streak>
			<wins> = <pro_faceoff_wins>
			<loses> = <pro_faceoff_loses>
			case p2_battle
			<total_win_lose_leaderboard_id> = lb_battle_winratio
			<streak_leaderboard_id> = lb_battle_win_streak
			<streak_score> = <battle_streak>
			<wins> = <battle_wins>
			<loses> = <battle_loses>
			default
			total_win_lose_leaderboard_id = lb_faceoff_winratio
			streak_leaderboard_id = lb_faceoff_win_streak
			streak_score = 0
			wins = 0
			loses = 0
		endswitch
		prepare_player_list_array {
			p1_leaderboard_id = <p1_leaderboard_id>
			p2_leaderboard_id = <p2_leaderboard_id>
			total_win_lose_leaderboard_id = <total_win_lose_leaderboard_id>
			streak_leaderboard_id = <streak_leaderboard_id>
			streak_score = <streak_score>
			wins = <wins>
			loses = <loses>
		}
		if GotParam \{Player_list}
			NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list>}
		endif
	endif
	Wait \{3
		Seconds}
	NetSessionFunc \{Obj = stats
		func = end_write_stats}
endscript

script net_get_highest_coop_difficulty 
	if ((($player1_status.difficulty) = expert) || (($player2_status.difficulty) = expert))
		return \{highest_diff = expert}
	endif
	if ((($player1_status.difficulty) = hard) || (($player2_status.difficulty) = hard))
		return \{highest_diff = hard}
	endif
	if ((($player1_status.difficulty) = medium) || (($player2_status.difficulty) = medium))
		return \{highest_diff = medium}
	endif
	return \{highest_diff = easy}
endscript

script online_set_win_losses_streak \{out_come = lose}
	GetGlobalTags \{net}
	switch ($game_mode)
		case p2_battle
		if (<out_come> = win)
			SetGlobalTags net params = {battle_streak = (<battle_streak> + 1) battle_wins = (<battle_wins> + 1)}
		else
			SetGlobalTags net params = {battle_streak = 0 battle_loses = (<battle_loses> + 1)}
		endif
		case p2_faceoff
		if (<out_come> = win)
			SetGlobalTags net params = {face_off_streak = (<face_off_streak> + 1) faceoff_wins = (<faceoff_wins> + 1)}
		else
			SetGlobalTags net params = {face_off_streak = 0 faceoff_loses = (<faceoff_loses> + 1)}
		endif
		case p2_pro_faceoff
		if (<out_come> = win)
			SetGlobalTags net params = {pro_face_off_streak = (<pro_face_off_streak> + 1) pro_faceoff_wins = (<pro_faceoff_wins> + 1)}
		else
			SetGlobalTags net params = {pro_face_off_streak = 0 pro_faceoff_loses = (<pro_faceoff_loses> + 1)}
		endif
	endswitch
endscript

script net_get_game_mode_leaderboard_id 
	switch ($game_mode)
		case p2_faceoff
		formatText checksumName = leaderboard_id_p1 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
		case p2_pro_faceoff
		formatText checksumName = leaderboard_id_p1 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
		case p2_battle
		formatText checksumName = leaderboard_id_p1 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
	endswitch
	return {p1_leaderboard_id = <leaderboard_id_p1> p2_leaderboard_id = <leaderboard_id_p2>}
endscript

script prepare_player_list_array 
	net_stats_calculate_wins
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	SetArrayElement ArrayName = player1_xuid index = 0 NewValue = ($player1_status.net_id_first)
	SetArrayElement ArrayName = player1_xuid index = 1 NewValue = ($player1_status.net_id_second)
	SetArrayElement ArrayName = player2_xuid index = 0 NewValue = ($player2_status.net_id_first)
	SetArrayElement ArrayName = player2_xuid index = 1 NewValue = ($player2_status.net_id_second)
	if (<p1_wins> = <p2_wins>)
		return
	elseif (<p1_wins> > <p2_wins>)
		return
		get_match_type_leaderboard_info \{p1_wins_value = 1
			p1_loses_value = 0
			p2_wins_value = 0
			p2_loses_value = 1}
		GetLeaderboardWinLoseValue win = (<wins> + 1) lose = <loses>
		online_set_win_losses_streak \{out_come = win}
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				leaderboards = [
					{
						leaderboard_id = <p1_leaderboard_id>
						rating = 0
						score = <score1>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum1>}
							{score = <attrib_score1>}
							{score = <attrib_tot1>}
						]
					}
					{
						leaderboard_id = <total_win_lose_leaderboard_id>
						rating = 0
						score = <winlosevalue>
						write_type = last
						columns = [
							{score = <winlosevalue>}
							{score = <winlosevalue>}
							{score = <winlosevalue>}
						]
					}
					{
						leaderboard_id = <streak_leaderboard_id>
						rating = 0
						score = (<streak_score> + 1)
						write_type = last
						columns = [
							{score = (<streak_score> + 1)}
							{score = (<streak_score> + 1)}
							{score = (<streak_score> + 1)}
						]
					}
				]
			}
			{
				player_xuid = <player2_xuid>
				team = 0
				leaderboards = [
					{
						leaderboard_id = <p2_leaderboard_id>
						rating = 0
						score = <score2>
						write_type = <write_type>
						columns =
						[
							{score = <attrib_acum2>}
							{score = <attrib_score2>}
							{score = <attrib_tot2>}
						]
					}
				]
			}
		]
	elseif (<p1_wins> < <p2_wins>)
		return
		get_match_type_leaderboard_info \{p1_wins_value = 0
			p1_loses_value = 1
			p2_wins_value = 1
			p2_loses_value = 0}
		GetLeaderboardWinLoseValue win = <wins> lose = (<loses> + 1)
		online_set_win_losses_streak \{outcome = lose}
		Player_list = [
			{
				player_xuid = <player2_xuid>
				team = 0
				leaderboards = [
					{
						leaderboard_id = <p2_leaderboard_id>
						rating = 0
						score = <score2>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum2>}
							{score = <attrib_score2>}
							{score = <attrib_tot2>}
						]
					}
				]
			}
			{
				player_xuid = <player1_xuid>
				team = 0
				leaderboards = [
					{
						leaderboard_id = <p1_leaderboard_id>
						rating = 0
						score = <score1>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum1>}
							{score = <attrib_score1>}
							{score = <attrib_tot1>}
						]
					}
					{
						leaderboard_id = <total_win_lose_leaderboard_id>
						rating = 0
						score = <winlosevalue>
						write_type = last
						columns = [
							{score = <winlosevalue>}
							{score = <winlosevalue>}
							{score = <winlosevalue>}
						]
					}
					{
						leaderboard_id = <streak_leaderboard_id>
						rating = 0
						score = 0
						write_type = last
						columns = [
							{score = 0}
							{score = 0}
							{score = 0}
						]
					}
				]
			}
		]
	endif
	return Player_list = <Player_list>
endscript

script get_match_type_leaderboard_info 
	if NOT ($game_mode = p2_battle)
		net_stats_calculate_total_scores
		player1_score = <p1_score>
		CastToInteger \{player1_score}
		player2_score = <p2_score>
		CastToInteger \{player2_score}
		return {
			write_type = Max
			score1 = <player1_score>
			attrib_acum1 = <player1_score>
			attrib_score1 = <player1_score>
			attrib_tot1 = 0
			score2 = <player2_score>
			attrib_acum2 = <player2_score>
			attrib_score2 = <player2_score>
			attrib_tot2 = 0
		}
	else
		return {
			write_type = ACCUMULATE
			score1 = <p1_wins_value>
			attrib_acum1 = <p1_wins_value>
			attrib_score1 = <p1_wins_value>
			attrib_tot1 = 0
			score2 = <p2_wins_value>
			attrib_acum2 = <p2_wins_value>
			attrib_score2 = <p2_wins_value>
			attrib_tot2 = 0
		}
	endif
endscript

script network_player_lobby_message 
	if NOT ((<Type> = open_comm) || (<Type> = ready_up))
		return
	endif
	switch <Type>
		case character_select
		<selection_type> = 0
		case character_hub_select
		<selection_type> = 1
		case outfit_select
		<selection_type> = 2
		case style_select
		<selection_type> = 3
		case guitar_select
		<selection_type> = 4
		case skin_select
		<selection_type> = 5
		case song_select
		<selection_type> = 6
		case ready_up
		<selection_type> = 7
		case open_comm
		<selection_type> = 8
	endswitch
	switch <action>
		case update
		<selection_action> = 0
		case deselect
		<selection_action> = 1
		case select
		<selection_action> = 2
	endswitch
	if GotParam \{value1}
		<selection_index1> = <value1>
	else
		<selection_index1> = 0
	endif
	if GotParam \{value2}
		<selection_index2> = <value2>
	else
		<selection_index2> = 0
	endif
	if GotParam \{checksum}
		<checksum_value> = <checksum>
	else
		<checksum_value> = NULL
	endif
	lobby_data = {
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index1 = <selection_index1>
		selection_index2 = <selection_index2>
		net_checksum = <checksum_value>
	}
	SendStructure callback = network_player_lobby_update data_to_send = {lobby_data = <lobby_data>}
endscript

script net_request_play_show 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if (<action> = 1)
		if ($p1_ready = 0)
			if ScreenElementExists \{id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		endif
	else
		if ($p1_ready = 1)
			if ScreenElementExists \{id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		else
			character_hub_go_back \{Player = 1}
		endif
	endif
endscript

script net_request_play_show_ack 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if GotParam \{action}
		if (<action> = 0)
			if (<Player> = 1)
				character_hub_go_back Player = <Player>
			else
				character_hub_net_ready_back
			endif
		else
			if (<Player> = 1)
				character_hub_select_play_show Player = <Player>
				if ScreenElementExists \{id = vmenu_character_hub_p1}
					LaunchEvent \{Type = focus
						target = vmenu_character_hub_p1}
				endif
			else
				character_hub_net_ready
			endif
		endif
	endif
endscript

script net_pausegh 
	printf \{qs(0x13c91937)}
	Change \{net_pause = 1}
	broadcastevent \{Type = event_pause_game}
	generic_event_choose \{state = Uistate_pausemenu}
	Wait \{1
		gameframe}
endscript

script net_unpausegh 
	printf \{qs(0x8609ed1f)}
	if GotParam \{from_pause}
		ui_event_block event = menu_back data = {state = Uistate_gameplay from_pause = <from_pause>}
	else
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	Change \{net_pause = 0}
endscript

script gameinvite_server_unavailable 
	printf \{qs(0x071785f3)}
	net_party_attempted_join_result \{join_result = 0
		join_mode = failed_invite_search
		reason = bad_state}
endscript

script destroy_join_refuse_dialog 
	destroy_connection_dialog_scroller
	destroy_popup_warning_menu
endscript

script CreateJoinRefusedDialog 
	printf \{qs(0x663aa339)}
	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	switch (<reason>)
		case net_reason_banned
		<connection_msg> = qs(0x790a47bc)
		case net_status_join_timeout
		<connection_msg> = qs(0x790a47bc)
		case net_reason_full_observers
		<connection_msg> = qs(0x790a47bc)
		case net_reason_wrong_password
		<connection_msg> = qs(0x790a47bc)
		case net_reason_default
		<connection_msg> = qs(0x790a47bc)
		case net_reason_rank_limit_low
		<connection_msg> = qs(0x790a47bc)
		case net_reason_rank_limit_high
		<connection_msg> = qs(0x790a47bc)
		case net_reason_default
		<connection_msg> = qs(0x790a47bc)
		case net_reason_full
		<connection_msg> = qs(0x251ba308)
	endswitch
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = net_popup_container
		id = connection_dialog_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		Pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		Type = VMenu
		parent = connection_dialog_scroller
		id = connection_dialog_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose destroy_popup_warning_menu}
			{pad_choose ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_choose cancel_join_server}
			{pad_choose destroy_join_refuse_dialog}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		z = 200.1
		text = qs(0x182f0173)}
	CreateScreenElement {
		Type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = <connection_msg>
		Pos = (640.0, 300.0)
		dims = (375.0, 200.0)
		z_priority = 200.0
		just = [center center]
	}
	LaunchEvent \{Type = focus
		target = connection_dialog_vmenu}
endscript

script create_net_popup \{title = qs(0x00000000)
		popup_text = qs(0x00000000)}
	SpawnScriptNow \{0x928a98c9}
	destroy_net_popup
	Change \{net_popup_active = 1}
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <popup_text>
		}
		no_background
	}
endscript

script append_animating_dots 
	printf \{qs(0xcbc6ba89)}
	num_dots = 0
	if ScreenElementExists id = <id>
		begin
		formatText TextName = new_text qs(0x5994d4f6) a = <text> b = ($dots_array [<num_dots>])
		<id> :se_setprops text = <new_text>
		if (<num_dots> = 3)
			<num_dots> = 0
		else
			<num_dots> = (<num_dots> + 1)
		endif
		Wait \{0.5
			Second}
		repeat
	endif
endscript

script destroy_net_popup 
	Change \{net_popup_active = 0}
	destroy_popup_warning_menu
endscript

script ShowJoinTimeoutNotice 
	spawnscript \{0x33198701}
endscript

script 0x33198701 
	begin
	ui_event_get_top
	if NOT (<base_name> = 'online')
		cancel_career_search_early
		break
	else
		if cancel_start_matchmaking
			break
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
	destroy_popup_warning_menu
	destroy_generic_popup
	if (<base_name> = 'online')
		set_focus_color rgba = ($0xb603fdb0)
		set_unfocus_color rgba = ($online_lobby_item_text_color)
	endif
	ui_event_wait_for_safe
	create_new_generic_popup \{popup_type = error_menu
		text = qs(0x3fd06963)
		error_func = 0x4321c536}
endscript

script 0x4321c536 
	destroy_generic_popup
	ui_event_get_top
	if (<base_name> = 'online')
		set_focus_color rgba = ($0xb603fdb0)
		set_unfocus_color rgba = ($online_lobby_item_text_color)
	elseif (<base_name> = 'band_mode')
		ui_event \{event = menu_refresh}
	endif
endscript

script timeout_connection_attempt 
	create_timeout_dialog
endscript

script FailedToCreateGame 
	cancel_join_server
	setup_sessionfuncs
	create_failed_connection_dialog
endscript

script destroy_connection_dialog_scroller 
	if ScreenElementExists \{id = connection_dialog_scroller}
		DestroyScreenElement \{id = connection_dialog_scroller}
	endif
	destroy_net_popup
endscript

script create_timeout_dialog 
	cancel_start_matchmaking
	destroy_generic_popup
	create_new_generic_popup \{popup_type = error_menu
		text = qs(0x3fd06963)
		error_func = destroy_generic_popup}
	return
endscript

script create_failed_connection_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement \{Type = VScrollingMenu
		parent = root_window
		id = connection_dialog_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		Pos = (640.0, 380.0)
		z_priority = 1.0}
	CreateScreenElement {
		Type = VMenu
		parent = connection_dialog_scroller
		id = connection_dialog_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_choose cancel_join_server}
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		z = 200.1
		text = qs(0x182f0173)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = qs(0x2677f0a3)
		Pos = (640.0, 315.0)
		dims = (375.0, 200.0)
		z_priority = 200.0
		just = [center center]
	}
	LaunchEvent \{Type = focus
		target = connection_dialog_vmenu}
endscript

script net_repeat_last_search 
	Wait \{1
		gameframe}
	ui_flow_manager_respond_to_action \{action = select_done}
endscript

script check_if_selecting_tie_breaker \{Player = 1}
	if IsHost
		if (($tie_breaker = HOST) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
	else
		if (($tie_breaker = HOST) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
	endif
	return \{selecting_tiebreaker = 0}
endscript

script test_events \{passed_in_value = 'test value'}
	printf \{qs(0x37c22cf4)}
	printstruct <...>
	NetSessionFunc \{Obj = stats
		func = write_key_value
		params = {
			wtf_value = 'test value'
			key = 'test key'
		}}
endscript

script net_failed_signin 
	printf \{qs(0xa15e7d04)}
	if ($respond_to_signin_changed = 0)
		return
	endif
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script xbox360_live_not_allowed 
	printf \{'xbox360_live_not_allowed'}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	create_menu_backdrop \{texture = xb_online_bg}
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back online_signin_select_cancel}
	]
	z = 100.0
	<menu_pos> = (640.0, 465.0)
	<bookend_r_pos> = (710.0, 533.0)
	<bookend_l_pos> = (500.0, 533.0)
	new_menu scrollid = sign_in_scoller vmenuid = sign_in_vmenu use_backdrop = (0) menu_pos = <menu_pos> just = [left top] event_handlers = <event_handlers> spacing = -45
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = signin_container
		Pos = (0.0, 0.0)}
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = signin_container
		z = 5}
	displaySprite \{parent = signin_container
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = signin_container
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		Pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	displaySprite \{parent = signin_container
		id = options_bg_1
		tex = dialog_menu_bg
		Pos = (640.0, 500.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			botom
		]}
	displaySprite \{parent = signin_container
		id = options_bg_2
		tex = dialog_menu_bg
		Pos = (640.0, 530.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			top
		]
		flip_h}
	CreateScreenElement \{Type = TextElement
		parent = signin_container
		font = fontgrid_title_a1
		Scale = 1.3
		rgba = [
			223
			223
			223
			250
		]
		text = qs(0xaa163738)
		just = [
			center
			top
		]
		z_priority = 10.0
		Pos = (640.0, 175.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	if isXenon
		<sign_in_text> = qs(0x076f1bf2)
	else
		if GotParam \{age_restricted}
			<sign_in_text> = qs(0x052f0757)
		else
			<sign_in_text> = qs(0xb7c0cb6f)
		endif
	endif
	Scale = 1
	StringLength string = <sign_in_text>
	printf qs(0xc76cea38) d = <str_len>
	if (<str_len> >= 135)
		<Scale> = 0.8
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = signin_container
		font = fontgrid_title_a1
		Scale = 0.6
		rgba = [210 210 210 250]
		text = <sign_in_text>
		just = [center top]
		internal_just = [center top]
		internal_scale = <Scale>
		z_priority = 10.0
		Pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	CreateScreenElement \{Type = ContainerElement
		parent = sign_in_vmenu
		dims = (0.0, 100.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = go_back
				}
			}
		]}
	container_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = qs(0x182f0173)
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		just = [right center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = sign_in_vmenu}
endscript

script xenon_auto_load_progress 
	printf \{qs(0x280d9b3b)}
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		if ($online_signin_autoload_required = 1)
			Change \{online_signin_autoload_required = 0}
			Change \{respond_to_signin_changed = 0}
			printf \{'respond_to_signin_changed = 0'}
			printscriptinfo
			fadetoblack \{On
				time = 0
				alpha = 1.0
				z_priority = 20000
				id = invite_screenfader}
			Wait \{1
				gameframe}
			StopRendering
			shutdown_game_for_signin_change \{signin_change = 1}
			LaunchEvent \{Type = unfocus
				target = root_window}
			StartRendering
			Wait \{1
				gameframe}
			fadetoblack \{OFF
				time = 0
				id = invite_screenfader}
			Wait \{1
				gameframe}
			Change invite_controller = ($primary_controller)
			ui_event \{event = menu_change
				data = {
					state = uistate_boot_iis
					clear_previous_stack
				}}
		else
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script scale_element_to_size \{time = 0}
	if NOT GotParam \{id}
		printf \{'Did not pass in id to scale_element_to_size! Returning'}
		return
	endif
	GetScreenElementDims id = <id>
	orig_height = <height>
	orig_width = <width>
	if NOT GotParam \{target_width}
		target_width = <orig_width>
	endif
	if NOT GotParam \{target_height}
		target_height = <orig_height>
	endif
	xScale = (<target_width> / (<orig_width> * 1.0))
	yScale = (<target_height> / (<orig_height> * 1.0))
	<id> :legacydomorph Scale = (<xScale> * (1.0, 0.0) + <yScale> * (0.0, 1.0)) time = <time>
endscript

script translate_screen_element \{time = 0}
	if NOT GotParam \{id}
		printf \{'Did not pass in id to translate_screen_element! Returning'}
		return
	endif
	if NOT GotParam \{Pos}
		GetScreenElementPosition id = <id>
		new_position = <screenelementpos>
	else
		new_position = <Pos>
	endif
	<id> :legacydomorph Pos = <new_position> time = <time>
endscript

script get_my_highway_layout 
	Player = 1
	begin
	<player_status> = ($0x2994109a [<Player>])
	if ($<player_status>.is_local_client)
		return my_highway = ($<player_status>.highway_layout)
	endif
	<Player> = (<Player> + 1)
	repeat 2
endscript

script agora_update 
	printf \{qs(0xdd557c5f)}
	if ($coop_dlc_active = 1)
		printf \{qs(0xa236d985)}
		return
	endif
	printf \{qs(0xbc6972f7)}
	NetSessionFunc \{func = stats_init}
	get_game_mode_name
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	formatText TextName = band_name '%s' s = <Name>
	progression_info = {}
	if NOT GotParam \{new_band}
		get_completed_percentage \{part = guitar}
		get_progression_globals \{career_guitar}
		summation_career_score tier_global = <tier_global>
		appendstruct {
			struct = progression_info
			Field = guitar_career
			params = {
				score = <career_score>
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = bass}
		get_progression_globals \{career_bass}
		summation_career_score tier_global = <tier_global>
		appendstruct {
			struct = progression_info
			Field = bass_career
			params = {
				score = <career_score>
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = drum}
		get_progression_globals \{career_drum}
		summation_career_score tier_global = <tier_global>
		appendstruct {
			struct = progression_info
			Field = drum_career
			params = {
				score = <career_score>
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = vocals}
		get_progression_globals \{career_vocals}
		summation_career_score tier_global = <tier_global>
		appendstruct {
			struct = progression_info
			Field = vocals_career
			params = {
				score = <career_score>
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = Band}
		get_progression_globals \{career_band}
		summation_career_score tier_global = <tier_global>
		appendstruct {
			struct = progression_info
			Field = band_career
			params = {
				score = <career_score>
				percent_complete = <completed_percentage>
			}
		}
	endif
	WriteUpdate {progression_info = <progression_info> band_name = <band_name> band_id = <band_id> cash = <career_earnings>}
endscript

script net_get_character_name \{Player = 1
		check_profanity = 1}
	RequireParams \{[
			Player
		]
		all}
	<player_status> = ($0x2994109a [<Player>])
	if (($<player_status>.is_local_client) = 1)
		get_savegame_from_player_status player_status = <player_status>
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	id = ($<player_status>.character_id)
	if searchmusicianprofilearray array_name = net_musician_profiles id = <id>
		id = (($net_musician_profiles [<index>]).old_character_id)
	endif
	resolve_guest_character_id id = <id>
	if band_builder_is_random character_id = <id>
		id = customcharacter
	endif
	if (<check_profanity> = 1)
		get_fullname_of_character id = <id> savegame = <savegame>
	else
		get_fullname_of_character id = <id> savegame = <savegame> profanity_allowed
	endif
	printstruct <...>
	return display_name = <fullname> character_id = <id>
endscript

script agora_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{qs(0xab65adaf)
		s = $game_mode}
	if ($boss_battle = 1)
		return
	endif
	if ($is_network_game)
		getplayerinfo \{1
			gamertag}
		p1_name = $<gamertag>
		getplayerinfo \{2
			gamertag}
		p2_name = $<gamertag>
		retrieve_player_net_id \{Player = 2}
		player_id2 = <net_id>
	else
		player_id2 = ($player2_status.controller)
	endif
	venue = (($LevelZones.$current_level).Name)
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	gamemode_gettype
	switch (<Type>)
		case quickplay
		mode = 'quickplay'
		case faceoff
		mode = 'faceoff'
		case pro_faceoff
		mode = 'pro_faceoff'
		case career
		mode = 'career'
		case battle
		mode = 'battle'
		default
		mode = 'quickplay'
	endswitch
	gamemode_getnumplayers
	if (<num_players> > 1)
		participants_info = []
		index = 1
		begin
		getplayerinfo <index> score
		getplayerinfo <index> stars
		getplayerinfo <index> notes_hit
		getplayerinfo <index> total_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		getplayerinfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		getplayerinfo <index> controller
		<net_id> = [0 0]
		getplayerinfo <index> is_local_client
		getplayerinfo <index> bot_play
		if (<bot_play> = 1)
			return
		endif
		if (<is_local_client> = 1)
			if (<controller> > 3)
				<controller> = (<controller> - 4)
			endif
			GetNetID controller_index = <controller>
		else
			getplayerinfo <index> net_id_first
			getplayerinfo <index> net_id_second
		endif
		SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
		if gamemode_iscooperative
			<winner> = 1
			score = ($band1_status.score)
		else
			if (<num_players> > 2)
				getplayerinfo \{1
					team}
				<player1_team> = <team>
				getplayerinfo <index> team
				if (<player1_team> = <team>)
					score = ($band1_status.score)
					if (($band1_status.score) > ($band2_status.score))
						<winner> = 1
					else
						<winner> = 0
					endif
				else
					score = ($band2_status.score)
					if (($band2_status.score) > ($band1_status.score))
						<winner> = 1
					else
						<winner> = 0
					endif
				endif
			else
				if (<Type> = battle)
					if ($is_network_game = 1)
						getplayerinfo \{1
							save_health}
						player1_score = <save_health>
						getplayerinfo \{2
							save_health}
						player2_score = <save_health>
					else
						getplayerinfo \{1
							current_health}
						player1_score = <current_health>
						getplayerinfo \{2
							current_health}
						player2_score = <current_health>
					endif
					getplayerinfo <index> score
					if (<index> = 1)
						if (<player1_score> > <player2_score>)
							<winner> = 1
						else
							<winner> = 0
						endif
					else
						if (<player2_score> > <player1_score>)
							<winner> = 1
						else
							<winner> = 0
						endif
					endif
				else
					getplayerinfo \{1
						score}
					player1_score = <score>
					getplayerinfo \{2
						score}
					player2_score = <score>
					if (<index> = 1)
						<score> = <player1_score>
						if (<player1_score> > <player2_score>)
							<winner> = 1
						else
							<winner> = 0
						endif
					else
						<score> = <player2_score>
						if (<player2_score> > <player1_score>)
							<winner> = 1
						else
							<winner> = 0
						endif
					endif
				endif
			endif
		endif
		CastToInteger \{score}
		create_agora_character_struct Player = <index>
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			winner = <winner>
			stars = <stars>
			notes_hit = <notes_hit>
			notes_missed = (<total_notes> - <notes_hit>)
			best_streak = <best_run>
			failed_attempts = ($agora_failed_attempts)
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			difficulty = <difficulty_text>
			part = <part_text>
			lefty_flip = <lefty_flip>
			character = <agora_character>
		}
		AddArrayElement array = <participants_info> element = <new_participant_info>
		<participants_info> = <array>
		<index> = (<index> + 1)
		repeat <num_players>
		WriteMultiPerformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner>
	else
		index = 1
		getplayerinfo <index> score
		getplayerinfo <index> stars
		getplayerinfo <index> notes_hit
		getplayerinfo <index> total_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		getplayerinfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		retrieve_player_net_id Player = <index>
		CastToInteger \{score}
		<net_id> = [0 0]
		getplayerinfo <index> is_local_client
		if (<is_local_client> = 1)
			GetNetID controller_index = <controller>
		else
			getplayerinfo <index> net_id_first
			getplayerinfo <index> net_id_second
		endif
		SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
		create_agora_character_struct Player = <index>
		participant_info = {
			player_id = <net_id>
			score = <score>
			winner = 1
			stars = <stars>
			notes_hit = <notes_hit>
			notes_missed = (<total_notes> - <notes_hit>)
			best_streak = <best_run>
			failed_attempts = ($agora_failed_attempts)
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			difficulty = <difficulty_text>
			part = <part_text>
			lefty_flip = <lefty_flip>
			character = <agora_character>
		}
		WritePerformance mode = <mode> title = <title> participant_info = <participant_info> band_id = <band_id> venue = <venue>
	endif
	Change \{agora_failed_attempts = 0}
endscript

script WritePerformance 
	if isngc
		num_cheats = 0
		if ($cheat_alwaysslide = 1)
			<num_cheats> = (<num_cheats> + 1)
		endif
		if ($cheat_autokick = 1)
			<num_cheats> = (<num_cheats> + 1)
		endif
		if ($Cheat_PerformanceMode = 1)
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	printf \{qs(0x91d6b9d1)}
	printstruct <...>
	NetSessionFunc Obj = stats func = write_performance params = {<...>}
endscript

script WriteMultiPerformance 
	if isngc
		num_cheats = 0
		if NOT ($is_network_game)
			if ($cheat_alwaysslide = 1)
				<num_cheats> = (<num_cheats> + 1)
			endif
			if ($cheat_autokick = 1)
				<num_cheats> = (<num_cheats> + 1)
			endif
			if ($Cheat_PerformanceMode = 1)
				<num_cheats> = (<num_cheats> + 1)
			endif
		endif
	endif
	printf \{qs(0x2aa91cf6)}
	printstruct <...>
	NetSessionFunc Obj = stats func = write_multi_match params = {<...>}
endscript

script WriteUpdate \{band_id = 0
		band_name = 'test name'
		cash = 100
		achievements = 'temp achievement string'}
	printf \{qs(0xfa3358a6)}
	printstruct <...>
	NetSessionFunc Obj = stats func = write_update params = {<...>}
endscript

script invite_accepted 
	printf 'invite_accepted - controllerID %c' c = <controllerid>
	Change invite_controller = <controllerid>
	if ($primary_controller_assigned = 0)
		printf \{'invite_accepted - primary controller not yet assigned!'}
		return
	else
		printf 'invite_accepted - $primary_controller %p' p = ($primary_controller)
	endif
	do_join_invite_stuff <...> accepted_invite
endscript

script accepted_invite_agree 
	destroy_popup_warning_menu
	if (GameIsPaused)
		unpausegh3
	endif
	do_join_invite_stuff <...> accepted_invite
endscript

script accepted_invite_disagree 
	destroy_popup_warning_menu
	if (GameIsPaused)
		create_pause_menu
	else
		pausegh3
	endif
endscript

script send_fail_song_message \{wait_frames = 30
		quit_early = 0}
	if (IsHost)
		loser = 0
	else
		loser = 1
	endif
	gamemode_getnumplayersshown
	begin
	SendNetMessage {
		Type = fail_song
		note_streak = ($player1_status.best_run)
		notes_hit = ($player1_status.notes_hit)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = <quit_early>
		loser = <loser>
	}
	repeat <num_players_shown>
	Wait <wait_frames> gameframes
endscript

script do_join_invite_stuff 
	printf \{'do_join_invite_stuff'}
	if GotParam \{accepted_invite}
		if ($invite_controller = $primary_controller)
			<invited_primary_controller> = true
		else
			<invited_primary_controller> = FALSE
		endif
		printf qs(0x867bec5c) i = <invited_primary_controller>
		Change \{online_signin_autoload_required = 0}
		wait_for_safe_shutdown
		printf \{qs(0x1c9bd5e2)}
		disable_pause
		quit_network_game_early
		unpausespawnedscript \{ui_event_block}
		if (<invited_primary_controller> = true)
			create_loading_screen \{no_bink}
		endif
		ui_event_wait_for_safe
		end_singleplayer_game
		if islocallysignedin controller = ($primary_controller)
			if CheckForSignIn controller_index = ($primary_controller)
				net_init
			endif
		endif
		Change \{has_invite_join_result_callback_completed = 0}
		if (<invited_primary_controller> = true)
			SetButtonEventMappings \{block_menu_input}
			ui_event_block \{event = menu_replace
				data = {
					state = uistate_mainmenu
					base_name = 'mainmenu'
					selected_index = 3
					clear_previous_stack
					ignore_camera = 1
				}}
			ui_event_remove_params \{param = ignore_camera}
			SetButtonEventMappings \{unblock_menu_input}
		else
			ui_event_block event = menu_replace data = {state = uistate_signin device_num = ($invite_controller) clear_previous_stack}
			return
		endif
		Change \{invite_controller = -1}
		xenon_singleplayer_session_begin_uninit
		UnPauseGame
		JoinInviteServer
	else
		printf \{qs(0x373f8c46)}
		0xf7e0f992 \{Wait
			0xdf3c5641}
		generic_event_choose \{state = uistate_online}
	endif
endscript

script ui_print_gamertags \{pos1 = (235.0, 100.0)
		pos2 = (1045.0, 100.0)
		just1 = [
			left
			top
		]
		just2 = [
			right
			top
		]
		offscreen = 0}
endscript

script ui_print_gamertag start_pos = (235.0, 100.0) Color = ($player1_color) Player = 1 dims = (450.0, 35.0) z = 60 offscreen = 0
	return
	if NOT GotParam \{Name}
		net_get_character_name Player = <Player>
		Name = <display_name>
	endif
	if NOT ScreenElementExists \{id = gamertag_container}
		if (<offscreen> = 1)
			CreateScreenElement {
				Type = ContainerElement
				id = gamertag_container
				parent = root_window
				Pos = (0.0, -400.0)
				just = [center center]
				z_priority = <z>
			}
		else
			CreateScreenElement {
				Type = ContainerElement
				id = gamertag_container
				parent = root_window
				Pos = (0.0, 0.0)
				just = [center center]
				z_priority = <z>
			}
		endif
	endif
	formatText checksumName = gamertag_text_px 'gamertag_text_p%d' d = <Player>
	formatText checksumName = debug_gamertag_container_px 'debug_gamertag_container_p%d' d = <Player>
	formatText checksumName = gt_frame_top 'gt_frame_top_p%d' d = <Player>
	formatText checksumName = gt_frame_top_fill 'gt_frame_top_fill_p%d' d = <Player>
	formatText checksumName = gt_frame_bottom 'gt_frame_bottom_p%d' d = <Player>
	formatText checksumName = gt_frame_bottom_fill 'gt_frame_bottom_fill_p%d' d = <Player>
	if (ScreenElementExists id = <gamertag_text_px>)
		if ScreenElementExists \{id = gamertag_icon_container}
			SetScreenElementProps \{id = gamertag_icon_container
				alpha = 1}
		endif
		return
	endif
	CreateScreenElement {
		Type = TextElement
		parent = gamertag_container
		font = fontgrid_title_a1
		rgba = <Color>
		text = <Name>
		id = <gamertag_text_px>
		Pos = (<start_pos> + (0.0, 3.0))
		just = <just>
		Scale = 0.75
		z_priority = (<z> + 1)
	}
	GetScreenElementDims id = <gamertag_text_px>
	x_dim = ((<dims>.(1.0, 0.0)) * 0.5625)
	y_dim = (<dims>.(0.0, 1.0) * 0.75)
	x_scale = 1.0
	y_scale = 1.0
	if (<width> > <x_dim>)
		<x_scale> = (<x_dim> / <width>)
	endif
	if (<height> > <y_dim>)
		<y_scale> = (<y_dim> / <height>)
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> + (0.0, 1.0) * <y_scale>)
	SetScreenElementProps {id = <gamertag_text_px> Scale = <scale_pair>}
	GetScreenElementDims id = <gamertag_text_px>
	text_w = (<width> + 80)
	text_h = (<dims>.(0.0, 1.0) + 10)
	GetScreenElementDims id = <gt_frame_top>
	frame_w = (<width> / 1.0)
	frame_h = (<height> / 1.0)
	frame_scale_x = (<text_w> / <frame_w>)
	frame_scale_y = (<text_h> / <frame_h>)
	frame_scale = ((<frame_scale_x> * (1.0, 0.0)) + (<frame_scale_y> * (0.0, 0.5625)))
	SetScreenElementProps {id = <gt_frame_top> Scale = <frame_scale>}
	SetScreenElementProps {id = <gt_frame_top_fill> Scale = <frame_scale>}
	x_adjust = (0.0, 0.0)
	y_adjust = (0.0, 0.0)
	y_adjust = ((0.0, 1.0) * ((-5 * <y_scale>) -5))
	if ((<just> [0]) = right)
		x_adjust = ((1.0, 0.0) * 40)
	elseif ((<just> [0]) = left)
		x_adjust = ((1.0, 0.0) * -40)
	endif
	new_pos = (<start_pos> + (<x_adjust> + <y_adjust>))
	SetScreenElementProps {id = <gt_frame_top> Pos = <new_pos>}
	SetScreenElementProps {id = <gt_frame_top_fill> Pos = <new_pos>}
	GetScreenElementProps id = <gt_frame_top>
	GetScreenElementDims id = <gt_frame_top>
	GetPlatform
	if (<Player> = 2 && <Platform> = Xenon)
		GetScreenElementDims id = <id>
		tag_width = 0
		if ((<just> [0]) = -1)
			<tag_width> = <width>
		elseif ((<just> [0]) = 0)
			<tag_width> = (<width> * 0.5)
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = gamertag_container
			id = gamertag_icon_container
			Pos = (<Pos> + (<height> * (0.0, 1.0)) + (<tag_width> * (1.0, 0.0)) + (-40.0, 23.0))
		}
		displayText {
			parent = gamertag_icon_container
			text = qs(0x9a7d1fe5)
			just = [right top]
			rgba = [0 0 0 255]
			noshadow
			Pos = (0.0, 5.0)
			Scale = 0.5
			font = ($user_control_text_font)
			z = (<z> + 200)
		}
		GetScreenElementDims id = <id>
		text_end = (<width> * (1.0, 0.0) + (20.0, 0.0))
		text_begin = ((-30.0, 0.0) - (<width> * (1.0, 0.0)))
		displayText {
			parent = gamertag_icon_container
			text = qs(0x57ea8b0f)
			Pos = (<text_begin> + (20.0, -1.0))
			just = [right top]
			font = ($gh3_button_font)
			Scale = 0.5
			z = (<z> + 200)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_end
			Pos = (10.0, 15.0)
			just = [right center]
			dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_body
			Pos = (0.0, 15.0)
			just = [right center]
			dims = ((32.0, 32.0) + <width> * (1.0, 0.0))
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_end
			Pos = ((0.0, -2.0) - <width> * (1.0, 0.0) - (32.0, 0.0))
			just = [right top]
			dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			z = (<z> + 100)
			flip_v
		}
	endif
endscript

script destroy_gamertags 
	if ScreenElementExists \{id = gamertag_container}
		DestroyScreenElement \{id = gamertag_container}
	endif
	if ScreenElementExists \{id = gamertag_container_p1}
		DestroyScreenElement \{id = gamertag_container_p1}
	endif
	if ScreenElementExists \{id = gamertag_container_p2}
		DestroyScreenElement \{id = gamertag_container_p2}
	endif
	if ScreenElementExists \{id = debug_gamertag_container_p1}
		DestroyScreenElement \{id = debug_gamertag_container_p1}
	endif
	if ScreenElementExists \{id = debug_gamertag_container_p2}
		DestroyScreenElement \{id = debug_gamertag_container_p2}
	endif
endscript

script destroy_gamertag_container \{Player = 1}
	formatText checksumName = gamertag_container 'gamertag_container_p%d' d = <Player>
	if ScreenElementExists id = <gamertag_container>
		DestroyScreenElement id = <gamertag_container>
	endif
endscript

script morph_gamertags 
	if ScreenElementExists \{id = gamertag_container}
		move_gamertag_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_gamertag_pos) + (<delta> * ((($g_hud_2d_struct_used).final_gamertag_pos) + <off_set>)))
		legacydoscreenelementmorph id = gamertag_container Pos = <move_gamertag_pos> time = <time_to_move>
		if ScreenElementExists \{id = gamertag_icon_container}
			SetScreenElementProps \{id = gamertag_icon_container
				alpha = 0}
		endif
	endif
endscript

script test_write_leaderboards 
	printf \{qs(0xdf4178e8)}
	begin_singleplayer_game
	Wait \{0.3
		Seconds
		ignoreslomo}
	if NOT should_update_stats_leader_board
		return
	endif
	NetSessionFunc Obj = stats func = write_stats params = {leaderboard_id = anarchy_in_the_uk score = 10000 rating = <rating_val>}
endscript

script test_read_leaderboards 
	NetSessionFunc \{Obj = stats
		func = get_stats
		params = {
			leaderboard_id = m_test_gh3
			callback = test_callback
			num_rows = 10
			listtype = rating
			rating_val = 5
			columns = 0
		}}
endscript

script menu_show_gamercard 
	if NOT (($is_network_game) && (isXenon))
		return
	endif
	retrieve_player_net_id \{Player = 2}
	NetSessionFunc func = showGamerCard params = {player_xuid = <net_id>}
endscript

script menu_show_gamercard_from_netid 
	RequireParams \{[
			device_num
		]
		all}
	if CheckForSignIn controller_index = <device_num>
		if NOT ($is_network_game = 1)
			return
		endif
		if GotParam \{net_id}
			NetSessionFunc func = showGamerCard params = {player_xuid = <net_id> controller_index = <device_num>}
		endif
	endif
endscript

script win_now 
	ExtendCrc \{song_won
		'p1'
		out = Type}
	broadcastevent Type = <Type> data = {song_complete = 1}
endscript
new_message_of_the_day = 0

script splash_callback 
	printf \{qs(0x7cd3e629)}
	printstruct <...>
	if GotParam \{motd_text}
		Change \{new_message_of_the_day = 1}
	else
		Change \{new_message_of_the_day = 0}
	endif
endscript

script test_send 
	test1 = 'does this get sent?'
	test2 = DoesThisGetSent
	test3 = DoesThisGetSent2
	printstruct <...>
	SendStructure callback = test_callback data_to_send = <...>
endscript

script test_callback 
	printf \{qs(0xebc04aee)}
	printstruct <...>
endscript

script cleanup_online_lobby_select 
	destroy_pause_menu_frame \{container_id = net_quit_warning}
	if ScreenElementExists \{id = ready_container_p1}
		DestroyScreenElement \{id = ready_container_p1}
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	destroy_pause_menu_frame
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	if ScreenElementExists \{id = leaving_lobby_dialog_menu}
		DestroyScreenElement \{id = leaving_lobby_dialog_menu}
	endif
	destroy_gamertags
	shut_down_flow_manager \{Player = 2}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_character_hub_p1}
	destroy_menu \{menu_id = character_hub_p1_container}
	destroy_menu \{menu_id = scrolling_character_hub_p2}
	destroy_menu \{menu_id = character_hub_p2_container}
	KillCamAnim \{Name = gs_view_cam}
	<Player> = 1
	begin
	formatText checksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <Player>
	formatText checksumName = s_container 's_container_p%i' i = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	formatText checksumName = scrolling_select_style 'scrolling_select_style_p%i' i = <Player>
	formatText checksumName = s_container 's_container_p%i' i = <Player>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	destroy_menu \{menu_id = scrolling_select_guitar_p1}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = select_finish_container}
	destroy_menu \{menu_id = scrolling_select_guitar_p2}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	destroy_menu \{menu_id = select_guitar_container_p2}
	destroy_menu \{menu_id = select_finish_container_p2}
	<Player> = 1
	begin
	<player_status> = ($0x2994109a [<Player>])
	<band_member> = ($<player_status>.band_member)
	if CompositeObjectExists Name = <band_member>
		if <band_member> :Anim_AnimNodeExists id = BodyTimer
			<band_member> :Anim_Command target = BodyTimer Command = Timer_SetSpeed params = {speed = 1.0}
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	formatText checksumName = scrolling_select_finish 'scrolling_select_finish_p%i' i = <Player>
	destroy_menu menu_id = <scrolling_select_finish>
	<Player> = (<Player> + 1)
	repeat 2
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script RemoveObserverBG 
endscript

script net_disable_pause 
	if ($net_pause = 1)
		net_unpausegh \{from_pause = 1}
	endif
	disable_pause
endscript

script net_fail_coop_song 
	printf \{qs(0x4a48ff2b)}
	net_disable_pause
	Change \{disable_attacks = 1}
	Change \{recovered_dropped_players = 0}
	Change \{net_num_players_data_ack = 0}
	if (IsHost)
		i = 1
		gamemode_getnumplayersshown
		begin
		<player_status> = ($0x2994109a [<i>])
		if (($<player_status>.is_local_client) = 1)
			Change net_num_players_data_ack = ($net_num_players_data_ack + 1)
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		GetNumPlayers
		Change net_num_players_data_needed = <num_players>
		SendStructure callback = set_client_band_score data_to_send = {band_score = ($band1_status.score)}
	else
		player_data = {}
		i = 1
		gamemode_getnumplayersshown
		begin
		<player_status> = ($0x2994109a [<i>])
		if (($<player_status>.is_local_client) = 1)
			appendstruct {
				struct = player_data
				Field = <player_status>
				params = {
					obj_id = ($<player_status>.net_obj_id)
					score = ($<player_status>.score)
					best_run = ($<player_status>.best_run)
					max_notes = ($<player_status>.max_notes)
					notes_hit = ($<player_status>.notes_hit)
					stars = ($<player_status>.stars)
					vocal_streak_phrases = ($<player_status>.vocal_streak_phrases)
					vocal_phrase_quality = ($<player_status>.vocal_phrase_quality)
					vocal_phrase_max_qual = ($<player_status>.vocal_phrase_max_qual)
					total_notes = ($<player_status>.total_notes)
					new_cash = ($<player_status>.new_cash)
					career_earnings = ($<player_status>.career_earnings)
					cash_rank_up = ($<player_status>.cash_rank_up)
				}
			}
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		SendStructure callback = player_data_request_ack data_to_send = {player_data = <player_data>} to_server
	endif
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
	SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
endscript

script set_client_band_score 
	if GotParam \{band_score}
		printf qs(0x287bc806) s = <band_score>
		Change structurename = band1_status score = <band_score>
	endif
endscript

script net_battle_win_song 
	printf \{qs(0xea72635e)}
	net_disable_pause
	Change \{disable_attacks = 1}
	if (<losing_player> = 1)
		Change \{structurename = player1_status
			current_health = 0.0}
		Change \{structurename = player2_status
			current_health = 1.0}
	else
		Change \{structurename = player1_status
			current_health = 1.0}
		Change \{structurename = player2_status
			current_health = 0.0}
	endif
	GuitarEvent_SongWon \{battle_win = 1}
endscript

script add_searching_menu_item \{z = 2.1}
	if GotParam \{vmenu_id}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			dims = (210.0, 35.0)
			Pos = (0.0, 0.0)
			just = [center top]
			internal_just = [center top]
		}
		<container_element> = <id>
		<id> :se_setprops {
			event_handlers = [
				{focus searching_menu_focus params = {parent = <id>}}
				{unfocus searching_menu_unfocus params = {parent = <id>}}
				{pad_choose <choose_script>}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = <container_element>
			local_id = text_string
			font = fontgrid_title_a1
			Scale = 0.65000004
			rgba = ($online_light_blue)
			text = <text>
			just = [center top]
			Pos = (105.0, 0.0)
			z_priority = <z>
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_element>
			local_id = highlight_bar
			texture = white
			dims = (250.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (105.0, 10.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_element>
			local_id = left_bookend
			texture = character_hub_hilite_bookend
			dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (-20.0, 10.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_element>
			local_id = right_bookend
			texture = character_hub_hilite_bookend
			dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (240.0, 10.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
	endif
endscript

script searching_menu_focus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text_string}
		legacydoscreenelementmorph id = {<objID> child = text_string} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = highlight_bar}
		legacydoscreenelementmorph id = {<objID> child = highlight_bar} alpha = 1.0
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		legacydoscreenelementmorph id = {<objID> child = left_bookend} alpha = 1.0
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		legacydoscreenelementmorph id = {<objID> child = right_bookend} alpha = 1.0
	endif
endscript

script searching_menu_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text_string}
		legacydoscreenelementmorph id = {<objID> child = text_string} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = highlight_bar}
		legacydoscreenelementmorph id = {<objID> child = highlight_bar} alpha = 0.0
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		legacydoscreenelementmorph id = {<objID> child = left_bookend} alpha = 0.0
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		legacydoscreenelementmorph id = {<objID> child = right_bookend} alpha = 0.0
	endif
endscript

script set_other_player_present 
	printf \{qs(0xa77d698c)}
	if NOT ($player2_present)
		Change \{player2_present = 1}
		SpawnScriptNow \{net_hub_stream}
	endif
	if ScreenElementExists \{id = character_hub_p1_continue}
		character_hub_p1_continue :se_setprops \{rgba = [
				180
				100
				60
				255
			]
			unblock_events}
	endif
endscript

script test_multi_leaderboards 
	Player_list = [
		{
			leaderboards = [
				{
					write_type = Max
					leaderboard_id = anarchyintheuk
					rating = 4
					score = 100
					columns = [
						{
							score = 100
						}
						{
							score = 200
						}
						{
							score = 300
						}
					]
				}
				{
					write_type = Max
					leaderboard_id = avalancha
					rating = 3
					score = 100
					columns = [
						{
							score = 100
						}
						{
							score = 200
						}
						{
							score = 300
						}
					]
				}
			]
		}
	]
	NetSessionFunc Obj = stats func = stats_write_multiplayer params = {DontEndSessionAfterWrite <...>}
endscript

script retrieve_player_net_id 
	net_id = [0 0]
	if GotParam \{Player}
		<player_status> = ($0x2994109a [<Player>])
		SetArrayElement ArrayName = net_id index = 0 NewValue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 NewValue = ($<player_status>.net_id_second)
	else
		SetArrayElement ArrayName = net_id index = 0 NewValue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 NewValue = ($player1_status.net_id_second)
	endif
	printf \{qs(0xa9796959)}
	return net_id = <net_id>
endscript

script host_handle_dropped_client 
	printf \{qs(0x4409230f)}
	quit_network_game_early
	printf \{qs(0x9aa6e41d)}
	ui_event event = menu_back object = <object> data = {state = uistate_online} force_event = true
endscript

script drop_client_from_character_select 
	destroy_gamertags
	if (NetSessionFunc Obj = match func = get_gamertag)
		ui_print_gamertag Name = <Name> start_pos = (235.0, 50.0) Color = ($player1_color) Player = 1 just = [left top] dims = (450.0, 35.0)
	endif
	KillSpawnedScript \{Name = cs_rotate_hilites_p2}
	Change \{g_cs_scroll_ready_p2 = 1}
	Change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	Change \{player2_present = 0}
	destroy_menu \{menu_id = ready_container_p2}
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Hide
	endif
endscript

script host_wait_for_client 
	if NOT (IsHost)
		return
	endif
	create_net_popup \{popup_text = qs(0xff7ee260)
		add_waiting_dots
		Pos = (640.0, 275.0)}
	begin
	if ($player2_present = 1)
		break
	endif
	Wait \{30
		gameframes}
	repeat
	destroy_net_popup
	cs_event_handlers = [
		{pad_up cs_scroll_up_or_down params = {Player = 1 Dir = up}}
		{pad_down cs_scroll_up_or_down params = {Player = 1 Dir = down}}
		{pad_back net_cs_go_back params = {Player = 1}}
		{pad_choose character_select_choose params = {Player = 1}}
	]
	SetScreenElementProps id = vmenu_character_select_p1 event_handlers = <cs_event_handlers> replace_handlers
endscript

script net_battle_select_icon 
	begin
	if ScreenElementExists id = <icon_id>
		<icon_id> :se_setprops texture = <icon_texture>
		return
	endif
	Wait \{1
		gameframe}
	repeat 600
	printf qs(0x1da116d9) i = <icon_id>
endscript

script net_hub_stream 
	player_status = player1_status
	begin
	char_data = {
		char_id = ($player1_status.character_id)
	}
	SendStructure callback = update_net_character data_to_send = {char_data = <char_data>}
	Wait \{1
		Second}
	repeat
endscript

script update_net_character 
	player_status = player2_status
	change_made = 0
	char_id = (<char_data>.char_id)
	if NOT ($<player_status>.character_id = <char_id>)
		Change structurename = <player_status> character_id = <char_id>
		<change_made> = 1
	endif
endscript

script character_hub_net_ready 
	if NOT (ScreenElementExists id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	if ($p2_ready = 0)
		Change \{p2_ready = 1}
		if ScreenElementExists \{id = ready_container_p2}
			ready_container_p2 :Obj_SpawnScriptLater \{drop_in_ready_sign
				params = {
					Player = 2
				}}
		endif
	endif
	if (($p1_ready = 1) && ($p2_ready = 1))
		SetButtonEventMappings \{block_menu_input}
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		destroy_ready_icons
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
		KillSpawnedScript \{Name = net_hub_stream}
		ui_flow_manager_respond_to_action \{action = select_ready
			Player = 1
			create_params = {
				Player = 1
			}}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script character_hub_net_ready_back 
	Change \{p2_ready = 0}
	if NOT (ScreenElementExists id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	drop_out_ready_sign \{Player = 2}
endscript

script debug_print_coop_stats \{identifier = qs(0x00000000)}
	printf qs(0x4ef48891) s = <identifier>
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
	p1_note_streak = ($player1_status.best_run)
	p2_note_streak = ($player2_status.best_run)
	p1_total_notes = ($player1_status.total_notes)
	p2_total_notes = ($player2_status.total_notes)
	<p1_percent_complete> = (100 * $player1_status.notes_hit / $player1_status.total_notes)
	<p2_percent_complete> = (100 * $player2_status.notes_hit / $player2_status.total_notes)
	printstruct <...>
endscript

script get_musician_instrument_type 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<desc_id> = <info_struct>.desc_id)
		return instrument_type = (<info_struct>.Type)
	endif
	index = (<index> + 1)
	repeat <array_Size>
endscript

script scale_element_width_to_size \{max_text_width = 400}
	if NOT GotParam \{id}
		return
	endif
	GetScreenElementDims id = <id>
	if (<width> > <max_text_width>)
		SetScreenElementProps {
			id = <id>
			Scale = ((1.0, 0.0) + (0.0, 1.0) * (<text_scale>.(0.0, 1.0)))
		}
		scale_element_to_size {
			id = <id>
			target_width = <max_text_width>
		}
	endif
endscript

script net_dl_content_compatabilty_warning_fade_out 
	Wait \{10
		Seconds}
	if ScreenElementExists id = <id>
		<id> :legacydomorph alpha = 0.0 time = 1.0
	endif
	Wait \{1
		Frame}
	if ScreenElementExists \{id = dl_content_warning}
		DestroyScreenElement \{id = dl_content_warning}
	endif
endscript

script net_dl_content_compatabilty_warning \{z = 100
		Pos = (0.0, 0.0)}
	if NOT GotParam \{parent}
		return
	endif
	if ScreenElementExists \{id = dl_content_warning}
		DestroyScreenElement \{id = dl_content_warning}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = dl_content_warning
		parent = <parent>
		Pos = <Pos>
	}
	menu_anchor = <id>
	if isXenon
	elseif isngc
		text = qs(0x812c13d8)
	else
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		font = fontgrid_text_a8
		Scale = (0.7, 0.55)
		rgba = ($online_light_blue)
		text = <text>
		just = [center top]
		z_priority = (<z> + 0.1)
		Pos = (320.0, -55.0)
		dims = (830.0, 185.0)
		allow_expansion
	}
	<menu_anchor> :Obj_SpawnScriptLater net_dl_content_compatabilty_warning_fade_out params = {id = <menu_anchor>}
endscript

script fit_text_into_menu_item 
	if ScreenElementExists id = <id>
		GetScreenElementDims id = <id>
		if (<width> > <max_width>)
			SetScreenElementProps {
				id = <id>
				Scale = 1.0
			}
			scale_element_to_size {
				id = <id>
				target_width = <max_width>
				target_height = <height>
			}
		endif
	endif
endscript

script net_coop_init_star_power 
	printf \{qs(0x188cbe2c)}
	if NOT (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1))
		SpawnScriptNow \{star_power_activate_and_drain
			params = {
				player_status = player1_status
				Player = 1
				player_text = 'p1'
			}}
		SpawnScriptNow \{star_power_activate_and_drain
			params = {
				player_status = player2_status
				Player = 2
				player_text = 'p2'
			}}
	endif
endscript
DEMONWARE_IS_READY = 1

script set_ready_for_input 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_demonware_failed 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_disable_demonware_input 
	Change \{DEMONWARE_IS_READY = 0}
endscript

script online_end_song 
	printf \{qs(0xdf6f59ee)}
	if GameIsOver
		printf \{qs(0x27fd2f0c)}
		return
	endif
	Change \{net_num_players_data_ack = 0}
	Change \{recovered_dropped_players = 0}
	end_song
	if (IsHost)
		i = 1
		gamemode_getnumplayersshown
		begin
		<player_status> = ($0x2994109a [<i>])
		if (($<player_status>.is_local_client) = 1)
			Change net_num_players_data_ack = ($net_num_players_data_ack + 1)
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		GetNumPlayers
		Change net_num_players_data_needed = <num_players>
		SendEndSong
		client_handle_end_song
	endif
	printf qs(0x8110ad7a) d = ($net_num_players_data_ack)
endscript

script client_handle_end_song 
	printf \{qs(0xb4527a20)}
	ExtendCrc \{song_won
		'p1'
		out = Type}
	broadcastevent Type = <Type> data = {song_complete = 1}
	if ($battle_do_or_die = 0)
		gamemode_gettype
		if (<Type> = career || <Type> = quickplay)
			progression_cashmilestonessongwon
		endif
	endif
	Change \{recovered_dropped_players = 0}
	if NOT IsHost
		player_data = {}
		i = 1
		gamemode_getnumplayersshown
		begin
		<player_status> = ($0x2994109a [<i>])
		if (($<player_status>.is_local_client) = 1)
			appendstruct {
				struct = player_data
				Field = <player_status>
				params = {
					obj_id = ($<player_status>.net_obj_id)
					score = ($<player_status>.score)
					best_run = ($<player_status>.best_run)
					max_notes = ($<player_status>.max_notes)
					notes_hit = ($<player_status>.notes_hit)
					stars = ($<player_status>.stars)
					vocal_streak_phrases = ($<player_status>.vocal_streak_phrases)
					vocal_phrase_quality = ($<player_status>.vocal_phrase_quality)
					vocal_phrase_max_qual = ($<player_status>.vocal_phrase_max_qual)
					total_notes = ($<player_status>.total_notes)
					new_cash = ($<player_status>.new_cash)
					career_earnings = ($<player_status>.career_earnings)
					cash_rank_up = ($<player_status>.cash_rank_up)
				}
			}
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		printf qs(0xc308da3b) d = ($<player_status>.Player)
		SendStructure callback = player_data_request_ack data_to_send = {player_data = <player_data>} to_server
	endif
endscript

script player_data_request_ack 
	printf \{qs(0xb13dabc7)}
	getplayerinfo \{1
		team}
	host_team = <team>
	if GotParam \{player_data}
		num_local_players = 4
		i = 1
		begin
		<player_status> = ($0x2994109a [<i>])
		if StructureContains structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			getplayerinfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.obj_id)
				Change net_num_players_data_ack = ($net_num_players_data_ack + 1)
				printf qs(0x83a3ff30) d = <j> a = ($net_num_players_data_ack)
				setplayerinfo <j> score = (<player_data>.<player_status>.score)
				setplayerinfo <j> best_run = (<player_data>.<player_status>.best_run)
				setplayerinfo <j> max_notes = (<player_data>.<player_status>.max_notes)
				setplayerinfo <j> notes_hit = (<player_data>.<player_status>.notes_hit)
				setplayerinfo <j> stars = (<player_data>.<player_status>.stars)
				setplayerinfo <j> vocal_streak_phrases = (<player_data>.<player_status>.vocal_streak_phrases)
				setplayerinfo <j> vocal_phrase_quality = (<player_data>.<player_status>.vocal_phrase_quality)
				setplayerinfo <j> vocal_phrase_max_qual = (<player_data>.<player_status>.vocal_phrase_max_qual)
				setplayerinfo <j> total_notes = (<player_data>.<player_status>.total_notes)
				setplayerinfo <j> new_cash = (<player_data>.<player_status>.new_cash)
				setplayerinfo <j> cash_rank_up = (<player_data>.<player_status>.cash_rank_up)
				setplayerinfo <j> career_earnings = (<player_data>.<player_status>.career_earnings)
				break
			endif
			j = (<j> + 1)
			repeat <num_net_players>
		endif
		i = (<i> + 1)
		repeat <num_local_players>
	endif
	printf qs(0x70a2ef09) a = ($net_num_players_data_needed) b = ($net_num_players_data_ack)
	if (($net_num_players_data_needed) = ($net_num_players_data_ack))
		Change \{net_num_players_data_ack = 0}
		player_data = {}
		i = 1
		begin
		<player_status> = ($0x2994109a [<i>])
		getplayerinfo <i> team
		if (<team> = 1)
			<band_score> = ($band2_status.score)
		else
			<band_score> = ($band1_status.score)
		endif
		appendstruct {
			struct = player_data
			Field = <player_status>
			params = {
				obj_id = ($<player_status>.net_obj_id)
				score = ($<player_status>.score)
				best_run = ($<player_status>.best_run)
				max_notes = ($<player_status>.max_notes)
				notes_hit = ($<player_status>.notes_hit)
				stars = ($<player_status>.stars)
				vocal_streak_phrases = ($<player_status>.vocal_streak_phrases)
				vocal_phrase_quality = ($<player_status>.vocal_phrase_quality)
				vocal_phrase_max_qual = ($<player_status>.vocal_phrase_max_qual)
				total_notes = ($<player_status>.total_notes)
				new_cash = ($<player_status>.new_cash)
				career_earnings = ($<player_status>.career_earnings)
				cash_rank_up = ($<player_status>.cash_rank_up)
			}
		}
		i = (<i> + 1)
		repeat ($net_num_players_data_needed)
		SendStructure callback = finish_player_data_sync data_to_send = {player_data = <player_data>}
	endif
endscript

script finish_player_data_sync 
	printf \{qs(0x2f12977f)}
	if GotParam \{player_data}
		num_net_players = 8
		i = 1
		begin
		<player_status> = ($0x2994109a [<i>])
		if StructureContains structure = <player_data> <player_status>
			num_players = 8
			j = 1
			begin
			getplayerinfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.obj_id)
				printf qs(0xe5e680fe) d = <j> a = ($net_num_players_data_ack)
				setplayerinfo <j> score = (<player_data>.<player_status>.score)
				setplayerinfo <j> best_run = (<player_data>.<player_status>.best_run)
				setplayerinfo <j> max_notes = (<player_data>.<player_status>.max_notes)
				setplayerinfo <j> notes_hit = (<player_data>.<player_status>.notes_hit)
				setplayerinfo <j> stars = (<player_data>.<player_status>.stars)
				setplayerinfo <j> vocal_streak_phrases = (<player_data>.<player_status>.vocal_streak_phrases)
				setplayerinfo <j> vocal_phrase_quality = (<player_data>.<player_status>.vocal_phrase_quality)
				setplayerinfo <j> vocal_phrase_max_qual = (<player_data>.<player_status>.vocal_phrase_max_qual)
				setplayerinfo <j> total_notes = (<player_data>.<player_status>.total_notes)
				setplayerinfo <j> new_cash = (<player_data>.<player_status>.new_cash)
				setplayerinfo <j> career_earnings = (<player_data>.<player_status>.career_earnings)
				setplayerinfo <j> cash_rank_up = (<player_data>.<player_status>.cash_rank_up)
				break
			endif
			j = (<j> + 1)
			repeat <num_players>
		endif
		i = (<i> + 1)
		repeat <num_net_players>
	endif
endscript

script 0xf06fbb81 
	if ($ui_flow_manager_state [0] = online_play_song_fs || $ui_flow_manager_state [0] = online_pause_fs)
		return \{0xcb44d97e = true}
	else
		return \{0xcb44d97e = FALSE}
	endif
endscript

script net_load_preferences 
	netoptions :pref_add \{Name = private_slots
		array = $num_private_slots
		index = 0
		value_field = num
		display_string_field = Name}
	netoptions :pref_add \{Name = Ranked
		array = $ranked_info
		index = 0
		display_string_field = Name}
	netoptions :pref_add \{Name = join_in_progress
		array = $join_in_progress_info
		index = 0
		value_field = num
		display_string_field = Name}
	netoptions :pref_add \{Name = num_players
		array = $num_players_info
		index = 1
		value_field = num
		display_string_field = Name}
	if ($is_multiplayer_beta = 0)
		netoptions :pref_add \{Name = game_modes
			array = $net_game_type_info
			index = 0
			display_string_field = Name}
	else
		netoptions :pref_add \{Name = game_modes
			array = $beta_net_game_type_info
			index = 0
			display_string_field = Name}
	endif
endscript

script new_net_player 
	printf \{qs(0xcc13a237)}
	formatText checksumName = gamertag_global 'gamertag_%d' d = (<player_num> - 1)
	printstruct <...>
	gamemode_gettype
	if (<Type> = career)
		transfer_controller_value_for_local_player <...>
	endif
	Change GlobalName = <gamertag_global> NewValue = <gamertag_string>
	Change structurename = <player_status> gamertag = <gamertag_global>
	Change structurename = <player_status> net_id_first = <net_id_first>
	Change structurename = <player_status> net_id_second = <net_id_second>
	Change structurename = <player_status> is_local_client = <local_client>
	Change structurename = <player_status> net_obj_id = <obj_id>
	Change structurename = <player_status> part = <part>
	Change structurename = <player_status> team = <team>
	Change structurename = <player_status> difficulty = <difficulty>
	Change structurename = <player_status> career_earnings = <career_cash>
	GetGlobalTags \{user_options}
	SendNetMessage {
		Type = lefty_update
		lefty_flag = (<lefty_flip_p1>)
	}
endscript

script host_proceed_to_online_play 
	printf \{qs(0xb2b28b68)}
	gamemode_getnumplayers
	Change current_num_players = <num_players>
	StartNetworkGame
endscript

script setautolaunchhostnetlevel 
	printf \{qs(0xb5e0a9a1)}
	Change \{net_autolaunch_role = HOST}
endscript

script setautolaunchclient 
	printf \{qs(0xc9e66c76)}
	Change \{net_autolaunch_role = CLIENT}
endscript

script ps3_new_invitation_received 
	begin
	if NOT (ScreenElementExists id = invite_container)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CreateScreenElement \{Type = ContainerElement
		id = invite_container
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 100}
	invite_container :Obj_SpawnScriptNow ps3_process_invites params = {count = <count> invitelist = <invitelist>}
endscript

script ps3_process_invites 
	if GotParam \{invitelist}
		if (<count> > 0)
			i = 0
			begin
			CreateScreenElement \{Type = ContainerElement
				id = ps3_invite_container
				parent = invite_container
				Pos = $ps3_invite_postion
				alpha = 0.0}
			CreateScreenElement \{Type = SpriteElement
				parent = ps3_invite_container
				texture = white
				rgba = [
					139
					69
					0
					255
				]
				Pos = (0.0, 0.0)
				dims = (200.0, 65.0)
				just = [
					left
					top
				]}
			formatText TextName = item_text qs(0x7647d0c4) d = (<invitelist> [<i>])
			CreateScreenElement {
				Type = TextBlockElement
				parent = ps3_invite_container
				font = fontgrid_title_a1
				Pos = (5.0, 5.0)
				dims = (400.0, 160.0)
				Scale = (0.5, 0.5)
				rgba = [255 222 173 255]
				text = <item_text>
				just = [left top]
			}
			RunScriptOnScreenElement \{id = ps3_invite_container
				ps3_display_invite_container}
			begin
			if NOT (ScreenElementExists id = ps3_invite_container)
				break
			endif
			Wait \{1
				gameframe}
			repeat
			<i> = (<i> + 1)
			repeat <count>
		endif
	endif
	if ScreenElementExists \{id = invite_container}
		DestroyScreenElement \{id = invite_container}
	endif
endscript

script ps3_display_invite_container 
	ps3_invite_container :legacydomorph \{alpha = 1.0
		time = 1.0}
	Wait \{1.0
		Seconds}
	ps3_invite_container :legacydomorph \{alpha = 0.0
		time = 1.0}
	if ScreenElementExists \{id = ps3_invite_container}
		DestroyScreenElement \{id = ps3_invite_container}
	endif
endscript

script ps3_display_invite_callback 
	printf \{qs(0xfa79ba7a)}
	printstruct <...>
endscript

script net_custom_guide_view_user_songs 
	printf \{qs(0xa819dc71)}
	printstruct <...>
	printscriptinfo
endscript

script get_controller_type 
	RequireParams \{[
			controller_index
		]
		all}
	getcontrollertype controller = <controller_index>
	return controller_type = <controller_type>
endscript

script test_sequenced_msgs 
	SendStructure \{callback = callback_test_sequenced_msgs
		data_to_send = {
			number = 1
		}}
endscript

script callback_test_sequenced_msgs 
	printf qs(0x848da1e2) i = <number>
endscript

script test_retrieve_friends_list 
	NetSessionFunc \{func = friends_init}
	NetSessionFunc \{Obj = friends
		func = begin_retrieve_friends_list
		params = {
			callback = test_friends_callback
			callback_params = {
				None
			}
		}}
endscript

script test_friends_callback 
	printf \{qs(0x1336825d)}
	printstruct <...>
	NetSessionFunc func = createcustommessage params = {deviceNum = 0 userlist = <friendlist> title = qs(0x88482835) game_msg = qs(0x1a7c6769) button_text = qs(0x054c661b) game_specific = guitar}
endscript

script get_player_num_from_controller 
	if NOT GotParam \{controller_index}
		printf \{qs(0x83889e11)}
	endif
	num_local_controllers = 4
	player_num = -1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller_index> = <controller>)
		player_num = <i>
		break
	endif
	i = (<i> + 1)
	repeat <num_local_controllers>
	return player_num = <player_num>
endscript

script net_dummy_get_needed_search_params 
	if ($game_mode = p4_career)
		guitars = 2
		drums = 1
		microphones = 1
		scoring_mode = career
	else
		guitars = 1
		drums = 0
		microphones = 0
		scoring_mode = competitive
	endif
	return needed_guitars = <guitars> needed_drums = <drums> needed_microphones = <microphones> scoring_mode = <scoring_mode>
endscript

script net_get_player_instrument 
	RequireParams \{[
			controller_index
		]
		all}
	get_controller_type controller_index = <controller_index>
	rb_drums = 0
	if checksumequals a = <controller_type> b = drum
		if isrbdrum controller = <controller_index>
			rb_drums = 1
		endif
	endif
	return instrument = <controller_type> <...>
endscript

script net_get_player_guitar_flag 
	printf \{qs(0xde0d8e43)}
	RequireParams \{[
			controller_index
		]
		all}
	get_player_num_from_controller controller_index = <controller_index>
	getplayerinfo <player_num> part
	if (<part> = bass)
		return \{flag = 1}
	else
		return \{flag = 0}
	endif
endscript

script net_get_player_cash 
	RequireParams \{[
			controller_index
		]
		all}
	get_player_num_from_controller controller_index = <controller_index>
	cash_ranks_get_rank Player = <player_num>
	return career_cash = <career_earnings>
endscript

script net_get_player_difficulty 
	RequireParams \{[
			controller_index
		]
		all}
	get_player_num_from_controller controller_index = <controller_index>
	if (<player_num> != -1)
		getplayerinfo <player_num> difficulty
	else
		printf \{qs(0x87ee2a4c)}
		difficulty = easy
	endif
	return difficulty = <difficulty>
endscript

script get_local_players_in_game 
	printf \{qs(0xfccab215)}
	max_local_players = 4
	i = 0
	array = []
	num_local_players = 0
	begin
	NetSessionFunc func = iscontrolleringame params = {controller = <i>}
	if GotParam \{isingame}
		AddArrayElement array = <array> element = 1
		num_local_players = (<num_local_players> + 1)
		RemoveParameter \{isingame}
	else
		AddArrayElement array = <array> element = 0
	endif
	i = (<i> + 1)
	repeat <max_local_players>
	return local_players = <array> num_local_players = <num_local_players>
endscript

script net_restore_player_status_structs 
	exception_index = -1
	if GotParam \{exception_indices}
		exception_index = (<exception_indices> [0])
		index = 0
	endif
	i = 0
	begin
	if NOT (<i> = <exception_index>)
		formatText checksumName = gamertag 'gamertag_%d' d = <i>
		Change GlobalName = <gamertag> NewValue = qs(0x00000000)
		setplayerinfo (<i> + 1) net_id_first = 0
		setplayerinfo (<i> + 1) net_id_second = 0
		setplayerinfo (<i> + 1) team = 0
		setplayerinfo (<i> + 1) highway_layout = default_highway
		if (<i> < 4)
			setplayerinfo (<i> + 1) is_local_client = 1
			getplayerinfo (<i> + 1) controller
			if (<controller> > 3)
				controller = 3
				setplayerinfo (<i> + 1) controller = <controller>
			endif
		else
			setplayerinfo (<i> + 1) is_local_client = 0
		endif
	else
		if GotParam \{index}
			GetArraySize <exception_indices>
			if ((<index> + 1) < <array_Size>)
				index = (<index> + 1)
				exception_index = (<exception_indices> [<index>])
			else
				exception_index = -1
			endif
		endif
	endif
	i = (<i> + 1)
	repeat 8
endscript

script transfer_controller_value_for_local_player 
	printf \{qs(0x70e88519)}
	if isps3
		num_local_controllers = 7
	else
		num_local_controllers = 4
	endif
	i = 0
	begin
	if (($temp_net_id [<i>].net_id_first) = <net_id_first> && ($temp_net_id [<i>].net_id_second) = <net_id_second>)
		if isps3
			if LocalizedStringEquals a = ($temp_net_id [<i>].Name) b = <gamertag_string>
				Change structurename = <player_status> controller = <i>
				player_found = 1
				break
			endif
		else
			Change structurename = <player_status> controller = <i>
			player_found = 1
			break
		endif
	endif
	i = (<i> + 1)
	repeat <num_local_controllers>
	if NOT GotParam \{player_found}
		Change structurename = <player_status> controller = 3
	endif
endscript

script net_choose_gamemode_from_players 
	printf \{qs(0x330f85fe)}
	printstruct <...>
	if checksumequals \{a = $game_mode
			b = p4_career}
		printf \{qs(0xd1270c2d)}
		switch <total_players>
			case 2
			printf \{qs(0x09c32524)}
			Change \{game_mode = p2_career}
			Change \{current_num_players = 2}
			case 3
			printf \{qs(0x10d81465)}
			Change \{game_mode = p3_career}
			Change \{current_num_players = 3}
			case 4
			printf \{qs(0x5f9982a2)}
			Change \{game_mode = p4_career}
			Change \{current_num_players = 4}
			default
			printf qs(0xc4b880c5) d = <total_players>
		endswitch
		Change \{career_matchmaking_complete = 1}
	elseif checksumequals \{a = $game_mode
			b = p4_quickplay}
		printf \{qs(0x4e077ebc)}
		switch <total_players>
			case 2
			printf \{qs(0x09c32524)}
			Change \{game_mode = p2_quickplay}
			Change \{current_num_players = 2}
			case 3
			printf \{qs(0x10d81465)}
			Change \{game_mode = p3_quickplay}
			Change \{current_num_players = 3}
			default
			printf qs(0xc4b880c5) d = <total_players>
		endswitch
	elseif checksumequals \{a = $game_mode
			b = p8_pro_faceoff}
		printf \{qs(0x2bc53c10)}
		if NOT (<total_players> = 8)
			if NOT (<total_players> = 6)
				ScriptAssert 'trying to play band v band with %d playes (only 8 or 6 with no mics allowed)!' d = <total_players>
			endif
			printf \{qs(0x7f593fba)}
			Change \{game_mode = p6_pro_faceoff_no_mics}
			Change \{current_num_players = 6}
		else
			printf qs(0xc4b880c5) d = <total_players>
		endif
	endif
endscript

script net_party_can_accept_new_players 
	printf \{qs(0x2334dcd0)}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	printstruct <...>
	can_join = 1
	check_insts = 0
	gamemode_gettype
	if (<Type> = career)
		check_insts = 1
	endif
	if (<check_insts> = 1)
		num_guitars = 0
		num_mics = 0
		num_drums = 0
		GetArraySize \{connections}
		if (<array_Size> > 0)
			i = 0
			begin
			switch (<connections> [<i>].instrument)
				case eguitar
				num_guitars = (<num_guitars> + 1)
				case emicrophone
				num_mics = (<num_mics> + 1)
				case edrums
				num_drums = (<num_drums> + 1)
				default
				printf \{qs(0xf20fed67)}
			endswitch
			i = (<i> + 1)
			repeat <array_Size>
		endif
		GetArraySize \{new_connections}
		if (<array_Size> > 0)
			i = 0
			begin
			switch (<new_connections> [<i>].instrument)
				case eguitar
				num_guitars = (<num_guitars> + 1)
				case emicrophone
				num_mics = (<num_mics> + 1)
				case edrums
				num_drums = (<num_drums> + 1)
				default
				printf \{qs(0xd922bea4)}
			endswitch
			i = (<i> + 1)
			repeat <array_Size>
		endif
		can_join = 0
		if (<num_guitars> <= 2)
			if (<num_mics> <= 1)
				if (<num_drums> <= 1)
					can_join = 1
				endif
			endif
		endif
	endif
	return can_join = <can_join>
endscript

script spawn_player_drop_listeners 
	destroy_player_drop_events
	SpawnScriptNow net_ui_player_drop_listeners params = {<...>}
endscript

script net_ui_player_drop_listeners \{drop_player_script = default_drop_player_script
		end_game_script = default_end_game_scr}
	printscriptinfo \{'create player drops'}
	SpawnScriptNow create_player_drop_events params = {<...>}
	SpawnScriptNow create_end_game_events params = {<...>}
endscript
0x6f0a2d20 = 0
0xe661dbb9 = 0

script create_player_drop_events 
	SetEventHandler response = call_script event = drop_net_player Scr = drop_script_spawner params = {spawn_script = <drop_player_script>}
	if ($0x6f0a2d20 = 1)
		printf \{'Spawning new player drop script.'}
		is_game_over = 0
		if ($0xe661dbb9)
			<is_game_over> = 1
		endif
		SpawnScriptNow drop_script_spawner params = {spawn_script = <drop_player_script> is_game_over = <is_game_over>} id = ui_player_drop_scripts
	endif
	Block
endscript

script create_end_game_events 
	SetEventHandler response = call_script event = drop_player_end_game Scr = drop_script_spawner params = {spawn_script = <end_game_script>}
	if ($0xe661dbb9 = 1)
		printf \{'Spawning new end game script'}
		SpawnScriptNow drop_script_spawner params = {spawn_script = <end_game_script> is_game_over = 1} id = ui_player_drop_scripts
	endif
	Block
endscript

script end_game_kill_event_test 
	printf \{qs(0x43c62dae)}
	if (<is_game_over> = 1)
		printf \{qs(0xb76c91f9)}
	endif
endscript

script 0xe583f6c9 
	begin
	if NOT ScriptIsRunning <spawn_script>
		break
	endif
	WaitOneGameFrame
	repeat
	printf \{'Drop script complete.'}
	if (<is_game_over> = 1)
		Change \{0xe661dbb9 = 0}
	else
		Change \{0x6f0a2d20 = 1}
	endif
endscript

script drop_script_spawner 
	if (1 = <is_game_over>)
		printf \{qs(0x80cfd935)}
		Change \{net_ready_to_start = 1}
		Change \{0xe661dbb9 = 1}
	else
		Change \{0x6f0a2d20 = 1}
	endif
	SpawnScriptNow <spawn_script> params = {<...>} id = ui_player_drop_scripts
	SpawnScriptNow 0xe583f6c9 params = {<...>} id = ui_player_drop_scripts
endscript

script destroy_player_drop_events 
	printscriptinfo \{'destroy player drops'}
	KillSpawnedScript \{Name = create_player_drop_events}
	KillSpawnedScript \{Name = create_end_game_events}
	KillSpawnedScript \{id = ui_player_drop_scripts}
endscript

script default_drop_player_script 
	warn_default_drop_script <...>
endscript

script default_end_game_scr 
	ui_event_get_top
	if NOT (<base_name> = 'online')
		create_net_popup \{title = qs(0x5ca2c535)
			popup_text = qs(0x32f94482)}
		Wait \{3
			Seconds}
		destroy_net_popup
		quit_network_game
		generic_event_back \{state = uistate_online}
	else
		ShowJoinTimeoutNotice
	endif
endscript

script warn_default_drop_script 
	printf \{qs(0x03ac90f0)}
	printf \{qs(0xbc5429e7)}
	printf \{qs(0xdd595c0d)}
	printf \{qs(0x9aeb32e8)}
	printf \{qs(0x838dd1ff)}
	printf \{qs(0x03ac90f0)}
	printstruct <...>
	ui_print_states
endscript

script wait_for_net_popup 
	begin
	if ($net_popup_active = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script net_popup_game_over 
	if NOT ($net_popup_active)
		formatText \{TextName = popup_text
			qs(0xa37c3dc8)}
		create_net_popup \{title = qs(0x5ca2c535)
			popup_text = Wait
			3
			Seconds}
		destroy_net_popup
	endif
endscript

script do_ps3_signin_state_change 
	printf \{qs(0x05f43ed9)}
	printstruct <...>
	if GotParam \{age_restricted}
		ui_event_wait event = menu_replace data = {state = <state> <params> require_live}
	elseif CheckForSignIn
		if GotParam \{going_to_career}
			Change \{game_mode = p4_career}
			netoptions :pref_choose \{Name = game_modes
				checksum = p4_career}
		endif
		ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
	else
		ui_event_wait event = menu_replace data = {state = <state> <params> require_live}
	endif
endscript
net_career_drop_msg_timer_count = 0

script net_create_player_drop_message_box 
	printf \{qs(0x0c498bd4)}
	RequireParams \{[
			parent_element
			drop_msg
		]
		all}
	if ScreenElementExists id = <parent_element>
		if NOT ScreenElementExists \{id = net_player_drop_container}
			CreateScreenElement {
				Type = ContainerElement
				id = net_player_drop_container
				parent = <parent_element>
				Pos = (640.0, 320.0)
				alpha = 0.0
				z_priority = 1000
				internal_just = [center center]
			}
			CreateScreenElement {
				Type = TextBlockElement
				id = net_player_drop_fail_msg_text
				parent = net_player_drop_container
				text = <drop_msg>
				font = fontgrid_text_a6
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				Pos = (0.0, -5.0)
				dims = (440.0, 180.0)
				rgba = [200 200 200 250]
				internal_scale = 1.0
				just = [center bottom]
				internal_just = [center center]
				Shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
				z_priority = 1500.1
			}
			CreateScreenElement \{Type = SpriteElement
				parent = net_player_drop_container
				texture = message_container
				rgba = [
					255
					255
					255
					255
				]
				Pos = (0.0, -100.0)
				dims = (600.0, 450.0)
				just = [
					center
					center
				]
				z_priority = 1500.0}
			net_player_drop_container :Obj_SpawnScriptNow \{display_net_dropped_player_msg}
		else
			net_player_drop_fail_msg_text :se_getprops
			formatText TextName = drop_message qs(0xce4939dc) t = <text> d = <drop_msg>
			net_player_drop_fail_msg_text :se_setprops text = <drop_message>
			Change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) + 1)
		endif
	endif
endscript

script display_net_dropped_player_msg 
	printf \{qs(0xf38b4635)}
	Obj_GetID
	Change \{net_career_drop_msg_timer_count = 3}
	<objID> :se_setprops alpha = 1.0 time = 0.5
	<objID> :se_waitprops
	begin
	Wait \{1
		Second}
	if ($net_career_drop_msg_timer_count < 0)
		break
	endif
	Change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) - 1)
	repeat
	<objID> :se_setprops alpha = 0.0 time = 0.8
	<objID> :se_waitprops
	if ($net_career_drop_msg_timer_count > 0)
		display_net_dropped_player_msg
		return
	endif
	<objID> :Die
endscript

script 0x5f5cad55 
	RequireParams \{[
			appearance
			obj_id
			character_id
		]
		all}
	printf \{qs(0x8d573038)}
	if ($game_mode = p8_pro_faceoff || $game_mode = p4_pro_faceoff)
		return
	endif
	0x36cbb40f = {character_id = <character_id> obj_id = <obj_id> appearance = <appearance>}
	SendStructure callback = 0xfcc6769b data_to_send = <0x36cbb40f>
endscript

script 0xfcc6769b 
	RequireParams \{[
			appearance
			obj_id
			character_id
		]
		all}
	printf qs(0xc3b92386) d = <obj_id>
	printstruct <...>
	0xdc61aa22 <...>
endscript
