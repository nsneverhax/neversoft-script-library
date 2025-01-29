invite_index = -1
num_players_info = [
	{
		Name = '2 Players'
		checksum = num_2
		num = 2
	}
]
num_private_slots = [
	{
		Name = '0 Players'
		checksum = num_0
		num = 0
	}
	{
		Name = '1 Players'
		checksum = num_1
		num = 1
	}
	{
		Name = '2 Players'
		checksum = num_2
		num = 2
	}
]
FilterTypes = {
	diff = {
		values = [
			'ANY'
			'EASY'
			'MEDIUM'
			'HARD'
			'EXPERT'
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
			'ANY'
			'FACE-OFF'
			'PRO FACE-OFF'
			'BATTLE'
			'CO-OP'
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
			'PLAYER'
			'RANKED'
		]
		checksum = [
			Player
			Ranked
		]
	}
	num_songs = {
		values = [
			'ANY'
			'1'
			'Best of 3'
			'Best of 5'
			'Best of 7'
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
			'ANY'
			'HOST'
			'CLIENT'
			'RANDOM'
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
			'ALL TIME'
			'MY RANK'
			'MY FRIENDS'
		]
	}
	song_type = {
		values = [
			'NORMAL SONGS'
			'CO-OP SONGS'
		]
	}
	vport = {
		values = [
			'DOUBLE'
			'SINGLE'
		]
	}
	lb_diff = {
		values = [
			'EASY'
			'MEDIUM'
			'HARD'
			'EXPERT'
		]
	}
	Ranked = {
		values = [
			$wii_yes
			$wii_no
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
net_current_flow_state = None
net_can_send_approval = 1
net_safe_to_enter_net_play = 1
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
opponent_gamertag = NULL
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
message_of_the_day = ''
0x41d5263e = friends
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
gt_player1_pos = (270.0, 95.0)
gt_player2_pos = (1010.0, 95.0)
net_game_type_info = [
	{
		Name = 'PRO FACEOFF'
		description = 'Play a song with the same notes.'
		checksum = p2_pro_faceoff
	}
	{
		Name = 'FACEOFF'
		description = 'Dueling sections on lead guitar.'
		checksum = p2_faceoff
	}
	{
		Name = 'BATTLE'
		description = 'Battle mode.'
		checksum = p2_battle
	}
	{
		Name = 'CO-OP'
		description = 'Mix lead guitar with bass/rhythm guitar.'
		checksum = p2_coop
	}
]
xenon_invite_confirm_title = 'GAME INVITE'
xenon_invite_confirm_dialog = 'Accepting this invite will lose progress in any currently active goals. Do you want to continue?'
xenon_invite_confirm_yes = 'YES'
xenon_invite_confirm_no = 'NO'
xenon_session_confirm_title = 'JOIN SESSION'
xenon_session_confirm_dialog = 'Joining this session will lose progress in any currently active goals. Do you want to continue?'
xenon_session_confirm_yes = 'YES'
xenon_session_confirm_no = 'NO'
xenon_invite_confirm_inactive_title = 'GAME INVITE'
xenon_invite_confirm_inactive_dialog = 'You have been invited to play an online game. This title doesn\'t support inactive controllers joining an online game, so the invite has been rejected.'
xenon_invite_confirm_inactive_ok = 'OK'
xenon_session_confirm_inactive_title = 'JOIN SESSION'
xenon_session_confirm_inactive_dialog = 'This title doesn\'t support inactive controllers joining an online game, so you cannot join this session.'
xenon_session_confirm_inactive_ok = 'OK'
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
new_net_logic = 0

script quit_network_game 

	LeaveServer
	RemoveTimeSyncTask
	NetSessionFunc \{Obj = session
		func = unpost_game}
	EndGameNetScriptPump
	Change \{battle_sudden_death = 0}
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
	SetNetworkPreference {Field = 'private_slots' string = ($num_private_slots [0].Name) checksum = ($num_private_slots [0].checksum) num = 0}
	Change \{net_ready_to_start = 0}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{g_tie_breaker_song = 0}
	Change \{net_can_send_approval = 1}
	Change \{net_current_flow_state = None}
	reset_setlist
	reset_net_stats_menu
	Change \{net_song_num = 0}
	Change \{structurename = player2_status
		is_local_client = 1}
	Change \{structurename = player2_status
		net_id_first = 0}
	Change \{structurename = player2_status
		net_id_second = 0}
	if NOT ($game_mode = p2_coop)
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = guitar}
	endif
	if (isngc)
		0xf643c6a5
	endif
endscript

script shut_down_net_play 
	Change \{is_network_game = 0}
	Change \{new_net_logic = 0}
	SetNetworkMode
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = voice_uninit}
	NetSessionFunc \{func = stats_uninit}
	destroy_gamertags
	destroy_net_popup
	cleanup_sessionfuncs
	Change \{structurename = player1_status
		highway_layout = default_highway}
	Change \{structurename = player2_status
		highway_layout = default_highway}
endscript

script select_quit_network_game 
	if ScreenElementExists \{id = yourock_text}
		DestroyScreenElement \{id = yourock_text}
	endif
	if ScreenElementExists \{id = yourock_text_2}
		DestroyScreenElement \{id = yourock_text_2}
	endif
	quit_network_game_early
endscript

script quit_network_game_early 
	Change \{disable_attacks = 1}
	if NOT ($is_network_game)
		return
	endif
	if ($playing_song)
		send_fail_song_message \{wait_frames = 10
			quit_early = 1}
	endif
	PauseGame
	quit_network_game
	if GotParam \{signin_change}
		shut_down_net_play
	else
		kill_gem_scroller
	endif
endscript

script cancel_join_server 

	LeaveServer
	NetSessionFunc \{Obj = session
		func = unpost_game}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
endscript

script post_network_game 
	NetSessionFunc \{Obj = match
		func = get_gamertag}
	SetNetworkPreference Field = 'network_id' string = <Name>
	SetNetworkPreference Field = 'server_name' string = <Name>
	NetSessionFunc Obj = session func = post_game params = {0x78d0f704 = ($0x41d5263e) 0x7232dd65 = ($invite_index)}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script set_match_values 
	return {
		difficulty = ($current_difficulty)
		gamemode = ($game_mode)
		num_songs = ($num_songs)
		Ranked = ($ranked_match)
	}
endscript

script set_network_preferences 
	if (($match_type) = Player)

		SetNetworkPreference \{Field = 'ranked'
			string = 'player'
			checksum = Player
			num = 1}
	else

		SetNetworkPreference \{Field = 'ranked'
			string = 'ranked'
			checksum = Ranked
			num = 0}
	endif
endscript

script send_game_info_to_client 
	prepare_lobby_message
	SendNetMessage {
		Type = lobby_setup
		game_mode_index = <game_mode_index>
		venue = ($current_level)
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		character = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		guitar = ($player1_status.instrument_id)
		flow_state_index = <flow_state>
	}
	Change \{structurename = player2_status
		character_id = Axel}
	Change \{structurename = player2_status
		outfit = 1}
	Change \{structurename = player2_status
		style = 1}
	Change \{structurename = player2_status
		instrument_id = Instrument_Les_Paul_Black}
	Change \{net_match_send_available_items_dirty = 1}
	Change \{character_select_highlighted_character_p2_dirty = 1}
	net_match_send_available_items
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :unhide
	endif
endscript

script client_lobby_setup 

	Change \{current_num_players = 2}
	KillSpawnedScript \{Name = coop_fail_song}
	set_character_hub_dirty
	Change current_level = <venue>
	translate_lobby_message {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		p2_flow_state = <flow_state_index>
	}
	Change structurename = player2_status character_id = <character>
	Change structurename = player2_status outfit = <outfit>
	Change structurename = player2_status style = <style>
	Change structurename = player2_status instrument_id = <guitar>
	Change \{structurename = player1_status
		character_id = Axel}
	Change \{structurename = player1_status
		outfit = 1}
	Change \{structurename = player1_status
		style = 1}
	Change \{structurename = player1_status
		instrument_id = Instrument_Les_Paul_Black}
	Change \{net_match_send_available_items_dirty = 1}
	Change \{character_select_highlighted_character_p2_dirty = 1}
	Change \{generic_select_monitor_p1_changed = 1}
	Change \{generic_select_monitor_p2_changed = 1}
	net_match_send_available_items
	ui_flow_manager_respond_to_action \{action = join_server}
	resolve_current_flow_state p2_current_flow_state = <p2_flow_state>
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
	switch ($current_difficulty)
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

script translate_lobby_message 
	switch (<game_mode_index>)
		case 1
		Change \{game_mode = p2_faceoff}
		case 2
		Change \{game_mode = p2_pro_faceoff}
		case 3
		Change \{game_mode = p2_battle}
		case 4
		Change \{game_mode = p2_coop}
	endswitch
	switch (<difficulty_index>)
		case 1
		Change \{current_difficulty = easy}
		Change \{current_difficulty2 = easy}
		case 2
		Change \{current_difficulty = medium}
		Change \{current_difficulty2 = medium}
		case 3
		Change \{current_difficulty = hard}
		Change \{current_difficulty2 = hard}
		case 4
		Change \{current_difficulty = expert}
		Change \{current_difficulty2 = expert}
	endswitch
	switch (<number_of_songs_index>)
		case 1
		Change \{num_songs = num_1}
		case 3
		Change \{num_songs = num_3}
		case 5
		Change \{num_songs = num_5}
		case 7
		Change \{num_songs = num_7}
	endswitch
	switch (<tie_breaker_index>)
		case 1
		Change \{tie_breaker = HOST}
		case 2
		Change \{tie_breaker = CLIENT}
	endswitch
	switch (<p2_flow_state>)
		case 1
		<p2_flow_state> = online_character_select_fs
		case 2
		<p2_flow_state> = online_character_hub_fs
		case 3
		<p2_flow_state> = online_select_outfit_fs
		case 4
		<p2_flow_state> = online_select_style_fs
		case 5
		<p2_flow_state> = online_select_guitar_fs
		case 6
		<p2_flow_state> = online_select_guitar_finish_fs
		case 7
		<p2_flow_state> = online_select_bass_fs
	endswitch
	return p2_flow_state = <p2_flow_state>
endscript

script resolve_current_flow_state 
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :unhide
	endif
	set_other_player_present
	network_player_lobby_message \{Type = open_comm
		action = update}
endscript

script choose_selected_server 
	NetSessionFunc Obj = match func = choose_server params = <...>
endscript

script cleanup_sessionfuncs 

	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = voice_uninit}
	NetSessionFunc \{func = motd_uninit}
