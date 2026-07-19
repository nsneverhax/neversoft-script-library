num_players_info = [
	{
		name = qs("2 Players")
		checksum = num_2
		num = 2
	}
	{
		name = qs("3 Players")
		checksum = num_3
		num = 3
	}
	{
		name = qs("4 Players")
		checksum = num_4
		num = 4
	}
	{
		name = qs("6 Players")
		checksum = num_6
		num = 6
	}
	{
		name = qs("8 Players")
		checksum = num_8
		num = 8
	}
]
num_private_slots = [
	{
		name = qs("0 Players")
		checksum = num_0
		num = 0
	}
	{
		name = qs("1 Players")
		checksum = num_1
		num = 1
	}
]
ranked_info = [
	{
		name = qs("PLAYER MATCH")
		checksum = player
		num = 1
	}
	{
		name = qs("RANKED MATCH")
		checksum = ranked
		num = 0
	}
]
join_in_progress_info = [
	{
		name = qs("Join in Progress Disallowed")
		num = 0
		checksum = no
	}
	{
		name = qs("Join in Progress Allowed")
		num = 1
		checksum = Yes
	}
]
FilterTypes = {
	diff = {
		values = [
			qs("ANY")
			qs("EASY")
			qs("MEDIUM")
			qs("HARD")
			qs("EXPERT")
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
			qs("ANY")
			qs("FACE-OFF")
			qs("PRO FACE-OFF")
			qs("BATTLE")
			qs("CO-OP")
		]
		checksum = [
			dont_care
			p2_faceoff
			p2_pro_faceoff
			p2_battle
			p2_coop
		]
	}
	type = {
		values = [
			qs("PLAYER")
			qs("RANKED")
		]
		checksum = [
			player
			ranked
		]
	}
	num_songs = {
		values = [
			qs("ANY")
			qs("\L1")
			qs("Best of 3")
			qs("Best of 5")
			qs("Best of 7")
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
			qs("ANY")
			qs("HOST")
			qs("CLIENT")
			qs("RANDOM")
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
			qs("ALL TIME")
			qs("MY RANK")
			qs("MY FRIENDS")
		]
	}
	song_type = {
		values = [
			qs("NORMAL SONGS")
			qs("CO-OP SONGS")
		]
	}
	vport = {
		values = [
			qs("DOUBLE")
			qs("SINGLE")
		]
	}
	lb_diff = {
		values = [
			qs("EASY")
			qs("MEDIUM")
			qs("HARD")
			qs("EXPERT")
		]
	}
}
Leaderboard_Difficulty_Lookup_Table = {
	easy = 'easy'
	medium = 'medium'
	hard = 'hard'
	expert = 'expert'
}
Controller_Lookup_Table = {
	controller = 'Vocal'
	guitar = 'Guitar'
	drum = 'Drum'
	Bass = 'Bass'
	Vocals = 'Vocal'
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
	null
	null
	null
]
player2_song_selections = [
	null
	null
	null
]
tie_breaker_song = bullsonparade
match_type = player
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
message_of_the_day = qs("")
online_song_choice_id = 0
PS3_NON_PRIMARY_CONTROLLER_ID = qs("Guest")
agora_failed_attempts = 0
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
PS3_invite_postion = (255.0, 96.0)
NET_DROP_PACKET_PERCENTAGE = 0
net_game_type_info = [
	{
		name = qs("PRO FACE-OFF")
		description = qs("Play a song with the same notes.")
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff
	}
	{
		name = qs("FACE-OFF")
		description = qs("Dueling sections on lead guitar.")
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = p2_faceoff
	}
	{
		name = qs("BAND QUICKPLAY")
		description = qs("Mix lead guitar with bass/rhythm guitar.")
		checksum = p4_quickplay
		func = is_gamemode_visible
		search_chk = p4_quickplay
	}
	{
		name = qs("CO-OP GUITARS")
		description = qs("Mix lead guitar with bass/rhythm guitar.")
		checksum = p2_quickplay
		func = is_gamemode_visible
		search_chk = p2_coop
	}
	{
		name = qs("2 vs 2 GUITARS")
		description = qs("Play a song with the same notes.")
		checksum = p4_pro_faceoff
		func = is_gamemode_visible
		search_chk = p4_pro_faceoff
	}
	{
		name = qs("BAND vs BAND")
		description = qs("Battle against another Band")
		checksum = p8_pro_faceoff
		func = is_gamemode_visible
		search_chk = p8_pro_faceoff
	}
	{
		name = qs("BATTLE")
		description = qs("Battle mode.")
		checksum = p2_battle
		func = is_gamemode_visible
		search_chk = p2_battle
	}
	{
		name = qs("1v1 PRO FACE-OFF (Bass)")
		description = qs("Play a song with the same notes.")
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff_bass
	}
	{
		name = qs("1v1 FACE-OFF  (Bass)")
		description = qs("Dueling sections on the bass.")
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = p2_faceoff_bass
	}
	{
		name = qs("1v1 PRO FACE-OFF (Drums)")
		description = qs("Play a song with the same notes.")
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
		search_chk = p2_pro_faceoff_drums
	}
	{
		name = qs("1v1 FACE-OFF  (Drums)")
		description = qs("Dueling sections on the drums.")
		checksum = p2_faceoff
		func = is_gamemode_visible
		search_chk = mode_extra_1
	}
	{
		name = qs("ONLINE CAREER")
		description = qs("Online career")
		checksum = p4_career
		func = is_gamemode_visible
		search_chk = p4_career
	}
]
beta_net_game_type_info = [
	{
		name = qs("1v1 PRO FACE-OFF")
		description = qs("Play a song with the same notes.")
		checksum = p2_pro_faceoff
		func = is_gamemode_visible
	}
	{
		name = qs("2v2 PRO FACE-OFF")
		description = qs("Play a song with the same notes.")
		checksum = p4_pro_faceoff
		func = is_gamemode_visible
	}
]
net_guitar_part_info = [
	{
		name = qs("LEAD")
		checksum = guitar
	}
	{
		name = qs("BASS")
		checksum = Bass
	}
]
xenon_invite_confirm_title = qs("Game Invite")
xenon_invite_confirm_dialog = qs("If you accept this invite, you will lose any unsaved game progress. Do you want to continue?")
xenon_invite_confirm_yes = qs("ACCEPT")
xenon_invite_confirm_no = qs("CANCEL")
xenon_invite_disallowed_title = qs("Game Invite")
xenon_invite_disallowed_dialog = qs("Cannot join into an Xbox LIVE multiplayer game with gamer profiles that are not enabled for Xbox LIVE multiplayer game play.")
xenon_invite_disallowed_ok = qs("OK")
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
net_autolaunch_role = none
net_popup_active = 0

script net_autolaunch_spawned 
	mode = ($game_mode)
	ui_event_block \{event = menu_change
		data = {
			state = UIstate_mainmenu
			base_name = 'mainmenu'
			selected_index = 3
			clear_previous_stack
		}}
	change game_mode = <mode>
	NetOptions :Pref_Choose name = game_modes checksum = ($game_mode)
	main_menu_select_online
	Block \{type = online_menu_created}
	add_active_controllers
	start_matchmaking device_num = ($primary_controller)
endscript

script al_refresh 
	ui_event \{event = menu_replace
		data = {
			state = UIstate_net_debug_lobby
			mode = CLIENT
		}}
	al_get_server_list
endscript

script al_get_server_list 
	printf \{qs("\Lautolaunch --- find servers...")}
	al_get_preferences
	get_server_list \{callback = autolaunch_add_server
		callback_complete = autoloaunch_results_stop}
endscript

script get_server_list \{callback = empty_script
		callback_complete = empty_script}
	change \{xboxlive_num_results = 0}
	NetSessionFunc \{obj = match
		func = stop_server_list}
	NetSessionFunc \{obj = match
		func = free_server_list}
	net_dummy_get_needed_search_params
	NetSessionFunc obj = match func = set_search_params params = <...>
	NetSessionFunc \{obj = match
		func = set_server_list_mode
		params = {
			optimatch
		}}
	NetSessionFunc {
		obj = match
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
	printf \{qs("\Lautolaunch_add_server")}
	change xboxlive_num_results = (($xboxlive_num_results) + 1)
	add_menu_item text = <server_name> pad_choose_script = net_al_choose_server pad_choose_params = {server_name = <server_name> server_id = <server_id>}
endscript

script autolaunch_results_stop 
	if GotParam \{xboxlive_num_results}
		change xboxlive_num_results = <xboxlive_num_results>
	endif
	printf qs("\L---autolaunch_results_stop number of servers=%d") d = ($xboxlive_num_results)
endscript

script net_al_choose_server 
	printf qs("\L---net_al_choose_server %s id=%d") s = <server_name> d = <server_id>
	NetSessionFunc obj = match func = choose_server params = {id = <server_id>}
	ui_event event = menu_change data = {state = UIstate_net_debug_lobby_join server_name = <server_name>}
endscript

script setup_and_post_game 
	NetSessionFunc \{obj = match
		func = stop_server_list}
	NetSessionFunc \{obj = match
		func = free_server_list}
	<rand> = 0
	GetRandomValue \{name = rand
		Integer
		a = 0
		b = 1}
	get_number_of_songs
	if ((<rand> = 0) || ($game_mode = p2_coop) || (<num_songs> = 1))
		change \{tie_breaker = HOST}
	else
		change \{tie_breaker = CLIENT}
	endif
	if IsHost
		ResetHubStates
	endif
	post_network_game controller = <device_num>
endscript

script quit_network_game 
	printf \{qs("\L------ quitting network game")}
	KillSpawnedScript \{name = Loading_Screen_Crowd_Swell}
	KillSpawnedScript \{name = Crowd_Loading_Whistle}
	LeaveServer
	RemoveTimeSyncTask
	clear_wait_for_net_match_available_items
	NetSessionFunc \{obj = session
		func = unpost_game}
	EndGameNetScriptPump
	change \{battle_do_or_die = 0}
	change \{battle_do_or_die_speed_scale = 1.0}
	change \{battle_do_or_die_attack_scale = 1.0}
	if ($game_mode = p2_battle)
		change \{save_current_powerups_p1 = [
				0
				0
				0
			]}
		change \{save_current_powerups_p2 = [
				0
				0
				0
			]}
		change \{structurename = player1_status
			save_num_powerups = 0}
		change \{structurename = player2_status
			save_num_powerups = 0}
		change \{structurename = player1_status
			save_health = 0.0}
		change \{structurename = player2_status
			save_health = 0.0}
	endif
	NetOptions :Pref_Choose \{name = private_slots
		value = 0}
	NetOptions :Pref_Choose \{name = ranked
		checksum = player}
	change \{current_num_players = 1}
	change \{player2_present = 0}
	change \{g_tie_breaker_song = 0}
	change \{net_can_send_approval = 1}
	reset_setlist
	reset_net_stats_menu
	change \{net_song_num = 0}
	if NOT ($game_mode = p2_coop)
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = guitar}
	endif
endscript

script handle_matchmaking_handoff_failed 
	printf \{qs("\L--- handle_matchmaking_handoff_failed")}
	quit_network_game
	ui_event_get_top
	continue_script = nullscript
	if (<base_name> = 'online')
		continue_script = handle_matchmaking_handoff_failed_continue_online
	elseif (<base_name> = 'band_mode')
		ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
		continue_script = handle_matchmaking_handoff_failed_continue_band_mode
	else
		printf \{qs("\Learly exit, we aren't on the right state to show a message")}
		return
	endif
	destroy_popup_warning_menu
	if isXenon
		popup_text = qs("We failed connecting to an Xbox LIVE game.")
	else
		popup_text = qs("We failed connecting to an online game.")
	endif
	create_popup_warning_menu {
		title = qs("FAILED CONNECT")
		textblock = {
			text = <popup_text>
		}
		no_background
		options = [
			{
				func = <continue_script>
				text = qs("CONTINUE")
			}
		]
	}
endscript

script handle_matchmaking_handoff_failed_continue_band_mode 
	printf \{qs("\L--- handle_matchmaking_handoff_failed_continue_band_mode")}
	if ($ui_band_mode_hit_force_completion = 0)
		destroy_popup_warning_menu
		change num_players_in_band = ($num_players_in_band_old)
		change \{career_matchmaking_complete = 0}
		ui_event \{event = menu_refresh}
	else
		generic_event_back \{state = uistate_group_play}
	endif
	change \{ui_band_mode_hit_force_completion = 0}
endscript

script handle_matchmaking_handoff_failed_continue_online 
	printf \{qs("\L--- handle_matchmaking_handoff_failed_continue_online")}
	destroy_popup_warning_menu
	net_clear_all_remote_player_status
	ui_event \{event = menu_refresh}
endscript

script net_clear_player_status 
	RequireParams \{[
			player_index
		]}
	printf qs("\LClearing player %d status") d = <player_index>
	SetPlayerInfo <player_index> is_local_client = 1
	SetPlayerInfo <player_index> net_id_first = 0
	SetPlayerInfo <player_index> net_id_second = 0
	SetPlayerInfo <player_index> net_obj_id = -1
	SetPlayerInfo <player_index> team = 0
	SetPlayerInfo <player_index> party_id = -1
	FormatText checksumname = gamertag 'gamertag_%d' d = (<player_index> - 1)
	change globalname = <gamertag> newvalue = qs("")
	controller = (<player_index> -1)
	if (<controller> > 3)
		controller = 3
	endif
	SetPlayerInfo <player_index> controller = <controller>
endscript

script net_clear_all_remote_player_status 
	player = 1
	begin
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		net_clear_player_status player_index = <player>
	else
		SetPlayerInfo <player> team = 0
	endif
	<player> = (<player> + 1)
	repeat 8
endscript

script shut_down_net_play 
	change \{is_network_game = 0}
	SetNetworkMode
	NetSessionFunc \{obj = match
		func = stop_server_list}
	NetSessionFunc \{obj = match
		func = free_server_list}
	NetSessionFunc \{func = stats_uninit}
	destroy_gamertags
	destroy_net_popup
	cleanup_sessionfuncs
	setup_sessionfuncs
	net_clear_all_remote_player_status
	change \{structurename = player1_status
		highway_layout = default_highway}
	change \{structurename = player2_status
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
		GameMode_GetType
		if (<type> = career)
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
	change \{disable_attacks = 1}
	if NOT ($is_network_game)
		return
	endif
	PauseGame
	if (CompositeObjectExists ui)
		ui :UnPause
	endif
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
	printf \{qs("\L---cancel_join_server")}
	LeaveServer
	NetSessionFunc \{obj = session
		func = unpost_game}
	NetSessionFunc \{obj = match
		func = free_server_list}
endscript

script post_network_game 
	if (NetSessionFunc obj = match func = get_gamertag params = {controller = <controller>})
		change default_network_id = <name>
		change default_server_id = <name>
	endif
	NetSessionFunc obj = session func = post_game params = {controller_index = <controller>}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script set_match_values 
	set_network_preferences \{dont_set}
	net_dummy_get_needed_search_params
	return {
		difficulty = ($player1_status.difficulty)
		gamemode = <gamemode>
		num_songs = ($num_songs)
		scoring_mode = <scoring_mode>
	}
endscript

script set_network_preferences 
	NetOptions :Pref_GetStruct \{name = game_modes}
	NetOptions :Pref_Get \{name = game_modes}
	if NOT GotParam \{dont_set}
		change game_mode = <checksum>
		GameMode_GetNumPlayers
		printf qs("\Lset_net_pref num_players=%s") s = <num_players>
		NetOptions :Pref_Choose name = num_players value = <num_players>
	endif
	return {
		gamemode = (<pref_struct>.search_chk)
		difficulty = ($player1_status.difficulty)
		num_songs = dont_care
	}
endscript

script set_netgame_globals 
	printf \{qs("\L---set_netgame_globals")}
	printstruct <...>
	change game_mode = <game_mode>
	change current_level = <level>
	GameMode_GetNumPlayers
	change current_num_players = <num_players>
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
	switch ($ui_flow_manager_state [0])
		case online_character_select_fs
		<flow_state> = 1
		case online_character_hub_fs
		<flow_state> = 2
		case online_select_outfit_fs
		<flow_state> = 3
		case online_select_style_fs
		<flow_state> = 4
		case online_select_guitar_fs
		<flow_state> = 5
		case online_select_guitar_finish_fs
		<flow_state> = 6
		case online_select_bass_fs
		<flow_state> = 7
	endswitch
	return {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		flow_state = <flow_state>
	}
endscript

script cleanup_sessionfuncs 
	printf \{qs("\L---cleanup sessionfuncs")}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = stats_uninit}
