boolean_types = [
	{
		name = "Yes"
		checksum = boolean_true
		value = 1
	}
	{
		name = "No"
		checksum = boolean_false
		value = 0
	}
]
on_off_types = [
	{
		name = "On"
		checksum = boolean_true
	}
	{
		name = "Off"
		checksum = boolean_false
	}
]
team_types = [
	{
		name = "None"
		checksum = teams_none
	}
	{
		name = "2"
		checksum = teams_two
	}
]
ntt_line_play_mode = [
	{
		name = "Sequential"
		checksum = sequential
	}
	{
		name = "Free For All"
		checksum = freeforall
	}
]
temp_net_horse_game_style = [
	{
		name = "Classic"
		checksum = ClassicMode
	}
	{
		name = "Nail"
		checksum = NTTMode
	}
]
score_players = [
	{
		name = "Show Players"
		checksum = score_players
	}
	{
		name = "Show Teams"
		checksum = score_teams
	}
]
ctf_type = [
	{
		name = "Use Time Limit"
		checksum = timed_ctf
	}
	{
		name = "Use Capture Limit"
		checksum = score_ctf
	}
]
gold_type = [
	{
		name = "Use Time Limit"
		checksum = timed_gold
	}
	{
		name = "Use Score Limit"
		checksum = score_gold
	}
]
score_type = [
	{
		name = "Points"
		checksum = point_scoring
	}
	{
		name = "Tags"
		checksum = tag_scoring
	}
]
default_master_servers = [
	{
		name = '205.147.4.17'
	}
	{
		name = '63.241.179.8'
	}
	{
		name = '205.147.28.3'
	}
]
rank_limits = [
	{
		name = "1"
		checksum = num_1
		num = 1
		test_greater_only
	}
	{
		name = "2"
		checksum = num_2
		num = 2
	}
	{
		name = "3"
		checksum = num_3
		num = 3
	}
	{
		name = "4"
		checksum = num_4
		num = 4
	}
	{
		name = "5"
		checksum = num_5
		num = 5
	}
	{
		name = "6"
		checksum = num_6
		num = 6
	}
	{
		name = "7"
		checksum = num_7
		num = 7
	}
	{
		name = "8"
		checksum = num_8
		num = 8
	}
	{
		name = "9"
		checksum = num_9
		num = 9
	}
	{
		name = "10"
		checksum = num_10
		num = 10
		test_less_only
	}
]
rank_tests = [
	{
		name = "None"
		checksum = rank_test_none
	}
	{
		name = "Less Than"
		checksum = rank_test_less
	}
	{
		name = "Greater Than"
		checksum = rank_test_greater
	}
]
team_graffiti_mode = [
	{
		name = "Combined"
		checksum = graffiti_team_scoring
	}
	{
		name = "Individual"
		checksum = graffiti_individual_scoring
	}
]
default_taunt_preferences = {
	no_way_string = {
		ui_string = "No Way"
	}
	your_daddy_string = {
		ui_string = "Who's your daddy?"
	}
	props_string = {
		ui_string = "Props"
	}
	get_some_string = {
		ui_string = "Come Get Some"
	}
}
MAX_NET_PLAYERS = 8
default_network_preferences = {
	game_type = {
		ui_string = "Trick Attack"
		checksum = nettrickattack
	}
	num_players = {
		ui_string = "8 Players"
		checksum = num_8
		value = $MAX_NET_PLAYERS
	}
	private_slots = {
		ui_string = "0 Players"
		checksum = num_0
		value = 0
	}
	ranked = {
		ui_string = "Player Match"
		checksum = player
		value = 1
	}
	num_observers = {
		ui_string = "No Observers"
		checksum = num_1
		value = 1
	}
	player_collision = {
		ui_string = "Off"
		checksum = boolean_false
	}
	friendly_fire = {
		ui_string = "Off"
		checksum = boolean_false
	}
	team_mode = {
		ui_string = "None"
		checksum = teams_none
	}
	password = {
		ui_string = ""
	}
	level = {
		ui_string = "PHILLY SLUMS"
		checksum = Load_Z_Slums
	}
	goals = {
		ui_string = "Classic Goals"
		checksum = goals_classic
	}
	server_name = {
		ui_string = "Neversoft"
	}
	network_id = {
		ui_string = "ProSkater"
	}
	ip_address = {
		ui_string = "192.168.0.10"
	}
	gateway = {
		ui_string = "192.168.0.1"
	}
	subnet_mask = {
		ui_string = "255.255.0.0"
	}
	auto_dns = {
		ui_string = "Yes"
		checksum = boolean_true
	}
	dns_server = {
		ui_string = "192.168.0.1"
	}
	dns_server2 = {
		ui_string = "192.168.0.2"
	}
	device_type = {
		ui_string = "None"
		checksum = device_none
	}
	broadband_type = {
		ui_string = "Auto-Detect (DHCP)"
		checksum = ip_dhcp
	}
	time_limit = {
		ui_string = "2 minutes"
		checksum = time_120
		time = 120
	}
	target_score = {
		ui_string = "1,000,000 pts"
		checksum = score_1000000
		score = 1000000
	}
	target_tags = {
		ui_string = "50 tags"
		checksum = tags_50
		score = 50
	}
	host_name = {
		ui_string = ""
	}
	domain_name = {
		ui_string = ""
	}
	skill_level = {
		ui_string = "3: Hold My Own"
		checksum = num_3
	}
	use_default_master_servers = {
		ui_string = "Yes"
		checksum = boolean_true
	}
	master_server1 = {
		ui_string = "0.0.0.0"
	}
	master_server2 = {
		ui_string = "0.0.0.0"
	}
	dialup_number2 = {
		ui_string = ""
	}
	dialup_number3 = {
		ui_string = ""
	}
	signed_disclaimer = {
		ui_string = "No"
		checksum = boolean_false
	}
	profile_email = {
		ui_string = ""
	}
	profile_password = {
		ui_string = ""
	}
	profile_password_confirm = {
		ui_string = ""
	}
	profile_success = {
		ui_string = "No"
		checksum = boolean_false
	}
	profile_warning_shown = {
		ui_string = "No"
		checksum = boolean_false
	}
	profile_cdkey = {
		ui_string = "dnaletsawnacirema"
	}
	config_type = {
		ui_string = "None"
		checksum = config_sony
	}
	unique_id = {
		ui_string = "123456789"
	}
	auto_brake = {
		ui_string = "On"
		checksum = boolean_true
	}
	show_names = {
		ui_string = "On"
		checksum = boolean_true
	}
	score_display = {
		ui_string = "Show Players"
		checksum = score_players
	}
	gold_game_type = {
		ui_string = "Use Time Limit"
		checksum = timed_gold
	}
	ctf_game_type = {
		ui_string = "Use Time Limit"
		checksum = timed_ctf
	}
	score_mode = {
		ui_string = "Points"
		checksum = point_scoring
	}
	stop_at_zero = {
		ui_string = "No"
		checksum = boolean_false
	}
	score_reset = {
		ui_string = "No"
		checksum = boolean_false
	}
	face_dl_key = {
		ui_string = ""
	}
	fireball_difficulty = {
		ui_string = "3"
		checksum = num_3
		fireball_level = 3
	}
	rank_limit = {
		ui_string = "9"
		checksum = num_9
		num = 9
	}
	rank_test = {
		ui_string = "None"
		checksum = rank_test_none
	}
	team_graffiti_mode = {
		ui_string = "Combined"
		checksum = graffiti_team_scoring
	}
	walls_mode_type = {
		ui_string = "Last Man Standing"
		checksum = lastmanstanding
	}
	walls_mode_points = {
		ui_string = "3"
		checksum = num_3
		num = 3
	}
	horse_time_limit = {
		ui_string = "10 seconds"
		checksum = horse_time_10
		time = 10
	}
	net_horse_mode_type = {
		ui_string = "Classic"
		checksum = ClassicMode
	}
	horse_word = {
		ui_string = "Horse"
	}
	game_wager_type = {
		ui_string = "No Wagers"
		checksum = no_wagers
	}
	game_wager_amount = {
		ui_string = "100"
		checksum = num_100
		num = 100
	}
	allow_cap_pieces = {
		ui_string = "Yes"
		checksum = allow_pieces
	}
	game_type_optimatch = {
		ui_string = "Don't Care"
		checksum = dont_care
	}
	num_players_optimatch = {
		ui_string = "Don't Care"
		checksum = dont_care
	}
	level_optimatch = {
		ui_string = "Don't Care"
		checksum = dont_care
	}
	skill_level_optimatch = {
		ui_string = "Don't Care"
		checksum = dont_care
	}
	buddy_array = [
	]
}