endscript

script setup_sessionfuncs 

	NetSessionFunc \{func = match_init}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = voice_init}
	NetSessionFunc \{func = motd_init}
	NetSessionFunc \{Obj = voice
		func = enable}
	if NetSessionFunc \{Obj = match
			func = get_gamertag}
		SetNetworkPreference Field = 'network_id' string = <Name>
		SetNetworkPreference Field = 'server_name' string = <Name>
	endif
endscript

script get_current_level_name 
	return level_name = ($LevelZones.($current_level).title) level = 1
endscript

script GetCurrentAreaStringAndChecksum 
	<area_string> = 'z_online_venue'
	<area_checksum> = dummy_value
endscript

script dispatch_player_state 
	if ($<player_status>.Player = 1)
		<other_player_status> = player2_status
	else
		<other_player_status> = player1_status
	endif
	if ($<other_player_status>.highway_layout = solo_highway)
		begin
		formatText \{checksumName = Type
			'%s'
			s = 'player_state_light'}
		SendNetMessage {
			Type = <Type>
			score = ($<player_status>.score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1
			Seconds}
		repeat
	else
		begin
		GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
		formatText \{checksumName = Type
			'%s'
			s = 'player_state'}
		SendNetMessage {
			Type = <Type>
			guitar_volume = ($<player_status>.guitar_volume)
			star_power_toggle = ($<player_status>.star_power_used)
			score = ($<player_status>.score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			hold_pattern = <hold_pattern>
			whammy_length = ($<player_status>.net_whammy)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1
			Seconds}
		repeat
	endif
endscript

script load_and_sync_timing \{start_delay = 4000}
	if ($<player_status>.highway_layout = solo_highway)
		Change \{current_num_players = 1}
	else
		Change \{current_num_players = 2}
	endif
	EndGameNetScriptPump
	set_rich_presence_game_mode \{online = 1}
	Change \{structurename = player2_status
		is_local_client = 0}
	Load_Venue

	Change \{net_ready_to_start = 0}
	Change \{current_transition = Intro}
	SpawnScriptLater restart_gem_scroller params = {
		song_name = ($current_song)
		difficulty = ($current_difficulty)
		difficulty2 = ($current_difficulty2)
		starttime = ($current_starttime)
		device_num = ($player1_status.controller)
	}
endscript

script launch_network_game 
	Change \{net_ready_to_start = 1}
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

script network_player_update 
	if NOT ($ui_flow_manager_state [0] = online_play_song_fs)
		return
	endif
	if (GameIsOver)
		return
	endif
	Change structurename = <player_status> score = <score>
	Change structurename = <player_status> current_health = <current_health>
	old_star_power = ($<player_status>.star_power_amount)
	Change structurename = <player_status> star_power_amount = <star_power_amount>
	if ((<old_star_power> < 50.0) && (<star_power_amount> >= 50.0))
		SpawnScriptNow show_star_power_ready params = {player_status = <player_status>}
	endif
	if ($game_mode = p2_coop)
		if (($player1_status.star_power_amount) < ($<player_status>.star_power_amount) && ($player1_status.star_power_used = 0))
			Change structurename = player1_status star_power_amount = <star_power_amount>
		endif
	endif
	if (($game_mode = p2_coop) && ($<player_status>.current_run > <current_run>))
		Change structurename = player1_status current_run = <current_run>
	endif
	Change structurename = <player_status> current_run = <current_run>
	if NOT ($player1_status.highway_layout = solo_highway)
		if NOT (($<player_status>.guitar_volume) = <Volume>)
			Change structurename = <player_status> guitar_volume = <Volume>
			UpdateGuitarVolume
		endif
		broadcastevent Type = net_button_check_p2 data = {hold_pattern = <hold_pattern> player_status = <player_status> whammy_len = <whammy_length>}
		if ($game_mode = p2_coop)
			return
		endif
		if NOT ($<player_status>.star_power_used = <star_Power>)
			if (<star_Power>)
				SpawnScriptNow star_power_activate_and_drain params = {
					player_status = <player_status>
					player_text = ($<player_status>.text)
					Player = ($<player_status>.Player)}
			endif
		endif
	endif
endscript

script net_check_buttons 
	get_song_prefix song = <song_name>
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	GuitarInputLogicInit player_status = <player_status> guitar_stream = <guitar_stream> time_offset = <time_offset>
	ExtendCrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	<player_text> = ($<player_status>.text)
	GetArraySize \{$gem_colors}
	begin
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	button_lip_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_lip_name> '_lip' out = button_lip_name
	ExtendCrc <button_lip_name> <player_text> out = button_lip_name
	button_mid_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_mid_name> '_mid' out = button_mid_name
	ExtendCrc <button_mid_name> <player_text> out = button_mid_name
	button_neck_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_neck_name> '_neck' out = button_neck_name
	ExtendCrc <button_neck_name> <player_text> out = button_neck_name
	button_head_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_head_name> '_head' out = button_head_name
	ExtendCrc <button_head_name> <player_text> out = button_head_name
	now_scale = (($nowbar_scale_x * (1.0, 0.0)) + ($nowbar_scale_y * (0.0, 1.0)))
	if ($<player_status>.lefthanded_button_ups = 1)
		<pos2d> = ($button_up_models.<Color>.left_pos_2d)
	else
		<pos2d> = ($button_up_models.<Color>.pos_2d)
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

script network_events 
	SetEventHandler \{response = call_script
		event = net_button_check_p2
		Scr = network_player_buttons}
	Block
endscript

script network_player_buttons 
	GetArraySize \{$gem_colors}
	check_button = 65536
	<mask> = ($player2_status.broken_string_mask)
	array_count = 0
	begin
	if NOT (<mask> && <check_button>)
		Color = ($gem_colors [<array_count>])
		button_head_name = ($button_up_models.<Color>.Name)
		ExtendCrc <button_head_name> '_head' out = button_head_name
		ExtendCrc <button_head_name> ($<player_status>.text) out = button_head_name
		if ScreenElementExists id = <button_head_name>
			if (<hold_pattern> && <check_button>)
				SetScreenElementProps id = <button_head_name> material = ($button_up_models.<Color>.material_down)
			else
				SetScreenElementProps id = <button_head_name> material = ($button_up_models.<Color>.material_head)
			endif
		endif
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($display_debug_input = 1)
		input_debug <...>
	endif
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
	begin
	GetSongTime
	start_time = <songtime>
	Block \{Type = net_button_check_p2}
	GetSongTime
	delta_time = (<songtime> - <start_time>)
	<time> = (<time> - (<delta_time> * 1000))
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	SpawnScriptNow net_whammy_pitch_shift params = {song = <song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = (<event_data>.whammy_len) time = <time>}
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
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> Player = (<player_status>.Player)
		<Scale> = (<Scale> + <scale_step>)
		Wait \{1
			gameframe}
		repeat <frames>
		begin
		set_whammy_pitchshift control = <net_whammy_length> player_status = <player_status>
		<whammy_scale> = (((<net_whammy_length> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue value = <whammy_scale> time_remaining = <time> player_status = <player_status> Player = (<player_status>.Player)
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

script finalize_connection_to_peer 

	Change opponent_gamertag = <opponent_gamertag>
	if NOT isngc
		Change structurename = player1_status net_id_first = <p1_net_id_first>
		Change structurename = player1_status net_id_second = <p1_net_id_second>
		Change structurename = player2_status net_id_first = <p2_net_id_first>
		Change structurename = player2_status net_id_second = <p2_net_id_second>
	endif
	if isngc
		Change structurename = player1_status net_id_first = <p1_net_id_first>
		Change \{structurename = player1_status
			net_id_second = 0}
		Change structurename = player2_status net_id_first = <p2_net_id_first>
		Change \{structurename = player2_status
			net_id_second = 0}
	endif
	formatText \{checksumName = player_status
		'player1_status'}
	GetGlobalTags \{user_options}
	SendNetMessage {
		Type = lefty_update
		lefty_flag = (<lefty_flip_p1>)
	}
	if IsHost
		ResetLobbyReady
		send_game_info_to_client
	endif
	StartGameNetScriptPump
endscript

script net_copy_intial_params 
	Change GlobalName = <copy_to> NewValue = $<copy_from>
endscript

script net_commit_or_reset_params 
	if GotParam \{commit}
		Change GlobalName = <copy_to> NewValue = $<copy_from>
	else
		if (<Type> = loc)
			<text> :SetProps text = ($LevelZones.($LevelZoneArray [$<Global>]).title)
		else
			<text> :SetProps text = ($FilterTypes.<Type>.values [$<Global>])
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
		<text> :SetProps text = ($LevelZones.($LevelZoneArray [$<Global>]).title) Scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	else
		<text> :SetProps text = ($FilterTypes.<Type>.values [$<Global>]) Scale = 1.0
		fit_text_into_menu_item id = <text> max_width = 375
	endif
	if (($SearchMatchTypeValue = 0) && (<Type> = mode) && ($<Global> = 4) && ($ui_flow_manager_state [0] = custom_match_fs))
		net_custom_up_down <...>
	endif
	if (($<Global> = 2) && (<Type> = search))
		if NOT isXenon
			net_custom_up_down <...>
		endif
	endif
endscript

script change_coop_value_if_ranked 
	if (($SearchMatchTypeValue = 0) && ($SearchGameModeValue = 4))
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
			difficulty :SetProps rgba = <change_color> unblock_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = <change_color> text = <new_text> unblock_events
		endif
	else
		if ScreenElementExists \{id = difficulty}
			difficulty :SetProps rgba = ($online_grey) block_events
		endif
		if ScreenElementExists \{id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = ($online_grey) text = 'N/A' block_events
		endif
	endif
endscript

script online_menu_init 

	Change player1_device = ($primary_controller)
	setup_online_player_settings
	Change \{is_network_game = 1}
	Change \{new_net_logic = 1}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	create_guitarist \{Name = GUITARIST
		UseOldPos
		no_strum
		animpak = 0}
	create_guitarist \{Name = BASSIST
		UseOldPos
		no_strum
		animpak = 0}
	SetNetworkMode \{$INTERNET_MODE}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionFunc \{func = GetNumPlayers}
	create_menu_backdrop \{texture = Online_Background}
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		Frame}
	repeat
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
	GetArraySize \{$gh3_songlist}
	begin
	song_checksum = ($gh3_songlist [<array_entry>])
	get_song_struct song = <song_checksum>
	if ((<song_struct>.version) = gh3)
		if (<first_song_index> = (-1))
			<first_song_index> = <array_entry>
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	<last_song_index> = (<array_entry> - 1)
	GetRandomValue Name = random_value integer a = <first_song_index> b = <last_song_index>
	return random_song = ($gh3_songlist [<random_value>])
endscript

script start_network_game 
	Change \{0x68d05d65 = 0}
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

	Change \{disable_attacks = 1}
	if (GameIsOver)
		Change \{current_num_players = 2}
		return
	endif
	if (IsHost)
		loser = 0
	else
		loser = 1
	endif
	SendNetMessage {
		Type = fail_song
		stars = ($player1_status.stars)
		note_streak = ($player1_status.best_run)
		notes_hit = ($player1_status.notes_hit)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = 0
		loser = <loser>
	}
endscript

script online_win_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause

	Change \{disable_attacks = 1}
	Change structurename = <player_status> stars = <stars>
	Change structurename = <player_status> best_run = <note_streak>
	Change structurename = <player_status> total_notes = <total_notes>
	Change structurename = <player_status> notes_hit = <notes_hit>
	if (<quit_early>)
		Change \{player2_present = 0}
		formatText TextName = notification_text '%n\\n has quit' n = ($opponent_gamertag)
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
		create_net_popup popup_text = <notification_text>
		Wait \{3
			Seconds}
		destroy_net_popup
	endif
	player_text = (<player_status>.text)
	Change \{current_num_players = 2}
	if ($game_mode = p2_battle)
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
	else
		ExtendCrc song_won <player_text> out = Type
		broadcastevent Type = <Type>
	endif
endscript

script broadcast_received_winner_stats 
	Change structurename = <player_status> stars = <stars>
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
	if (<online>)
		Change \{rich_presence_context = presence_online_game_mode}
	else
		switch ($game_mode)
			case p1_career
			Change \{rich_presence_context = presence_career}
			case p1_quickplay
			Change \{rich_presence_context = presence_quick_play}
			case p2_career
			Change \{rich_presence_context = presence_coop_career}
			case p2_pro_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_battle
			Change \{rich_presence_context = presence_battle}
			case training
			Change \{rich_presence_context = presence_practice}
		endswitch
	endif
endscript

script get_custom_match_search_params 
	GetPreferenceChecksum \{Ranked}
	Ranked = <checksum>
	GetPreferenceValue \{Ranked}
	ranked_value = <value>
	if (($SearchGameModeValue = 0) || ($SearchGameModeValue = 2))
		difficulty_checksum = ($FilterTypes.diff.checksum [($SearchDifficultyValue)])
	else
		difficulty_checksum = dont_care
	endif
	return {
		difficulty = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.checksum [($SearchGameModeValue)])
		num_songs = ($FilterTypes.num_songs.checksum [($SearchNumSongsValue)])
		tie_breaker = dont_care
		Ranked = ($FilterTypes.Ranked.checksum [($SearchMatchTypeValue)])
		ranked_value = <ranked_value>
	}
endscript

script get_quick_match_search_params 
	GetGlobalTags \{user_options}
	GetPreferenceChecksum \{Ranked}
	Ranked = <checksum>
	GetPreferenceValue \{Ranked}
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
		tie_breaker = dont_care
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript
bPS3SingleSignOnCheckComplete = 0

script xenon_singleplayer_session_init \{ps3_signin_callback = xenon_singleplayer_session_init}
	if isps2
		return
	endif
	if isngc
		return
	endif
	if CheckForSignIn
		NetSessionFunc \{func = stats_uninit}
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_uninit}
		NetSessionFunc \{func = motd_init}
		if isXenon
			NetSessionFunc \{func = start_singleplayer_session
				Obj = session}
			massiveinit \{sku = 'ATVI_Guitar_Hero_3_x360_na'
				startzone = 'GlobalZone'}
		endif
	else
		if NOT isXenon
			if ($is_attract_mode = 0)
				if NOT GotParam \{from_callback}
					if (0 = $bPS3SingleSignOnCheckComplete)
						NetSessionFunc func = OnlineSignIn params = {callback = <ps3_signin_callback>}
						Change \{bPS3SingleSignOnCheckComplete = 1}
					endif
				else

				endif
			endif
		endif
	endif
endscript

script begin_singleplayer_game 
	if isps2
		return
	endif
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = begin_singleplayer_game}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	if isps2
		return
	endif
	if isXenon
		NetSessionFunc \{func = stop_singleplayer_session
			Obj = session}
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	if isps2
		return
	endif

	Change \{net_safe_to_enter_net_play = 0}
	Wait \{3
		Seconds}
	NetSessionFunc \{Obj = session
		func = unpost_game}
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = motd_uninit}
	Change \{net_safe_to_enter_net_play = 1}
endscript

script send_leader_board_message 
	if NOT isngc
		if isps2
			return
		endif
		player1_xuid = [0 0]
		player2_xuid = [0 0]
		switch (<diff>)
			case easy
			<rating> = 1
			case medium
			<rating> = 2
			case hard
			<rating> = 3
			case expert
			<rating> = 4
		endswitch
		if ($game_mode = p1_career)
			controller = ($primary_controller)
			GetNetID Player = <controller>
			SetArrayElement ArrayName = player1_xuid index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = player1_xuid index = 1 NewValue = <net_id_second>
			switch (<diff>)
				case easy
				<career_leaderboard_id> = lb_career_easy
				<campaign_leaderboard_id> = lb_campaign_easy
				case medium
				<career_leaderboard_id> = lb_career_med
				<campaign_leaderboard_id> = lb_campaign_med
				case hard
				<career_leaderboard_id> = lb_career_hard
				<campaign_leaderboard_id> = lb_campaign_hard
				case expert
				<career_leaderboard_id> = lb_career_expert
				<campaign_leaderboard_id> = lb_campaign_expert
			endswitch
			get_progression_globals game_mode = ($game_mode)
			summation_career_score tier_global = <tier_global>
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
								{score = <score>}
								{score = <score>}
								{score = <score>}
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
							]
						}
						{
							leaderboard_id = <campaign_leaderboard_id>
							rating = 0
							score = <score>
							write_type = ACCUMULATE
							columns = [
								{score = <score>}
								{score = <score>}
								{score = <score>}
							]
						}
						{
							leaderboard_id = lb_campaign
							rating = 0
							score = <score>
							write_type = ACCUMULATE
							columns = [
								{score = <score>}
								{score = <score>}
								{score = <score>}
							]
						}
					]
				}
			]
		elseif ($game_mode = p2_career)
			controller = ($primary_controller)
			GetNetID Player = <controller>
			SetArrayElement ArrayName = player1_xuid index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = player1_xuid index = 1 NewValue = <net_id_second>
			net_get_highest_coop_difficulty
			switch <highest_diff>
				case easy
				rating = 1
				career1_leaderboard_id = lb_coop_career_easy
				case medium
				rating = 2
				career1_leaderboard_id = lb_coop_career_med
				case hard
				rating = 3
				career1_leaderboard_id = lb_coop_career_hard
				case expert
				rating = 4
				career1_leaderboard_id = lb_coop_career_expert
			endswitch
			get_progression_globals game_mode = ($game_mode)
			summation_career_score tier_global = <tier_global>
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
								{score = <score>}
								{score = <score>}
								{score = <score>}
							]
						}
						{
							leaderboard_id = <career1_leaderboard_id>
							rating = 0
							score = <career_score>
							write_type = Max
							columns = [
								{score = <career_score>}
								{score = <career_score>}
								{score = <career_score>}
							]
						}
					]
				}
			]
		else
			controller = ($primary_controller)
			GetNetID Player = <controller>
			SetArrayElement ArrayName = player1_xuid index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = player1_xuid index = 1 NewValue = <net_id_second>
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
								{score = <score>}
								{score = <score>}
								{score = 0}
							]
						}
					]
				}
			]
		endif
		NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list>}
	endif