endscript

script setup_sessionfuncs 
	printf \{qs("\L---setup_sessionfuncs")}
	NetSessionFunc \{func = match_init}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = voice_init}
	NetSessionFunc \{func = motd_init}
	NetSessionFunc \{obj = voice
		func = enable}
	if NetSessionFunc \{obj = match
			func = get_gamertag}
		change default_network_id = <name>
		change default_server_id = <name>
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
	GameMode_GetType
	if (<type> = career)
		ui_event event = menu_change data = {state = uistate_play_song progression_flag = ($current_progression_flag) gig_num = ($current_gig_number) song_checksum = ($current_song) song_index = ($net_career_song_index)}
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script load_and_sync_timing \{start_delay = 3000}
	EndGameNetScriptPump
	printf \{qs("\Lload venue")}
	Load_Venue
	printf \{qs("\LStarting Song with Zone = %i\n")
		i = $current_level}
	GameMode_GetType
	if (<type> != career)
		change \{current_transition = fastintro}
		restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) StartTime = 0 endtime = 999999999 device_num = ($player1_status.controller)
	else
		restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) StartTime = 0 endtime = 999999999 device_num = ($player1_status.controller) loading_transition = 0
		($default_loading_screen.destroy)
	endif
endscript

script launch_network_game 
	change \{net_ready_to_start = 1}
endscript

script ranked_quit_fix_scores 
	get_number_of_songs
	song_index = 0
	begin
	if ($game_mode = p2_battle)
		SetArrayElement ArrayName = g_p1_scores GlobalArray index = <song_index> newvalue = 8
		SetArrayElement ArrayName = g_p2_scores GlobalArray index = <song_index> newvalue = -1
	else
		SetArrayElement ArrayName = g_p2_scores GlobalArray index = <song_index> newvalue = 0
	endif
	<song_index> = (<song_index> + 1)
	repeat <num_songs>
endscript

script net_check_buttons 
	get_song_prefix song = <song_name>
	FormatText checksumname = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	GuitarInputLogicInit player_status = <player_status> guitar_stream = <guitar_stream> time_offset = <time_offset>
	ExtendCRC button_up_pixel_array ($<player_status>.text) out = pixel_array
	<player_text> = ($<player_status>.text)
	GetArraySize \{$gem_colors}
	begin
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	button_lip_name = (($button_up_models [(<player> -1)]).<color>.name)
	ExtendCRC <button_lip_name> '_lip' out = button_lip_name
	ExtendCRC <button_lip_name> <player_text> out = button_lip_name
	button_mid_name = (($button_up_models [(<player> -1)]).<color>.name)
	ExtendCRC <button_mid_name> '_mid' out = button_mid_name
	ExtendCRC <button_mid_name> <player_text> out = button_mid_name
	button_neck_name = (($button_up_models [(<player> -1)]).<color>.name)
	ExtendCRC <button_neck_name> '_neck' out = button_neck_name
	ExtendCRC <button_neck_name> <player_text> out = button_neck_name
	button_head_name = (($button_up_models [(<player> -1)]).<color>.name)
	ExtendCRC <button_head_name> '_head' out = button_head_name
	ExtendCRC <button_head_name> <player_text> out = button_head_name
	pos_table = ($highway_pos_table [(<player> -1)])
	now_scale = (((<pos_table>.nowbar_scale_x) * (1.0, 0.0)) + ((<pos_table>.nowbar_scale_y) * (0.0, 1.0)))
	if ($<player_status>.lefthanded_button_ups = 1)
		<pos2d> = (($button_up_models [(<player> -1)]).<color>.left_pos_2d)
	else
		<pos2d> = (($button_up_models [(<player> -1)]).<color>.pos_2d)
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
		SetScreenElementProps id = <button_neck_name> z_priority = 4.7 scale = <neck_scale>
	endif
	if ScreenElementExists id = <button_head_name>
		SetScreenElementProps id = <button_head_name> z_priority = 4.8 pos = <head_pos>
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	array_count = 0
	GetDeltaTime
	sub_amount = (($button_up_pixels * <delta_time>) / $button_sink_time)
	begin
	pixels = ($<pixel_array> [<array_count>])
	pixels = (<pixels> - <sub_amount>)
	if (<pixels> < 0.0)
		<pixels> = 0.0
	endif
	SetArrayElement ArrayName = <pixel_array> GlobalArray index = <array_count> newvalue = <pixels>
	array_count = (<array_count> + 1)
	repeat <array_size>
	Wait \{1
		gameframe}
	repeat
endscript

script net_check_note_hold 
	CheckNoteHoldInit player = <player> player_status = <player_status> array_entry = <array_entry> time = <time> guitar_stream = <guitar_stream> song = <song> pattern = <pattern>
	begin
	if NOT CheckNoteHoldWait player = <player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CheckNoteHoldStart player = <player>
	SpawnScriptLater net_control_whammy_pitch_loop params = {song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> time = <time>}
	begin
	if NOT CheckNoteHoldPerFrame player = <player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{name = net_whammy_pitch_shift}
	KillSpawnedScript \{name = net_control_whammy_pitch_loop}
	CheckNoteHoldEnd player = <player>
endscript

script net_control_whammy_pitch_loop 
	change \{pitch_dirty = 1}
	FormatText checksumname = net_update_event 'net_button_check_p%d' d = ($<player_status>.player) AddToStringLookup = true
	begin
	GetSongTime
	start_time = <songtime>
	Block type = <net_update_event>
	GetSongTime
	delta_time = (<songtime> - <start_time>)
	<time> = (<time> - (<delta_time> * 1000))
	KillSpawnedScript \{name = net_whammy_pitch_shift}
	spawnscriptnow net_whammy_pitch_shift params = {song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = (<event_data>.net_whammy_length) time = <time>}
	repeat
	KillSpawnedScript \{name = net_whammy_pitch_shift}
endscript
pitch_dirty = 1
prev_len = 0