script launch_network_options_menu 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_network_options_menu}
endscript

script back_from_net_options_menu 
	go_to_sub_menu = 0
	pausemusicandstreams
	if istrue $innetoptionsfromnetplay
		printf "********************* InNetOptionsFromNetPlay *******************"
		go_to_sub_menu = 1
	else
		if istrue $innetoptionsfromfacedownload
			printf "********************* InNetOptionsFromFaceDownload *******************"
			go_to_sub_menu = 1
		endif
	endif
	if (<go_to_sub_menu> = 1)
		getpreferencechecksum pref_type = network device_type
		switch <checksum>
			case device_none
			if istrue $innetoptionsfromnetplay
				create_ss_menu
			else
				face_back_from_net_setup
			endif
			default
			if objectexists id = current_menu_anchor
				destroyscreenelement id = current_menu_anchor
			endif
			if istrue $innetoptionsfromnetplay
				do_network_setup error_script = back_from_startup_error_dialog success_script = net_setup_from_net_play_successful need_setup_script = create_net_startup_need_setup_dialog
			else
				do_network_setup error_script = face_back_from_net_setup success_script = create_face_download_menu_from_net_setup need_setup_script = face_create_net_startup_need_setup_dialog
			endif
		endswitch
		change innetoptionsfromnetplay = 0
		change innetoptionsfromfacedownload = 0
		unpausemusicandstreams
	else
		unpausemusicandstreams
	endif