endscript

script net_write_single_player_stats 
	net_retrieve_primary_controller_score
	primary_player_score = <primary_score>
	secondary_player_score = <secondary_score>
	if (<primary_player_score> > 0)
		if NOT (($game_mode = p2_battle) || ($game_mode = practice) || $Cheat_NoFail = 1 || $Cheat_EasyExpert = 1)
			if ($game_mode = p2_career)
				primary_player_score = (<primary_player_score> + <secondary_player_score>)
				CastToInteger \{primary_player_score}
				get_song_struct song = ($current_song)
				formatText checksumName = coop_song_checksum 'lb_coop_%s' s = (<song_struct>.Name)
				send_leader_board_message score = <primary_player_score> leaderboard_id = <coop_song_checksum> diff = ($current_difficulty)
			else
				CastToInteger \{primary_player_score}
				send_leader_board_message score = <primary_player_score> leaderboard_id = ($current_song) diff = ($current_difficulty)
			endif
		else
			xenon_singleplayer_session_begin_uninit
		endif
	else
		xenon_singleplayer_session_begin_uninit
	endif
endscript

script net_retrieve_primary_controller_score 
	if (($player1_status.controller) = ($primary_controller))
		return primary_score = ($player1_status.score) secondary_score = ($player2_status.score)
	elseif (($player2_status.controller) = ($primary_controller))
		return primary_score = ($player2_status.score) secondary_score = ($player1_status.score)
	else
		return \{primary_score = 0
			secondary_score = 0}
	endif