script net_whammy_pitch_shift 
	if ($pitch_dirty = 1)
		change \{pitch_dirty = 0}
		change prev_len = <net_whammy_length>
		begin
		ControlWhammyPitchShift player_status = <player_status> net_whammy_length = <net_whammy_length> time = <time>
		Wait \{1
			gameframe}
		repeat
	else
		<len_delta> = (<net_whammy_length> - $prev_len)
		<len_base> = ($prev_len)
		change prev_len = <net_whammy_length>
		<frames> = 5
		<scale> = (1.0 / <frames>)
		<scale_step> = <scale>
		begin
		<len> = (<len_base> + (<len_delta> * <scale>))
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> player = ($<player_status>.player)
		<scale> = (<scale> + <scale_step>)
		Wait \{1
			gameframe}
		repeat <frames>
		begin
		set_whammy_pitchshift control = <net_whammy_length> player_status = <player_status>
		<whammy_scale> = (((<net_whammy_length> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> player = ($<player_status>.player)
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script set_net_client_highway 
	change structurename = <player_status> highway_layout = <layout>
endscript

script set_net_client_lefty 
	change structurename = player2_status lefthanded_gems = <lefty_flip_p2>
	change structurename = player2_status lefthanded_button_ups = <lefty_flip_p2>
endscript

script net_copy_intial_params 
	change globalname = <copy_to> newvalue = $<copy_from>
endscript

script net_commit_or_reset_params 
	if GotParam \{commit}
		change globalname = <copy_to> newvalue = $<copy_from>
	else
		if (<type> = loc)
			<text> :SE_SetProps text = ($LevelZones.($LevelZoneArray [$<global>]).title)
		else
			<text> :SE_SetProps text = ($FilterTypes.<type>.values [$<global>])
		endif
	endif
	change_coop_value_if_ranked
endscript

script net_custom_up_down \{direction = up}
	if (<type> = loc)
		GetArraySize ($LevelZoneArray)
	else
		GetArraySize ($FilterTypes.<type>.values)
	endif
	if (<direction> = up)
		if ((<array_size> -1) = $<global>)
			change globalname = <global> newvalue = 0
		else
			change globalname = <global> newvalue = ($<global> + 1)
		endif
	else
		if (0 = $<global>)
			change globalname = <global> newvalue = (<array_size> -1)
		else
			change globalname = <global> newvalue = (<global> - 1)
		endif
	endif
	if (<type> = loc)
		<text> :SE_SetProps text = ($LevelZones.($LevelZoneArray [$<global>]).title) scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	else
		<text> :SE_SetProps text = ($FilterTypes.<type>.values [$<global>]) scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	endif
	if (($SearchMatchTypeValue = 1) && (<type> = mode) && ($<global> = 4) && ($ui_flow_manager_state [0] = custom_match_fs))
		net_custom_up_down <...>
	endif
	if (($<global> = 2) && (<type> = search))
		if NOT isXenon
			net_custom_up_down <...>
		endif
	endif
endscript

script change_coop_value_if_ranked 
	if (($SearchMatchTypeValue = 1) && ($SearchGameModeValue = 4))
		net_custom_up_down \{direction = up
			type = mode
			global = SearchGameModeValue
			text = game_mode_selection_text}
	endif
endscript

script block_unblock_difficulty_actions \{diff_focus = off
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
			difficulty :SE_SetProps rgba = <change_color> unblock_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :SE_SetProps rgba = <change_color> text = <new_text> unblock_events
		endif
	else
		if ScreenElementExists \{id = difficulty}
			difficulty :SE_SetProps rgba = ($online_grey) block_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :SE_SetProps rgba = ($online_grey) text = qs("\LN/A") block_events
		endif
	endif
endscript

script net_init 
	change \{is_network_game = 1}
	SetNetworkMode \{$INTERNET_MODE}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionFunc \{func = getnumplayers}
	spawn_player_drop_listeners
endscript

script wait_for_dw_init 
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		frame}
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
		if CheckForSignIn controller_index = <controller_index>
			NetSessionFunc func = AddControllers params = {controller = <controller_index>}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
endscript

script add_active_controllers_local 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		if CheckForSignIn local controller_index = <controller_index>
			NetSessionFunc func = AddControllers params = {controller = <controller_index>}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
endscript

script update_ingame_controllers 
	if ($is_network_game = 0)
		if GotParam \{controller}
			NetSessionFunc \{func = RemoveAllControllers}
			if IsArray <controller>
				GetArraySize <controller>
				if (<array_size> > 0)
					<i> = 0
					begin
					<c> = (<controller> [<i>])
					NetSessionFunc func = AddControllers params = {controller = <c>}
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			else
				NetSessionFunc func = AddControllers params = {controller = <controller>}
			endif
		else
			add_active_controllers_local
		endif
	endif
endscript

script setup_online_player_settings 
	GetGlobalTags \{user_options}
	switch (<online_highway>)
		case 0
		change \{structurename = player1_status
			highway_layout = default_highway}
		case 1
		change \{structurename = player1_status
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
	repeat <array_size>
	<last_song_index> = (<array_entry> - 1)
	GetRandomValue name = random_value Integer a = <first_song_index> b = <last_song_index>
	return random_song = ($gh_songlist [<random_value>])
endscript

script start_network_game 
	if IsHost
		startnetworkgame
	endif
endscript

script check_for_final_song_selection 
	if (($tie_breaker) = song_rand)
		return \{can_select_final_song = false}
	elseif (($tie_breaker) = HOST)
		if IsHost
			return \{can_select_final_song = true}
		else
			return \{can_select_final_song = false}
		endif
	elseif (($tie_breaker) = CLIENT)
		if IsHost
			return \{can_select_final_song = false}
		else
			return \{can_select_final_song = true}
		endif
	endif
endscript

script online_fail_song 
	printf \{qs("\L---online fail song")}
	change \{disable_attacks = 1}
	if ((GameIsOver) || (SessionIsOver))
		return
	endif
	NetFailSong
endscript

script online_win_song 
	if ($net_pause = 1)
		net_unpausegh
	endif
	disable_pause
	printf \{qs("\L---online_win_song")}
	change \{disable_attacks = 1}
	change structurename = <player_status> best_run = <note_streak>
	change structurename = <player_status> total_notes = <total_notes>
	change structurename = <player_status> notes_hit = <notes_hit>
	if (<quit_early>)
		change \{player2_present = 0}
		if ($match_type = ranked)
			ranked_quit_fix_scores
		endif
		if ($game_mode = p2_battle)
			change \{structurename = player1_status
				current_health = 1.0}
			change \{structurename = player2_status
				current_health = 0.0}
		else
			change \{structurename = player2_status
				score = 0.0}
		endif
		wait_for_net_popup
	endif
	player_text = ($<player_status>.text)
endscript

script broadcast_received_winner_stats 
	change structurename = <player_status> best_run = <note_streak>
	change structurename = <player_status> total_notes = <total_notes>
	change structurename = <player_status> notes_hit = <notes_hit>
	if ($game_mode = p2_battle)
		record_net_statistics
	endif
endscript

script set_rich_presence_searching 
endscript

script set_rich_presence_game_mode \{online = 0}
	if ScreenElementExists \{id = metallifacts_container}
		change \{rich_presence_context = presence_gigboard_and_setlist}
		return
	endif
	if (<online>)
		change \{rich_presence_context = presence_online}
	elseif ($rich_presence_context != presence_music_studio)
		switch ($game_mode)
			case p1_career
			change \{rich_presence_context = presence_career}
			case p2_career
			case p3_career
			case p4_career
			change \{rich_presence_context = presence_band_career}
			case p1_quickplay
			case p2_quickplay
			case p3_quickplay
			case p4_quickplay
			change \{rich_presence_context = presence_quickplay}
			case p2_pro_faceoff
			case p2_faceoff
			case p2_battle
			change \{rich_presence_context = presence_head_to_head}
			case training
			change \{rich_presence_context = presence_practice}
			case tutorial
			change \{rich_presence_context = presence_tutorial}
		endswitch
	endif
endscript

script get_custom_match_search_params 
	if (($SearchGameModeValue = 0) || ($SearchGameModeValue = 2))
		difficulty_checksum = ($FilterTypes.diff.checksum [($SearchDifficultyValue)])
	else
		difficulty_checksum = dont_care
	endif
	return {
		difficulty = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.checksum [($SearchGameModeValue)])
		num_songs = ($FilterTypes.num_songs.checksum [($SearchNumSongsValue)])
	}
endscript

script get_quick_match_search_params 
	ScriptAssert \{qs("\Lget_quick_match_search_params is obsolete")}
endscript
bPS3SingleSignOnCheckComplete = 0

script xenon_singleplayer_session_init \{ps3_signin_callback = xenon_singleplayer_session_init}
	if CheckForSignIn
		NetSessionFunc \{func = stats_uninit}
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_init}
		if isXenon
			NetSessionFunc \{func = start_singleplayer_session
				obj = session}
		endif
	else
		if NOT isXenon
			if ($is_attract_mode = 0)
				if NOT GotParam \{from_callback}
					if (0 = $bPS3SingleSignOnCheckComplete)
						NetSessionFunc func = onlinesignin params = {callback = <ps3_signin_callback>}
						change \{bPS3SingleSignOnCheckComplete = 1}
					endif
				else
					printf \{qs("\LPS3: unable to signin in to the network platform")}
					change \{ps3_signin_complete = 1}
				endif
			endif
		endif
	endif
endscript

script begin_singleplayer_game 
	if ($is_network_game = 1)
		if IsHost
			if NetSessionFunc \{obj = session
					func = has_active_session}
				NetSessionFunc \{obj = session
					func = begin_singleplayer_game}
			endif
		endif
	else
		if NetSessionFunc \{obj = session
				func = has_active_session}
			NetSessionFunc \{obj = session
				func = begin_singleplayer_game}
		endif
	endif
endscript

script end_singleplayer_game 
	if NetSessionFunc \{obj = session
			func = has_active_session}
		NetSessionFunc \{obj = session
			func = end_singleplayer_game}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	printscriptinfo \{qs("--- xenon_singleplayer_session_begin_uninit")}
	if isXenon
		if NetSessionFunc \{obj = session
				func = is_singleplayer_session}
			NetSessionFunc \{func = stop_singleplayer_session
				obj = session}
		endif
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	change \{net_safe_to_enter_net_play = 0}
	if NOT GotParam \{song_failed}
		Wait \{3
			seconds}
	endif
	NetSessionFunc \{obj = session
		func = unpost_game}
	change \{net_safe_to_enter_net_play = 1}
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
	GameMode_GetNumPlayers
	players_on_team = (<num_players> / 2)
	if GameMode_IsCooperative
		<players_on_team> = <num_players>
	endif
	if (<players_on_team> > 0)
		i = 1
		begin
		GetPlayerInfo <i> part
		GetPlayerInfo <i> difficulty
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
			case Bass
			<bass_rating> = <rating>
			case drum
			<drum_rating> = <rating>
			case Vocals
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
	if NOT GotParam \{player_list}
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
		NetSessionFunc func = stats_write_multiplayer obj = stats params = {player_list = <player_list>}
	else
		if (<end_session> = 1)
			NetSessionFunc func = stats_write_multiplayer obj = stats params = {player_list = <player_list>}
		else
			NetSessionFunc func = stats_write_multiplayer obj = stats params = {player_list = <player_list> dontendsessionafterwrite}
		endif
	endif
endscript

script get_single_career_lb_stats 
	printf \{channel = net
		qs("\L--- get_single_career_lb_stats ---")}
	player1_xuid = [0 0]
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		if (<end_session> = 1)
			xenon_singleplayer_session_begin_uninit
		endif
		return
	endif
	GetPlayerInfo <player_num> difficulty
	if ChecksumEquals a = <difficulty> b = easy_rhythm
		if (<end_session> = 1)
			xenon_singleplayer_session_begin_uninit
		endif
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
	controller = ($primary_controller)
	if CheckForSignIn controller_index = <controller>
		GetNetID controller_index = <controller>
		SetArrayElement ArrayName = player1_xuid index = 0 newvalue = <net_id_first>
		SetArrayElement ArrayName = player1_xuid index = 1 newvalue = <net_id_second>
		GetPlayerInfo <player_num> part
		switch (<part>)
			case guitar
			career_leaderboard_id = lb_career_guitar
			case Bass
			career_leaderboard_id = lb_career_bass
			case drum
			career_leaderboard_id = lb_career_drum
			case Vocals
			career_leaderboard_id = lb_career_vocals
		endswitch
		get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
		summation_career_score tier_global = <tier_global>
		GetPlayerInfo <player_num> score
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
			printf \{qs("\Lyou screwed up somewhere dude")}
		endswitch
		if (<score> > 0)
			player_list = [
				{
					player_xuid = <player1_xuid>
					team = 0
					leaderboards = [
						{
							leaderboard_id = <leaderboard_id>
							rating = <rating>
							score = <score>
							write_type = max
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
							write_type = max
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
							write_type = max
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
			return player_list = <player_list>
		endif
	endif
endscript

script get_multiplayer_career_lb_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{channel = net
		qs("\L--- get_multiplayer_career_lb_stats ---")}
	career_leaderboard_id = lb_career_band
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	player_xuid = [0 0]
	player_list = []
	band_score = ($band1_status.score)
	CastToInteger \{band_score}
	index = 1
	GameMode_GetNumPlayers
	begin
	<player_xuid> = [0 0]
	<rating> = 0
	<easy_score> = 0
	<medium_score> = 0
	<hard_score> = 0
	<expert_score> = 0
	GetPlayerInfo <index> is_local_client
	if ($is_network_game = 0 || ($is_network_game = 1 && <is_local_client> = 1))
		GetPlayerInfo <index> difficulty
		if NOT ChecksumEquals a = <difficulty> b = easy_rhythm
			GetPlayerInfo <index> controller
			if CheckForSignIn controller_index = <controller>
				GetNetID controller_index = <controller>
				SetArrayElement ArrayName = player_xuid index = 0 newvalue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 newvalue = <net_id_second>
				summation_career_score tier_global = <tier_global>
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
				GetPlayerInfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case Bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case Vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				get_song_struct song = <song_checksum>
				FormatText checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = <part_text>
				FormatText checksumname = lb_band_song_id '%s_band' s = (<song_struct>.name)
				GetPlayerInfo <index> score
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
				printf qs("\LPlayer - %i part - %p score - %s") i = <index> p = <part> s = <score>
				if (<band_score> > 0)
					new_player_info = {
						player_xuid = <player_xuid>
						team = 0
						leaderboards = [
							{
								leaderboard_id = <career_leaderboard_id>
								rating = 0
								score = <career_score>
								write_type = max
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
								write_type = max
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
								write_type = max
								columns = [
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
									{score = <career_earnings>}
								]
							}
						]
					}
					AddArrayElement array = <player_list> element = <new_player_info>
					<player_list> = <array>
				endif
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	return player_list = <player_list>
endscript

script get_non_career_lb_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{channel = net
		qs("\L--- get_non_career_lb_stats ---")}
	player_list = []
	<player_xuid> = [0 0]
	index = 1
	GameMode_GetNumPlayers
	begin
	<player_xuid> = [0 0]
	<rating> = 0
	<easy_score> = 0
	<medium_score> = 0
	<hard_score> = 0
	<expert_score> = 0
	GetPlayerInfo <index> is_local_client
	if ($is_network_game = 0 || ($is_network_game = 1 && <is_local_client> = 1))
		GetPlayerInfo <index> difficulty
		if NOT ChecksumEquals a = <difficulty> b = easy_rhythm
			GetPlayerInfo <index> controller
			if CheckForSignIn controller_index = <controller>
				GetNetID controller_index = <controller>
				SetArrayElement ArrayName = player_xuid index = 0 newvalue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 newvalue = <net_id_second>
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
				GetPlayerInfo <index> score
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
				GetPlayerInfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case Bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case Vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				FormatText checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = <part_text>
				FormatText checksumname = lb_band_song_id '%s_band' s = (<song_struct>.name)
				printf qs("\LPlayer - %i part - %p score - %s") i = <index> p = <part> s = <score>
				GameMode_GetType
				if (<num_players> > 1 && <type> = quickplay)
					band_score = ($band1_status.score)
					CastToInteger \{band_score}
					if (<band_score> > 0)
						new_player_info = {
							player_xuid = <player_xuid>
							team = 0
							leaderboards = [
								{
									leaderboard_id = <lb_band_song_id>
									rating = <band_rating>
									score = <band_score>
									write_type = max
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
									write_type = max
									columns = [
										{score = <career_earnings>}
										{score = <career_earnings>}
										{score = <career_earnings>}
										{score = <career_earnings>}
									]
								}
							]
						}
						AddArrayElement array = <player_list> element = <new_player_info>
						<player_list> = <array>
					endif
				else
					if (<score> > 0)
						new_player_info = {
							player_xuid = <player_xuid>
							team = 0
							leaderboards = [
								{
									leaderboard_id = <lb_song_id>
									rating = <rating>
									score = <score>
									write_type = max
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
									write_type = max
									columns = [
										{score = <career_earnings>}
										{score = <career_earnings>}
										{score = <career_earnings>}
										{score = <career_earnings>}
									]
								}
							]
						}
						AddArrayElement array = <player_list> element = <new_player_info>
						<player_list> = <array>
					endif
				endif
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	return player_list = <player_list>
endscript

script net_write_single_player_stats 
	printf \{channel = net
		qs("\L--- net_write_single_player_stats ---")}
	RequireParams \{[
			song_checksum
		]
		all}
	net_retrieve_controller_scores
	if (<total_score> > 0)
		if Achievements_IsCheatingAutoKick
			autokick_cheating = 1
		else
			autokick_cheating = 0
		endif
		if NOT (($game_mode = p2_battle) || ($game_mode = practice) || $Cheat_FreeDrum = 1 || $Cheat_AlwaysSlide = 1 || (<autokick_cheating> = 1) || ($game_mode = p2_faceoff))
			if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
				CastToInteger \{total_score}
				get_song_struct song = <song_checksum>
				FormatText checksumname = band_song_checksum '%s_band' s = (<song_struct>.name)
				send_leader_board_message score = <total_score> leaderboard_id = <band_song_checksum> end_session = <end_session> song_checksum = <song_checksum>
			else
				primary_player_score = (<scores> [<primary_index>])
				CastToInteger \{primary_player_score}
				net_retrieve_primary_controller_part
				primary_player_part = <primary_part>
				switch (<primary_player_part>)
					case guitar
					part = 'guitar'
					case Bass
					part = 'backup'
					case drum
					part = 'drums'
					case Vocals
					part = 'mic'
					case rhythm
					part = 'backup'
					default
					part = 'none'
				endswitch
				get_song_struct song = <song_checksum>
				FormatText checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = <part>
				send_leader_board_message score = <primary_player_score> leaderboard_id = <lb_song_id> end_session = <end_session> song_checksum = <song_checksum>
			endif
		else
			if (<end_session> = 1)
				printstruct <...>
				xenon_singleplayer_session_begin_uninit
			endif
		endif
	else
		if (<end_session> = 1)
			printstruct <...>
			xenon_singleplayer_session_begin_uninit
		endif
	endif
endscript

script net_retrieve_controller_scores 
	GameMode_GetNumPlayers
	total_score = 0
	index = 1
	primary_index = 0
	<array> = []
	begin
	GetPlayerInfo <index> score
	CastToInteger \{score}
	GetPlayerInfo <index> controller
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
		qs("\Lsummation_career_score")}
	setlist_prefix = ($<tier_global>.prefix)
	printstruct channel = net <...>
	career_score = 0
	tier = 1
	begin
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
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
	printf channel = net qs("\LAdding %s for %a to career_score - %c") s = <best_score> a = <song_checksum> c = <career_score>
	<career_score> = (<career_score> + <best_score>)
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
	CastToInteger \{career_score}
	printf qs("\Lreturning career_score - %c") c = <career_score>
	return career_score = <career_score>
endscript

script online_song_end_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{qs("\L--- online_song_end_write_stats ---")}
	player_xuid = [0 0]
	player_list = []
	guitar_rating = 0
	bass_rating = 0
	drum_rating = 0
	vocals_rating = 0
	band_rating = 5
	GameMode_GetNumPlayers
	players_on_team = (<num_players> / 2)
	if GameMode_IsCooperative
		<players_on_team> = <num_players>
	endif
	i = 1
	begin
	GetPlayerInfo <i> part
	GetPlayerInfo <i> difficulty
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
		case Bass
		<bass_rating> = <rating>
		case drum
		<drum_rating> = <rating>
		case Vocals
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
	GameMode_GetType
	if (<type> = quickplay)
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
		GetPlayerInfo <index> is_local_client
		if (<is_local_client> = 1)
			GetPlayerInfo <index> difficulty
			if NOT ChecksumEquals a = <difficulty> b = easy_rhythm
				GetPlayerInfo <index> net_id_first
				GetPlayerInfo <index> net_id_second
				SetArrayElement ArrayName = player_xuid index = 0 newvalue = <net_id_first>
				SetArrayElement ArrayName = player_xuid index = 1 newvalue = <net_id_second>
				GetPlayerInfo <index> part
				switch (<part>)
					case guitar
					part_text = 'guitar'
					case Bass
					part_text = 'backup'
					case drum
					part_text = 'drums'
					case Vocals
					part_text = 'mic'
					case rhythm
					part_text = 'backup'
					default
					part_text = 'none'
				endswitch
				get_song_struct song = <song_checksum>
				FormatText checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = <part_text>
				FormatText checksumname = lb_band_song_id '%s_band' s = (<song_struct>.name)
				GetPlayerInfo <index> score
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
					GameMode_GetType
					if (<num_players> > 1)
						GetPlayerInfo <index> controller
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
									write_type = max
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
									write_type = max
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
					AddArrayElement array = <player_list> element = <new_player_info>
					<player_list> = <array>
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <num_players>
	endif
	if GotParam \{player_list}
		NetSessionFunc func = stats_write_multiplayer obj = stats params = {player_list = <player_list>}
	else
		NetSessionFunc \{obj = session
			func = end_active_session}
	endif
endscript

script online_match_end_write_stats 
	write_stats = 0
	if isXenon
		if (NetSessionFunc func = isranked obj = match)
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
		if GotParam \{player_list}
			NetSessionFunc func = stats_write_multiplayer obj = stats params = {player_list = <player_list>}
		endif
	endif
	Wait \{3
		seconds}
	NetSessionFunc \{obj = stats
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
		FormatText checksumname = leaderboard_id_p1 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		FormatText checksumname = leaderboard_id_p2 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
		case p2_pro_faceoff
		FormatText checksumname = leaderboard_id_p1 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		FormatText checksumname = leaderboard_id_p2 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
		case p2_battle
		FormatText checksumname = leaderboard_id_p1 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player1_status.difficulty))
		FormatText checksumname = leaderboard_id_p2 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($player2_status.difficulty))
	endswitch
	return {p1_leaderboard_id = <leaderboard_id_p1> p2_leaderboard_id = <leaderboard_id_p2>}
endscript

script prepare_player_list_array 
	net_stats_calculate_wins
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	SetArrayElement ArrayName = player1_xuid index = 0 newvalue = ($player1_status.net_id_first)
	SetArrayElement ArrayName = player1_xuid index = 1 newvalue = ($player1_status.net_id_second)
	SetArrayElement ArrayName = player2_xuid index = 0 newvalue = ($player2_status.net_id_first)
	SetArrayElement ArrayName = player2_xuid index = 1 newvalue = ($player2_status.net_id_second)
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
		player_list = [
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
		player_list = [
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
	return player_list = <player_list>
endscript

script get_match_type_leaderboard_info 
	if NOT ($game_mode = p2_battle)
		net_stats_calculate_total_scores
		player1_score = <p1_score>
		CastToInteger \{player1_score}
		player2_score = <p2_score>
		CastToInteger \{player2_score}
		return {
			write_type = max
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
			write_type = accumulate
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
	if NOT ((<type> = open_comm) || (<type> = ready_up))
		return
	endif
	switch <type>
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
		<checksum_value> = null
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
				LaunchEvent \{type = unfocus
					target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				type = lobby_ready
				ready_status = <action>
			}
		endif
	else
		if ($p1_ready = 1)
			if ScreenElementExists \{id = vmenu_character_hub_p1}
				LaunchEvent \{type = unfocus
					target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				type = lobby_ready
				ready_status = <action>
			}
		else
			character_hub_go_back \{player = 1}
		endif
	endif
endscript

script net_request_play_show_ack 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if GotParam \{action}
		if (<action> = 0)
			if (<player> = 1)
				character_hub_go_back player = <player>
			else
				character_hub_net_ready_back
			endif
		else
			if (<player> = 1)
				character_hub_select_play_show player = <player>
				if ScreenElementExists \{id = vmenu_character_hub_p1}
					LaunchEvent \{type = focus
						target = vmenu_character_hub_p1}
				endif
			else
				character_hub_net_ready
			endif
		endif
	endif
endscript

script net_pausegh 
	printf \{qs("\L---net_pausegh")}
	change \{net_pause = 1}
	BroadcastEvent \{type = event_pause_game}
	generic_event_choose \{state = UIstate_pausemenu}
	Wait \{1
		gameframe}
endscript

script net_unpausegh 
	printf \{qs("\L---net_unpausegh")}
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
	Wait \{1
		gameframe}
	change \{net_pause = 0}
endscript

script gameinvite_server_unavailable 
	printf \{qs("\L--- gameinvite_server_unavailable")}
	net_party_attempted_join_result \{join_result = 0
		join_mode = failed_invite_search
		reason = bad_state}
endscript

script destroy_join_refuse_dialog 
	destroy_connection_dialog_scroller
	destroy_popup_warning_menu
endscript

script createjoinrefuseddialog 
	ScriptAssert \{qs("\Ldeprecated")}
endscript

script create_net_popup \{title = qs("")
		popup_text = qs("")}
	destroy_net_popup
	change \{net_popup_active = 1}
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <popup_text>
		}
		no_background
	}
endscript

script append_animating_dots 
	printf \{qs("\L---append_animating_dots")}
	num_dots = 0
	if ScreenElementExists id = <id>
		begin
		FormatText TextName = new_text qs("\L%a\n%b") a = <text> b = ($dots_array [<num_dots>])
		<id> :SE_SetProps text = <new_text>
		if (<num_dots> = 3)
			<num_dots> = 0
		else
			<num_dots> = (<num_dots> + 1)
		endif
		Wait \{0.5
			second}
		repeat
	endif
endscript

script destroy_net_popup 
	change \{net_popup_active = 0}
	destroy_popup_warning_menu
endscript

script showjointimeoutnotice 
	cancel_join_server
	setup_sessionfuncs
	spawnscriptnow \{timeout_connection_attempt}
endscript

script timeout_connection_attempt 
	create_timeout_dialog
	ui_flow_manager_respond_to_action \{action = timeout}
	net_repeat_last_search
endscript

script failedtocreategame 
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
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement \{type = VScrollingMenu
		parent = root_window
		id = connection_dialog_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		type = VMenu
		parent = connection_dialog_scroller
		id = connection_dialog_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		z = 200.1
		text = qs("CONTINUE")}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		pos = (0.0, 0.0)}
	CreateScreenElement {
		type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = qs("CONNECTION TIMED OUT")
		pos = (640.0, 300.0)
		dims = (375.0, 200.0)
		z_priority = 200.0
		just = [center center]
	}
	LaunchEvent \{type = focus
		target = connection_dialog_vmenu}
endscript

script create_failed_connection_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement \{type = VScrollingMenu
		parent = root_window
		id = connection_dialog_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		type = VMenu
		parent = connection_dialog_scroller
		id = connection_dialog_vmenu
		pos = (0.0, 0.0)
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
		text = qs("CONTINUE")}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		pos = (0.0, 0.0)}
	CreateScreenElement {
		type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = qs("FAILED TO CONNECT TO GAME")
		pos = (640.0, 315.0)
		dims = (375.0, 200.0)
		z_priority = 200.0
		just = [center center]
	}
	LaunchEvent \{type = focus
		target = connection_dialog_vmenu}
endscript

script net_repeat_last_search 
	Wait \{1
		gameframe}
	ui_flow_manager_respond_to_action \{action = select_done}
endscript

script check_if_selecting_tie_breaker \{player = 1}
	if IsHost
		if (($tie_breaker = HOST) && (<player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
	else
		if (($tie_breaker = HOST) && (<player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
	endif
	return \{selecting_tiebreaker = 0}
endscript

script test_events \{passed_in_value = 'test value'}
	printf \{qs("\Ltest_events")}
	printstruct <...>
	NetSessionFunc \{obj = stats
		func = write_key_value
		params = {
			wtf_value = 'test value'
			key = 'test key'
		}}
endscript

script net_failed_signin 
	printf \{qs("\L--- net_failed_signin")}
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
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = signin_container
		pos = (0.0, 0.0)}
	change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	change \{menu_unfocus_color = [
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
		pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaySprite \{parent = signin_container
		tex = Dialog_Title_BG
		dims = (224.0, 224.0)
		z = 9
		pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	displaySprite \{parent = signin_container
		id = options_bg_1
		tex = dialog_menu_bg
		pos = (640.0, 500.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			botom
		]}
	displaySprite \{parent = signin_container
		id = options_bg_2
		tex = dialog_menu_bg
		pos = (640.0, 530.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			top
		]
		flip_h}
	CreateScreenElement \{type = TextElement
		parent = signin_container
		font = fontgrid_title_a1
		scale = 1.3
		rgba = [
			223
			223
			223
			250
		]
		text = qs("WARNING")
		just = [
			center
			top
		]
		z_priority = 10.0
		pos = (640.0, 175.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	if isXenon
		<sign_in_text> = qs("The current gamer profile is not enabled for Xbox LIVE multiplayer game play.")
	else
		if GotParam \{age_restricted}
			<sign_in_text> = qs("Online service is disabled on your PlayStation®Network account due to parental control restrictions.")
		else
			<sign_in_text> = qs("You must be signed in to enter the lobby.")
		endif
	endif
	scale = 1
	StringLength string = <sign_in_text>
	printf qs("\Llen = %d") d = <str_len>
	if (<str_len> >= 135)
		<scale> = 0.8
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = signin_container
		font = fontgrid_title_a1
		scale = 0.6
		rgba = [210 210 210 250]
		text = <sign_in_text>
		just = [center top]
		internal_just = [center top]
		internal_scale = <scale>
		z_priority = 10.0
		pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	CreateScreenElement \{type = ContainerElement
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
		type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($menu_unfocus_color)
		text = qs("CONTINUE")
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		just = [right center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)))
		alpha = 0.0
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		just = [left center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)))
		alpha = 0.0
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
	}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent \{type = focus
		target = sign_in_vmenu}
endscript

script xenon_auto_load_progress 
	printf \{qs("\L--- xenon_auto_load_progress")}
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		if ($online_signin_autoload_required = 1)
			change \{online_signin_autoload_required = 0}
			change \{respond_to_signin_changed = 0}
			printf \{'respond_to_signin_changed = 0'}
			printscriptinfo
			fadetoblack \{on
				time = 0
				alpha = 1.0
				z_priority = 20000
				id = invite_screenfader}
			Wait \{1
				gameframe}
			stoprendering
			shutdown_game_for_signin_change \{signin_change = 1}
			LaunchEvent \{type = unfocus
				target = root_window}
			startrendering
			Wait \{1
				gameframe}
			fadetoblack \{off
				time = 0
				id = invite_screenfader}
			Wait \{1
				gameframe}
			change invite_controller = ($primary_controller)
			ui_event \{event = menu_change
				data = {
					state = UIstate_boot_iis
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
	orig_height = <Height>
	orig_width = <width>
	if NOT GotParam \{target_width}
		target_width = <orig_width>
	endif
	if NOT GotParam \{target_height}
		target_height = <orig_height>
	endif
	xScale = (<target_width> / (<orig_width> * 1.0))
	yScale = (<target_height> / (<orig_height> * 1.0))
	<id> :LegacyDoMorph scale = (<xScale> * (1.0, 0.0) + <yScale> * (0.0, 1.0)) time = <time>
endscript

script translate_screen_element \{time = 0}
	if NOT GotParam \{id}
		printf \{'Did not pass in id to translate_screen_element! Returning'}
		return
	endif
	if NOT GotParam \{pos}
		GetScreenElementPosition id = <id>
		new_position = <screenelementpos>
	else
		new_position = <pos>
	endif
	<id> :LegacyDoMorph pos = <new_position> time = <time>
endscript

script get_my_highway_layout 
	player = 1
	begin
	FormatText checksumname = player_status 'player%p_status' p = <player>
	if ($<player_status>.is_local_client)
		return my_highway = ($<player_status>.highway_layout)
	endif
	<player> = (<player> + 1)
	repeat 2
endscript

script agora_update 
	if ($coop_dlc_active = 1)
		return
	endif
	get_game_mode_name
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	FormatText TextName = band_name '%s' s = <name>
	progression_info = {}
	if NOT GotParam \{new_band}
		get_completed_percentage \{part = guitar}
		AppendStruct {
			struct = progression_info
			field = guitar_career
			params = {
				score = 0
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = Bass}
		AppendStruct {
			struct = progression_info
			field = bass_career
			params = {
				score = 0
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = drum}
		AppendStruct {
			struct = progression_info
			field = drum_career
			params = {
				score = 0
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = Vocals}
		AppendStruct {
			struct = progression_info
			field = vocals_career
			params = {
				score = 0
				percent_complete = <completed_percentage>
			}
		}
		get_completed_percentage \{part = Band}
		AppendStruct {
			struct = progression_info
			field = band_career
			params = {
				score = 0
				percent_complete = <completed_percentage>
			}
		}
	endif
	GetGlobalTags \{achievement_info}
	achievements = 'what achievements?'
	purchases = 'test purchases'
	WriteUpdate {progression_info = <progression_info> band_name = <band_name> band_id = <band_id> Cash = <Cash>}
endscript

script net_get_character_name \{player = 1
		check_profanity = 1}
	RequireParams \{[
			player
		]
		all}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	if (($<player_status>.is_local_client) = 1)
		get_savegame_from_player_status player_status = <player_status>
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	id = ($<player_status>.character_id)
	if SearchMusicianProfileArray array_name = Net_Musician_Profiles id = <id>
		id = (($Net_Musician_Profiles [<index>]).old_character_id)
	endif
	resolve_guest_character_id id = <id>
	if band_builder_is_random character_id = <id>
		id = CustomCharacter
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
	printf \{qs("\Lagora_write_stats %s")
		s = $game_mode}
	if ($boss_battle = 1)
		return
	endif
	if ($is_network_game)
		GetPlayerInfo \{1
			gamertag}
		p1_name = $<gamertag>
		GetPlayerInfo \{2
			gamertag}
		p2_name = $<gamertag>
		retrieve_player_net_id \{player = 2}
		player_id2 = <net_id>
	else
		player_id2 = ($player2_status.controller)
	endif
	venue = (($LevelZones.$current_level).name)
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	GameMode_GetType
	switch (<type>)
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
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		participants_info = []
		index = 1
		begin
		GetPlayerInfo <index> score
		GetPlayerInfo <index> stars
		GetPlayerInfo <index> notes_hit
		GetPlayerInfo <index> total_notes
		GetPlayerInfo <index> best_run
		GetPlayerInfo <index> sp_phrases_hit
		GetPlayerInfo <index> sp_phrases_total
		GetPlayerInfo <index> difficulty
		GetPlayerInfo <index> part
		GetPlayerInfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		GetPlayerInfo <index> controller
		<net_id> = [0 0]
		GetPlayerInfo <index> is_local_client
		if (<is_local_client> = 1)
			if (<controller> > 3)
				<controller> = (<controller> - 4)
			endif
			GetNetID controller_index = <controller>
		else
			GetPlayerInfo <index> net_id_first
			GetPlayerInfo <index> net_id_second
		endif
		SetArrayElement ArrayName = net_id index = 0 newvalue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 newvalue = <net_id_second>
		if GameMode_IsCooperative
			<winner> = 1
			score = ($band1_status.score)
		else
			if (<num_players> > 2)
				GetPlayerInfo \{1
					team}
				<player1_team> = <team>
				GetPlayerInfo <index> team
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
				if (<type> = battle)
					if ($is_network_game = 1)
						GetPlayerInfo \{1
							save_health}
						player1_score = <save_health>
						GetPlayerInfo \{2
							save_health}
						player2_score = <save_health>
					else
						GetPlayerInfo \{1
							current_health}
						player1_score = <current_health>
						GetPlayerInfo \{2
							current_health}
						player2_score = <current_health>
					endif
					GetPlayerInfo <index> score
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
					GetPlayerInfo \{1
						score}
					player1_score = <score>
					GetPlayerInfo \{2
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
		create_agora_character_struct player = <index>
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
		if GotParam \{jam_info}
			WriteMultiPerformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner> jam_info = <jam_info>
		else
			WriteMultiPerformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner>
		endif
	else
		index = 1
		GetPlayerInfo <index> score
		GetPlayerInfo <index> stars
		GetPlayerInfo <index> notes_hit
		GetPlayerInfo <index> total_notes
		GetPlayerInfo <index> best_run
		GetPlayerInfo <index> sp_phrases_hit
		GetPlayerInfo <index> sp_phrases_total
		GetPlayerInfo <index> difficulty
		GetPlayerInfo <index> part
		GetPlayerInfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		retrieve_player_net_id player = <index>
		CastToInteger \{score}
		<net_id> = [0 0]
		GetPlayerInfo <index> is_local_client
		if (<is_local_client> = 1)
			GetNetID controller_index = <controller>
		else
			GetPlayerInfo <index> net_id_first
			GetPlayerInfo <index> net_id_second
		endif
		SetArrayElement ArrayName = net_id index = 0 newvalue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 newvalue = <net_id_second>
		create_agora_character_struct player = <index>
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
		if GotParam \{jam_info}
			WritePerformance mode = <mode> title = <title> participant_info = <participant_info> band_id = <band_id> venue = <venue> jam_info = <jam_info>
		else
			WritePerformance mode = <mode> title = <title> participant_info = <participant_info> band_id = <band_id> venue = <venue>
		endif
	endif
	change \{agora_failed_attempts = 0}
endscript

script WritePerformance 
	if ($Cheat_AirGuitar = 1)
		air_guitar_active = air_guitar_active
	endif
	if ($Cheat_PerformanceMode = 1)
		performance_mode = performance_mode
	endif
	printf \{qs("\LWritePerformance")}
	printstruct <...>
	NetSessionFunc obj = XmlKeyArchive func = WriteAgora params = {write_type = WritePerformance <...>}
endscript

script WriteMultiPerformance 
	printf \{qs("\LWriteMultiPerformance")}
	printstruct <...>
	NetSessionFunc obj = XmlKeyArchive func = WriteAgora params = {write_type = WriteMultiplayerMatch <...>}
endscript

script WriteUpdate \{band_id = 0
		band_name = 'test name'
		Cash = 100
		achievements = 'temp achievement string'}
	printf \{qs("\LWriteUpdate")}
	printstruct <...>
	NetSessionFunc obj = XmlKeyArchive func = WriteAgora params = {write_type = WriteUpdate <...>}
endscript

script invite_accepted 
	if ScriptIsRunning \{do_join_invite_stuff}
		printf 'invite_accepted - replaced old invite for controller %c' c = ($invite_controller)
		KillSpawnedScript \{name = do_join_invite_stuff}
	endif
	printf 'invite_accepted - controllerID %c' c = <controllerid>
	change invite_controller = <controllerid>
	if ($primary_controller_assigned = 0)
		printf \{'invite_accepted - primary controller not yet assigned!'}
		return
	else
		printf 'invite_accepted - $primary_controller %p' p = ($primary_controller)
	endif
	do_join_invite_stuff <...> accepted_invite
endscript

script send_fail_song_message \{wait_frames = 30
		quit_early = 0}
	if (IsHost)
		loser = 0
	else
		loser = 1
	endif
	GameMode_GetNumPlayersShown
	begin
	SendNetMessage {
		type = fail_song
		note_streak = ($player1_status.best_run)
		notes_hit = ($player1_status.notes_hit)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = <quit_early>
		loser = <loser>
	}
	repeat <num_players_shown>
	Wait <wait_frames> gameframes
endscript

script join_invite_stuff_check_for_bad_ui_state 
	if NOT ui_event_exists_in_stack \{name = 'memcard'}
		if NOT ui_event_exists_in_stack \{name = 'boot_download_scan'}
			if NOT ui_event_exists_in_stack \{name = 'signin'}
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script do_join_invite_stuff 
	printf \{'do_join_invite_stuff'}
	if GotParam \{accepted_invite}
		if ($signin_jam_mode = 1)
			return
		endif
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			ui_event_block \{event = menu_back}
		endif
		if (($primary_controller_assigned = 1) && ($invite_controller = $primary_controller))
			GetGlobalTags \{user_options}
			if (<autosave> = 1)
				if current_band_save_created controller = ($primary_controller)
					<invited_primary_controller> = true
				else
					<invited_primary_controller> = false
				endif
			else
				<invited_primary_controller> = true
			endif
		else
			<invited_primary_controller> = false
		endif
		printf qs("\Ldo_join_invite_stuff - invited primary controller=%i") i = <invited_primary_controller>
		change \{online_signin_autoload_required = 0}
		wait_for_safe_shutdown
		if ($signin_change_happening = 1)
			return
		endif
		printf \{qs("\Ldo_join_invite_stuff - started")}
		disable_pause
		if IsPs3
			NetSessionFunc \{obj = party
				func = leave_party}
		endif
		quit_network_game_early
		unpausespawnedscript \{ui_event_block}
		if (<invited_primary_controller> = true)
			if ($cas_heap_state = in_cas)
				create_loading_screen_empty
			else
				KillAllMovies
				WaitForAllMoviesToFinish
				set_bink_heap_state \{state = small}
				create_loading_screen \{no_bink}
			endif
		endif
		ui_event_wait_for_safe
		end_singleplayer_game
		if IsLocallySignedIn controller = ($primary_controller)
			if CheckForSignIn controller_index = ($primary_controller)
				net_init
			endif
		endif
		change \{has_invite_join_result_callback_completed = 0}
		startrendering
		if (<invited_primary_controller> = true)
			destroy_popup_warning_menu
			SetButtonEventMappings \{block_menu_input}
			change \{keep_loading_screen = 1}
			ui_event \{event = menu_replace
				data = {
					state = UIstate_mainmenu
					base_name = 'mainmenu'
					selected_index = 3
					clear_previous_stack
					ignore_camera = 1
				}}
			Block \{type = mainmenu_invite_finished}
			ui_event_remove_params \{param = ignore_camera}
			printf \{'do_join_invite_stuff - start waiting for frontend anims...'}
			begin
			if frontend_anim_paks_are_loaded
				printf \{'do_join_invite_stuff - frontend anims are now loaded'}
				break
			endif
			Wait \{1
				gameframe}
			repeat 1200
			printf \{'do_join_invite_stuff - done waiting for anims'}
			SetButtonEventMappings \{unblock_menu_input}
		else
			UnPauseGame
			unpausespawnedscript \{ui_event_block}
			begin
			<has_waited_for_invalid_ui_state> = 0
			begin
			ui_event_wait_for_safe
			if join_invite_stuff_check_for_bad_ui_state
				<has_waited_for_invalid_ui_state> = 1
			else
				break
			endif
			Wait \{1
				gameframes}
			repeat
			if (<has_waited_for_invalid_ui_state> = 0)
				break
			endif
			Wait \{1
				seconds}
			repeat
			destroy_popup_warning_menu
			ui_event_block event = menu_replace data = {state = uistate_signin device_num = ($invite_controller) clear_previous_stack}
			return
		endif
		if NOT NetSessionFunc func = IsControllerInGame params = {controller = ($invite_controller)}
			NetSessionFunc func = AddControllers params = {controller = ($invite_controller)}
		endif
		change \{invite_controller = -1}
		printstruct <...>
		xenon_singleplayer_session_begin_uninit
		UnPauseGame
		GetActiveControllers
		<controller_idx> = 0
		begin
		if NetSessionFunc func = IsControllerInGame params = {controller = <controller_idx>}
			if NOT CheckForSignIn controller_index = <controller_idx>
				printf 'do_join_invite_stuff - removed controller %c, not signed in' c = <controller_idx>
				NetSessionFunc func = RemoveController params = {controller = <controller_idx>}
			endif
			if (<active_controllers> [<controller_idx>] = 0)
				NetSessionFunc func = RemoveController params = {controller = <controller_idx>}
			endif
		endif
		<controller_idx> = (<controller_idx> + 1)
		repeat 4
		JoinInviteServer
	else
		printf \{'do_join_invite_stuff - not accepted'}
		ui_event_block \{event = menu_replace
			data = {
				state = UIstate_mainmenu
				base_name = 'mainmenu'
				selected_index = 3
				clear_previous_stack
			}}
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

script ui_print_gamertag start_pos = (235.0, 100.0) color = ($player1_color) player = 1 dims = (450.0, 35.0) z = 60 offscreen = 0
	return
	if NOT GotParam \{name}
		net_get_character_name player = <player>
		name = <display_name>
	endif
	if NOT ScreenElementExists \{id = gamertag_container}
		if (<offscreen> = 1)
			CreateScreenElement {
				type = ContainerElement
				id = gamertag_container
				parent = root_window
				pos = (0.0, -400.0)
				just = [center center]
				z_priority = <z>
			}
		else
			CreateScreenElement {
				type = ContainerElement
				id = gamertag_container
				parent = root_window
				pos = (0.0, 0.0)
				just = [center center]
				z_priority = <z>
			}
		endif
	endif
	FormatText checksumname = gamertag_text_px 'gamertag_text_p%d' d = <player>
	FormatText checksumname = debug_gamertag_container_px 'debug_gamertag_container_p%d' d = <player>
	FormatText checksumname = gt_frame_top 'gt_frame_top_p%d' d = <player>
	FormatText checksumname = gt_frame_top_fill 'gt_frame_top_fill_p%d' d = <player>
	FormatText checksumname = gt_frame_bottom 'gt_frame_bottom_p%d' d = <player>
	FormatText checksumname = gt_frame_bottom_fill 'gt_frame_bottom_fill_p%d' d = <player>
	if (ScreenElementExists id = <gamertag_text_px>)
		if ScreenElementExists \{id = gamertag_icon_container}
			SetScreenElementProps \{id = gamertag_icon_container
				alpha = 1}
		endif
		return
	endif
	CreateScreenElement {
		type = TextElement
		parent = gamertag_container
		font = fontgrid_title_a1
		rgba = <color>
		text = <name>
		id = <gamertag_text_px>
		pos = (<start_pos> + (0.0, 3.0))
		just = <just>
		scale = 0.75
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
	if (<Height> > <y_dim>)
		<y_scale> = (<y_dim> / <Height>)
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> + (0.0, 1.0) * <y_scale>)
	SetScreenElementProps {id = <gamertag_text_px> scale = <scale_pair>}
	GetScreenElementDims id = <gamertag_text_px>
	text_w = (<width> + 80)
	text_h = (<dims>.(0.0, 1.0) + 10)
	GetScreenElementDims id = <gt_frame_top>
	frame_w = (<width> / 1.0)
	frame_h = (<Height> / 1.0)
	frame_scale_x = (<text_w> / <frame_w>)
	frame_scale_y = (<text_h> / <frame_h>)
	frame_scale = ((<frame_scale_x> * (1.0, 0.0)) + (<frame_scale_y> * (0.0, 0.5625)))
	SetScreenElementProps {id = <gt_frame_top> scale = <frame_scale>}
	SetScreenElementProps {id = <gt_frame_top_fill> scale = <frame_scale>}
	x_adjust = (0.0, 0.0)
	y_adjust = (0.0, 0.0)
	y_adjust = ((0.0, 1.0) * ((-5 * <y_scale>) -5))
	if ((<just> [0]) = right)
		x_adjust = ((1.0, 0.0) * 40)
	elseif ((<just> [0]) = left)
		x_adjust = ((1.0, 0.0) * -40)
	endif
	new_pos = (<start_pos> + (<x_adjust> + <y_adjust>))
	SetScreenElementProps {id = <gt_frame_top> pos = <new_pos>}
	SetScreenElementProps {id = <gt_frame_top_fill> pos = <new_pos>}
	GetScreenElementProps id = <gt_frame_top>
	GetScreenElementDims id = <gt_frame_top>
	GetPlatform
	if (<player> = 2 && <platform> = xenon)
		GetScreenElementDims id = <id>
		tag_width = 0
		if ((<just> [0]) = -1)
			<tag_width> = <width>
		elseif ((<just> [0]) = 0)
			<tag_width> = (<width> * 0.5)
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = gamertag_container
			id = gamertag_icon_container
			pos = (<pos> + (<Height> * (0.0, 1.0)) + (<tag_width> * (1.0, 0.0)) + (-40.0, 23.0))
		}
		displayText {
			parent = gamertag_icon_container
			text = qs("GAMER CARD")
			just = [right top]
			rgba = [0 0 0 255]
			noshadow
			pos = (0.0, 5.0)
			scale = 0.5
			font = ($user_control_text_font)
			z = (<z> + 200)
		}
		GetScreenElementDims id = <id>
		text_end = (<width> * (1.0, 0.0) + (20.0, 0.0))
		text_begin = ((-30.0, 0.0) - (<width> * (1.0, 0.0)))
		displayText {
			parent = gamertag_icon_container
			text = qs("\L\ba")
			pos = (<text_begin> + (20.0, -1.0))
			just = [right top]
			font = ($gh3_button_font)
			scale = 0.5
			z = (<z> + 200)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_end
			pos = (10.0, 15.0)
			just = [right center]
			dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_body
			pos = (0.0, 15.0)
			just = [right center]
			dims = ((32.0, 32.0) + <width> * (1.0, 0.0))
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = helper_pill_end
			pos = ((0.0, -2.0) - <width> * (1.0, 0.0) - (32.0, 0.0))
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

script destroy_gamertag_container \{player = 1}
	FormatText checksumname = gamertag_container 'gamertag_container_p%d' d = <player>
	if ScreenElementExists id = <gamertag_container>
		DestroyScreenElement id = <gamertag_container>
	endif
endscript

script morph_gamertags 
	if ScreenElementExists \{id = gamertag_container}
		move_gamertag_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_gamertag_pos) + (<delta> * ((($g_hud_2d_struct_used).final_gamertag_pos) + <off_set>)))
		LegacyDoScreenElementMorph id = gamertag_container pos = <move_gamertag_pos> time = <time_to_move>
		if ScreenElementExists \{id = gamertag_icon_container}
			SetScreenElementProps \{id = gamertag_icon_container
				alpha = 0}
		endif
	endif
endscript

script test_write_leaderboards 
	printf \{qs("\Ltest_write_leaderboards")}
	begin_singleplayer_game
	Wait \{0.3
		seconds
		ignoreslomo}
	if NOT should_update_stats_leader_board
		return
	endif
	NetSessionFunc obj = stats func = write_stats params = {leaderboard_id = anarchy_in_the_uk score = 10000 rating = <rating_val>}
endscript

script test_read_leaderboards 
	NetSessionFunc \{obj = stats
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
	retrieve_player_net_id \{player = 2}
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
	ExtendCRC \{song_won
		'p1'
		out = type}
	BroadcastEvent type = <type> data = {song_complete = 1}
endscript
new_message_of_the_day = 0

script splash_callback 
	printf \{qs("\Lsplash_callback")}
	printstruct <...>
	if GotParam \{motd_text}
		change \{new_message_of_the_day = 1}
	else
		change \{new_message_of_the_day = 0}
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
	printf \{qs("\Ltest_callback")}
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
	shut_down_flow_manager \{player = 2}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_character_hub_p1}
	destroy_menu \{menu_id = character_hub_p1_container}
	destroy_menu \{menu_id = scrolling_character_hub_p2}
	destroy_menu \{menu_id = character_hub_p2_container}
	KillCamAnim \{name = gs_view_cam}
	<player> = 1
	begin
	FormatText checksumname = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <player>
	FormatText checksumname = s_container 's_container_p%i' i = <player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <s_container>
	<player> = (<player> + 1)
	repeat 2
	<player> = 1
	begin
	FormatText checksumname = scrolling_select_style 'scrolling_select_style_p%i' i = <player>
	FormatText checksumname = s_container 's_container_p%i' i = <player>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <s_container>
	<player> = (<player> + 1)
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
	<player> = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	<band_member> = ($<player_status>.band_member)
	if CompositeObjectExists name = <band_member>
		if <band_member> :Anim_AnimNodeExists id = BodyTimer
			<band_member> :Anim_Command target = BodyTimer command = Timer_SetSpeed params = {Speed = 1.0}
		endif
	endif
	<player> = (<player> + 1)
	repeat 2
	<player> = 1
	begin
	FormatText checksumname = scrolling_select_finish 'scrolling_select_finish_p%i' i = <player>
	destroy_menu menu_id = <scrolling_select_finish>
	<player> = (<player> + 1)
	repeat 2
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script removeobserverbg 
endscript

script net_disable_pause 
	if ($net_pause = 1)
		net_unpausegh
	endif
	disable_pause
endscript

script net_fail_coop_song 
	printf \{qs("\L--- net_fail_coop_song")}
	net_disable_pause
	change \{disable_attacks = 1}
	change \{recovered_dropped_players = 0}
	change \{net_num_players_data_ack = 0}
	if (IsHost)
		i = 1
		GameMode_GetNumPlayersShown
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if (($<player_status>.is_local_client) = 1)
			change net_num_players_data_ack = ($net_num_players_data_ack + 1)
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		getnumplayers
		change net_num_players_data_needed = <num_players>
		SendStructure callback = set_client_band_score data_to_send = {band_score = ($band1_status.score)}
	else
		player_data = {}
		i = 1
		GameMode_GetNumPlayersShown
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if (($<player_status>.is_local_client) = 1)
			AppendStruct {
				struct = player_data
				field = <player_status>
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
	KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
	spawnscriptnow \{GuitarEvent_SongFailed_Spawned}
endscript

script set_client_band_score 
	if GotParam \{band_score}
		printf qs("\Lchanging band1_status score to %s") s = <band_score>
		change structurename = band1_status score = <band_score>
	endif
endscript

script net_battle_win_song 
	printf \{qs("\L--- net_battle_win_song")}
	net_disable_pause
	change \{disable_attacks = 1}
	if (<losing_player> = 1)
		change \{structurename = player1_status
			current_health = 0.0}
		change \{structurename = player2_status
			current_health = 1.0}
	else
		change \{structurename = player1_status
			current_health = 1.0}
		change \{structurename = player2_status
			current_health = 0.0}
	endif
	if NOT ($is_attract_mode = 1)
		Achievements_Update
	endif
	GuitarEvent_SongWon \{battle_win = 1}
endscript

script add_searching_menu_item \{z = 2.1}
	if GotParam \{vmenu_id}
		CreateScreenElement {
			type = ContainerElement
			parent = <vmenu_id>
			dims = (210.0, 35.0)
			pos = (0.0, 0.0)
			just = [center top]
			internal_just = [center top]
		}
		<container_element> = <id>
		<id> :SE_SetProps {
			event_handlers = [
				{focus searching_menu_focus params = {parent = <id>}}
				{unfocus searching_menu_unfocus params = {parent = <id>}}
				{pad_choose <choose_script>}
			]
		}
		CreateScreenElement {
			type = TextElement
			parent = <container_element>
			local_id = text_string
			font = fontgrid_title_a1
			scale = 0.65000004
			rgba = ($online_light_blue)
			text = <text>
			just = [center top]
			pos = (105.0, 0.0)
			z_priority = <z>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <container_element>
			local_id = highlight_bar
			texture = white
			dims = (250.0, 35.0)
			rgba = ($online_light_blue)
			pos = (105.0, -3.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <container_element>
			local_id = left_bookend
			texture = character_hub_hilite_bookend
			dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (-20.0, -3.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <container_element>
			local_id = right_bookend
			texture = character_hub_hilite_bookend
			dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (240.0, -3.0)
			just = [center top]
			z_priority = <z>
			alpha = 0.0
		}
	endif
endscript

script searching_menu_focus 
	Obj_GetID
	if ScreenElementExists id = {<ObjID> child = text_string}
		LegacyDoScreenElementMorph id = {<ObjID> child = text_string} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<ObjID> child = highlight_bar}
		LegacyDoScreenElementMorph id = {<ObjID> child = highlight_bar} alpha = 1.0
	endif
	if ScreenElementExists id = {<ObjID> child = left_bookend}
		LegacyDoScreenElementMorph id = {<ObjID> child = left_bookend} alpha = 1.0
	endif
	if ScreenElementExists id = {<ObjID> child = right_bookend}
		LegacyDoScreenElementMorph id = {<ObjID> child = right_bookend} alpha = 1.0
	endif
endscript

script searching_menu_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<ObjID> child = text_string}
		LegacyDoScreenElementMorph id = {<ObjID> child = text_string} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<ObjID> child = highlight_bar}
		LegacyDoScreenElementMorph id = {<ObjID> child = highlight_bar} alpha = 0.0
	endif
	if ScreenElementExists id = {<ObjID> child = left_bookend}
		LegacyDoScreenElementMorph id = {<ObjID> child = left_bookend} alpha = 0.0
	endif
	if ScreenElementExists id = {<ObjID> child = right_bookend}
		LegacyDoScreenElementMorph id = {<ObjID> child = right_bookend} alpha = 0.0
	endif
endscript

script set_other_player_present 
	printf \{qs("\Lset_other_player_present")}
	if NOT ($player2_present)
		change \{player2_present = 1}
		spawnscriptnow \{net_hub_stream}
	endif
	if ScreenElementExists \{id = character_hub_p1_continue}
		character_hub_p1_continue :SE_SetProps \{rgba = [
				180
				100
				60
				255
			]
			unblock_events}
	endif
endscript

script test_multi_leaderboards 
	player_list = [
		{
			leaderboards = [
				{
					write_type = max
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
					write_type = max
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
	NetSessionFunc obj = stats func = stats_write_multiplayer params = {dontendsessionafterwrite <...>}
endscript

script retrieve_player_net_id 
	net_id = [0 0]
	if GotParam \{player}
		FormatText checksumname = player_status 'player%i_status' i = <player>
		SetArrayElement ArrayName = net_id index = 0 newvalue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 newvalue = ($<player_status>.net_id_second)
	else
		SetArrayElement ArrayName = net_id index = 0 newvalue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 newvalue = ($player1_status.net_id_second)
	endif
	printf \{qs("\Lretrieve_player_net_id")}
	return net_id = <net_id>
endscript

script host_handle_dropped_client 
	printf \{qs("\L---host_handle_dropped_client")}
endscript

script drop_client_from_character_select 
	destroy_gamertags
	if (NetSessionFunc obj = match func = get_gamertag)
		ui_print_gamertag name = <name> start_pos = (235.0, 50.0) color = ($player1_color) player = 1 just = [left top] dims = (450.0, 35.0)
	endif
	KillSpawnedScript \{name = cs_rotate_hilites_p2}
	change \{g_cs_scroll_ready_p2 = 1}
	change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	change \{player2_present = 0}
	destroy_menu \{menu_id = ready_container_p2}
	if CompositeObjectExists \{name = bassist}
		bassist :hide
	endif
endscript

script host_wait_for_client 
	if NOT (IsHost)
		return
	endif
	create_net_popup \{popup_text = qs("Waiting for other player to join")
		add_waiting_dots
		pos = (640.0, 275.0)}
	begin
	if ($player2_present = 1)
		break
	endif
	Wait \{30
		gameframes}
	repeat
	destroy_net_popup
	cs_event_handlers = [
		{pad_up cs_scroll_up_or_down params = {player = 1 dir = up}}
		{pad_down cs_scroll_up_or_down params = {player = 1 dir = down}}
		{pad_back net_cs_go_back params = {player = 1}}
		{pad_choose character_select_choose params = {player = 1}}
		{pad_start menu_show_gamercard}
	]
	SetScreenElementProps id = vmenu_character_select_p1 event_handlers = <cs_event_handlers> replace_handlers
endscript

script net_battle_select_icon 
	begin
	if ScreenElementExists id = <icon_id>
		<icon_id> :SE_SetProps texture = <icon_texture>
		return
	endif
	Wait \{1
		gameframe}
	repeat 600
	printf qs("\LCouldn't find battle icon id=%i") i = <icon_id>
endscript

script net_hub_stream 
	player_status = player1_status
	begin
	char_data = {
		char_id = ($player1_status.character_id)
	}
	SendStructure callback = update_net_character data_to_send = {char_data = <char_data>}
	Wait \{1
		second}
	repeat
endscript

script update_net_character 
	player_status = player2_status
	change_made = 0
	char_id = (<char_data>.char_id)
	if NOT ($<player_status>.character_id = <char_id>)
		change structurename = <player_status> character_id = <char_id>
		<change_made> = 1
	endif
endscript

script character_hub_net_ready 
	if NOT (ScreenElementExists id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	if ($p2_ready = 0)
		change \{p2_ready = 1}
		if ScreenElementExists \{id = ready_container_p2}
			ready_container_p2 :Obj_SpawnScriptLater \{drop_in_ready_sign
				params = {
					player = 2
				}}
		endif
	endif
	if (($p1_ready = 1) && ($p2_ready = 1))
		if ScreenElementExists \{id = vmenu_character_hub_p1}
			LaunchEvent \{type = unfocus
				target = vmenu_character_hub_p1}
		endif
		Wait \{0.4
			seconds}
		clean_up_user_control_helpers
		shut_down_flow_manager \{player = 2}
		destroy_ready_icons
		change \{p1_ready = 0}
		change \{p2_ready = 0}
		KillSpawnedScript \{name = net_hub_stream}
		ui_flow_manager_respond_to_action \{action = select_ready
			player = 1
			create_params = {
				player = 1
			}}
	endif
endscript

script character_hub_net_ready_back 
	change \{p2_ready = 0}
	if NOT (ScreenElementExists id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	drop_out_ready_sign \{player = 2}
endscript

script debug_print_coop_stats \{identifier = qs("")}
	printf qs("\LTMR ---------------------------- %s -------------------------") s = <identifier>
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	p1_stars = ($player1_status.stars)
	p2_stars = ($player2_status.stars)
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
		return instrument_type = (<info_struct>.type)
	endif
	index = (<index> + 1)
	repeat <array_size>
endscript

script scale_element_width_to_size \{max_text_width = 400}
	if NOT GotParam \{id}
		return
	endif
	GetScreenElementDims id = <id>
	if (<width> > <max_text_width>)
		SetScreenElementProps {
			id = <id>
			scale = ((1.0, 0.0) + (0.0, 1.0) * (<text_scale>.(0.0, 1.0)))
		}
		scale_element_to_size {
			id = <id>
			target_width = <max_text_width>
		}
	endif
endscript

script net_dl_content_compatabilty_warning_fade_out 
	Wait \{10
		seconds}
	if ScreenElementExists id = <id>
		<id> :LegacyDoMorph alpha = 0.0 time = 1.0
	endif
	Wait \{1
		frame}
	if ScreenElementExists \{id = dl_content_warning}
		DestroyScreenElement \{id = dl_content_warning}
	endif
endscript

script net_dl_content_compatabilty_warning \{z = 100
		pos = (0.0, 0.0)}
	if NOT GotParam \{parent}
		return
	endif
	if ScreenElementExists \{id = dl_content_warning}
		DestroyScreenElement \{id = dl_content_warning}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = dl_content_warning
		parent = <parent>
		pos = <pos>
	}
	menu_anchor = <id>
	if isXenon
	else
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <menu_anchor>
		font = fontgrid_text_a8
		scale = (0.7, 0.55)
		rgba = ($online_light_blue)
		text = <text>
		just = [center top]
		z_priority = (<z> + 0.1)
		pos = (320.0, -55.0)
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
				scale = 1.0
			}
			scale_element_to_size {
				id = <id>
				target_width = <max_width>
				target_height = <Height>
			}
		endif
	endif
endscript

script net_coop_init_star_power 
	printf \{qs("\LTrying to init star power")}
	if NOT (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1))
		spawnscriptnow \{star_power_activate_and_drain
			params = {
				player_status = player1_status
				player = 1
				player_text = 'p1'
			}}
		spawnscriptnow \{star_power_activate_and_drain
			params = {
				player_status = player2_status
				player = 2
				player_text = 'p2'
			}}
	endif
endscript
DEMONWARE_IS_READY = 1

script set_ready_for_input 
	change \{DEMONWARE_IS_READY = 1}
endscript

script set_demonware_failed 
	change \{DEMONWARE_IS_READY = 1}
endscript

script set_disable_demonware_input 
	change \{DEMONWARE_IS_READY = 0}
endscript

script online_end_song 
	printf \{qs("\L---online_end_song")}
	if ((GameIsOver) || (SessionIsOver))
		printf \{qs("\LGame is over already, no song win event")}
		return
	endif
	change \{net_num_players_data_ack = 0}
	change \{recovered_dropped_players = 0}
	if (IsHost)
		i = 1
		GameMode_GetNumPlayersShown
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if (($<player_status>.is_local_client) = 1)
			change net_num_players_data_ack = ($net_num_players_data_ack + 1)
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		getnumplayers
		change net_num_players_data_needed = <num_players>
		SendEndSong
		client_handle_end_song
	endif
	printf qs("\Lack global = %d") d = ($net_num_players_data_ack)
endscript

script client_handle_end_song 
	printf \{qs("\Lclient_handle_end_song - Broadcasting song won event.")}
	ExtendCRC \{song_won
		'p1'
		out = type}
	BroadcastEvent type = <type> data = {song_complete = 1}
	change \{Achievements_SongWonFlag = 1}
	if ($battle_do_or_die = 0)
		GameMode_GetType
		if (<type> = career || <type> = quickplay)
			Progression_CashMilestonesSongWon
		endif
	endif
	change \{recovered_dropped_players = 0}
	if NOT IsHost
		player_data = {}
		i = 1
		GameMode_GetNumPlayersShown
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if (($<player_status>.is_local_client) = 1)
			AppendStruct {
				struct = player_data
				field = <player_status>
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
		printf qs("\Lsend data req to server for player %d") d = ($<player_status>.player)
		SendStructure callback = player_data_request_ack data_to_send = {player_data = <player_data>} to_server
	endif
endscript

script player_data_request_ack 
	printf \{qs("\Lserver: player_data_request_ack")}
	GetPlayerInfo \{1
		team}
	host_team = <team>
	if GotParam \{player_data}
		num_local_players = 4
		i = 1
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if StructureContains Structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			GetPlayerInfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.obj_id)
				change net_num_players_data_ack = ($net_num_players_data_ack + 1)
				printf qs("\Lsetting player info player %d - ack global %a") d = <j> a = ($net_num_players_data_ack)
				SetPlayerInfo <j> score = (<player_data>.<player_status>.score)
				SetPlayerInfo <j> best_run = (<player_data>.<player_status>.best_run)
				SetPlayerInfo <j> max_notes = (<player_data>.<player_status>.max_notes)
				SetPlayerInfo <j> notes_hit = (<player_data>.<player_status>.notes_hit)
				SetPlayerInfo <j> stars = (<player_data>.<player_status>.stars)
				SetPlayerInfo <j> vocal_streak_phrases = (<player_data>.<player_status>.vocal_streak_phrases)
				SetPlayerInfo <j> vocal_phrase_quality = (<player_data>.<player_status>.vocal_phrase_quality)
				SetPlayerInfo <j> vocal_phrase_max_qual = (<player_data>.<player_status>.vocal_phrase_max_qual)
				SetPlayerInfo <j> total_notes = (<player_data>.<player_status>.total_notes)
				SetPlayerInfo <j> new_cash = (<player_data>.<player_status>.new_cash)
				SetPlayerInfo <j> cash_rank_up = (<player_data>.<player_status>.cash_rank_up)
				SetPlayerInfo <j> career_earnings = (<player_data>.<player_status>.career_earnings)
				break
			endif
			j = (<j> + 1)
			repeat <num_net_players>
		endif
		i = (<i> + 1)
		repeat <num_local_players>
	endif
	printf qs("\Ldone with sync: num players data needed %a - net num players ack %b") a = ($net_num_players_data_needed) b = ($net_num_players_data_ack)
	if (($net_num_players_data_needed) = ($net_num_players_data_ack))
		change \{net_num_players_data_ack = 0}
		player_data = {}
		i = 1
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		GetPlayerInfo <i> team
		if (<team> = 1)
			<band_score> = ($band2_status.score)
		else
			<band_score> = ($band1_status.score)
		endif
		AppendStruct {
			struct = player_data
			field = <player_status>
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
		if NOT ($is_attract_mode = 1)
			GameMode_GetType
			if (<type> = career)
				if progression_check_for_gig_end
					change \{Achievements_NewGigWonFlag = 1}
				endif
			endif
			Achievements_Update
			change \{Achievements_SongWonFlag = 0}
			change \{Achievements_NewGigWonFlag = 0}
		endif
		SendStructure callback = finish_player_data_sync data_to_send = {player_data = <player_data>}
	endif
endscript

script finish_player_data_sync 
	printf \{qs("\L---finish_player_data_sync")}
	if GotParam \{player_data}
		num_net_players = 8
		i = 1
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if StructureContains Structure = <player_data> <player_status>
			num_players = 8
			j = 1
			begin
			GetPlayerInfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.obj_id)
				printf qs("\Lfinish - setting player info player %d - ack global %a") d = <j> a = ($net_num_players_data_ack)
				SetPlayerInfo <j> score = (<player_data>.<player_status>.score)
				SetPlayerInfo <j> best_run = (<player_data>.<player_status>.best_run)
				SetPlayerInfo <j> max_notes = (<player_data>.<player_status>.max_notes)
				SetPlayerInfo <j> notes_hit = (<player_data>.<player_status>.notes_hit)
				SetPlayerInfo <j> stars = (<player_data>.<player_status>.stars)
				SetPlayerInfo <j> vocal_streak_phrases = (<player_data>.<player_status>.vocal_streak_phrases)
				SetPlayerInfo <j> vocal_phrase_quality = (<player_data>.<player_status>.vocal_phrase_quality)
				SetPlayerInfo <j> vocal_phrase_max_qual = (<player_data>.<player_status>.vocal_phrase_max_qual)
				SetPlayerInfo <j> total_notes = (<player_data>.<player_status>.total_notes)
				SetPlayerInfo <j> new_cash = (<player_data>.<player_status>.new_cash)
				SetPlayerInfo <j> career_earnings = (<player_data>.<player_status>.career_earnings)
				SetPlayerInfo <j> cash_rank_up = (<player_data>.<player_status>.cash_rank_up)
				break
			endif
			j = (<j> + 1)
			repeat <num_players>
		endif
		i = (<i> + 1)
		repeat <num_net_players>
		if NOT ($is_attract_mode = 1)
			GameMode_GetType
			if (<type> = career)
				if progression_check_for_gig_end
					change \{Achievements_NewGigWonFlag = 1}
				endif
			endif
			Achievements_Update
			change \{Achievements_SongWonFlag = 0}
			change \{Achievements_NewGigWonFlag = 0}
		endif
	endif
endscript

script net_load_preferences 
	NetOptions :Pref_Add \{name = private_slots
		array = $num_private_slots
		index = 0
		value_field = num
		display_string_field = name}
	NetOptions :Pref_Add \{name = ranked
		array = $ranked_info
		index = 0
		display_string_field = name}
	NetOptions :Pref_Add \{name = join_in_progress
		array = $join_in_progress_info
		index = 0
		value_field = num
		display_string_field = name}
	NetOptions :Pref_Add \{name = num_players
		array = $num_players_info
		index = 1
		value_field = num
		display_string_field = name}
	if ($is_multiplayer_beta = 0)
		NetOptions :Pref_Add \{name = game_modes
			array = $net_game_type_info
			index = 0
			display_string_field = name}
	else
		NetOptions :Pref_Add \{name = game_modes
			array = $beta_net_game_type_info
			index = 0
			display_string_field = name}
	endif
endscript

script new_net_player 
	printf \{qs("\L---new_net_player")}
	FormatText checksumname = gamertag_global 'gamertag_%d' d = (<player_num> - 1)
	printstruct <...>
	if (<local_client> = 1)
		transfer_controller_value_for_local_player <...>
	endif
	change globalname = <gamertag_global> newvalue = <gamertag_string>
	change structurename = <player_status> gamertag = <gamertag_global>
	change structurename = <player_status> net_id_first = <net_id_first>
	change structurename = <player_status> net_id_second = <net_id_second>
	change structurename = <player_status> is_local_client = <local_client>
	change structurename = <player_status> net_obj_id = <obj_id>
	change structurename = <player_status> part = <part>
	change structurename = <player_status> team = <team>
	change structurename = <player_status> difficulty = <difficulty>
	change structurename = <player_status> career_earnings = <career_cash>
	GetGlobalTags \{user_options}
	SendNetMessage {
		type = lefty_update
		lefty_flag = (<lefty_flip_p1>)
	}
endscript

script host_proceed_to_online_play 
	printf \{qs("\L---host_proceed_to_online_play")}
	GameMode_GetNumPlayers
	change current_num_players = <num_players>
	startnetworkgame
endscript

script setautolaunchhostnetlevel 
	printf \{qs("\L--SetAutoLaunchHostNetLevel")}
	change \{net_autolaunch_role = HOST}
endscript

script setautolaunchclient 
	printf \{qs("\L--SetAutoLaunchClient")}
	change \{net_autolaunch_role = CLIENT}
endscript

script PS3_new_invitation_received 
	begin
	if NOT (ScreenElementExists id = invite_container)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	CreateScreenElement \{type = ContainerElement
		id = invite_container
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 100}
	invite_container :Obj_SpawnScriptNow PS3_process_invites params = {count = <count> inviteList = <inviteList>}
endscript

script PS3_process_invites 
	if GotParam \{inviteList}
		if (<count> > 0)
			i = 0
			begin
			CreateScreenElement \{type = ContainerElement
				id = ps3_invite_container
				parent = invite_container
				pos = $PS3_invite_postion
				alpha = 0.0}
			CreateScreenElement \{type = SpriteElement
				parent = ps3_invite_container
				texture = white
				rgba = [
					139
					69
					0
					255
				]
				pos = (0.0, 0.0)
				dims = (200.0, 65.0)
				just = [
					left
					top
				]}
			FormatText TextName = item_text qs("%d wants to play") d = (<inviteList> [<i>])
			CreateScreenElement {
				type = TextBlockElement
				parent = ps3_invite_container
				font = fontgrid_title_a1
				pos = (5.0, 5.0)
				dims = (400.0, 160.0)
				scale = (0.5, 0.5)
				rgba = [255 222 173 255]
				text = <item_text>
				just = [left top]
			}
			RunScriptOnScreenElement \{id = ps3_invite_container
				PS3_display_invite_container}
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

script PS3_display_invite_container 
	ps3_invite_container :LegacyDoMorph \{alpha = 1.0
		time = 1.0}
	Wait \{1.0
		seconds}
	ps3_invite_container :LegacyDoMorph \{alpha = 0.0
		time = 1.0}
	if ScreenElementExists \{id = ps3_invite_container}
		DestroyScreenElement \{id = ps3_invite_container}
	endif
endscript

script PS3_display_invite_callback 
	printf \{qs("\LPS3_display_invite_callback")}
	printstruct <...>
endscript

script net_custom_guide_view_user_songs 
	printf \{qs("\L--- net_custom_guide_view_user_songs")}
	printstruct <...>
	printscriptinfo
endscript

script get_controller_type 
	if NOT GotParam \{controller_index}
		return \{controller_type = controller}
	endif
	GetControllerType controller = <controller_index>
	if NOT IsControllerPluggedIn controller = <controller_index>
		if (<controller_type> = controller)
			get_player_num_from_controller controller_index = <controller_index>
			if (<player_num> != -1)
				GetPlayerInfo <player_num> part
				return controller_type = <part>
			endif
		endif
	endif
	return controller_type = <controller_type>
endscript

script test_sequenced_msgs 
	SendStructure \{callback = callback_test_sequenced_msgs
		data_to_send = {
			number = 1
		}}
endscript

script callback_test_sequenced_msgs 
	printf qs("\Lcallback_test_sequenced_msgs - %i\n") i = <number>
endscript

script test_retrieve_friends_list 
	NetSessionFunc \{func = friends_init}
	NetSessionFunc \{obj = friends
		func = begin_retrieve_friends_list
		params = {
			callback = test_friends_callback
			callback_params = {
				none
			}
		}}
endscript

script test_friends_callback 
	printf \{qs("\Ltest_friends_callback")}
	printstruct <...>
	NetSessionFunc func = CreateCustomMessage params = {deviceNum = 0 userList = <friendList> title = qs("Let's do this!") game_msg = qs("Join me as a guitarist!") button_text = qs("As Guitarist") game_specific = guitar}
endscript

script get_player_num_from_controller 
	if NOT GotParam \{controller_index}
		printf \{qs("\Ldidn't get a controller")}
	endif
	num_local_controllers = 4
	player_num = -1
	i = 1
	begin
	GetPlayerInfo <i> controller
	GetPlayerInfo <i> bot_play
	if (<bot_play> = 1)
		GetPlayerInfo <i> bot_original_controller
		if (<bot_original_controller> != -1)
			controller = <bot_original_controller>
		endif
	endif
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
		Drums = 1
		microphones = 1
		scoring_mode = career
	else
		guitars = 1
		Drums = 0
		microphones = 0
		scoring_mode = competitive
	endif
	return needed_guitars = <guitars> needed_drums = <Drums> needed_microphones = <microphones> scoring_mode = <scoring_mode>
endscript

script net_get_player_instrument 
	RequireParams \{[
			controller_index
		]
		all}
	get_controller_type controller_index = <controller_index>
	rb_drums = 0
	if ChecksumEquals a = <controller_type> b = drum
		if isRBDrum controller = <controller_index>
			rb_drums = 1
		endif
	endif
	return instrument = <controller_type> <...>
endscript

script net_get_player_guitar_flag 
	printf \{qs("\L--- net_get_player_guitar_flag")}
	RequireParams \{[
			controller_index
		]
		all}
	get_player_num_from_controller controller_index = <controller_index>
	GetPlayerInfo <player_num> part
	if (<part> = Bass)
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
	cash_ranks_get_rank player = <player_num>
	return career_cash = <career_earnings>
endscript

script net_get_player_difficulty 
	RequireParams \{[
			controller_index
		]
		all}
	get_player_num_from_controller controller_index = <controller_index>
	if (<player_num> != -1)
		GetPlayerInfo <player_num> difficulty
	else
		printf \{qs("\LSETTING DIFFICULTY to EASY player_num -1 something is wrong")}
		difficulty = easy
	endif
	return difficulty = <difficulty>
endscript

script get_local_players_in_game 
	printf \{qs("\Lget_local_players_in_game")}
	if isXenon
		max_local_players = 4
	else
		max_local_players = 7
	endif
	i = 0
	array = []
	num_local_players = 0
	begin
	NetSessionFunc func = IsControllerInGame params = {controller = <i>}
	if GotParam \{IsInGame}
		AddArrayElement array = <array> element = 1
		num_local_players = (<num_local_players> + 1)
		RemoveParameter \{IsInGame}
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
		FormatText checksumname = gamertag 'gamertag_%d' d = <i>
		change globalname = <gamertag> newvalue = qs("")
		SetPlayerInfo (<i> + 1) net_id_first = 0
		SetPlayerInfo (<i> + 1) net_id_second = 0
		SetPlayerInfo (<i> + 1) team = 0
		SetPlayerInfo (<i> + 1) highway_layout = default_highway
		if (<i> < 4)
			SetPlayerInfo (<i> + 1) is_local_client = 1
			GetPlayerInfo (<i> + 1) controller
			if (<controller> > 3)
				controller = 3
				SetPlayerInfo (<i> + 1) controller = <controller>
			endif
		else
			SetPlayerInfo (<i> + 1) is_local_client = 0
		endif
	else
		if GotParam \{index}
			GetArraySize <exception_indices>
			if ((<index> + 1) < <array_size>)
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
	printf \{qs("\Ltransfer_controller_value_for_local_player")}
	if IsPs3
		num_local_controllers = 7
	else
		num_local_controllers = 4
	endif
	i = 0
	begin
	if (($temp_net_id [<i>].net_id_first) = <net_id_first> && ($temp_net_id [<i>].net_id_second) = <net_id_second>)
		if IsPs3
			if LocalizedStringEquals a = ($temp_net_id [<i>].name) b = <gamertag_string>
				change structurename = <player_status> controller = <i>
				restore_save_net_preferences controller_index = <i> player_status_index = ($<player_status>.player)
				player_found = 1
				break
			endif
		else
			change structurename = <player_status> controller = <i>
			restore_save_net_preferences controller_index = <i> player_status_index = ($<player_status>.player)
			player_found = 1
			break
		endif
	endif
	i = (<i> + 1)
	repeat <num_local_controllers>
	if NOT GotParam \{player_found}
		change structurename = <player_status> controller = 3
	endif
endscript

script net_choose_gamemode_from_players 
	printf \{qs("\L--- net_choose_gamemode_from_players")}
	printstruct <...>
	if ChecksumEquals \{a = $game_mode
			b = p4_career}
		printf \{qs("\Lcareer")}
		switch <total_players>
			case 2
			printf \{qs("\L2")}
			change \{game_mode = p2_career}
			change \{current_num_players = 2}
			case 3
			printf \{qs("\L3")}
			change \{game_mode = p3_career}
			change \{current_num_players = 3}
			case 4
			printf \{qs("\L4")}
			change \{game_mode = p4_career}
			change \{current_num_players = 4}
			default
			printf qs("\Lgamemode unchanged, have %d players") d = <total_players>
		endswitch
		change \{career_matchmaking_complete = 1}
	elseif ChecksumEquals \{a = $game_mode
			b = p4_quickplay}
		printf \{qs("\Lquickplay")}
		switch <total_players>
			case 2
			printf \{qs("\L2")}
			change \{game_mode = p2_quickplay}
			change \{current_num_players = 2}
			case 3
			printf \{qs("\L3")}
			change \{game_mode = p3_quickplay}
			change \{current_num_players = 3}
			default
			printf qs("\Lgamemode unchanged, have %d players") d = <total_players>
		endswitch
	elseif ChecksumEquals \{a = $game_mode
			b = p8_pro_faceoff}
		printf \{qs("\Lband v band")}
		if NOT (<total_players> = 8)
			if NOT (<total_players> = 6)
				ScriptAssert 'trying to play band v band with %d playes (only 8 or 6 with no mics allowed)!' d = <total_players>
			endif
			printf \{qs("\Lchanging to 3v3 no mics")}
			change \{game_mode = p6_pro_faceoff_no_mics}
			change \{current_num_players = 6}
		else
			printf qs("\Lgamemode unchanged, have %d players") d = <total_players>
		endif
	endif
endscript

script net_party_can_accept_new_players 
	printf \{qs("\L--- net_party_can_accept_new_players")}
	NetSessionFunc \{obj = party
		func = get_party_members}
	printstruct <...>
	can_join = 1
	check_insts = 0
	GameMode_GetType
	if (<type> = career)
		check_insts = 1
	endif
	if (<check_insts> = 1)
		num_guitars = 0
		num_mics = 0
		num_drums = 0
		GetArraySize \{connections}
		if (<array_size> > 0)
			i = 0
			begin
			switch (<connections> [<i>].instrument)
				case eGUITAR
				num_guitars = (<num_guitars> + 1)
				case eMICROPHONE
				num_mics = (<num_mics> + 1)
				case eDRUMS
				num_drums = (<num_drums> + 1)
				default
				printf \{qs("\LHow did this happen! 1")}
			endswitch
			i = (<i> + 1)
			repeat <array_size>
		endif
		GetArraySize \{new_connections}
		if (<array_size> > 0)
			i = 0
			begin
			switch (<new_connections> [<i>].instrument)
				case eGUITAR
				num_guitars = (<num_guitars> + 1)
				case eMICROPHONE
				num_mics = (<num_mics> + 1)
				case eDRUMS
				num_drums = (<num_drums> + 1)
				default
				printf \{qs("\LHow did this happen! 2")}
			endswitch
			i = (<i> + 1)
			repeat <array_size>
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
	spawnscriptnow net_ui_player_drop_listeners params = {<...>}
endscript

script net_ui_player_drop_listeners \{drop_player_script = default_drop_player_script
		end_game_script = default_end_game_scr}
	printscriptinfo \{qs("create player drops")}
	spawnscriptnow create_player_drop_events params = {<...>}
	spawnscriptnow create_end_game_events params = {<...>}
endscript

script create_player_drop_events 
	SetEventHandler response = call_script event = drop_net_player Scr = drop_script_spawner params = {spawn_script = <drop_player_script>}
	Block
endscript

script create_end_game_events 
	SetEventHandler response = call_script event = drop_player_end_game Scr = drop_script_spawner params = {spawn_script = <end_game_script>}
	Block
endscript

script end_game_kill_event_test 
	printf \{qs("\L---end_game_kill_event_test")}
	if (<is_game_over> = 1)
		printf \{qs("\Lno longer listening for game over events")}
	endif
endscript

script drop_script_spawner 
	if (1 = <is_game_over>)
		printf \{qs("\Ldrop_script_spawner - setting net_ready_to_start to 1")}
		change \{net_ready_to_start = 1}
	endif
	spawnscriptnow <spawn_script> params = {<...>} id = ui_player_drop_scripts
endscript

script destroy_player_drop_events 
	printscriptinfo \{qs("destroy_player drops")}
	KillSpawnedScript \{name = create_player_drop_events}
	KillSpawnedScript \{name = create_end_game_events}
	KillSpawnedScript \{id = ui_player_drop_scripts}
endscript

script default_drop_player_script 
	warn_default_drop_script <...>
endscript

script default_end_game_scr 
	create_net_popup \{title = qs("GAME OVER")
		popup_text = qs("A player has left the game. There are not enough players to continue.")}
	Wait \{3
		seconds}
	destroy_net_popup
	quit_network_game
	generic_event_back \{state = uistate_online}
endscript

script warn_default_drop_script 
	printf \{qs("\L")}
	printf \{qs("\L=================================WARNING=================================")}
	printf \{qs("\L= Default player drop script called")}
	printf \{qs("\L= This UI state is missing handlers for dropping net players")}
	printf \{qs("\L=========================================================================")}
	printf \{qs("\L")}
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
		FormatText TextName = popup_text qs("%s has quit.  There are not enough players to continue.") s = <name_string>
		create_net_popup \{title = qs("GAME OVER")
			popup_text = Wait
			3
			seconds}
		destroy_net_popup
	endif
endscript

script do_PS3_signin_state_change 
	printf \{qs("\Ldo_signin_state_change")}
	printstruct <...>
	if GotParam \{age_restricted}
		ui_event_wait event = menu_replace data = {state = <state> <params> require_live}
	elseif CheckForSignIn
		if GotParam \{going_to_career}
			change \{game_mode = p4_career}
			NetOptions :Pref_Choose \{name = game_modes
				checksum = p4_career}
		endif
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_uninit}
		NetSessionFunc \{func = motd_init}
		NetSessionFunc \{func = live_settings_init}
		ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
	else
		if GotParam \{state}
			ui_event_wait event = menu_replace data = {state = <state> <params> require_live}
		else
			sysnotify_handle_connection_loss \{cable_unplugged}
		endif
	endif
endscript

script net_party_leave_current_game 
	printf \{qs("\L--- net_party_leave_current_game")}
	destroy_player_drop_events
	quit_network_game_early
	net_clear_all_remote_player_status
	GameMode_GetType
	if (<type> = career)
		change \{net_band_mode_menu = invite}
		change \{num_players_in_band = 0}
		change \{net_band_members = [
			]}
		change \{net_num_joiners = 0}
		change \{career_matchmaking_complete = 0}
		change \{game_mode = p4_career}
		ui_event_get_stack
		found_state = 0
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'band_mode')
			<found_state> = 1
			break
		endif
		i = (<i> + 1)
		repeat <stack_size>
		if (<found_state> = 1)
			generic_event_back data = {num_states = (<i> + 1)}
		else
			generic_event_back \{state = uistate_group_play}
		endif
		change \{net_popup_active = 0}
		UnPauseGame
	else
		startrendering
		destroy_net_popup
		change \{net_new_matchmaking_ui_flag = 0}
		UnPauseGame
		GetGlobalTags \{user_options}
		if ((<autosave> = 1) && (<type> = quickplay))
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_memcard
					type = autosave
					event_params = {
						event = menu_back
						data = {
							state = uistate_online
						}
					}
				}}
		else
			ui_event_wait \{event = menu_back
				state = uistate_online}
		endif
	endif
endscript

script net_party_host_cancel_matchmaking 
	printf \{qs("\L--- net_party_host_cancel_matchmaking")}
	GameMode_GetType
	if (<type> = career)
		change \{net_band_mode_menu = invite}
		change \{net_band_members = [
			]}
		begin
		if NOT ScriptIsRunning \{ui_create_band_mode_spawned}
			ui_event_wait \{event = menu_back}
			break
		else
			Wait \{1
				gameframe}
		endif
		repeat
	else
		printf \{qs("\Lnot too sure if you guys will need this")}
	endif
endscript

script uisignin_motd_callback 
	printf \{qs("\Luisignin_motd_callback")}
	if GotParam \{success}
		printf qs("\Lmotd_header = %d") d = ($MOTD_Header)
		printf qs("\Lmotd_subject = %d") d = ($motd_subject)
	else
		printf \{qs("\LFAILED TO GET THE MOTD!")}
	endif
	printstruct <...>
endscript

script retrieved_live_settings_file 
endscript

script create_flaming_wait 
	printscriptinfo \{qs("create_flaming_wait")}
	CreateScreenElement {
		id = net_please_wait
		type = DescInterface
		desc = 'net_please_wait'
		parent = root_window
		z_priority = <setlist_popup_z>
		alpha = 1.0
		not_focusable
		z_priority = 662
	}
	net_please_wait :SE_SetProps \{net_flame_message_text = qs("Please Wait")}
endscript

script show_flaming_wait 
	Wait \{2
		seconds}
	if ScreenElementExists \{id = net_please_wait}
		net_please_wait :SE_SetProps \{alpha = 1.0}
	endif
endscript

script destroy_flaming_wait 
	printscriptinfo \{qs("destroy_flaming_wait")}
	if ScreenElementExists \{id = net_please_wait}
		DestroyScreenElement \{id = net_please_wait}
	endif
endscript

script net_dropped_player_recovery 
	change \{recovered_dropped_players = 1}
	printf \{qs("\L--- net_dropped_player_recovery ---")}
	GameMode_GetType
	if (<type> = career)
		FormatText checksumname = mode 'p%d_career' d = ($current_num_players)
		change game_mode = <mode>
	endif
	if ($net_dropped_players_flag > 0)
		old_num_players_shown = (($current_num_players) + ($net_dropped_players_flag))
		GameMode_GetNumPlayersShown
		i = 1
		begin
		GetPlayerInfo <i> net_obj_id
		if (<net_obj_id> < 0)
			FormatText checksumname = bogus_player_status 'player%d_status' d = <i>
			temp_bogus_gamertag = ($<bogus_player_status>.gamertag)
			temp_bogus_part = ($<bogus_player_status>.part)
			temp_bogus_character_id = ($<bogus_player_status>.character_id)
			temp_bogus_band_member = ($<bogus_player_status>.band_member)
			temp_bogus_difficulty = ($<bogus_player_status>.difficulty)
			temp_bogus_controller = ($<bogus_player_status>.controller)
			temp_bogus_fret_anims = ($<bogus_player_status>.fret_anims)
			temp_bogus_bot_play = ($<bogus_player_status>.bot_play)
			temp_bogus_bot_original_controller = ($<bogus_player_status>.bot_original_controller)
			temp_bogus_original_character_id = ($<bogus_player_status>.original_character_id)
			temp_bogus_lefty_flip = ($<bogus_player_status>.lefty_flip)
			temp_bogus_vocals_highway_view = ($<bogus_player_status>.vocals_highway_view)
			temp_bogus_lefthanded_gems = ($<bogus_player_status>.lefthanded_gems)
			temp_bogus_lefthanded_button_ups = ($<bogus_player_status>.lefthanded_button_ups)
			temp_bogus_lefthanded_gems_flip_save = ($<bogus_player_status>.lefthanded_gems_flip_save)
			temp_bogus_lefthanded_button_ups_flip_save = ($<bogus_player_status>.lefthanded_button_ups_flip_save)
			temp_bogus_vocal_streak_phrases = ($<bogus_player_status>.vocal_streak_phrases)
			temp_bogus_vocal_phrase_quality = ($<bogus_player_status>.vocal_phrase_quality)
			temp_bogus_vocal_phrase_max_qual = ($<bogus_player_status>.vocal_phrase_max_qual)
			temp_bogus_vocals_sp_clap = ($<bogus_player_status>.vocals_sp_clap)
			temp_bogus_mic_type = ($<bogus_player_status>.mic_type)
			temp_bogus_mic_connected = ($<bogus_player_status>.mic_connected)
			temp_bogus_hyperspeed = ($<bogus_player_status>.hyperspeed)
			temp_bogus_net_whammy = ($<bogus_player_status>.net_whammy)
			temp_bogus_is_local_client = ($<bogus_player_status>.is_local_client)
			temp_bogus_highway_layout = ($<bogus_player_status>.highway_layout)
			temp_bogus_net_id_first = ($<bogus_player_status>.net_id_first)
			temp_bogus_net_id_second = ($<bogus_player_status>.net_id_second)
			temp_bogus_controller_type = ($<bogus_player_status>.controller_type)
			temp_bogus_net_obj_id = ($<bogus_player_status>.net_obj_id)
			temp_bogus_net_difficulty = ($<bogus_player_status>.net_difficulty)
			temp_bogus_net_venue = ($<bogus_player_status>.net_venue)
			temp_bogus_team = ($<bogus_player_status>.team)
			temp_bogus_party_id = ($<bogus_player_status>.party_id)
			temp_bogus_individual_band_score = ($<bogus_player_status>.individual_band_score)
			temp_bogus_cash = ($<bogus_player_status>.Cash)
			temp_bogus_new_cash = ($<bogus_player_status>.new_cash)
			temp_bogus_cash_rank_up = ($<bogus_player_status>.cash_rank_up)
			temp_bogus_career_earnings = ($<bogus_player_status>.career_earnings)
			j = (<i> + 1)
			begin
			GetPlayerInfo <j> net_obj_id
			if (<net_obj_id> >= 0)
				FormatText checksumname = valid_player_status 'player%d_status' d = <j>
				printf qs("\Lswitching %c with %d") c = <bogus_player_status> d = <valid_player_status>
				UpdatePlayerNumObjIdMapper old_player_num = <j> new_player_num = <i>
				change structurename = <bogus_player_status> gamertag = ($<valid_player_status>.gamertag)
				change structurename = <bogus_player_status> part = ($<valid_player_status>.part)
				change structurename = <bogus_player_status> character_id = ($<valid_player_status>.character_id)
				change structurename = <bogus_player_status> band_member = ($<valid_player_status>.band_member)
				change structurename = <bogus_player_status> difficulty = ($<valid_player_status>.difficulty)
				change structurename = <bogus_player_status> controller = ($<valid_player_status>.controller)
				change structurename = <bogus_player_status> fret_anims = ($<valid_player_status>.fret_anims)
				change structurename = <bogus_player_status> bot_play = ($<valid_player_status>.bot_play)
				change structurename = <bogus_player_status> bot_original_controller = ($<valid_player_status>.bot_original_controller)
				change structurename = <bogus_player_status> original_character_id = ($<valid_player_status>.original_character_id)
				change structurename = <bogus_player_status> lefty_flip = ($<valid_player_status>.lefty_flip)
				change structurename = <bogus_player_status> vocals_highway_view = ($<valid_player_status>.vocals_highway_view)
				change structurename = <bogus_player_status> lefthanded_gems = ($<valid_player_status>.lefthanded_gems)
				change structurename = <bogus_player_status> lefthanded_button_ups = ($<valid_player_status>.lefthanded_button_ups)
				change structurename = <bogus_player_status> lefthanded_gems_flip_save = ($<valid_player_status>.lefthanded_gems_flip_save)
				change structurename = <bogus_player_status> lefthanded_button_ups_flip_save = ($<valid_player_status>.lefthanded_button_ups_flip_save)
				change structurename = <bogus_player_status> vocal_streak_phrases = ($<valid_player_status>.vocal_streak_phrases)
				change structurename = <bogus_player_status> vocal_phrase_quality = ($<valid_player_status>.vocal_phrase_quality)
				change structurename = <bogus_player_status> vocal_phrase_max_qual = ($<valid_player_status>.vocal_phrase_max_qual)
				change structurename = <bogus_player_status> vocals_sp_clap = ($<valid_player_status>.vocals_sp_clap)
				change structurename = <bogus_player_status> mic_type = ($<valid_player_status>.mic_type)
				change structurename = <bogus_player_status> mic_connected = ($<valid_player_status>.mic_connected)
				change structurename = <bogus_player_status> hyperspeed = ($<valid_player_status>.hyperspeed)
				change structurename = <bogus_player_status> net_whammy = ($<valid_player_status>.net_whammy)
				change structurename = <bogus_player_status> is_local_client = ($<valid_player_status>.is_local_client)
				change structurename = <bogus_player_status> highway_layout = ($<valid_player_status>.highway_layout)
				change structurename = <bogus_player_status> net_id_first = ($<valid_player_status>.net_id_first)
				change structurename = <bogus_player_status> net_id_second = ($<valid_player_status>.net_id_second)
				change structurename = <bogus_player_status> controller_type = ($<valid_player_status>.controller_type)
				change structurename = <bogus_player_status> net_obj_id = ($<valid_player_status>.net_obj_id)
				change structurename = <bogus_player_status> net_difficulty = ($<valid_player_status>.net_difficulty)
				change structurename = <bogus_player_status> net_venue = ($<valid_player_status>.net_venue)
				change structurename = <bogus_player_status> team = ($<valid_player_status>.team)
				change structurename = <bogus_player_status> party_id = ($<valid_player_status>.party_id)
				change structurename = <bogus_player_status> individual_band_score = ($<valid_player_status>.individual_band_score)
				change structurename = <bogus_player_status> Cash = ($<valid_player_status>.Cash)
				change structurename = <bogus_player_status> new_cash = ($<valid_player_status>.new_cash)
				change structurename = <bogus_player_status> cash_rank_up = ($<valid_player_status>.cash_rank_up)
				change structurename = <bogus_player_status> career_earnings = ($<valid_player_status>.career_earnings)
				change structurename = <valid_player_status> gamertag = <temp_bogus_gamertag>
				change structurename = <valid_player_status> part = <temp_bogus_part>
				change structurename = <valid_player_status> character_id = <temp_bogus_character_id>
				change structurename = <valid_player_status> band_member = <temp_bogus_band_member>
				change structurename = <valid_player_status> difficulty = <temp_bogus_difficulty>
				change structurename = <valid_player_status> controller = <temp_bogus_controller>
				change structurename = <valid_player_status> fret_anims = <temp_bogus_fret_anims>
				change structurename = <valid_player_status> bot_play = <temp_bogus_bot_play>
				change structurename = <valid_player_status> bot_original_controller = <temp_bogus_bot_original_controller>
				change structurename = <valid_player_status> original_character_id = <temp_bogus_original_character_id>
				change structurename = <valid_player_status> lefty_flip = <temp_bogus_lefty_flip>
				change structurename = <valid_player_status> vocals_highway_view = <temp_bogus_vocals_highway_view>
				change structurename = <valid_player_status> lefthanded_gems = <temp_bogus_lefthanded_gems>
				change structurename = <valid_player_status> lefthanded_button_ups = <temp_bogus_lefthanded_button_ups>
				change structurename = <valid_player_status> lefthanded_gems_flip_save = <temp_bogus_lefthanded_gems_flip_save>
				change structurename = <valid_player_status> lefthanded_button_ups_flip_save = <temp_bogus_lefthanded_button_ups_flip_save>
				change structurename = <valid_player_status> vocal_streak_phrases = <temp_bogus_vocal_streak_phrases>
				change structurename = <valid_player_status> vocal_phrase_quality = <temp_bogus_vocal_phrase_quality>
				change structurename = <valid_player_status> vocal_phrase_max_qual = <temp_bogus_vocal_phrase_max_qual>
				change structurename = <valid_player_status> vocals_sp_clap = <temp_bogus_vocals_sp_clap>
				change structurename = <valid_player_status> mic_type = <temp_bogus_mic_type>
				change structurename = <valid_player_status> mic_connected = <temp_bogus_mic_connected>
				change structurename = <valid_player_status> hyperspeed = <temp_bogus_hyperspeed>
				change structurename = <valid_player_status> net_whammy = <temp_bogus_net_whammy>
				change structurename = <valid_player_status> is_local_client = <temp_bogus_is_local_client>
				change structurename = <valid_player_status> highway_layout = <temp_bogus_highway_layout>
				change structurename = <valid_player_status> net_id_first = <temp_bogus_net_id_first>
				change structurename = <valid_player_status> net_id_second = <temp_bogus_net_id_second>
				change structurename = <valid_player_status> controller_type = <temp_bogus_controller_type>
				change structurename = <valid_player_status> net_obj_id = <temp_bogus_net_obj_id>
				change structurename = <valid_player_status> net_difficulty = <temp_bogus_net_difficulty>
				change structurename = <valid_player_status> net_venue = <temp_bogus_net_venue>
				change structurename = <valid_player_status> team = <temp_bogus_team>
				change structurename = <valid_player_status> party_id = <temp_bogus_party_id>
				change structurename = <valid_player_status> individual_band_score = <temp_bogus_individual_band_score>
				change structurename = <valid_player_status> Cash = <temp_bogus_cash>
				change structurename = <valid_player_status> new_cash = <temp_bogus_new_cash>
				change structurename = <valid_player_status> cash_rank_up = <temp_bogus_cash_rank_up>
				change structurename = <valid_player_status> career_earnings = <temp_bogus_career_earnings>
				break
			endif
			j = (<j> + 1)
			repeat (<old_num_players_shown> - <i>)
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
		change \{net_dropped_players_flag = 0}
	endif
endscript
net_career_drop_msg_timer_count = 0

script net_create_player_drop_message_box 
	printf \{qs("\L--- net_create_player_drop_message_box ---")}
	RequireParams \{[
			parent_element
			drop_msg
		]
		all}
	if ScreenElementExists id = <parent_element>
		if NOT ScreenElementExists \{id = net_player_drop_container}
			CreateScreenElement {
				type = ContainerElement
				id = net_player_drop_container
				parent = <parent_element>
				pos = (640.0, 320.0)
				alpha = 0.0
				z_priority = 1000
				internal_just = [center center]
			}
			CreateScreenElement {
				type = TextBlockElement
				id = net_player_drop_fail_msg_text
				parent = net_player_drop_container
				text = <drop_msg>
				font = fontgrid_text_a6
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				pos = (0.0, -5.0)
				dims = (540.0, 180.0)
				rgba = [200 200 200 250]
				internal_scale = 1.0
				just = [center bottom]
				internal_just = [center center]
				shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
				z_priority = 1500.1
			}
			CreateScreenElement \{type = SpriteElement
				parent = net_player_drop_container
				texture = message_container
				rgba = [
					255
					255
					255
					255
				]
				pos = (0.0, -100.0)
				dims = (600.0, 450.0)
				just = [
					center
					center
				]
				z_priority = 1500.0}
			net_player_drop_container :Obj_SpawnScriptNow \{display_net_dropped_player_msg}
		else
			net_player_drop_fail_msg_text :SE_GetProps
			FormatText TextName = drop_message qs("%t\n%d") t = <text> d = <drop_msg>
			net_player_drop_fail_msg_text :SE_SetProps text = <drop_message>
			change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) + 1)
		endif
	endif
endscript

script display_net_dropped_player_msg 
	printf \{qs("\L--- display_net_dropped_player_msg ---")}
	Obj_GetID
	change \{net_career_drop_msg_timer_count = 3}
	<ObjID> :SE_SetProps alpha = 1.0 time = 0.5
	<ObjID> :SE_WaitProps
	begin
	Wait \{1
		second}
	if ($net_career_drop_msg_timer_count < 0)
		break
	endif
	change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) - 1)
	repeat
	<ObjID> :SE_SetProps alpha = 0.0 time = 0.8
	<ObjID> :SE_WaitProps
	if ($net_career_drop_msg_timer_count > 0)
		display_net_dropped_player_msg
		return
	endif
	<ObjID> :Die
endscript