endscript

script net_options_menu_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_options_menu
endscript

script maybe_load_net_settings 
	skater :hide
	launch_load_network_settings
endscript

script launch_load_net_config 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = _creationoptionsloadnetconfig}
endscript

script back_from_hardware_setup_refused_dialog 
	dialog_box_exit
	create_manual_net_setup
endscript

script back_from_load_refused_dialog 
	dialog_box_exit
	create_network_options_menu
endscript

script launch_hardware_setup_refused_dialog 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_refused_dialog}
endscript

script create_hardware_setup_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_change_device
		buttons = [
			{
				text = "ok"
				pad_choose_script = back_from_hardware_setup_refused_dialog
			}
		]}
endscript

script create_net_load_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_load_settings
		buttons = [
			{
				text = "back"
				pad_choose_script = back_from_load_refused_dialog
			}
			{
				text = "restart"
				pad_choose_script = restart_ps2
			}
		]}
endscript

script launch_hardware_setup 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_menu}
endscript

script launch_connection_settings 
	if objectexists \{id = current_menu_anchor}
		runscriptonscreenelement \{id = current_menu_anchor
			menu_offscreen
			callback = create_connection_settings}
	else
		dialog_box_exit
		create_connection_settings
	endif
endscript

script back_from_startup_error_dialog 
	printf "**** in back_from_startup_error_dialog"
	netsessionfunc func = match_uninit
	netsessionfunc func = content_uninit
	netsessionfunc func = presence_uninit
	netsessionfunc func = stats_uninit
	change needstodownloadstats = 1
	unpausemusicandstreams
	dialog_box_exit
	if objectexists id = select_skater_anchor
		destroyscreenelement id = select_skater_anchor
		restore_start_key_binding
	endif
	skater :cancelrotatedisplay
	create_main_menu
endscript

script create_net_startup_error_dialog 
	create_dialog_box {title = net_error_msg
		text = <text>
		buttons = [{text = "ok" pad_choose_script = <error_script>}
		]
	}
endscript