endscript

script summation_career_score 
	setlist_prefix = ($<tier_global>.prefix)
	career_score = 0
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier>
	GetGlobalTags <song_checksum> param = score
	<career_score> = (<career_score> + <score>)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return career_score = <career_score>
endscript

script online_song_end_write_stats \{song_type = single}
	player1_score = ($player1_status.score)
	CastToInteger \{player1_score}
	if (<player1_score> > 0)
		player1_xuid = [0 0]
		SetArrayElement ArrayName = player1_xuid index = 0 NewValue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = player1_xuid index = 1 NewValue = ($player1_status.net_id_second)
		if (<song_type> = coop)
			net_get_highest_coop_difficulty
			switch <highest_diff>
				case easy
				<player1_difficulty_index> = 1
				case medium
				<player1_difficulty_index> = 2
				case hard
				<player1_difficulty_index> = 3
				case expert
				<player1_difficulty_index> = 4
			endswitch
			get_song_struct song = ($net_setlist_songs [($net_song_num)])
			formatText checksumName = leaderboard_id 'lb_coop_%s' s = (<song_struct>.Name)
		else
			switch ($current_difficulty)
				case easy
				<player1_difficulty_index> = 1
				case medium
				<player1_difficulty_index> = 2
				case hard
				<player1_difficulty_index> = 3
				case expert
				<player1_difficulty_index> = 4
			endswitch
			leaderboard_id = ($net_setlist_songs [($net_song_num)])
		endif
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				leaderboards = [
					{
						leaderboard_id = <leaderboard_id>
						rating = <player1_difficulty_index>
						score = <player1_score>
						write_type = Max
						columns = [
							{score = <player1_score>}
							{score = <player1_score>}
							{score = 0}
						]
					}
				]
			}
		]
	endif
	if GotParam \{Player_list}
		NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list> DontEndSessionAfterWrite}
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
			NetSessionFunc func = stats_write_multiplayer Obj = stats params = {Player_list = <Player_list> DontEndSessionAfterWrite}
		endif
	endif
	Wait \{3
		Seconds}
	NetSessionFunc \{Obj = stats
		func = end_write_stats}
endscript

script net_get_highest_coop_difficulty 
	if (($current_difficulty = expert) || ($current_difficulty2 = expert))
		return \{highest_diff = expert}
	endif
	if (($current_difficulty = hard) || ($current_difficulty2 = hard))
		return \{highest_diff = hard}
	endif
	if (($current_difficulty = medium) || ($current_difficulty2 = medium))
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
		formatText checksumName = leaderboard_id_p1 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_pro_faceoff
		formatText checksumName = leaderboard_id_p1 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_pro_faceoff_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_battle
		formatText checksumName = leaderboard_id_p1 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText checksumName = leaderboard_id_p2 'lb_battle_%s' s = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
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
	SendNetMessage {
		Type = lobby_selection
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index1 = <selection_index1>
		selection_index2 = <selection_index2>
		net_checksum = <checksum_value>
	}
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
			if ScreenElementExists \{id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					target = vmenu_character_hub_p1}
			endif
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
	if (($p1_ready = 1) && ($p2_ready = 1))
		if ScreenElementExists \{id = vmenu_character_hub_p1}
			LaunchEvent \{Type = unfocus
				target = vmenu_character_hub_p1}
		endif
	endif
endscript

script network_player_lobby_update 
	if NOT (($player2_present) || (<selection_type> = 8))

		return
	endif
	switch <selection_type>
		case 0
		switch <selection_action>
			get_musician_profile_struct index = <checksum_value>
			case 0
			if (<selection_index1> = 0)
				cs_scroll_up_or_down \{Player = 2
					Dir = up}
			else
				cs_scroll_up_or_down \{Player = 2
					Dir = down}
			endif
			case 1
			net_cs_go_back \{Player = 2}
			case 2
			if (<selection_index1> = ($character_select_highlighted_character_p2))
				character_select_choose \{Player = 2}
			endif
		endswitch
		case 1
		switch <selection_action>
			case 1
			character_hub_go_back \{Player = 2}
			case 2
			switch <selection_index1>
				case 1
				character_hub_select_change_outfit \{Player = 2}
				case 2
				character_hub_select_change_guitar \{Player = 2}
				case 3
				character_hub_select_change_guitar \{Player = 2
					bass}
			endswitch
		endswitch
		case 2
		switch <selection_action>
			case 0
			os_scroll_up_or_down \{Player = 2}
			case 1
			select_outfit_go_back \{Player = 2}
			case 2
			select_outfit_choose \{Player = 2}
		endswitch
		case 3
		switch <selection_action>
			case 0
			select_outfit_style_highlight Player = 2 index = <selection_index1>
			case 1
			destroy_select_style_menu \{Player = 2}
			case 2
			select_outfit_style_choose \{Player = 2}
		endswitch
		case 4
		switch <selection_action>
			case 0
			net_gs_scroll_up_or_down Player = 2 dir_value = <selection_index1> instrument_type = <checksum_value>
			case 1
			SpawnScriptNow \{select_guitar_go_back
				params = {
					Player = 2
				}}
			case 2
			net_select_guitar Player = 2 index = <selection_index1> instrument_type = <checksum_value>
		endswitch
		case 5
		switch <selection_action>
			case 0
			case 1
			net_select_guitar_go_back_from_finish_menu Player = 2 instrument_type = <checksum_value>
			case 2
			net_select_guitar_finish_choose Player = 2 index = <selection_index1> finish_index = <selection_index2> instrument_type = <checksum_value>
		endswitch
		case 6
		switch <selection_action>
			case 1
			online_song_deselect \{Player = 2}
			case 2
			online_song_select song = <checksum_value> Player = 2
		endswitch
		case 7
		switch <selection_action>
			case 1
			if (<checksum_value> = final)
				online_song_deselect \{Player = 2}
				return
			endif
			character_hub_net_ready_back
			case 2
			if (<checksum_value> = final)
				online_song_select \{Player = 2}
				return
			endif
			character_hub_net_ready
		endswitch
		case 8
		set_other_player_present
	endswitch
endscript

script net_lobby_state_message 
	switch <current_state>
		case None
		selection_type = 1
		case character_hub
		selection_type = 1
		case instrument
		selection_type = 2
		case difficulty
		selection_type = 3
		case song
		selection_type = 4
	endswitch
	switch <action>
		case request
		selection_action = 0
		case approval
		selection_action = 1
	endswitch
	if GotParam \{request_state}
		switch <request_state>
			case leaving_lobby
			value = 0
			case character_hub
			value = 1
			case instrument
			value = 2
			case difficulty
			value = 3
			case song
			value = 4
		endswitch
	else
		value = 1
	endif
	SendNetMessage {
		Type = lobby_state
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index = <value>
	}
endscript

script net_lobby_state_update 
	switch <selection_type>
		case 1
		Change \{net_current_flow_state = character_hub}
		Change \{net_can_send_approval = 1}
		case 2
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = guitar}
		set_character_hub_dirty
		if IsHost
			ResetLobbyReady
		endif
		LaunchEvent \{Type = focus
			target = si_vmenu_p1}
		Change \{net_current_flow_state = instrument}
		Change \{net_can_send_approval = 1}
		case 3
		if IsHost
			ResetLobbyReady
		endif
		LaunchEvent \{Type = focus
			target = vmenu_select_difficulty}
		Change \{net_current_flow_state = difficulty}
		Change \{net_can_send_approval = 1}
		case 4
		if (IsHost)
			ResetLobbyReady
			if ($host_songs_to_pick = 0)
				LaunchEvent \{Type = focus
					target = ready_container_p1}
			else
				LaunchEvent \{Type = focus
					target = vmenu_setlist}
			endif
		else
			if ($client_songs_to_pick = 0)
				LaunchEvent \{Type = focus
					target = ready_container_p1}
			else
				LaunchEvent \{Type = focus
					target = vmenu_setlist}
			endif
		endif
		Change \{net_current_flow_state = song}
		Change \{net_can_send_approval = 1}
	endswitch
endscript

script net_pausegh3 
	broadcastevent \{Type = event_pause_game}
	ui_flow_manager_respond_to_action \{action = pause_game}
	Wait \{1
		gameframe}
endscript

script net_unpausegh3 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = select_resume}
endscript

script gameinvite_server_unavailable 
	CreateJoinRefusedDialog \{reason = net_status_join_timeout}
endscript

script destroy_join_refuse_dialog 
	destroy_connection_dialog_scroller
	destroy_popup_warning_menu
endscript

script CreateJoinRefusedDialog 

	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	switch (<reason>)
		case net_reason_banned
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_status_join_timeout
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_full_observers
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_wrong_password
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_default
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_rank_limit_low
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_rank_limit_high
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_default
		<connection_msg> = 'SESSION IS NO LONGER AVAILABLE'
		case net_reason_full
		<connection_msg> = 'THIS SERVER IS NOW FULL'
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
		text = 'CONTINUE'}
	displaySprite id = connect_message_top parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) dims = (448.0, 64.0) just = [center top] z = 200
	displaySprite \{id = connect_message_top_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200}
	displaySprite id = connect_message_body parent = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) dims = (448.0, 128.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_body_fill
		parent = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		dims = (448.0, 128.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	displaySprite id = connect_message_bottom parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) dims = (448.0, 64.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_bottom_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.333
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

script create_connection_lost_dialog 

	Change \{player2_present = 0}
	KillSpawnedScript \{Name = net_hub_stream}
	if ($ui_flow_manager_state [0] = online_loading_fs)
		RemoveTimeSyncTask
		Change \{net_ready_to_start = 1}
	endif
	wait_for_safe_shutdown
	if (GotParam from_invite)
		formatText \{TextName = gt_lost_connection_text
			'The invite server has been filled.'
			DontAssertForChecksums}
	elseif (GotParam player_quit)
		if ($opponent_gamertag = NULL)
			formatText \{TextName = gt_lost_connection_text
				'Your opponent has quit'
				DontAssertForChecksums}
		else
			formatText TextName = gt_lost_connection_text '%n\\n has quit' n = ($opponent_gamertag) DontAssertForChecksums
		endif
	else
		if ($opponent_gamertag = NULL)
			formatText \{TextName = gt_lost_connection_text
				'LOST CONNECTION TO YOUR OPPONENT'
				DontAssertForChecksums}
		else
			formatText TextName = gt_lost_connection_text 'LOST CONNECTION TO\\n%g' g = ($opponent_gamertag) DontAssertForChecksums
		endif
	endif
	create_net_popup popup_text = <gt_lost_connection_text>
	if ($playing_song = 1)
		Wait \{2
			Seconds}
		if ($ui_flow_manager_state [0] = online_play_song_fs)
			connection_lost_end_song
		elseif ($ui_flow_manager_state [0] = online_pause_fs)
			ui_flow_manager_respond_to_action \{action = select_resume}
			connection_lost_end_song
		endif
		Wait \{2
			Seconds}
	else
		if (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs))
			cleanup_newspaper_other_player_quit
			Wait \{4
				Seconds}
		elseif ($ui_flow_manager_state [0] = online_menu_fs)
			Wait \{4
				Seconds}
		else
			Wait \{4
				Seconds}
			lobby_connection_lost
		endif
	endif
	destroy_net_popup
endscript

script create_net_popup \{parent = root_window
		Pos = (640.0, 325.0)}
	destroy_net_popup
	destroy_pause_menu_frame
	unpausegh3
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = net_popup_container
		just = [center center]
		Pos = (0.0, 0.0)
	}
	displaySprite id = connect_message_top parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (<Pos> - (0.0, 125.0)) dims = (448.0, 64.0) just = [center top] z = 200
	displaySprite id = connect_message_top_fill parent = net_popup_container tex = window_fill_cap rgba = ($online_trans_grey) Pos = (<Pos> - (0.0, 125.0)) dims = (448.0, 64.0) just = [center top] z = 200
	displaySprite id = connect_message_body parent = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (<Pos> - (0.0, 61.0)) dims = (448.0, 128.0) just = [center top] z = 200 flip_h
	displaySprite id = connect_message_body_fill parent = net_popup_container tex = window_fill_body_large rgba = ($online_trans_grey) Pos = (<Pos> - (0.0, 61.0)) dims = (448.0, 128.0) just = [center top] z = 200 flip_h
	displaySprite id = connect_message_bottom parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (<Pos> + (0.0, 67.0)) dims = (448.0, 64.0) just = [center top] z = 200 flip_h
	displaySprite id = connect_message_bottom_fill parent = net_popup_container tex = window_fill_cap rgba = ($online_trans_grey) Pos = (<Pos> + (0.0, 67.0)) dims = (448.0, 64.0) just = [center top] z = 200 flip_h
	CreateScreenElement {
		Type = TextBlockElement
		id = net_popup_text
		parent = net_popup_container
		font = fontgrid_title_gh3
		Scale = 0.66700006
		rgba = ($online_light_blue)
		text = <popup_text>
		Pos = <Pos>
		dims = (375.0, 200.0)
		z_priority = 200.1
		just = [center center]
	}
	if GotParam \{add_waiting_dots}
		RunScriptOnScreenElement id = net_popup_text append_animating_dots params = {id = net_popup_text text = <popup_text>}
	endif
endscript

script append_animating_dots 

	num_dots = 0
	if ScreenElementExists id = <id>
		begin
		formatText TextName = new_text '%a\\n%b' a = <text> b = ($dots_array [<num_dots>])
		<id> :SetProps text = <new_text>
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
	if ScreenElementExists \{id = net_popup_container}
		DestroyScreenElement \{id = net_popup_container}
	endif
endscript

script ShowJoinTimeoutNotice 
	cancel_join_server
	setup_sessionfuncs
	SpawnScriptNow \{timeout_connection_attempt}
endscript

script timeout_connection_attempt 
	create_timeout_dialog
	ui_flow_manager_respond_to_action \{action = timeout}
	net_repeat_last_search
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
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		z = 200.1
		text = 'CONTINUE'}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		Pos = (0.0, 0.0)}
	displaySprite id = connect_message_top parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) dims = (448.0, 64.0) just = [center top] z = 200
	displaySprite \{id = connect_message_top_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200}
	displaySprite id = connect_message_body parent = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) dims = (448.0, 128.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_body_fill
		parent = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		dims = (448.0, 128.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	displaySprite id = connect_message_bottom parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) dims = (448.0, 64.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_bottom_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = 'CONNECTION TIMED OUT'
		Pos = (640.0, 300.0)
		dims = (375.0, 200.0)
		z_priority = 200.0
		just = [center center]
	}
	LaunchEvent \{Type = focus
		target = connection_dialog_vmenu}
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
		text = 'CONTINUE'}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_popup_container
		just = [
			center
			center
		]
		Pos = (0.0, 0.0)}
	displaySprite id = connect_message_top parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) dims = (448.0, 64.0) just = [center top] z = 200
	displaySprite \{id = connect_message_top_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200}
	displaySprite id = connect_message_body parent = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) dims = (448.0, 128.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_body_fill
		parent = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		dims = (448.0, 128.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	displaySprite id = connect_message_bottom parent = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) dims = (448.0, 64.0) just = [center top] z = 200 flip_h
	displaySprite \{id = connect_message_bottom_fill
		parent = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		dims = (448.0, 64.0)
		just = [
			center
			top
		]
		z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		parent = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = 'FAILED TO CONNECT TO GAME'
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

script get_num_players_by_gamemode 
	if (($game_mode = p1_career) || ($game_mode = p1_quickplay) || ($game_mode = training))
		return \{num_players = 1}
	else
		return \{num_players = 2}
	endif
endscript

script connection_lost_end_song 

	Change \{current_num_players = 2}
	if ($playing_song = 0)
		return
	endif
	if ($game_mode = p2_battle)
		Change \{structurename = player1_status
			current_health = 1.0}
		Change \{structurename = player2_status
			current_health = 0.0}
		GuitarEvent_SongWon \{battle_win = 1}
	else
		ExtendCrc \{song_won
			'p1'
			out = Type}
		broadcastevent Type = <Type>
	endif
endscript

script test_events \{passed_in_value = 'test value'}


	NetSessionFunc \{Obj = stats
		func = write_key_value
		params = {
			wtf_value = 'test value'
			key = 'test key'
		}}
endscript

script net_failed_signin 

	if ($respond_to_signin_changed = 0)
		return
	endif
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script xbox360_live_not_allowed 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	create_menu_backdrop \{texture = Online_Background}
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
		tex = Dialog_BG
		Pos = (640.0, 500.0)
		dims = (320.0, 64.0)
		z = 9
		just = [
			center
			botom
		]}
	displaySprite \{parent = signin_container
		id = options_bg_2
		tex = Dialog_BG
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
		font = fontgrid_title_gh3
		Scale = 1.7333001
		rgba = [
			223
			223
			223
			250
		]
		text = 'WARNING'
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
		<sign_in_text> = 'The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play.'
	else
		<sign_in_text> = 'You must be signed in to enter the PLAYSTATION®Network lobby.'
	endif
	Scale = 1
	StringLength string = <sign_in_text>

	if (<str_len> >= 135)
		<Scale> = 0.8
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = signin_container
		font = fontgrid_title_gh3
		Scale = 0.8
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
		font = fontgrid_title_gh3
		Scale = 1.1333001
		rgba = ($menu_unfocus_color)
		text = 'CONTINUE'
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
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
		texture = Dialog_Highlight
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = sign_in_vmenu}
endscript

script xenon_auto_load_progress 

	if (($ui_flow_manager_state [0]) = online_signin_fs)
		if ($online_signin_autoload_required = 1)
			Change \{online_signin_autoload_required = 0}
			Change \{respond_to_signin_changed = 0}
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
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script scale_element_to_size \{time = 0}
	if NOT GotParam \{id}

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
	<id> :DoMorph Scale = (<xScale> * (1.0, 0.0) + <yScale> * (0.0, 1.0)) time = <time>
endscript

script translate_screen_element \{time = 0}
	if NOT GotParam \{id}

		return
	endif
	if NOT GotParam \{Pos}
		GetScreenElementPosition id = <id>
		new_position = <screenelementpos>
	else
		new_position = <Pos>
	endif
	<id> :DoMorph Pos = <new_position> time = <time>
endscript

script get_my_highway_layout 
	Player = 1
	begin
	formatText checksumName = player_status 'player%p_status' p = <Player>
	if ($<player_status>.is_local_client)
		return my_highway = ($<player_status>.highway_layout)
	endif
	<Player> = (<Player> + 1)
	repeat 2
endscript

script agora_update 

	get_game_mode_name
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	formatText TextName = band_name '%s' s = <Name>
	if NOT GotParam \{new_band}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		if (<game_mode_name> = p2_career)
			coop_difficulty = <difficulty_text_nl>
			get_diff_completion_percentage \{for_p2_career = 1}
		else
			career_difficulty = <difficulty_text_nl>
			get_diff_completion_percentage
		endif
		if ($game_mode = p2_career)
			coop_percent_complete_easy = (<diff_completion_percentage> [0])
			coop_score_overall_easy = (<diff_completion_score> [0])
			coop_percent_complete_medium = (<diff_completion_percentage> [1])
			coop_score_overall_medium = (<diff_completion_score> [1])
			coop_percent_complete_hard = (<diff_completion_percentage> [2])
			coop_score_overall_hard = (<diff_completion_score> [2])
			coop_percent_complete_expert = (<diff_completion_percentage> [3])
			coop_score_overall_expert = (<diff_completion_score> [3])
		else
			career_percent_complete_easy = (<diff_completion_percentage> [0])
			career_score_overall_easy = (<diff_completion_score> [0])
			career_percent_complete_medium = (<diff_completion_percentage> [1])
			career_score_overall_medium = (<diff_completion_score> [1])
			career_percent_complete_hard = (<diff_completion_percentage> [2])
			career_score_overall_hard = (<diff_completion_score> [2])
			career_percent_complete_expert = (<diff_completion_percentage> [3])
			career_score_overall_expert = (<diff_completion_score> [3])
		endif
	endif
	GetGlobalTags \{achievement_info}

	CastToInteger \{total_points_in_career_mode_easy}
	campaign_score_easy = <total_points_in_career_mode_easy>
	CastToInteger \{total_points_in_career_mode_medium}
	campaign_score_medium = <total_points_in_career_mode_medium>
	CastToInteger \{total_points_in_career_mode_hard}
	campaign_score_hard = <total_points_in_career_mode_hard>
	CastToInteger \{total_points_in_career_mode_expert}
	campaign_score_expert = <total_points_in_career_mode_expert>
	campaign_score_overall = (<total_points_in_career_mode_expert> + <total_points_in_career_mode_hard> + <total_points_in_career_mode_medium> + <total_points_in_career_mode_easy>)
	achievements = 'what achievements?'
	purchases = 'test purchases'
	WriteUpdate <...>
endscript

script agora_write_stats venue = (($LevelZones.$current_level).Name) song = ($current_song)

	if ($game_mode = p1_quickplay)
		quickplay = 1
	endif
	if ($boss_battle = 1)
		return
	endif
	if ($is_network_game)
		if NOT IsHost
			return
		endif
	endif
	player_id = ($player1_status.controller)
	get_num_players_by_gamemode
	GetGlobalTags \{user_options
		param = lefty_flip_p1}
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	if ($is_network_game)
		NetSessionFunc \{Obj = match
			func = get_gamertag}
		formatText TextName = gamertag1 '%s' s = <Name>
		formatText TextName = gamertag2 '%s' s = ($opponent_gamertag)
		p1_name = <gamertag1>
		p2_name = <gamertag2>
		retrieve_player_net_id \{Player = 2}
		if isngc
			player_id2 = (<net_id> [0])
		else
			player_id2 = <net_id>
		endif
	else
		player_id2 = ($player2_status.controller)
		if (($game_mode = p1_career) || ($game_mode = p2_career))
			menu_ebn_get_band_name_text
			StringRemoveTrailingWhitespace string = <band_name_text_string>
			formatText TextName = band_text '%s' s = <band_name_text_string>
			<p1_name> = <band_text>
			<p2_name> = <band_text>
		else
		endif
	endif
	get_game_mode_name
	switch <game_mode_name>
		case 'p2_battle'
		mode = 'battle'
		case 'p2_faceoff'
		mode = 'face_off'
		case 'p2_pro_faceoff'
		mode = 'pro_face_off'
		case 'p2_quickplay'
		mode = 'local_coop'
		case 'p2_coop'
		mode = 'online_coop'
		default
		mode = 'invalid'
	endswitch
	if isngc
		if NOT ($is_network_game)
			player_id2 = -1
		endif
	endif
	get_song_prefix song = <song>
	title = <song_prefix>
	if ($player1_status.part = guitar)
		part = 'guitar'
	elseif ($player1_status.part = bass)
		part = 'bass'
	else
		part = 'rhythm'
	endif
	get_difficulty_text_nl difficulty = ($current_difficulty)
	difficulty = <difficulty_text_nl>
	score = ($player1_status.score)
	CastToInteger \{score}
	stars = ($player1_status.stars)
	notes_hit = ($player1_status.notes_hit)
	notes_missed = (($player1_status.total_notes) - ($player1_status.notes_hit))
	best_streak = ($player1_status.best_run)
	star_power_achieved = ($player1_status.sp_phrases_hit)
	star_power_available = ($player1_status.sp_phrases_total)
	if (<lefty_flip_p1>)
		lefty = true
	else
		lefty = FALSE
	endif
	get_character_name \{Player = 1}
	p1_character_name = <character_name>
	get_character_outfit_name \{Player = 1}
	outfit = <outfit_name>
	character_color = ($player1_status.style)
	get_player_instrument_desc_name \{Player = 1}
	guitar = <instrument_name>
	skin = <instrument_name>
	if (<num_players> = 2)
		if ($player1_status.score > $player2_status.score)
			winner = 'participant_1'
		else
			winner = 'participant_2'
		endif
		if ($player2_status.part = guitar)
			part2 = 'guitar'
		elseif ($player2_status.part = bass)
			part2 = 'bass'
		else
			part2 = 'rhythm'
		endif
		get_difficulty_text_nl difficulty = ($current_difficulty2)
		difficulty2 = <difficulty_text_nl>
		score2 = ($player2_status.score)
		CastToInteger \{score2}
		stars2 = ($player2_status.stars)
		notes_hit2 = ($player2_status.notes_hit)
		notes_missed2 = (($player2_status.total_notes) - ($player2_status.notes_hit))
		best_streak2 = ($player2_status.best_run)
		star_power_received2 = ($player2_status.sp_phrases_hit)
		star_power_achieved2 = ($player2_status.sp_phrases_hit)
		0x82f10596 = ($player2_status.sp_phrases_total)
		if ($player2_status.lefthanded_button_ups = 1)
			lefty2 = true
		else
			lefty2 = FALSE
		endif
		get_character_name \{Player = 2}
		character_name2 = <character_name>
		get_character_outfit_name \{Player = 2}
		outfit2 = <outfit_name>
		character_color2 = ($player2_status.style)
		get_player_instrument_desc_name \{Player = 2}
		guitar2 = <instrument_name>
		skin2 = <instrument_name>
		character_name = <p1_character_name>
		WriteMultiPerformance <...>
	else
		winner = <p1_name>
		WritePerformance <...>
	endif
endscript

script WritePerformance 
	if isngc
		num_cheats = 0
	endif
	if ($Cheat_AirGuitar = 1)
		air_guitar_active = air_guitar_active
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_PerformanceMode = 1)
		performance_mode = performance_mode
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_Hyperspeed > 0)
		hyper_speed = hyper_speed
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_NoFail = 1)
		no_fail = no_fail
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_EasyExpert = 1)
		easy_expert = easy_expert
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_PrecisionMode = 1)
		precision_mode = precision_mode
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if ($Cheat_BretMichaels = 1)
		bret_michaels = bret_michaels
		if isngc
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif
	if isngc
		if ($cheat_largegems = 1)
			0x2f1a37f8 = 0x2f1a37f8
			<num_cheats> = (<num_cheats> + 1)
		endif
	endif

	NetSessionFunc Obj = stats func = write_performance params = {<...>}
endscript

script WriteMultiPerformance 
	NetSessionFunc Obj = stats func = write_multi_match params = {<...>}
endscript

script WriteUpdate 

	NetSessionFunc Obj = stats func = write_update params = {<...>}
endscript

script invite_accepted 
	if ($primary_controller_assigned = 0)
		Change invite_controller = <controllerid>
		return
	elseif ($primary_controller != <controllerid>)
		Change invite_controller = <controllerid>
	endif
	if ((($is_network_game = 0) && ($playing_song)) &&
			(($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_career)))
		if (GameIsPaused)
			destroy_pause_menu
		endif
		create_popup_warning_menu {
			textblock = {
				text = 'Are you sure you want to leave this game session? Only the player who accepted the game invite will go to Xbox LIVE.'
				Pos = (640.0, 380.0)
			}
			player_device = <controllerid>
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = accepted_invite_agree
					text = 'YES'
				}
				{
					func = accepted_invite_disagree
					text = 'NO'
				}
			]
			no_background
		}
	else
		do_join_invite_stuff <...> accepted_invite
	endif
endscript

script accepted_invite_agree 
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
	SendNetMessage {
		Type = fail_song
		stars = ($player1_status.stars)
		note_streak = ($player1_status.best_run)
		notes_hit = ($player1_status.notes_hit)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = <quit_early>
		loser = <loser>
	}
	Wait <wait_frames> gameframes
endscript

script do_join_invite_stuff 

	if GotParam \{accepted_invite}

		Change \{online_signin_autoload_required = 0}
		wait_for_safe_shutdown

		disable_pause
		if ($primary_controller_assigned = 1 && $primary_controller != $invite_controller && $invite_controller != -1)
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
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			StopRendering
			shutdown_game_for_signin_change \{unloadcontent = 0}
			Change \{invite_controller = -1}
			LaunchEvent \{Type = unfocus
				target = root_window}
			online_menu_init
			start_flow_manager \{flow_state = invite_joining_game_fs}
			StartRendering
			if NOT ($primary_controller = $player1_status.controller)
				Change structurename = player1_status controller = ($primary_controller)
				GetGlobalTags \{user_options}
				Change structurename = player1_status lefthanded_gems = <lefty_flip_p2>
				Change structurename = player1_status lefthanded_button_ups = <lefty_flip_p2>
			endif
			JoinInviteServer
		endif
	else

		if (($ui_flow_manager_state [0]) = main_menu_fs)
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
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
	NetSessionFunc \{Obj = match
		func = get_gamertag}
	ui_print_gamertag Name = <Name> start_pos = <pos1> Color = ($player1_color) Player = 1 just = <just1> dims = <dims> offscreen = <offscreen>
	ui_print_gamertag Name = ($opponent_gamertag) start_pos = <pos2> Color = ($player2_color) Player = 2 just = <just2> dims = <dims> offscreen = <offscreen>
endscript

script ui_print_gamertag start_pos = (235.0, 100.0) Color = ($player1_color) Player = 1 dims = (450.0, 35.0) z = 60 offscreen = 0
	if NOT GotParam \{Name}
		get_character_name Player = <Player>
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
		font = fontgrid_title_gh3
		rgba = <Color>
		text = <Name>
		id = <gamertag_text_px>
		Pos = (<start_pos> + (0.0, 3.0))
		just = <just>
		Scale = 1.0
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
	displaySprite {
		id = <gt_frame_top>
		parent = gamertag_container
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		Pos = <start_pos>
		just = <just>
		z = <z>
	}
	displaySprite {
		id = <gt_frame_top_fill>
		parent = gamertag_container
		tex = window_fill_cap
		rgba = ($online_trans_grey)
		Pos = <start_pos>
		just = <just>
		z = <z>
	}
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
	displaySprite {
		id = <gt_frame_bottom>
		parent = gamertag_container
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		Pos = (<Pos> + (<height> * (0.0, 1.0)))
		just = <just>
		Scale = <Scale>
		z = (<z> + 5)
		flip_h
	}
	displaySprite {
		id = <gt_frame_bottom_fill>
		parent = gamertag_container
		tex = window_fill_cap
		rgba = ($online_trans_grey)
		Pos = (<Pos> + (<height> * (0.0, 1.0)))
		just = <just>
		Scale = <Scale>
		z = <z>
		flip_h
	}
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
			text = 'GAMER CARD'
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
			text = '\\ba'
			Pos = (<text_begin> + (20.0, -1.0))
			just = [right top]
			font = ($gh3_button_font)
			Scale = 0.5
			z = (<z> + 200)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = Control_pill_end
			Pos = (10.0, 15.0)
			just = [right center]
			dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = Control_pill_body
			Pos = (0.0, 15.0)
			just = [right center]
			dims = ((32.0, 32.0) + <width> * (1.0, 0.0))
			rgba = [180 180 180 255]
			z = (<z> + 100)
		}
		displaySprite {
			parent = gamertag_icon_container
			tex = Control_pill_end
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
		DoScreenElementMorph id = gamertag_container Pos = <move_gamertag_pos> time = <time_to_move>
		if ScreenElementExists \{id = gamertag_icon_container}
			SetScreenElementProps \{id = gamertag_icon_container
				alpha = 0}
		endif
	endif
endscript
net_star_power_pending = 0

script coop_attempt_star_power 
	if ($net_star_power_pending)
		return
	endif
	Change \{net_star_power_pending = 1}
	SendNetMessage \{Type = coop_star_power_notify}
	Wait \{30
		frames}
	Change \{net_star_power_pending = 0}
endscript

script test_write_leaderboards 

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
	if NOT ($is_network_game = 1)
		return
	endif
	if GotParam \{net_id}
		NetSessionFunc func = showGamerCard params = {player_xuid = <net_id>}
	endif
endscript

script new_net_logic_init 
	Change boss_controller = ($player2_status.controller)
	Change \{boss_pattern = 0}
	Change \{boss_strum = 0}
	Change \{boss_lastwhammytime = 0}
	Change \{boss_lastbrokenstringtime = 0}
	Change \{boss_hammer_count = 0}
endscript

script new_net_logic_deinit 
	if ($is_network_game)
		Change structurename = player2_status controller = ($boss_oldcontroller)
		Change \{boss_pattern = 0}
		Change \{boss_strum = 0}
		Change \{boss_lastwhammytime = 0}
		Change \{boss_lastbrokenstringtime = 0}
		Change \{boss_hammer_count = 0}
	endif
endscript

script win_now 
	ExtendCrc \{song_won
		'p1'
		out = Type}
	broadcastevent Type = <Type>
endscript
new_message_of_the_day = 0

script splash_callback 


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

	SendStructure callback = test_callback data_to_send = <...>
endscript

script test_callback 


endscript

script cleanup_online_lobby_select 
	shut_down_character_hub
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
	formatText checksumName = player_status 'player%i_status' i = <Player>
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

script create_link_unplugged_dialog 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = 'CONNECTION LOST'
		title_props = {
			Scale = 1.0
		}
		textblock = {
			text = 'Your network connection has been disconnected. Returning to the main menu.'
			Pos = (640.0, 380.0)
		}
		menu_pos = (600.0, 475.0)
		options = [
			{
				func = connection_lost_resume_play
				text = 'CONTINUE'
				Scale = (1.0, 1.0)
			}
		]}
endscript

script connection_lost_resume_play 

	destroy_popup_warning_menu
	Change \{g_connection_loss_dialogue = 0}
	start_flow_manager \{flow_state = main_menu_fs}
endscript

script RemoveObserverBG 
endscript

script coop_fail_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause
	if (<quit_early>)
		Change \{player2_present = 0}
		formatText TextName = notification_text '%n\\n has quit' n = ($opponent_gamertag)
		create_net_popup popup_text = <notification_text>
		Wait \{3
			Seconds}
		destroy_net_popup
	endif
	Change structurename = <player_status> stars = <stars>
	Change structurename = <player_status> best_run = <note_streak>
	Change structurename = <player_status> total_notes = <total_notes>
	Change structurename = <player_status> notes_hit = <notes_hit>
	player_text = (<player_status>.text)
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
	SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
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
		<id> :SetProps {
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
			font = fontgrid_title_gh3
			Scale = 0.8667
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

script start_final_song 
	Change current_song = ($net_setlist_songs [($net_song_num)])
	SpawnScriptLater \{load_and_sync_timing
		params = {
			start_delay = 3000
			player_status = player1_status
		}}
endscript

script server_disconnection_cleanup 

	determine_if_game_over
	Change \{player2_present = 0}
	if ($ui_flow_manager_state [0] = online_loading_fs)
		create_connection_lost_dialog
	elseif ($playing_song = 0)
		if (($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
			if NOT ScreenElementExists \{net_popup_container}
				get_number_of_songs
				if NOT (<game_over>)
					create_connection_lost_dialog \{player_quit}
				endif
			endif
		else
			create_connection_lost_dialog \{player_quit}
		endif
	endif
endscript

script searching_menu_focus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text_string}
		DoScreenElementMorph id = {<objID> child = text_string} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = highlight_bar}
		DoScreenElementMorph id = {<objID> child = highlight_bar} alpha = 1.0
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		DoScreenElementMorph id = {<objID> child = left_bookend} alpha = 1.0
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		DoScreenElementMorph id = {<objID> child = right_bookend} alpha = 1.0
	endif
endscript

script searching_menu_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text_string}
		DoScreenElementMorph id = {<objID> child = text_string} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = highlight_bar}
		DoScreenElementMorph id = {<objID> child = highlight_bar} alpha = 0.0
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		DoScreenElementMorph id = {<objID> child = left_bookend} alpha = 0.0
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		DoScreenElementMorph id = {<objID> child = right_bookend} alpha = 0.0
	endif
endscript

script set_other_player_present 

	if NOT ($player2_present)
		Change \{player2_present = 1}
		SpawnScriptNow \{net_hub_stream}
	endif
	if ScreenElementExists \{id = character_hub_p1_continue}
		character_hub_p1_continue :SetProps \{rgba = [
				180
				100
				60
				255
			]
			unblock_events}
	endif
	ui_print_gamertag Name = ($opponent_gamertag) start_pos = (1010.0, 95.0) Color = ($player2_color) Player = 2 just = [right top] dims = (450.0, 35.0)
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
		formatText checksumName = player_status 'player%i_status' i = <Player>
		SetArrayElement ArrayName = net_id index = 0 NewValue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 NewValue = ($<player_status>.net_id_second)
	else
		SetArrayElement ArrayName = net_id index = 0 NewValue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = net_id index = 1 NewValue = ($player1_status.net_id_second)
	endif


	return net_id = <net_id>
endscript

script host_handle_dropped_client 

	determine_if_game_over
	Change \{player2_present = 0}
	KillSpawnedScript \{Name = net_hub_stream}
	EndGameNetScriptPump
	if ($ui_flow_manager_state [0] = online_character_select_fs)
		drop_client_from_character_select
		net_lobby_state_message \{current_state = character_hub
			action = request
			request_state = leaving_lobby}
		ResetLobbyReady
	elseif ($ui_flow_manager_state [0] = online_loading_fs)
	elseif (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
		if NOT ScreenElementExists \{net_popup_container}
			get_number_of_songs
			if NOT (<game_over>)
				create_connection_lost_dialog \{player_quit}
			endif
		endif
	else
		if ($game_mode = p2_coop)
			Change \{structurename = player1_status
				part = guitar}
			Change \{structurename = player2_status
				part = guitar}
			create_guitarist \{Name = GUITARIST
				UseOldPos
				no_strum
				animpak = 0}
			create_guitarist \{Name = BASSIST
				UseOldPos
				no_strum
				animpak = 0}
		endif
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = leaving_lobby
		}
		Wait \{2
			Frame}
		if ($playing_song = 0)
			destroy_gamertags
			if NOT ($0x41d5263e = friends)
				NetSessionFunc \{Obj = match
					func = get_gamertag}
				ui_print_gamertag Name = <Name> start_pos = (270.0, 95.0) Color = ($player1_color) Player = 1 just = [left top] dims = (450.0, 35.0)
			endif
		endif
		ResetLobbyReady
		Change \{net_can_send_approval = 1}
	endif
	ui_flow_manager_respond_to_action \{action = handle_dropped_client}
	if ($playing_song = 0)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
endscript

script drop_client_from_character_select 
	destroy_gamertags
	if NOT ($0x41d5263e = friends)
		NetSessionFunc \{Obj = match
			func = get_gamertag}
		ui_print_gamertag Name = <Name> start_pos = (270.0, 95.0) Color = ($player1_color) Player = 1 just = [left top] dims = (450.0, 35.0)
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
	create_net_popup \{popup_text = 'Waiting for other player to join'
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
		<icon_id> :SetProps texture = <icon_texture>
		return
	endif
	Wait \{1
		gameframe}
	repeat 600

endscript

script net_hub_stream 
	player_status = player1_status
	begin
	char_data = {
		char_id = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		instrument_id = ($player1_status.instrument_id)
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
	outfit = (<char_data>.outfit)
	style = (<char_data>.style)
	instrument_id = (<char_data>.instrument_id)
	valid = 0
	if find_profile_by_id id = <char_id>
		if is_musician_profile_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)

		char_id = Axel
		outfit = 1
		style = 1
	endif
	valid = 0
	if find_instrument_index desc_id = <instrument_id>
		if is_musician_instrument_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)

		instrument_id = Instrument_Les_Paul_Black
	endif
	if NOT ($<player_status>.character_id = <char_id>)
		Change structurename = <player_status> character_id = <char_id>
		<change_made> = 1
	endif
	if NOT ($<player_status>.outfit = <outfit>)
		Change structurename = <player_status> outfit = <outfit>
		<change_made> = 1
	endif
	if NOT ($<player_status>.style = <style>)
		Change structurename = <player_status> style = <style>
		<change_made> = 1
	endif
	if NOT ($<player_status>.instrument_id = <instrument_id>)
		get_musician_instrument_type desc_id = <instrument_id>
		if GotParam (instrument_type)
			if (<instrument_type> = guitar)
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_guitar = <instrument_id>
				endif
			else
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_bass = <instrument_id>
				endif
			endif
			Change structurename = <player_status> instrument_id = <instrument_id>
			<change_made> = 1
		endif
	endif
	if (<change_made> = 1)
		Change \{generic_select_monitor_p2_changed = 1}
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
		shut_down_character_hub
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

script debug_print_coop_stats \{identifier = ''}

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
		<id> :DoMorph alpha = 0.0 time = 1.0
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
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_frame_cap
		dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		Pos = (0.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_fill_cap
		dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		Pos = (0.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_frame_body_tall
		dims = (128.0, 512.0)
		rgba = ($online_medium_blue)
		Pos = (64.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_fill_body_large
		dims = (128.0, 512.0)
		rgba = ($online_trans_grey)
		Pos = (64.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_frame_cap
		dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		Pos = (576.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = window_fill_cap
		dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		Pos = (576.0, 0.0)
		just = [center top]
		z_priority = <z>
		rot_angle = -90
		alpha = 1.0
		flip_h
	}
	if isXenon
		text = 'Both players need to have the same Downloaded Songs in order to use them in XBOX LIVE multiplayer games.'
	else
		text = 'Both players need to have the same Downloaded Songs in order to use them in PLAYSTATION®Network multiplayer games.'
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		font = text_a4
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
	if GameIsOver
		return
	endif
	if ($game_mode = p2_battle)
		if (IsHost)
			SendEndSong
			client_handle_end_song
		endif
	else
		client_handle_end_song
	endif
endscript

script client_handle_end_song 

	ExtendCrc \{song_won
		'p1'
		out = Type}
	broadcastevent Type = <Type>
endscript

script 0xf06fbb81 
	if ($ui_flow_manager_state [0] = online_play_song_fs || $ui_flow_manager_state [0] = online_pause_fs)
		return \{0xcb44d97e = true}
	else
		return \{0xcb44d97e = FALSE}
	endif
endscript
