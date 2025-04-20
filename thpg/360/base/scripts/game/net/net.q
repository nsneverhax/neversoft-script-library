UseSessionAPI = 1
innetoptionsfromnetplay = 0
innetoptionsfromfacedownload = 0
SkipDNASAuthentication = 0
InFaceMapEditor = 0
NeedsToDownloadMOTD = 1
needstodownloadstats = 1
SignedDisclaimer = 0
signedin = 0
SigningIn = 0
WaitingForSignInToComplete = 0
CheckedForGameInvite = 0
MAXNUMBEROFPLAYERS = 8
newarea = ''
prevarea = ''
multiplayer_spawn_in = [
]
AutoLaunchHostNetLevel = 0
AutoLaunchClient = 0
net_entered_from_singleplayer = 0
xenon_invite_confirm_title = "GAME INVITE"
xenon_invite_confirm_dialog = "Accepting this invite will lose progress in any currently active goals. Do you want to continue?"
xenon_invite_confirm_yes = "YES"
xenon_invite_confirm_no = "NO"
xenon_session_confirm_title = "JOIN SESSION"
xenon_session_confirm_dialog = "Joining this session will lose progress in any currently active goals. Do you want to continue?"
xenon_session_confirm_yes = "YES"
xenon_session_confirm_no = "NO"
xenon_invite_confirm_2p_title = "GAME INVITE"
xenon_invite_confirm_2p_dialog = "You have been invited to play an online game. This title doesn't support two players joining an online game, so the invite has been rejected."
xenon_invite_confirm_2p_ok = "OK"
xenon_session_confirm_2p_title = "JOIN SESSION"
xenon_session_confirm_2p_dialog = "This title doesn't support two players joining an online game, so you cannot join this session."
xenon_session_confirm_2p_ok = "OK"
xenon_invite_confirm_inactive_title = "GAME INVITE"
xenon_invite_confirm_inactive_dialog = "You have been invited to play an online game. This title doesn't support inactive Xbox 360 Controllers joining an online game, so the invite has been rejected."
xenon_invite_confirm_inactive_ok = "OK"
xenon_session_confirm_inactive_title = "JOIN SESSION"
xenon_session_confirm_inactive_dialog = "This title doesn't support inactive Xbox 360 Controllers joining an online game, so you cannot join this session."
xenon_session_confirm_inactive_ok = "OK"

script auto_launch_viewer 
	usenetworkpreferences
	launchviewer
endscript

script setautolaunchhostnetlevel 
	change \{AutoLaunchHostNetLevel = 1}
endscript

script AutoLaunchNetLevel 
	printf \{"AutoLaunchNetLevel netLevel ="}
	printf <AutoLaunchHostNetLevel>
	return \{istrue
		$AutoLaunchHostNetLevel}
endscript

script setautolaunchclient 
	change \{AutoLaunchClient = 1}
endscript
XenonAcceptedInvite = 0
no_net_mode = 0
lan_mode = 1
internet_mode = 2
HOST_MODE_SERVE = 0
HOST_MODE_AUTO_SERVE = 1
HOST_MODE_FCFS = 2
join_mode_play = 0
JOIN_MODE_OBSERVE = 1
num_players_info = [
	{
		name = "2 Players"
		checksum = num_2
		num = 2
	}
	{
		name = "3 Players"
		checksum = num_3
		num = 3
	}
	{
		name = "4 Players"
		checksum = num_4
		num = 4
		broadband_only
	}
	{
		name = "5 Players"
		checksum = num_5
		num = 5
		broadband_only
	}
	{
		name = "6 Players"
		checksum = num_6
		num = 6
		broadband_only
	}
	{
		name = "7 Players"
		checksum = num_7
		num = 7
		broadband_only
	}
	{
		name = "8 Players"
		checksum = num_8
		num = 8
		broadband_only
	}
]
num_private_slots = [
	{
		name = "0 Players"
		checksum = num_0
		num = 0
	}
	{
		name = "1 Players"
		checksum = num_1
		num = 1
	}
	{
		name = "2 Players"
		checksum = num_2
		num = 2
	}
	{
		name = "3 Players"
		checksum = num_3
		num = 3
	}
	{
		name = "4 Players"
		checksum = num_4
		num = 4
	}
	{
		name = "5 Players"
		checksum = num_5
		num = 5
	}
	{
		name = "6 Players"
		checksum = num_6
		num = 6
	}
	{
		name = "7 Players"
		checksum = num_7
		num = 7
	}
	{
		name = "8 Players"
		checksum = num_8
		num = 8
	}
]
ranked_info = [
	{
		name = "Player Match"
		checksum = player
		num = 1
	}
	{
		name = "Ranked Match"
		checksum = ranked
		num = 0
	}
]
ps3_ranked_info = [
	{
		name = "No Wagers"
		checksum = player
		num = 1
	}
	{
		name = "Wagers"
		checksum = ranked
		num = 0
	}
]
wager_info = [
	{
		name = "Wagers"
		checksum = wagers
	}
	{
		name = "No Wagers"
		checksum = no_wagers
	}
]
wager_amount_info = [
	{
		name = "100"
		checksum = num_100
		num = 100
	}
	{
		name = "250"
		checksum = num_250
		num = 250
	}
	{
		name = "500"
		checksum = num_500
		num = 500
	}
	{
		name = "1000"
		checksum = num_1000
		num = 1000
	}
	{
		name = "2000"
		checksum = num_2000
		num = 2000
	}
	{
		name = "5000"
		checksum = num_5000
		num = 5000
	}
]
net_game_type_info = [
	{
		name = "TRICK ATTACK"
		description = "The player with the highest score at the end of the time limit wins."
		checksum = nettrickattack
		goal_script = StartGoal_TrickAttack
	}
	{
		name = "GRAFFITI"
		description = "The player who tags the most objects wins."
		checksum = netgraffiti
		goal_script = StartGoal_Graffiti
	}
	{
		name = "COMBO MAMBO"
		description = "The player who busts the biggest combo during the time limit, wins."
		checksum = netcombomambo
		goal_script = StartGoal_combomambo
	}
	{
		name = "WALLS"
		description = "Position the trailing wall infront of other skaters and make them bail. Your wall gets longer when you combo."
		checksum = netwalls
		goal_script = StartGoal_WallGame
	}
	{
		name = "SKATE THE LINE"
		description = "Lay out badass trick lines to attempt."
		checksum = net_line
		goal_script = startgoal_net_horse
	}
	{
		name = "NET NAIL THE TRICK"
		description = "Set up a spot to see who can Nail the Trick."
		checksum = net_nail
		goal_script = startgoal_net_horse
	}
	{
		name = "SCORE CHALLENGE"
		description = "First one to reach set score wins."
		checksum = netscorechallenge
		goal_script = StartGoal_ScoreChallenge
	}
	{
		name = "COMBO CHALLENGE"
		description = "First one to reach set combo score wins."
		checksum = netcombochallenge
		goal_script = StartGoal_ComboChallenge
	}
]
mp_game_type_info = [
	{
		name = "FREE SKATE"
		description = "Skate the zone freely."
		checksum = freeskate2p
		goal_script = StartFreeSkate
	}
	{
		name = "TRICK ATTACK"
		description = "The player with the highest score at the end of the time limit wins."
		checksum = trickattack
		goal_script = StartGoal_TrickAttack
	}
	{
		name = "GRAFFITI"
		description = "The player who tags the most objects wins."
		checksum = graffiti
		goal_script = StartGoal_Graffiti
	}
	{
		name = "SCORE CHALLENGE"
		description = "First one to reach set score wins."
		checksum = scorechallenge
		goal_script = StartGoal_ScoreChallenge
	}
	{
		name = "COMBO CHALLENGE"
		description = "First one to reach set combo score wins."
		checksum = combochallenge
		goal_script = StartGoal_ComboChallenge
	}
	{
		name = "COMBO MAMBO"
		description = "The player who busts the biggest combo during the time limit, wins!"
		checksum = combomambo
		goal_script = StartGoal_combomambo
	}
	{
		name = "HORSE"
		description = "Pull off combos until someone spells HORSE."
		checksum = horse
		goal_script = do_nothing
	}
]
num_observers_info = [
	{
		name = "NO OBSERVERS"
		checksum = num_0
	}
	{
		name = "1 OBSERVER"
		checksum = num_1
		broadband_only
	}
]
net_goal_info = [
	{
		name = "CLASSIC GOALS"
		checksum = goals_classic
	}
]
skill_level_info = [
	{
		name = "1: BABY STEPS"
		checksum = num_1
	}
	{
		name = "2: I CAN CRAWL!"
		checksum = num_2
	}
	{
		name = "3: HOLD MY OWN"
		checksum = num_3
	}
	{
		name = "4: LET'S DO THIS!"
		checksum = num_4
	}
	{
		name = "5: BRING IT ON!"
		checksum = num_5
	}
]
fireball_level_info = [
	{
		name = "1 (easy)"
		checksum = num_1
		fireball_level = 1
	}
	{
		name = "2"
		checksum = num_2
		fireball_level = 2
	}
	{
		name = "3"
		checksum = num_3
		fireball_level = 3
	}
	{
		name = "4"
		checksum = num_4
		fireball_level = 4
	}
	{
		name = "5 (hard)"
		checksum = num_5
		fireball_level = 5
	}
]
walls_mode_type_options = [
	{
		name = "POINTS"
		checksum = pointscoring
	}
	{
		name = "LAST MAN STANDING"
		checksum = lastmanstanding
	}
]
walls_mode_points_options = [
	{
		name = "1"
		checksum = num_1
		num = 1
	}
	{
		name = "3"
		checksum = num_3
		num = 3
	}
	{
		name = "5"
		checksum = num_5
		num = 5
	}
	{
		name = "10"
		checksum = num_10
		num = 10
	}
]
net_horse_mode_type_options = [
	{
		name = "Classic"
		checksum = ClassicMode
	}
	{
		name = "Nail the Trick"
		checksum = NTTMode
	}
]

script sign_out 
	SignOut
	pause_game_and_create_pause_menu
endscript

script go_to_xbox_dashboard 
endscript

script net_payphone_enter 
	if checkforsignin
		do_actual_pause
		ui_change_state \{state = UIstate_net_view_goals_from_gameplay}
	endif
endscript

script create_big_black_hiding_box 
	unlock_root_window
	if screenelementexists \{id = big_black_box}
		destroyscreenelement \{id = big_black_box}
	endif
	createscreenelement \{type = spriteelement
		parent = root_window
		id = big_black_box
		texture = black
		pos = (640.0, 390.0)
		rgba = [
			0
			0
			0
			255
		]
		scale = (500.0, 500.0)
		just = [
			center
			center
		]
		z_priority = 5001}
endscript

script net_reset_server_cheats 
	printf \{"--- net_reset_server_cheats"}
	unsetglobalflag \{flag = $flag_g_expert_mode_no_reverts}
	unsetglobalflag \{flag = $flag_g_expert_mode_no_walking}
	unsetglobalflag \{flag = $flag_g_expert_mode_no_manuals}
	unsetglobalflag \{flag = $no_g_display_balance}
endscript

script quit_network_game 
	printf "script quit_network_game"
	should_unpost = 0
	net_rounds_quit_game_cleanup
	net_wagers_quit_game_cleanup
	net_reset_server_cheats
	getcurrentlevel
	if (<level> = load_z_mainmenu)
		printf "!!Can't quit_network_game when in the frontend!!"
		netsessionfunc obj = session func = unpost_game
		if NOT gotparam back_from_removed
			return
		endif
	endif
	removeobserverbg nowait
	mc_waitasyncopsfinished
	autosave_wake_scripts
	do_autosave immediate suspend_ui
	if (gotparam singlemulti_level)
		load_level_handle_movie_loading_screen level = <singlemulti_level>
	else
		load_level_handle_movie_loading_screen level = load_z_mainmenu
	endif
	if ininternetmode
		if OnServer
			<should_unpost> = 1
		endif
		<should_unpost> = 1
		printf "unposting bitches!"
	endif
	change is_changing_levels = 1
	create_big_black_hiding_box
	console_destroy
	restore_start_key_binding
	if ininternetmode
		if OnServer
			if NOT isxenon
				report_stats final
			endif
		endif
		netsessionfunc obj = voice func = reset
	endif
	if objectexists id = skater
		if NOT isobserving
			skater :netenableplayerinput
		endif
	endif
	if NOT isobserving
		exitsurveyormode
	endif
	proximcleanup
	chosen_leave_server reason = <reason>
	dialog_box_exit anchor_id = quit_dialog_anchor
	dialog_box_exit
	printstruct <...>
	if (<should_unpost> = 1)
		netsessionfunc obj = session func = unpost_game
	endif
	setgametype career
	setcurrentgametype
	SetStatOverride
	setservermode on
	startserver
	setjoinmode $join_mode_play
	setnetworkmode $lan_mode
	joinserver
	begin
	if JoinServerComplete
		break
	else
		wait 1
	endif
	repeat
	if ininternetmode
		netsessionfunc obj = match func = set_quiet_mode params = {off}
	endif
	if NOT gotparam dont_reset_net_game_type
		setgametype netlobby
		setcurrentgametype
	endif
	unload_net_area_pak
	if NOT ($newarea = '')
		change newarea = ''
	endif
	if NOT ($prevarea = '')
		change prevarea = ''
	endif
	printstruct <...>
	if (gotparam singlemulti_level)
		change_gamemode_career
		if NOT netsessionfunc obj = session func = has_active_session
			xenon_singleplayer_session_init
		endif
		level_select_change_level level = <singlemulti_level> pedlife_allowed quit_to_single load_screen_already_up
	else
		if NOT gotparam back_from_removed
			level_select_change_level level = load_z_mainmenu no_levelUnload load_screen_already_up
		else
			level_select_change_level level = load_z_mainmenu no_levelUnload
		endif
	endif
	setnetworkmode
endscript

script join_level_cleanup 
	mainmenu_display_loading_screen
	pausegame
	if compositeobjectexists name = GameStateMachine
		printf "unpausing the game state machine..."
		GameStateMachine :unpause
	else
		printf "My GameStateMachine doesn't exist"
	endif
	leave_front_end
	deinit_goal_manager
	grid_control_deinit_grid_control_manager
	cleanup_before_changing_level <...>
	printf "Calling cleanup_before_changing_level_unload_all_paks"
	cleanup_before_changing_level_unload_all_paks
	if gotparam preserve_skaters
		if insplitscreengame
			if infrontend
				do_not_wait = 1
			endif
		endif
		if NOT gotparam do_not_wait
		endif
	endif
	cleanup_before_changing_level_unload_zones <...>
	cleanup_before_loading_level <...>
	netsessionfunc obj = voice func = enable
	unpausegame
	printf "done join_level_cleanup"
	if NOT OnServer
		printf "waiting for local player to get created"
		printstruct <...>
		begin
		getskaterid
		if gotparam objid
			printstruct <...>
			printf "Yes we now have a local player"
			break
		endif
		wait 1 frame
		repeat
		DoneJoinLevelCleanup
	endif
endscript

script spawned_chosen_host_game 
	printf "spawned_chosen_host_game"
	GetPreferenceString pref_type = network level
	get_level_load_time level = <level>
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
		wait 1 frame
	endif
	join_level_cleanup preserve_skaters
	pausegame
	if compositeobjectexists name = GameStateMachine
		printf "unpausing the game state machine..."
		GameStateMachine :unpause
	else
		printf "My GameStateMachine doesn't exist"
	endif
	netsessionfunc obj = match func = stop_server_list
	netsessionfunc obj = match func = free_server_list
	leaveserver
	setgametype net
	setcurrentgametype
	initskaterheaps
	InitNetMiscHeap
	setservermode
	startserver
	setjoinmode $join_mode_play
	joinserver
	printf "Joining server..."
	begin
	if JoinServerComplete
		printf "JoinServer is complete!"
		break
	else
		printf "Still waiting to JoinServer"
		wait 1
	endif
	repeat
	getpreferencechecksum pref_type = network level
	if checksumequals a = <checksum> b = whole_world
		randomIndex = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 )
		SetPreferencesFromUI prefs = network field = 'level' string = ($online_level_select_menu_level_info [<randomIndex>].text) checksum = ($online_level_select_menu_level_info [<randomIndex>].level)
	endif
	<level> = whole_world
	ChangeLevel level = use_preferences
	if compositeobjectexists name = main_menu_camera
		main_menu_camera :die
	endif
	restore_skater_camera
endscript

script chosen_host_game 
	printf \{"chosen_host_game"}
	change \{in_server_options = 0}
	if innetgame
		printf \{"We're already in a netgame!"}
		network_start_selected
	else
		if insplitscreengame
			ApplySplitScreenOptions
			chosen_start_game
		else
			change \{is_changing_levels = 1}
			spawnscriptlater \{spawned_chosen_host_game
				notsessionspecific = 1}
		endif
	endif
endscript

script chosen_client_game 
	printf \{"chose_client_game"}
	pausegame
	xbox_live_start_quickmatch
endscript

script spawn_client_join_game 
	printf \{"spawn_client_join_game"}
	xbox_live_start_quickmatch
endscript

script select_thug_online_play 
	printf \{"--- select_thug_online_play"}
	change_gamemode_net
	launch_xbox_live \{AcceptedGameInvite}
endscript

script prompt_for_net_config 
	change \{innetoptionsfromnetplay = 1}
	_creationoptionsloadnetconfig
endscript

script select_internet_play 
	pausemusicandstreams
	do_network_setup \{error_script = back_from_startup_error_dialog
		success_script = maybe_show_disclaimer
		need_setup_script = prompt_for_net_config}
endscript

script xbox_live_start_login 
	printf \{"--- xbox_live_start_login"}
	scriptassert
	if istrue \{$signedin}
		select_thug_online_play
	else
		if istrue \{$SigningIn}
			change \{WaitingForSignInToComplete = 1}
			create_dialog_box \{title = $net_status_msg
				text = "Connecting..."}
		else
			netsessionfunc \{func = auth_init}
			launch_user_selection <...>
		endif
	endif
endscript

script xenon_live_start 
	printf \{"--- xenon_live_start"}
	connected_to_internet
endscript

script launch_user_selection 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if netsessionfunc \{obj = auth
			func = retrieve_user_list}
		netsessionfunc \{obj = auth
			func = get_num_users}
		if (<num_users> > 0)
			display_xbox_user_list <...>
		else
			launch_no_accounts_dialog
		endif
	else
		back_from_user_selection
	endif
endscript

script net_setup_from_net_play_successful 
	dialog_box_exit
	if (network_connection_type = internet)
		select_internet_play
	else
		select_lan_play
	endif
endscript

script do_network_setup 
	printf \{"----"}
	printf \{"do"}
	printf \{"network"}
	printf \{"setup"}
	printf \{"----"}
	printstruct <...>
	setmemthreadsafe
	usenetworkpreferences
	spawnscriptlater test_network_setup params = <...>
endscript

script test_network_setup 
	if infrontend
		skater :hide
	endif
	pausemusicandstreams
	getpreferencechecksum pref_type = network device_type
	switch <checksum>
		case device_none
		<need_setup_script> text = net_status_need_to_setup <...>
		return
		case device_sony_modem
		case device_usb_modem
		GetPreferenceString pref_type = network dialup_number
		if (<ui_string> = "")
			<need_setup_script> text = net_status_need_to_setup_dialup <...>
			return
		endif
		default
	endswitch
	if NeedToTestNetSetup
		pausemusicandstreams
		create_testing_network_settings_dialog
		wait 1 seconds
		TestNetSetup <...>
		pausemusicandstreams
	else
		<success_script> <...>
	endif
endscript

script launch_network_host_options_sub_menu 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	<sub_menu_script> <...>
endscript

script back_from_user_selection 
	change \{SigningIn = 0}
	change \{WaitingForSignInToComplete = 0}
	killspawnedscript \{name = async_check_for_any_accounts}
	killspawnedscript \{name = async_check_for_changed_accounts}
	dialog_box_exit
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	back_from_internet_options \{sign_out}
endscript

script back_from_wrong_pin_dialog 
	dialog_box_exit
	ConnectToInternet
endscript

script async_check_for_any_accounts 
	begin
	if netsessionfunc \{obj = auth
			func = retrieve_user_list}
		netsessionfunc \{obj = auth
			func = get_num_users}
		if (<num_users> > 0)
			dialog_box_exit
			display_xbox_user_list
			break
		endif
	endif
	wait \{10
		frames}
	repeat
endscript

script async_check_for_changed_accounts 
	begin
	if netsessionfunc obj = auth func = retrieve_user_list
		netsessionfunc obj = auth func = get_num_users
		if (<num_users> = 0)
			if objectexists id = current_menu_anchor
				destroyscreenelement id = current_menu_anchor
			endif
			launch_no_accounts_dialog
			break
		else
			if NOT (<num_users> = <orig_num_users>)
				if objectexists id = current_menu_anchor
					destroyscreenelement id = current_menu_anchor
				endif
				display_xbox_user_list
				break
			endif
		endif
	endif
	wait 10 frames
	repeat
endscript

script launch_auto_server_notification 
	destroy_onscreen_keyboard
	create_error_box {title = "Auto-Server"
		text = "This server is in auto-server mode.  When at least two players are present, games will launch one-after-another."
		buttons = [{text = "OK" pad_choose_script = dialog_box_exit}
		]
		no_animate
		delay_input
	}
endscript

script launch_fcfs_notification 
	if (<checksum> = boolean_true)
		SetPreferencesFromUI prefs = network field = 'player_collision' string = "On" <...>
	else
		SetPreferencesFromUI prefs = network field = 'player_collision' string = "Off" <...>
	endif
	destroy_onscreen_keyboard
	force_close_rankings
	unpause_game_and_destroy_pause_menu
	create_error_box {title = "HOST NOTIFICATION"
		text = "This server is in First Come First Serve mode. You are the designated host. You may change options and start games."
		buttons = [{text = "OK" pad_choose_script = exit_async_dialog}
		]
		no_animate
		delay_input
	}
endscript

script fcfs_confirm 
	destroyscreenelement id = current_menu_anchor
	create_dialog_box {title = "FIRST COME FIRST SERVE"
		text = "This option will make you a permanent observer and will allow the first joining player to choose game modes and change levels. Are you sure?"
		buttons = [{text = "CONTINUE" pad_choose_script = fcfs_selected}
			{text = "CANCEL" pad_choose_script = create_sit_out_menu}
		]
		no_animate
	}
endscript

script auto_serve_confirm 
	destroyscreenelement id = current_menu_anchor
	create_dialog_box {title = "AUTO SERVE"
		text = "This option will make you a permanent observer. When at least two players have joined, a new game of the current game mode will start and new games will follow thereafter. Are you sure?"
		buttons = [{text = "CONTINUE" pad_choose_script = auto_serve_selected}
			{text = "CANCEL" pad_choose_script = create_sit_out_menu}
		]
		no_animate
	}
endscript

script create_kick_ban_menu 
	destroyscreenelement \{id = current_menu_anchor}
	create_dialog_box {title = <name>
		text = "REMOVE PLAYER?"
		buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
			{text = "REMOVE" pad_choose_script = kick_player_confirm pad_choose_params = <...>}
			{text = "BAN" pad_choose_script = ban_player_confirm pad_choose_params = <...>}
		]
		no_animate
	}
endscript

script create_player_options_dialog 
	if gotparam allow_remove_homie
		destroyscreenelement id = current_menu_anchor
		if OnServer
			create_dialog_box {title = "PLAYER OPTIONS"
				text = <name>
				pad_back_script = cancel_remove_player
				buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
					{text = "REMOVE" pad_choose_script = kick_player_confirm pad_choose_params = <...>}
					{text = "BAN" pad_choose_script = ban_player_confirm pad_choose_params = <...>}
					{text = "remove homie" pad_choose_script = remove_buddy pad_choose_params = <...>}
				]
				no_animate
			}
		else
			create_dialog_box {title = "PLAYER OPTIONS"
				text = <name>
				pad_back_script = cancel_remove_player
				buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
					{text = "remove homie" pad_choose_script = remove_buddy pad_choose_params = <...>}
				]
				no_animate
			}
		endif
	else
		if gotparam allow_add_homie
			destroyscreenelement id = current_menu_anchor
			if OnServer
				create_dialog_box {title = "PLAYER OPTIONS"
					text = <name>
					pad_back_script = cancel_remove_player
					buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
						{text = "REMOVE" pad_choose_script = kick_player_confirm pad_choose_params = <...>}
						{text = "BAN" pad_choose_script = ban_player_confirm pad_choose_params = <...>}
						{text = "add homie" pad_choose_script = add_buddy pad_choose_params = <...>}
					]
					no_animate
				}
			else
				create_dialog_box {title = "PLAYER OPTIONS"
					text = <name>
					pad_back_script = cancel_remove_player
					buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
						{text = "add homie" pad_choose_script = add_buddy pad_choose_params = <...>}
					]
					no_animate
				}
			endif
		else
			if OnServer
				destroyscreenelement id = current_menu_anchor
				create_dialog_box {title = "PLAYER OPTIONS"
					text = <name>
					pad_back_script = cancel_remove_player
					buttons = [{text = "CANCEL" pad_choose_script = cancel_remove_player}
						{text = "REMOVE" pad_choose_script = kick_player_confirm pad_choose_params = <...>}
						{text = "BAN" pad_choose_script = ban_player_confirm pad_choose_params = <...>}
					]
					no_animate
				}
			endif
		endif
	endif
endscript

script launch_quit_game_dialog 
	dialog_box_exit
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_quit_game_dialog
endscript

script create_quit_game_dialog 
	printf "--- create_quit_game_dialog ---"
	if OnServer
		create_error_box {title = "QUIT GAME?"
			text = "Leaving the game now will end this session. Are you sure you want to leave?"
			anchor_id = quit_dialog_anchor
			buttons = [{text = "YES" pad_choose_script = quit_network_game}
				{text = "NO" pad_choose_script = quit_game_dialog_box_exit id = no_button}
			]
			no_animate
		}
	else
		create_error_box {title = "QUIT GAME?"
			text = "Are you sure you want to leave this session?"
			anchor_id = quit_dialog_anchor
			buttons = [{text = "YES" pad_choose_script = quit_network_game}
				{text = "NO" pad_choose_script = quit_game_dialog_box_exit id = no_button}
			]
			no_animate
		}
	endif
endscript

script quit_game_dialog_box_exit 
	generic_menu_pad_back_sound
	unpause_game_and_destroy_pause_menu
	dialog_box_exit \{anchor_id = quit_dialog_anchor}
endscript

script launch_network_select_games_menu 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_network_select_games_menu \{play_cam}
endscript

script launch_remove_players_menu 
	hide_current_goal
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_remove_players_menu
endscript

script launch_xbox_online_menu 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_xbox_online_menu
endscript

script check_availability 
	printf "--- check_availability"
	dialog_box_exit
	create_dialog_box {
		title = $net_status_msg
		text = $net_status_checking_motd
		no_animate
	}
	wait 10 frames
	netsessionfunc obj = match func = start_availability_check
	begin
	netsessionfunc obj = match func = availability_check_think
	if netsessionfunc obj = match func = availability_check_complete
		printf "*** check complete"
		break
	endif
	wait 20 frames
	repeat
	if netsessionfunc obj = match func = is_service_available
		printf "*** service is available!!!"
		track_usage
	else
		if netsessionfunc obj = match func = is_temporarily_unavailable
			netsessionfunc func = match_uninit
			service_not_available
		else
			netsessionfunc func = match_uninit
			service_never_available
		endif
	endif
endscript
bps3singlesignoncheckcomplete = 0

script xenon_singleplayer_session_init 
	if checkforsignin
		netsessionfunc \{func = match_uninit}
		netsessionfunc \{func = match_init}
		netsessionfunc \{func = stats_uninit}
		netsessionfunc \{func = stats_init}
		if isxenon
			netsessionfunc \{func = start_singleplayer_session
				obj = session}
			massiveinit \{sku = 'ATVI_Tony_Hawk_9_x360_na'
				startzone = 'GlobalZone'}
		endif
	endif
endscript

script do_ps3_online_signin 
	if NOT gotparam \{from_callback}
		netsessionfunc \{func = onlinesignin
			params = {
				callback = xenon_singleplayer_session_init
			}}
		ps3_signin_wait_for_system_ui
	else
		printf \{"PS3: unable to signin in to the network platform"}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	if isxenon
		netsessionfunc \{func = stop_singleplayer_session
			obj = session}
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	netsessionfunc \{func = stats_uninit}
	netsessionfunc \{func = match_uninit}
endscript

script begin_singleplayer_game 
	if netsessionfunc \{obj = session
			func = has_active_session}
		netsessionfunc \{obj = session
			func = begin_singleplayer_game}
	endif
endscript

script setup_sessionfuncs 
	printf "script: setup_sessionfuncs"
	printf "Initializing match"
	netsessionfunc func = match_init
	netsessionfunc func = presence_init
	netsessionfunc func = stats_init
	netsessionfunc func = voice_uninit
	netsessionfunc func = voice_init
	printstruct <...>
	if netsessionfunc obj = match func = get_gamertag
		SetPreferencesFromUI prefs = network field = 'network_id' string = <name>
		SetPreferencesFromUI prefs = network field = 'server_name' string = <name>
	endif
	if isxenon
		massiveinit sku = 'ATVI_Tony_Hawk_9_x360_na' startzone = 'GlobalZone'
	endif
endscript

script cleanup_sessionfuncs 
	printf \{"--- cleanup_sessionfuncs"}
	netsessionfunc \{func = match_uninit}
	netsessionfunc \{func = presence_uninit}
	netsessionfunc \{func = stats_uninit}
	netsessionfunc \{func = voice_uninit}
	netsessionfunc \{func = content_uninit}
	netsessionfunc \{func = auth_uninit}
	netsessionfunc \{func = clear_invited_session}
endscript

script connected_to_internet 
	printf "--- connected_to_internet"
	pausemusicandstreams
	cleanup_sessionfuncs
	setup_sessionfuncs
	netsessionfunc obj = presence func = set_state params = {online}
	netsessionfunc obj = presence func = get_mute_list
	printf "checking availability"
	if netsessionfunc obj = match func = is_service_available
		printf "*** service is available!!!"
	else
		printf "-----------------------------------------------------------"
		printf " Should NEVER GET HERE!!!"
		printf "-----------------------------------------------------------"
	endif
endscript

script invite_accepted 
	do_join_invite_stuff <...> accepted_invite
endscript

script cross_game_invite_accepted 
endscript

script check_for_signin \{continue_script = xbox360live_sign_in_go
		cancel_script = ui_change_state
		cancel_params = {
			state = uistate_mainmenu
		}
		signed_in_script = xbox360live_sign_in}
	printf \{"--- check_for_signin"}
	if NOT checkforsignin
		if isxenon
			xbox360live_sign_in_go
		else
			xbox360live_sign_in
		endif
	else
		<signed_in_script>
	endif
endscript

script displaynetplatformwarning \{continue_script = xbox360live_sign_in}
	create_dialog_box {title = "Online"
		text = "We will attempt to sign you in to the Network Platform."
		buttons = [{text = "CONTINUE" pad_choose_script = <continue_script>}]
		no_animate
		preserve_case
	}
endscript
ui_x360_sign_in_checked = 0

script xbox360live_sign_in_go 
	printf \{"xbox360live_sign_in_go"}
	change \{ui_x360_sign_in_checked = 1}
	xbox360live_sign_in
endscript

script xbox360live_sign_in 
	printf \{"--- xbox360live_sign_in"}
	pause_menu_fmv_kill
	if gotparam \{callback}
		netsessionfunc func = onlinesignin params = {callback = <callback>}
	else
		netsessionfunc \{func = onlinesignin}
	endif
	ps3_signin_wait_for_system_ui
endscript

script set_ready_for_input 
	printf \{"set_ready_for_input"}
	change \{net_layer_ready_for_input = 1}
endscript

script set_demonware_failed 
	printf \{"set_demonware_failed"}
	change \{net_layer_ready_for_input = 1}
	level_select_change_level_quit \{level = $load_z_mainmenu}
endscript

script set_disable_demonware_input 
	printf \{"set_disable_demonware_input"}
	change \{net_layer_ready_for_input = 0}
endscript

script ps3_signin_wait_for_system_ui 
	if isps3
		wait \{16
			gameframes}
		if ($paused_for_hardware = 1)
			horse_wait_for_hardware_pause
		endif
		wait \{8
			gameframes}
	endif
endscript

script do_join_invite_stuff 
	printf "--- do_join_invite_stuff"
	getcurrentlevel
	if (<level> = load_z_mainmenu)
		main_menu_exit_to_online <...>
	else
		if gotparam accepted_invite
			printf "accepted invite"
			ve_panic_unload_ve no_hard_load_zone
			if (innetgame)
				quit_network_game
			else
				if (netsessionfunc obj = match func = still_in_netgame)
					<still_in_netgame> = 1
				else
					<still_in_netgame> = 0
				endif
				if NOT istrue <still_in_netgame>
					deinit_goal_manager
				endif
				change_gamemode_net
				if istrue <still_in_netgame>
					quit_network_game
				else
					if objectexists id = current_menu_anchor
						destroyscreenelement id = current_menu_anchor
					endif
					change XenonAcceptedInvite = 1
					level_select_change_level_quit level = load_z_mainmenu
				endif
			endif
		else
			printf "didn't get an invite"
			ve_panic_unload_ve
			ui_change_state state = UIstate_net_view_goals
		endif
	endif
endscript

script net_failed_signin 
	if infrontend
		launch_main_menu
	else
		ui_change_state \{state = uistate_pausemenu}
	endif
endscript

script dont_join_invite 
	netsessionfunc \{func = clearinvite}
	if NOT infrontend
		unpause_game_and_destroy_pause_menu
	endif
endscript

script availability_check_wait 
	printf \{"IN availability_check_wait"}
	dialog_box_exit
	create_dialog_box \{title = $net_status_msg
		text = $net_status_checking_motd
		no_animate}
endscript

script service_never_available 
	dialog_box_exit
	create_dialog_box \{title = $net_status_msg
		text = $net_status_never_available
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_startup_error_dialog
			}
		]}
endscript

script service_not_available 
	dialog_box_exit
	create_dialog_box \{title = $net_status_msg
		text = $net_status_not_available
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_startup_error_dialog
			}
		]}
endscript

script failed_internet_connection 
	printf \{"script failed_internet_connection"}
	netsessionfunc \{func = content_uninit}
	netsessionfunc \{func = voice_uninit}
endscript

script chose_internet 
	printf \{"**** Chose Internet*****"}
	setnetworkmode \{$internet_mode}
	if ConnectToInternet \{success = authenticate_client
			failure = failed_internet_connection}
		printf \{"connected to internet"}
	else
		if objectexists \{id = current_menu_anchor}
			destroyscreenelement \{id = current_menu_anchor}
		endif
	endif
endscript

script confirm_observe 
	generic_menu_pad_back_sound
	unpause_game_and_destroy_pause_menu
	dialog_box_exit
	EnterObserverMode
endscript

script chose_observe 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	create_dialog_box {title = "OBSERVER MODE"
		text = "Are you sure you would like to observe this game? You will not be able to jump back in."
		buttons = [{text = "YES" pad_choose_script = confirm_observe}
			{text = "NO" pad_choose_script = back_from_dialog}
		]
		no_animate
	}
endscript

script launch_network_select_lan_games_menu 
	setnetworkmode \{lan_mode}
	launch_network_select_games_menu
endscript

script launch_network_host_options_menu 
	dialog_box_exit
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_network_host_options_menu
endscript
in_server_options = 0

script back_from_internet_host_options 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
		wait \{1
			frame}
	endif
	change \{in_server_options = 0}
	if innetgame
		pause_game_and_create_pause_menu
	else
		launch_network_select_games_menu
	endif
endscript
in_net_lobby = 0

script back_from_auth_error 
	printf \{"script back_from_auth_error"}
	netsessionfunc \{func = match_uninit}
	dialog_box_exit
endscript

script display_auth_error 
	pausemusicandstreams
	dialog_box_exit
	formattext textname = message "%h (%s)\\n%e\\n\\n%f" h = <header> s = <sub_code> e = <desc> f = <footer>
	create_dialog_box {title = net_error_msg
		text = <message>
		text_font = text_a1
		buttons = [{text = "OK" pad_choose_script = back_from_auth_error}
		]
	}
endscript
current_lobby_focus = 0

script host_chosen 
	console_hide
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	launch_network_host_options_menu
endscript

script fcfs_selected 
	dialog_box_exit
	SetHostMode \{HOST_MODE_FCFS}
	unpause_game_and_destroy_pause_menu
endscript

script auto_serve_selected 
	dialog_box_exit
	getpreferencechecksum pref_type = network game_type
	switch <checksum>
		case netgoalattack
		if NOT GoalManager_GoalsAreSelected
			unpause_game_and_destroy_pause_menu
			create_dialog_box {title = "NO GOALS SELECTED"
				text = "You must select goals before starting the Goal Attack auto-server."
				buttons = [{text = "OK" pad_choose_script = back_from_dialog}
				]
			}
			return
		endif
	endswitch
	SetHostMode HOST_MODE_AUTO_SERVE
	unpause_game_and_destroy_pause_menu
endscript

script create_sit_out_menu 
	dialog_box_exit
	make_new_themed_sub_menu title = "SIT OUT"
	setscreenelementprops {id = sub_menu event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = pause_game_and_create_pause_menu}}
		]
	}
	create_helper_text $generic_helper_text
	theme_menu_add_item text = "First Come, First Serve" id = menu_network_fcfs_select pad_choose_script = fcfs_confirm highlight_bar_scale = (1.15, 1.3) highlight_bar_pos = (97.0, -7.0) centered = 1
	theme_menu_add_item text = "Auto-Serve" id = menu_network_auto_serve_select pad_choose_script = auto_serve_confirm highlight_bar_scale = (1.15, 1.3) highlight_bar_pos = (97.0, -7.0) centered = 1 last_menu_item = 1
	finish_themed_sub_menu
endscript

script CreateCheckExternalDeviceDialog \{choose_script = back_from_startup_error_dialog}
	dialog_box_exit
	create_dialog_box {title = $net_status_msg
		text = $net_error_not_connected
		buttons = [{text = "OK" pad_choose_script = <choose_script>}
		]
	}
endscript

script StatsLoginFailedDialog 
	dialog_box_exit
	create_dialog_box \{title = net_error_msg
		text = net_status_stats_login_failed
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_profile_error
			}
		]}
endscript

script StatsRetrievalFailedDialog 
	dialog_box_exit
	create_dialog_box \{title = net_error_msg
		text = net_status_stats_retrieval_failed
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_profile_error
			}
		]}
endscript

script back_from_failed_buddy_login 
	cleanup_sessionfuncs
	dialog_box_exit
	setnetworkmode
endscript

script CreateBuddyLoginFailedDialog 
	dialog_box_exit
	create_dialog_box \{title = net_error_msg
		text = net_status_buddy_login_failed
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_failed_buddy_login
			}
		]}
endscript

script back_from_removed_dialog 
	dialog_box_exit
	mc_waitasyncopsfinished
	begin
	if ($ingame_save_active = 0)
		break
	endif
	autosave_wake_scripts
	wait 1 gameframe
	repeat 30
	if ($ingame_save_active = 1)
		mc_waitasyncopsfinished
		wait 4 gameframes
		game_progress_autosave_inactive
	endif
	printf "!!!!!!!!!!!back_from_removed_dialog!!!!!!!!!!"
	printstruct <...>
	if gotparam in_front_end
		cancel_join_server
	else
		quit_network_game back_from_removed
	endif
endscript

script createserverremovedyoudialog 
	hideloadingscreen
	gman_deactivateallgoals
	gman_uninitializeallgoals
	gman_setcanstartgoal 0
	kill_net_panel_messages
	force_close_rankings dont_retry
	destroy_onscreen_keyboard
	dialog_box_exit
	unpause_game_and_destroy_pause_menu
	if NOT isobserving
		skater :vibrate off
	endif
	if screenelementexists id = quit_dialog_anchor
		destroyscreenelement id = quit_dialog_anchor
	endif
	create_error_box {title = $net_notice_msg
		text = $net_message_server_removed_you
		buttons = [{text = "OK" pad_choose_script = back_from_removed_dialog pad_choose_params = <...>}
		]
		delay_input
	}
endscript

script createservermovedondialog 
	hideloadingscreen
	force_close_rankings dont_retry
	destroy_onscreen_keyboard
	dialog_box_exit
	unpause_game_and_destroy_pause_menu
	if NOT isobserving
		skater :vibrate off
	endif
	createscreenelement {
		type = spriteelement
		id = black_bg
		texture = white2
		pos = (0.0, 0.0)
		parent = root_window
		dims = (3000.0, 3000.0)
		rgba = [0 0 0 255]
	}
	create_error_box {title = $net_notice_msg
		text = $net_message_server_moved_on
		buttons = [{text = "OK" pad_choose_script = back_from_removed_dialog pad_choose_params = <...>}
		]
		delay_input
	}
endscript

script destroy_server_menu_children 
	if objectexists \{id = server_list_menu}
		setscreenelementlock \{id = server_list_menu
			off}
		destroyscreenelement \{id = server_list_menu
			recurse
			preserve_parent}
		if gotparam \{refocus}
			refocus_actions_menu
		endif
	endif
endscript

script destroy_server_desc_children 
	if objectexists \{id = server_desc_menu}
		setscreenelementlock \{id = server_desc_menu
			off}
		destroyscreenelement \{id = server_desc_menu
			recurse
			preserve_parent}
	endif
	if objectexists \{id = server_player_menu}
		destroyscreenelement \{id = server_player_menu
			recurse
			preserve_parent}
	endif
	refocus_gamelist_menu
endscript

script add_no_servers_found_message 
	if objectexists \{id = server_list_menu}
		setscreenelementlock \{id = server_list_menu
			off}
		add_cas_menu_item \{text = "NO SERVERS FOUND"
			parent = server_list_menu
			id = menu_network_no_servers}
		if gotparam \{refocus}
			refocus_actions_menu
		endif
	endif
endscript

script prepare_server_menu_for_new_children 
	if objectexists \{id = server_list_menu}
		setscreenelementlock \{id = server_list_menu
			off}
	endif
endscript

script choose_selected_server 
	printf \{"---- choose_selected_server ----"}
	console_hide
	netsessionfunc obj = match func = choose_server params = <...>
	destroyscreenelement \{id = current_menu_anchor}
endscript

script choose_selected_player 
	CreatePlayerOptions <...>
endscript

script choose_selected_account 
	ChooseAccount <...>
endscript

script cancel_remove_player 
	CancelRemovePlayer
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script kick_player_confirm 
	create_dialog_box {title = <name>
		text = "KICK PLAYER?"
		buttons = [{text = "YES" pad_choose_script = kick_player}
			{text = "NO" pad_choose_script = cancel_remove_player}
		]
	}
endscript

script kick_player 
	KickPlayer
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script back_from_dialog 
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script ban_player_confirm 
	create_dialog_box {title = <name>
		text = "BAN PLAYER?"
		buttons = [{text = "YES" pad_choose_script = ban_player}
			{text = "NO" pad_choose_script = cancel_remove_player}
		]
	}
endscript

script ban_player 
	BanPlayer
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script launch_pin_entry_menu 
	destroyscreenelement \{id = current_menu_anchor}
	create_pin_entry_menu
endscript

script launch_buddy_list 
	destroyscreenelement \{id = current_menu_anchor}
	create_buddy_list_menu
endscript

script async_update_homie_list 
	netsessionfunc \{obj = presence
		func = retrieve_friends_list}
	begin
	netsessionfunc \{obj = presence
		func = pump_friends_list}
	wait \{1
		frame}
	repeat
endscript

script launch_homie_list parent = root_window
	pulse_blur
	dialog_box_exit
	if objectexists id = console_message_vmenu
		doscreenelementmorph id = console_message_vmenu time = 0 scale = 0
	endif
	if innetgame
		goalmanager_hidepoints
	endif
	if (<parent> = root_window)
		if objectexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
	endif
	setscreenelementlock id = <parent> off
	on_rgba = [128 123 20 255]
	off_rgba = [128 128 128 240]
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = homie_bg_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
	}
	assignalias id = homie_bg_anchor alias = current_menu_anchor
	create_helper_text $generic_helper_text
	build_theme_sub_title title = "HOMIE LIST"
	if infrontend
		build_top_and_bottom_blocks bot_z = 15
	endif
	createscreenelement {
		type = containerelement
		parent = homie_bg_anchor
		id = homie_menu_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	assignalias id = homie_menu_anchor alias = current_menu_anchor
	theme_background width = 7 pos = (320.0, 63.0) num_parts = 10 static = static dark_menu = dark_menu
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = white2
		scale = (71.3, 4.0)
		pos = (35.0, 63.0)
		just = [left top]
		rgba = [0 0 0 128]
		alpha = 0.8
		z_priority = 2
	}
	if infrontend
		createscreenelement {
			type = spriteelement
			parent = homie_bg_anchor
			texture = homie
			scale = (1.8, 1.3)
			pos = (380.0, 67.0)
			just = [left bottom]
			alpha = 0.5
			z_priority = 5
		}
		createscreenelement {
			type = spriteelement
			parent = homie_bg_anchor
			id = Globe
			texture = Globe
			scale = 1.5
			pos = (760.0, 240.0)
			just = [center center]
			alpha = 0.8
			z_priority = -1
		}
	endif
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		text = "Name"
		scale = 1
		font = text_a1
		rgba = <on_rgba>
		pos = (90.0, 83.0)
		just = [left center]
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = up_arrow
		texture = up_arrow
		scale = 1
		pos = (260.0, 83.0)
		just = [center center]
		alpha = 0.5
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = down_arrow
		texture = down_arrow
		scale = 1
		pos = (260.0, 345.0)
		just = [center center]
		alpha = 0.5
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = white2
		scale = (0.8, 32.3)
		pos = (275.0, 95.0)
		just = [left top]
		rgba = [0 0 0 128]
		alpha = 0.8
		z_priority = 2
	}
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		text = "Status"
		scale = 1
		font = text_a1
		rgba = <on_rgba>
		pos = (285.0, 83.0)
		just = [left center]
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = white2
		scale = (0.8, 32.3)
		pos = (380.0, 95.0)
		just = [left top]
		rgba = [0 0 0 128]
		alpha = 0.8
		z_priority = 2
	}
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		text = "Location"
		scale = 1
		font = text_a1
		rgba = <on_rgba>
		pos = (390.0, 83.0)
		just = [left center]
	}
	if innetgame
		pad_back_script = back_to_pause_menu_from_buddy_list
	else
		pad_back_script = back_to_server_list_from_buddy_list
	endif
	createscreenelement {
		type = vscrollingmenu
		parent = current_menu_anchor
		id = homie_scrolling_menu
		just = [left top]
		dims = (600.0, 240.0)
		pos = (100.0, 103.0)
	}
	createscreenelement {
		type = vmenu
		parent = homie_scrolling_menu
		id = homie_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <pad_back_script>}}
		]
		dont_allow_wrap
	}
	assignalias id = homie_bg_anchor alias = current_menu_anchor
	if screenelementexists id = Globe
		runscriptonscreenelement id = Globe rotate_internet_options_globe
	endif
	if NOT gotparam dont_animate_in
		runscriptonscreenelement id = homie_menu_anchor online_stats_animate_in params = {id = homie_menu_anchor}
		launchevent type = focus target = homie_vmenu
	endif
endscript

script homie_list_add_item name = "" status = "" location = ""
	printf "homie_list_add_item"
	off_rgba = [128 128 128 240]
	bar_rgba = [25 25 25 255]
	if screenelementexists id = homie_vmenu
		printf "homie_list_add_itemhomie_list_add_item"
		setscreenelementlock id = homie_vmenu off
		createscreenelement {
			type = containerelement
			parent = homie_vmenu
			id = <id>
			dims = (500.0, 15.0)
			pos = (0.0, 0.0)
			event_handlers = [
				{focus online_stats_generic_focus}
				{unfocus online_stats_generic_unfocus}
				{pad_choose present_buddy_options params = {<pad_choose_params>}}
				{pad_start present_buddy_options params = {<pad_choose_params>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
		anchor_id = <id>
		createscreenelement {
			type = spriteelement
			parent = <anchor_id>
			texture = de_highlight_bar
			scale = (4.4500003, 0.45000002)
			pos = (-65.0, 0.0)
			just = [left center]
			rgba = <bar_rgba>
			alpha = 0
			z_priority = 2
		}
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			text = <name>
			font = text_a1
			scale = 0.8
			pos = (-10.0, 0.0)
			just = [left center]
			rgba = <off_rgba>
		}
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			text = <status>
			font = text_a1
			scale = 0.8
			pos = (185.0, 0.0)
			just = [left center]
			rgba = <off_rgba>
		}
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			text = <location>
			font = text_a1
			scale = 0.8
			pos = (290.0, 0.0)
			just = [left center]
			rgba = <off_rgba>
		}
	endif
endscript

script back_to_pause_menu_from_buddy_list 
	netsessionfunc \{obj = presence
		func = stop_friends_list}
	killspawnedscript \{name = async_update_homie_list}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	goalmanager_showpoints
	pause_game_and_create_pause_menu
endscript

script show_nat_start_dialog 
	pausemusicandstreams
	create_dialog_box \{title = $net_status_msg
		text = $net_status_locating
		buttons = [
			{
				text = "CANCEL"
				pad_choose_script = cancel_join_server
				pad_choose_params = {
					cancel_nn
				}
			}
		]}
endscript

script show_nat_timeout 
	dialog_box_exit
	create_dialog_box \{title = net_error_msg
		text = net_status_nat_neg_failed
		buttons = [
			{
				text = "OK"
				pad_choose_script = cancel_join_server
				pad_choose_params = {
					cancel_nn
				}
			}
		]}
endscript

script present_buddy_options back_script = launch_homie_list remove_script = lobby_remove_buddy
	if gotparam in_lobby
		if objectexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
		pad_back_params = {from_lobby}
	else
		destroyscreenelement id = current_menu_anchor
	endif
	netsessionfunc obj = presence func = stop_friends_list
	killspawnedscript name = async_update_homie_list
	back_script = launch_homie_list
	nick = <name>
	if gotparam allow_join
		if gotparam allow_remove
			formattext textname = msg_text "%s : %t" s = <status> t = <location>
			create_dialog_box {title = <nick>
				text = <msg_text>
				buttons = [{text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
					{text = "send message" pad_choose_script = message_buddy pad_choose_params = <...>}
					{text = "join" pad_choose_script = join_buddy pad_choose_params = <...>}
					{text = "observe" pad_choose_script = observe_buddy pad_choose_params = <...>}
					{text = "remove" pad_choose_script = <remove_script> pad_choose_params = <...>}
				]
			}
		else
			formattext textname = msg_text "%s : %t" s = <status> t = <location>
			create_dialog_box {title = <nick>
				text = <msg_text>
				buttons = [{text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
					{text = "send message" pad_choose_script = message_buddy pad_choose_params = <...>}
					{text = "join" pad_choose_script = join_buddy pad_choose_params = <...>}
					{text = "observe" pad_choose_script = observe_buddy pad_choose_params = <...>}
				]
			}
		endif
	else
		if gotparam allow_remove
			formattext textname = msg_text "%s : %t" s = <status> t = <location>
			create_dialog_box {title = <nick>
				text = <msg_text>
				buttons = [{text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
					{text = "send message" pad_choose_script = message_buddy pad_choose_params = <...>}
					{text = "remove" pad_choose_script = <remove_script> pad_choose_params = <...>}
				]
			}
		else
			formattext textname = msg_text "%s : %t" s = <status> t = <location>
			create_dialog_box {title = <nick>
				text = <msg_text>
				buttons = [{text = "send message" pad_choose_script = message_buddy pad_choose_params = <...>}
					{text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params>}
				]
			}
		endif
	endif
endscript

script join_buddy 
	netsessionfunc obj = presence func = join_friend params = <...>
endscript

script observe_buddy 
	netsessionfunc obj = presence func = join_friend params = {<...> observe}
endscript

script shell_remove_buddy 
	netsessionfunc obj = presence func = remove_friend params = <...>
	back_from_shell_buddy_options
endscript

script back_from_shell_buddy_options 
	dialog_box_exit
	launch_homie_list
endscript

script net_chosen_join_server 
	printf \{"******* In net_chosen_join_server *******"}
	printstruct <...>
	leaveserver
	setservermode \{off}
	netsessionfunc \{obj = match
		func = stop_lobby_list}
	joinserver <...>
	change_gamemode_net
	kill_start_key_binding
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript

script create_lobby_list_menu 
	rgba = [128 123 20 255]
	build_top_and_bottom_blocks
	createscreenelement {
		type = containerelement
		parent = root_window
		id = lobby_list_anchor
		pos = (-5.0, 800.0)
	}
	make_new_menu {menu_id = lobby_list_menu
		parent = lobby_list_anchor
		type = vscrollingmenu
		dims = (200.0, 205.0)
		pos = (80.0, 140.0)
		vmenu_id = lobby_list_vmenu
		menu_title = ""
		dont_allow_wrap = dont_allow_wrap
	}
	createscreenelement {
		type = textelement
		parent = lobby_list_anchor
		font = text_a1
		text = "REGIONS"
		scale = 1.5
		pos = (92.0, 86.0)
		just = [left top]
		rgba = [128 128 128 98]
		not_focusable
	}
	createscreenelement {
		type = spriteelement
		parent = lobby_list_anchor
		texture = white2
		texture = white2
		scale = (34.5, 5.0)
		pos = (34.0, 82.0)
		just = [left top]
		rgba = [0 0 0 128]
		not_focusable
	}
	createscreenelement {
		type = spriteelement
		parent = lobby_list_anchor
		id = regions_up_arrow
		texture = up_arrow
		scale = 1
		pos = (150.0, 121.0)
		just = [left top]
		rgba = [128 128 128 98]
		not_focusable
	}
	createscreenelement {
		type = spriteelement
		parent = lobby_list_anchor
		id = regions_down_arrow
		texture = down_arrow
		scale = 1
		pos = (150.0, 338.0)
		just = [left top]
		rgba = [128 128 128 98]
		not_focusable
	}
	theme_background parent = lobby_list_anchor width = 2.25 pos = (170.0, 78.0) num_parts = 10
	setscreenelementlock id = root_window off
	setscreenelementprops {id = lobby_list_menu event_handlers = [{pad_back generic_menu_pad_back params = {callback = back_from_lobbies}}]}
	setscreenelementprops {id = lobby_list_vmenu event_handlers = [
			{pad_up set_which_arrow params = {arrow = regions_up_arrow}}
			{pad_down set_which_arrow params = {arrow = regions_down_arrow}}
		]
	}
	createscreenelement {
		type = spriteelement
		parent = lobby_list_anchor
		z_priority = 100
		pos = (132.0, 68.0)
		texture = gslogo scale = 1.1
		alpha = 1
	}
	runscriptonscreenelement lobby_list_animate_in id = lobby_list_anchor
	launchevent type = focus target = lobby_list_menu
endscript

script lobby_list_animate_in \{id = lobby_list_anchor}
	doscreenelementmorph id = <id> pos = (-5.0, 0.0) time = 0.3
endscript

script regions_menu_add_item 
	formattext checksumname = id '%i' i = <text>
	theme_menu_add_item {parent = lobby_list_vmenu centered <...> menu = 2 no_bg = no_bg}
endscript

script regions_menu_set_focus 
	generic_menu_update_arrows \{up_arrow_id = regions_up_arrow
		down_arrow_id = regions_down_arrow}
	lobby_list_vmenu :gettags
	if gotparam \{arrow_id}
		menu_vert_blink_arrow {id = <arrow_id>}
	endif
	main_theme_focus <...>
endscript

script back_from_regions_menu 
	if objectexists \{id = lobby_list_anchor}
		launchevent \{type = unfocus
			target = lobby_list_menu}
		launchevent \{type = focus
			target = sub_menu}
		assignalias \{id = menu_parts_anchor
			alias = current_menu_anchor}
		doscreenelementmorph \{id = lobby_list_anchor
			pos = (-5.0, 800.0)
			time = 0.3}
		wait \{0.3
			seconds}
		destroyscreenelement \{id = lobby_list_anchor}
	endif
endscript

script back_from_lobbies 
	printf \{"script back_from_lobbies"}
	netsessionfunc \{obj = match
		func = logoff}
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	netsessionfunc \{obj = match
		func = cancel_nat_negotiation}
	back_from_regions_menu
endscript

script back_from_network_menu 
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	destroyscreenelement \{id = current_menu_anchor}
endscript

script back_from_multiplayer_menu 
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	back_from_network_select_menu <...>
endscript

script select_host_option 
	SetPreferencesFromUI <...>
	if ininternetmode
		if innetgame
			if OnServer
				netsessionfunc \{obj = match
					func = update_game_options}
			endif
		endif
	endif
	select_host_option2
endscript

script select_host_option2 
	launch_network_host_options_menu
endscript

script set_gametype 
	SetPreferencesFromUI <...>
	printf <checksum>
	printstruct <...>
	if NOT innetgame
		getcurrentlevel
		if (<level> = load_z_crib)
			SetPreferencesFromUI prefs = <prefs> field = 'score_mode' checksum = point_scoring string = "Points"
		endif
	endif
	switch <checksum>
		case netscorechallenge
		case scorechallenge
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 score = 1000000 string = "1,000,000 pts"
			case tag_scoring
			printf "tag_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
			default
			printf "unknown scoring method"
		endswitch
		case netcombochallenge
		case combochallenge
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_100000 score = 100000 string = "100,000 pts"
			case tag_scoring
			printf "tag_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
			default
			printf "unknown scoring method"
		endswitch
		case netking
		case king
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = time_120 time = 120 string = "2 minutes"
		case timed_gold
		printf "setting target score to timed"
		getpreferencechecksum pref_type = <prefs> score_mode
		printf <checksum>
		SetPreferencesFromUI prefs = <prefs> field = 'time_limit' checksum = time_120 time = 120 string = "2 minutes"
		case netgold
		case gold
		case score_gold
		printf "setting target score to points/tags"
		getpreferencechecksum pref_type = <prefs> score_mode
		printf <checksum>
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 score = 1000000 string = "1,000,000 pts"
		SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
		case netctf
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_5 score = 5 string = "5 captures"
		case netwalls
		SetPreferencesFromUI prefs = <prefs> field = 'walls_mode_type' checksum = lastmanstanding string = "Last Man Standing"
		SetPreferencesFromUI prefs = <prefs> field = 'walls_mode_points' checksum = num_3 string = "3"
		case walls
		printf "Setting values for the wall games, bitches"
		case net_horse
		printf "Setup what NETHORSE prefs we want to set!!!!!!!!!"
	endswitch
	ui_change_state state = UIstate_net_startgame
endscript

script select_game_option 
	printf "select_game_option"
	if (<checksum> = netctf)
		if NOT InTeamGame
			SetPreferencesFromUI prefs = network field = 'team_mode' checksum = teams_two string = "2"
			SetNumTeams 2
		endif
	endif
	SetPreferencesFromUI <...>
	printf <checksum>
	switch <checksum>
		case netscorechallenge
		case scorechallenge
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 score = 1000000 string = "1,000,000 pts"
			case tag_scoring
			printf "tag_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
			default
			printf "unknown scoring method"
		endswitch
		case netcombochallenge
		case combochallenge
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_10000 score = 10000 string = "10,000 pts"
			case tag_scoring
			printf "tag_scoring game option"
			SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
			default
			printf "unknown scoring method"
		endswitch
		case netking
		case king
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = time_120 time = 120 string = "2 minutes"
		case timed_gold
		printf "setting target score to timed"
		getpreferencechecksum pref_type = <prefs> score_mode
		printf <checksum>
		SetPreferencesFromUI prefs = <prefs> field = 'time_limit' checksum = time_120 time = 120 string = "2 minutes"
		case netgold
		case gold
		case score_gold
		printf "setting target score to points/tags"
		getpreferencechecksum pref_type = <prefs> score_mode
		printf <checksum>
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_1000000 score = 1000000 string = "1,000,000 pts"
		SetPreferencesFromUI prefs = <prefs> field = 'target_tags' checksum = tags_10 score = 10 string = "10 Tags"
		case netctf
		SetPreferencesFromUI prefs = <prefs> field = 'target_score' checksum = score_5 score = 5 string = "5 captures"
		case netwalls
		case walls
		printf "Setting values for the wall games, bitches"
		case net_horse
		printf "Setup what NETHORSE values we need to update!!!!!!!!"
	endswitch
	printf "select_game_option"
	if innetgame
		create_network_game_options_menu <...>
	else
		printf "select_game_option 2"
		create_network_game_options_menu <...> end_run
	endif
endscript

script select_team_mode_option 
	SetPreferencesFromUI <...>
	if gamemodeequals is_lobby
		getpreferencechecksum pref_type = network team_mode
		switch <checksum>
			case teams_none
			printf "SetNumTeams 0"
			SetNumTeams 0
			case teams_two
			printf "SetNumTeams 2"
			SetNumTeams 2
			case teams_three
			printf "SetNumTeams 3"
			SetNumTeams 3
			case teams_four
			printf "SetNumTeams 4"
			SetNumTeams 4
			default
		endswitch
	endif
	launch_network_host_options_menu
endscript

script game_options_goals_sub_menu_return 
	SetPreferencesFromUI \{prefs = network
		field = 'goals'
		string = "CREATED"
		checksum = goals_created}
	if NOT infrontend
		dialog_box_exit
		kill_start_key_binding
		create_dialog_box \{title = net_warning_msg
			text = net_message_goals_next_level
			buttons = [
				{
					text = "OK"
					pad_choose_script = create_network_game_options_menu
				}
			]}
	else
		create_network_game_options_menu
	endif
endscript

script host_options_goals_sub_menu_return 
	SetPreferencesFromUI \{prefs = network
		field = 'goals'
		string = "CREATED"
		checksum = goals_created}
	if NOT infrontend
		dialog_box_exit
		kill_start_key_binding
		create_dialog_box \{title = net_warning_msg
			text = net_message_goals_next_level
			buttons = [
				{
					text = "OK"
					pad_choose_script = launch_network_host_options_menu
				}
			]}
	else
		launch_network_host_options_menu
	endif
endscript

script host_options_goals_sub_menu_exit 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	<new_menu_script> <...>
endscript

script create_host_options_sub_menu pad_choose = select_host_option
	make_new_themed_sub_menu title = <menu_title>
	if infrontend
		createscreenelement {
			type = spriteelement
			parent = menu_parts_anchor
			id = Globe
			texture = Globe
			scale = 1.5
			pos = (760.0, 240.0)
			just = [center center]
			alpha = 0.6
			z_priority = -1
		}
		runscriptonscreenelement id = Globe rotate_internet_options_globe
	endif
	setscreenelementprops {id = sub_menu
		event_handlers = [{pad_back generic_menu_pad_back params = {callback = launch_network_host_options_menu}}]
	}
	removeparameter id
	if gotparam array
		getarraysize <array>
		if gotparam max_index
			<array_size> = (<max_index> + 1)
		endif
		<index> = 0
		begin
		name = ((<array> [<index>]).name)
		if structurecontains structure = (<array> [<index>]) checksum
			checksum = ((<array> [<index>]).checksum)
		endif
		if structurecontains structure = (<array> [<index>]) time
			time = ((<array> [<index>]).time)
		endif
		if structurecontains structure = (<array> [<index>]) broadband_only
			orig_checksum = <checksum>
			getpreferencechecksum pref_type = network device_type
			switch <checksum>
				case device_sony_modem
				case device_usb_modem
				break
			endswitch
			checksum = <orig_checksum>
		endif
		params = {}
		if structurecontains structure = (<array> [<index>]) test_greater_only
			orig_checksum = <checksum>
			getpreferencechecksum pref_type = network rank_test
			switch <checksum>
				case rank_test_less
				params = {not_focusable}
			endswitch
			checksum = <orig_checksum>
		endif
		if structurecontains structure = (<array> [<index>]) test_less_only
			orig_checksum = <checksum>
			getpreferencechecksum pref_type = network rank_test
			switch <checksum>
				case rank_test_greater
				params = {not_focusable}
			endswitch
			checksum = <orig_checksum>
		endif
		pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>}
		if (<pref_field> = 'skill_level')
			<just> = [left center]
			removeparameter centered
			text_pos = (20.0, -5.0)
		else
			<just> = [center center]
		endif
		if (<index> = 0)
			theme_menu_add_item {
				<...>
				text = <name>
				<params>
				pad_choose_script = <pad_choose>
				pad_choose_params = <pad_choose_params>
				text_just = <just>
			}
		else
			if (<index> = (<array_size> - 1))
				theme_menu_add_item {
					last_menu_item = last_menu_item
					<...>
					<params>
					text = <name>
					pad_choose_script = <pad_choose>
					pad_choose_params = <pad_choose_params>
					text_just = <just>
				}
			else
				theme_menu_add_item {
					<...>
					<params>
					text = <name>
					pad_choose_script = <pad_choose>
					pad_choose_params = <pad_choose_params>
					text_just = <just>
				}
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	finish_themed_sub_menu
endscript

script create_game_options_sub_menu 
	if insplitscreengame
		prefs = splitscreen
	else
		prefs = network
	endif
	if (<pref_field> = 'game_type')
		make_new_themed_sub_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu pos = (230.0, 603.0) dims = (450.0, 190.0) scrolling
		createscreenelement {
			type = spriteelement
			parent = options_sub_menu
			id = options_sub_menu_arrow_up
			texture = up_arrow
			pos = (315.0, 595.0)
			just = [center bottom]
			z_priority = 20
			scale = 1
			rgba = [110 0 85 128]
		}
		createscreenelement {
			type = spriteelement
			parent = options_sub_menu
			id = options_sub_menu_arrow_down
			texture = down_arrow
			pos = (315.0, 800.0)
			just = [center bottom]
			z_priority = 20
			scale = 1
			rgba = [110 0 85 128]
		}
		setscreenelementprops {
			id = options_sub_vmenu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = create_network_game_options_menu <...>}}
				{pad_up blink_arrow params = {id = options_sub_menu_arrow_up}}
				{pad_down blink_arrow params = {id = options_sub_menu_arrow_down}}
			]
		}
		generic_array_menu_desc_setup <...>
	else
		make_new_themed_sub_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu pos = (230.0, 620.0)
		setscreenelementprops {
			id = options_sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = create_network_game_options_menu <...>}}
			]
		}
		generic_array_menu_setup <...>
	endif
	build_theme_sub_title title = <menu_title> right_bracket_z = -1 right_bracket_alpha = 0.0
	create_helper_text $generic_helper_text
	goalmanager_hidepoints
	doscreenelementmorph id = options_sub_menu time = 0.2 pos = (320.0, -240.0)
	if (<pref_field> = 'game_type')
		doscreenelementmorph id = bg_box_vmenu time = 0.2 pos = (320.0, 85.0)
		doscreenelementmorph id = item_bg_box time = 0.2 pos = (320.0, 329.0)
		doscreenelementmorph id = item_description_text time = 0.2 pos = (320.0, 318.0)
		doscreenelementmorph id = item_description_bar time = 0.2 pos = (320.0, 328.0)
	endif
	if screenelementexists id = top_bar_anchor
		doscreenelementmorph id = top_bar_anchor time = 0.2 pos = (0.0, 62.0)
	endif
	launchevent type = focus target = options_sub_menu
endscript

script set_host_option_preference 
	keyboard_current_string :text_getstring
	SetPreferencesFromUI prefs = network <...>
	destroy_onscreen_keyboard
	create_network_host_options_menu
endscript

script host_options_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_host_options_menu
endscript

script set_horse_option_preference 
	keyboard_current_string :text_getstring
	SetPreferencesFromUI prefs = splitscreen <...>
	horse_word_back_from_keyboard
endscript

script horse_word_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_game_options_menu \{end_run}
endscript

script create_network_host_options_server_name_menu 
	GetPreferenceString \{pref_type = network
		server_name}
	destroyscreenelement \{id = current_menu_anchor}
	create_onscreen_keyboard allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = "NAME" field = 'server_name' text = <ui_string> min_length = 1 max_length = 15
endscript

script create_network_host_options_password_menu 
	GetPreferenceString \{pref_type = network
		password}
	destroyscreenelement \{id = current_menu_anchor}
	create_onscreen_keyboard password allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = "PASSWORD" field = "password" text = <ui_string> min_length = 0 max_length = 9
endscript

script create_network_host_options_max_players_menu 
	create_host_options_sub_menu menu_title = "PLAYERS" pref_type = network pref_field = 'num_players' array = num_players_info pad_choose_script = select_host_option pos = (227.0, 112.0) helper_text = $generic_helper_text <...> centered
endscript

script create_network_host_options_max_observers_menu 
	create_host_options_sub_menu \{menu_title = "OBSERVERS"
		pref_type = network
		pref_field = 'num_observers'
		array = num_observers_info
		pad_choose_script = select_host_option
		pos = (227.0, 112.0)
		helper_text = $generic_helper_text
		centered}
endscript

script create_network_host_options_player_collision_menu 
	create_host_options_sub_menu \{menu_title = "PLAYER COLLISION"
		pref_type = network
		pref_field = 'player_collision'
		array = on_off_types
		pad_choose_script = select_host_option
		helper_text = $generic_helper_text
		centered}
endscript

script create_network_host_options_team_menu 
	create_host_options_sub_menu \{menu_title = "TEAMS"
		pref_type = network
		pref_field = 'team_mode'
		array = team_types
		pad_choose = select_team_mode_option
		pos = (227.0, 112.0)
		helper_text = $generic_helper_text
		centered}
endscript

script create_network_host_options_skill_level_menu 
	create_host_options_sub_menu \{menu_title = "SKILL LEVEL"
		pref_type = network
		pref_field = 'skill_level'
		array = skill_level_info
		pad_choose_script = select_host_option
		pos = (227.0, 112.0)
		helper_text = $generic_helper_text
		centered}
endscript

script create_network_host_options_rank_limit_menu 
	create_host_options_sub_menu \{menu_title = "RANK LIMIT"
		pref_type = network
		pref_field = 'rank_limit'
		array = rank_limits
		pad_choose_script = select_host_option
		pos = (227.0, 112.0)
		helper_text = $generic_helper_text
		centered}
endscript

script create_network_host_options_rank_test_menu 
	create_host_options_sub_menu \{menu_title = "RANK RESTRICTION"
		pref_type = network
		pref_field = 'rank_test'
		array = rank_tests
		pad_choose_script = select_host_option
		pos = (227.0, 112.0)
		helper_text = $generic_helper_text
		centered}
endscript

script create_mp_game_options_game_type_menu 
	create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = splitscreen pref_field = 'game_type' array = mp_game_type_info call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_game_type_menu 
	if istrue \{$demo_build}
		create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = network pref_field = 'game_type' array = net_game_type_info_DEMO call_script = select_game_option helper_text = $generic_helper_text <...>
	else
		create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = network pref_field = 'game_type' array = net_game_type_info call_script = select_game_option helper_text = $generic_helper_text <...>
	endif
endscript

script create_network_game_options_goal_type_menu 
	create_game_options_sub_menu menu_title = "GOAL TYPE" pref_type = <prefs> pref_field = "goals" array = net_goal_info call_script = network_game_options_goal_type_select helper_text = $generic_helper_text <...>
endscript

script network_game_options_goal_type_select 
	GoalManager_DeselectAllGoals
	select_game_option <...>
endscript

script create_network_game_options_ctf_mode_menu 
	create_game_options_sub_menu menu_title = "MODE" pref_type = <prefs> pref_field = 'ctf_game_type' array = ctf_type call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_gold_mode_menu 
	create_game_options_sub_menu menu_title = "MODE" pref_type = <prefs> pref_field = 'gold_game_type' array = gold_type call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_score_mode_menu 
	create_game_options_sub_menu menu_title = "SCORE MODE" pref_type = <prefs> pref_field = 'score_mode' array = score_type call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_walls_mode_menu 
	create_game_options_sub_menu menu_title = "WALLS MODE" pref_type = <prefs> pref_field = 'walls_mode_type_help' array = walls_mode_type_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_score_menu 
	create_game_options_sub_menu menu_title = "TARGET SCORE" pref_type = <prefs> pref_field = 'target_score' array = target_score_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_tags_menu 
	create_game_options_sub_menu menu_title = "TARGET TAGS" pref_type = <prefs> pref_field = 'target_tags' array = target_tags_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_captures_menu 
	create_game_options_sub_menu menu_title = "CAPTURES" pref_type = <prefs> pref_field = 'target_score' array = capture_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_target_time_menu 
	create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = <prefs> pref_field = 'target_score' array = time_limit_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_time_menu 
	create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = network pref_field = 'time_limit' array = time_limit_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_graffiti_scoring_menu 
	create_game_options_sub_menu menu_title = "SCORING MODE" pref_type = network pref_field = 'team_graffiti_mode' array = team_graffiti_mode call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_friendly_fire_menu 
	create_game_options_sub_menu menu_title = "FRIENDLY FIRE" pref_type = network pref_field = 'friendly_fire' array = on_off_types call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_network_game_options_fireball_difficulty_menu 
	create_game_options_sub_menu menu_title = "FIREBALL DIFFICULTY" pref_type = network pref_field = 'fireball_difficulty' array = fireball_level_info call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_mp_game_options_stop_at_zero_menu 
	create_game_options_sub_menu menu_title = "STOP AT ZERO" pref_type = network pref_field = 'stop_at_zero' array = boolean_types call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_mp_game_options_score_reset_menu 
	create_game_options_sub_menu menu_title = "SCORE RESET" pref_type = network pref_field = 'score_reset' array = boolean_types call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_mp_game_options_time_menu 
	create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = splitscreen pref_field = 'time_limit' array = time_limit_options call_script = select_game_option helper_text = $generic_helper_text <...>
endscript

script create_mp_game_options_horse_time_menu 
	create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = splitscreen pref_field = 'horse_time_limit' array = horse_time_limit_options call_script = select_game_option helper_text = $generic_helper_text prefs = splitscreen <...>
endscript
horse_allowed_characters = [
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"0"
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
	"g"
	"h"
	"i"
	"j"
	"k"
	"l"
	"m"
	"n"
	"o"
	"p"
	"q"
	"r"
	"s"
	"t"
	"u"
	"v"
	"w"
	"x"
	"y"
	"z"
	"A"
	"B"
	"C"
	"D"
	"E"
	"F"
	"G"
	"H"
	"I"
	"J"
	"K"
	"L"
	"M"
	"N"
	"O"
	"P"
	"Q"
	"R"
	"S"
	"T"
	"U"
	"V"
	"W"
	"X"
	"Y"
	"Z"
	"."
	","
	"!"
	"?"
	"-"
	"¦"
	"'"
	"+"
	"^"
	"#"
	"$"
	"*"
	"@"
	"`"
	"&"
	":"
	"<"
	">"
	"_"
	"-"
	"="
	"("
	")"
	"/"
	"ß"
	"Ä"
	"Ü"
	"Ö"
	"à"
	"â"
	"ê"
	"è"
	"é"
	"ë"
	"ì"
	"î"
	"ï"
	"ô"
	"ò"
	"Ö"
	"ù"
	"û"
	"Ü"
	"ç"
	""
	"ü"
	"ä"
	"ö"
	"¼"
	"½"
	"¾"
	"¢"
	"º"
	"®"
	"¡"
	"¿"
	"£"
	"¥"
	"§"
	"©"
]

script create_mp_game_options_horse_word_menu 
	GetPreferenceString \{pref_type = splitscreen
		horse_word}
	create_onscreen_keyboard allowed_characters = $horse_allowed_characters no_space allow_cancel keyboard_cancel_script = horse_word_back_from_keyboard keyboard_done_script = set_horse_option_preference keyboard_title = "HORSE WORD" field = 'horse_word' text = <ui_string> min_length = 1 max_length = 15
endscript

script create_net_game_options_horse_word_menu 
	GetPreferenceString \{pref_type = network
		horse_word}
	create_onscreen_keyboard {
		allowed_characters = $horse_allowed_characters
		allow_cancel
		keyboard_cancel_script = net_horse_word_back_from_keyboard
		keyboard_done_script = set_net_horse_option_preference
		keyboard_title = "HORSE WORD"
		field = 'horse_word'
		text = <ui_string>
		min_length = 1
		max_length = 15
	}
endscript

script set_net_horse_option_preference 
	keyboard_current_string :text_getstring
	SetPreferencesFromUI prefs = network <...>
	horse_word_back_from_keyboard
endscript

script net_horse_word_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_game_options_menu \{end_run}
endscript

script create_account_list_menu 
	setscreenelementlock \{id = root_window
		off}
	setscreenelementprops \{id = account_list_menu
		event_handlers = [
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_from_account_list_menu
				}
			}
		]}
	runscriptonscreenelement \{id = current_menu_anchor
		menu_onscreen}
endscript

script create_network_game_options_menu 
	printf "create_network_game_options_menu"
	dialog_box_exit
	hide_current_goal
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if insplitscreengame
		prefs = splitscreen
	else
		prefs = network
	endif
	hide_net_player_names on
	if innetgame
		back_state = UIstate_net_gametype
	else
		back_state = UIstate_2player_create_game
	endif
	make_cas_menu {
		title = "GAME OPTIONS" right_bracket_alpha = 0.0
		back_state = <back_state>
		pausemenu
		width = 700
		highlight_add = (100.0, 0.0)
	}
	the_extras_offset = (90.0, 0.0)
	GetPreferenceString pref_type = <prefs> game_type
	if innetgame
		add_cas_menu_item text = "GAME TYPE:" extra_text = <ui_string> extras_offset = <the_extras_offset> id = menu_network_host_options_game_type
	else
		if gotparam end_run
			add_cas_menu_item text = "GAME TYPE:" extra_text = <ui_string> extras_offset = <the_extras_offset> id = menu_network_host_options_game_type
		else
			add_cas_menu_item text = "GAME TYPE:" extra_text = <ui_string> extras_offset = <the_extras_offset> id = menu_network_host_options_game_type
		endif
	endif
	getpreferencechecksum pref_type = <prefs> game_type
	switch <checksum>
		case netgoalattack
		GetPreferenceString pref_type = <prefs> goals
		pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_ctf_mode_menu prefs = <prefs>}
		add_cas_menu_item text = "CHOOSE GOALS" centered = centered id = menu_network_host_options_choose_goals pad_choose_script = create_choose_goals_menu
		if GoalManager_GoalsAreSelected
			add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		else
			add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game not_focusable rgba = [80 80 80 128] last_menu_item = 1
		endif
		case freeskate2p
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case horse
		GetPreferenceString pref_type = <prefs> horse_time_limit
		add_cas_menu_item {
			text = "TIME LIMIT:"
			extra_text = <ui_string>
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = adjust_host_option_array2
			option_arrows_callback_params = {
				id = menu_network_host_options_time_limit
				type = <prefs>
				pref_field = horse_time_limit
				string_field = 'horse_time_limit'
				array = $horse_time_limit_options
				settime
			}
		}
		GetPreferenceString pref_type = <prefs> horse_word
		sub_script = create_mp_game_options_horse_word_menu
		add_cas_menu_item {
			text = "HORSE WORD:"
			extra_text = <ui_string>
			id = menu_network_host_options_horse_word
			extras_offset = <the_extras_offset>
			pad_choose_script = launch_network_host_options_sub_menu
			pad_choose_params = {end_run
				sub_menu_script = <sub_script>}
		}
		add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		case net_horse
		GetPreferenceString pref_type = <prefs> net_horse_mode_type
		add_cas_menu_item {
			text = "HORSE MODE:"
			extra_text = <ui_string>
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_game_mode
			option_arrows
			option_arrows_callback = adjust_host_option_array2
			option_arrows_callback_params = {
				id = menu_network_host_options_game_mode
				type = <prefs>
				pref_field = net_horse_mode_type
				string_field = 'net_horse_mode_type'
				array = $net_horse_mode_type_options
			}
		}
		GetPreferenceString pref_type = <prefs> horse_time_limit
		add_cas_menu_item {
			text = "TIME LIMIT:"
			extra_text = <ui_string>
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = adjust_host_option_array2
			option_arrows_callback_params = {
				id = menu_network_host_options_time_limit
				type = <prefs>
				pref_field = horse_time_limit
				string_field = 'horse_time_limit'
				array = $horse_time_limit_options
				settime
			}
		}
		GetPreferenceString pref_type = <prefs> horse_word
		sub_script = create_net_game_options_horse_word_menu
		add_cas_menu_item {
			text = "HORSE WORD:"
			extra_text = <ui_string>
			id = menu_network_host_options_horse_word
			extras_offset = <the_extras_offset>
			pad_choose_script = launch_network_host_options_sub_menu
			pad_choose_params = {end_run
				sub_menu_script = <sub_script>}
		}
		add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		case scorechallenge
		case netscorechallenge
		GetPreferenceString pref_type = <prefs> score_mode
		if gotparam end_run
			add_cas_menu_item {
				text = "MODE:"
				extras_offset = <the_extras_offset>
				extra_text = <ui_string>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
					setScore
				}
				tag_grid_x = 1
			}
		else
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
					setScore
				}
				tag_grid_x = 1
			}
		endif
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring"
			GetPreferenceString pref_type = <prefs> target_score
			if gotparam end_run
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_score
						string_field = 'target_score'
						array = $target_score_options
						setScore
					}
				}
			else
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_score
						string_field = 'target_score'
						array = $target_score_options
						setScore
					}
				}
			endif
			case tag_scoring
			printf "tag_scoring"
			GetPreferenceString pref_type = <prefs> target_tags
			if gotparam end_run
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_tags
						string_field = 'target_tags'
						array = $target_tags_options
						setScore
					}
				}
			else
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_tags
						string_field = 'target_tags'
						array = $target_tags_options
						setScore
					}
				}
			endif
		endswitch
		if innetgame
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		else
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		endif
		case combochallenge
		case netcombochallenge
		GetPreferenceString pref_type = <prefs> score_mode
		if gotparam end_run
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
					setScore
				}
				tag_grid_x = 1
			}
		else
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
					setScore
				}
				tag_grid_x = 1
			}
		endif
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			printf "point_scoring"
			GetPreferenceString pref_type = <prefs> target_score
			if gotparam end_run
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_score
						string_field = 'target_score'
						array = $target_score_options
						setScore
					}
				}
			else
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_score
						string_field = 'target_score'
						array = $target_score_options
						setScore
					}
				}
			endif
			case tag_scoring
			printf "tag_scoring"
			GetPreferenceString pref_type = <prefs> target_tags
			if gotparam end_run
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_tags
						string_field = 'target_tags'
						array = $target_tags_options
						setScore
					}
				}
			else
				add_cas_menu_item {
					text = "TARGET SCORE:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_target_score
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_target_score
						type = <prefs>
						pref_field = target_tags
						string_field = 'target_tags'
						array = $target_tags_options
						setScore
					}
				}
			endif
		endswitch
		if innetgame
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		else
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		endif
		case netctf
		GetPreferenceString pref_type = <prefs> ctf_game_type
		add_cas_menu_item text = "MODE:" extra_text = <ui_string> id = menu_network_host_options_ctf_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_ctf_mode_menu prefs = <prefs>}
		getpreferencechecksum pref_type = <prefs> ctf_game_type
		switch <checksum>
			case timed_ctf
			GetPreferenceString pref_type = <prefs> time_limit
			add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_time_menu}
			case score_ctf
			GetPreferenceString pref_type = <prefs> target_score
			add_cas_menu_item text = "CAPTURES:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_captures_menu prefs = <prefs>}
		endswitch
		getpreferencechecksum pref_type = <prefs> ctf_game_type
		switch <checksum>
			case timed_ctf
			GetPreferenceString pref_type = <prefs> stop_at_zero
			add_cas_menu_item text = "STOP AT ZERO:" extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_mp_game_options_stop_at_zero_menu}
		endswitch
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case king
		case netking
		GetPreferenceString pref_type = <prefs> target_score
		if gotparam end_run
			add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs>}
		else
			add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs>}
		endif
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case gold
		case netgold
		GetPreferenceString pref_type = <prefs> gold_game_type
		if gotparam end_run
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_gold_mode
				pad_choose_script = launch_network_host_options_sub_menu
				pad_choose_params = {
					end_run
					sub_menu_script = create_network_game_options_gold_mode_menu
					prefs = <prefs>
				}
			}
		else
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_gold_mode
				pad_choose_script = launch_network_host_options_sub_menu
				pad_choose_params = {
					sub_menu_script = create_network_game_options_gold_mode_menu
					prefs = <prefs>
				}
			}
		endif
		getpreferencechecksum pref_type = <prefs> gold_game_type
		if (<checksum> = timed_gold)
			GetPreferenceString pref_type = <prefs> time_limit
			if gotparam end_run
				add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_time_menu}
			else
				add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_time_menu}
			endif
			GetPreferenceString pref_type = <prefs> stop_at_zero
			if gotparam end_run
				add_cas_menu_item text = "STOP AT ZERO:" extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_mp_game_options_stop_at_zero_menu}
			else
				add_cas_menu_item text = "STOP AT ZERO:" extra_text = <ui_string> id = menu_network_host_options_stop_at_zero pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_mp_game_options_stop_at_zero_menu}
			endif
		endif
		GetPreferenceString pref_type = <prefs> score_mode
		if gotparam end_run
			add_cas_menu_item text = "SCORE MODE:" extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
		else
			add_cas_menu_item text = "SCORE MODE:" extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
		endif
		getpreferencechecksum pref_type = <prefs> score_mode
		switch <checksum>
			case point_scoring
			GetPreferenceString pref_type = <prefs> target_score
			if gotparam end_run
				add_cas_menu_item text = "TARGET SCORE:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
			else
				add_cas_menu_item text = "TARGET SCORE:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_menu prefs = <prefs>}
			endif
			case tag_scoring
			GetPreferenceString pref_type = <prefs> target_tags
			if gotparam end_run
				add_cas_menu_item text = "TARGET TAGS:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {end_run sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
			else
				add_cas_menu_item text = "TARGET TAGS:" extra_text = <ui_string> id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_tags_menu prefs = <prefs>}
			endif
		endswitch
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case elimiskate
		case netelimiskate
		GetPreferenceString pref_type = <prefs> time_limit
		add_cas_menu_item text = "TIME LIMIT:" extra_text = <ui_string> id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_time_menu}
		GetPreferenceString pref_type = <prefs> score_mode
		add_cas_menu_item text = "MODE:" extra_text = <ui_string> id = menu_network_host_options_score_mode pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_score_mode_menu prefs = <prefs>}
		GetPreferenceString pref_type = <prefs> score_reset
		add_cas_menu_item text = "SCORE RESET:" extra_text = <ui_string> id = menu_network_host_options_score_reset pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_mp_game_options_score_reset_menu}
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case netgraffiti
		if InTeamGame
			GetPreferenceString pref_type = <prefs> team_graffiti_mode
			add_cas_menu_item {
				text = "SCORING MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_scoring_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_scoring_mode
					type = <prefs>
					pref_field = team_graffiti_mode
					string_field = 'team_graffiti_mode'
					array = $team_graffiti_mode
				}
			}
		endif
		GetPreferenceString pref_type = <prefs> time_limit
		if innetgame
			add_cas_menu_item {
				text = "TIME LIMIT:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_time_limit
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_time_limit
					type = <prefs>
					pref_field = time_limit
					string_field = 'time_limit'
					array = $time_limit_options
					settime
				}
			}
		else
			if gotparam end_run
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			else
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			endif
		endif
		if innetgame
			GetPreferenceString pref_type = <prefs> stop_at_zero
			add_cas_menu_item {
				text = "STOP AT ZERO:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_stop_at_zero
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_stop_at_zero
					type = <prefs>
					pref_field = stop_at_zero
					string_field = 'stop_at_zero'
					array = $boolean_types
				}
			}
		endif
		if innetgame
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		else
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		endif
		case firefight
		case netfirefight
		if innetgame
			if InTeamGame
				GetPreferenceString pref_type = <prefs> friendly_fire
				add_cas_menu_item text = "FRIENDLY FIRE:" extra_text = <ui_string> id = menu_network_host_options_friendly_fire pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_friendly_fire_menu prefs = <prefs>}
			endif
			GetPreferenceString pref_type = <prefs> fireball_difficulty
			add_cas_menu_item text = "FIREBALL COMBO LEVEL:" extra_text = <ui_string> id = menu_network_host_options_fireball_difficulty pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = {sub_menu_script = create_network_game_options_fireball_difficulty_menu prefs = <prefs>}
		endif
		add_cas_menu_item text = "READY" id = menu_network_host_options_ready pad_choose_script = chosen_host_game last_menu_item = 1
		case combomambo
		case netcombomambo
		GetPreferenceString pref_type = <prefs> score_mode
		if gotparam end_run
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
				}
				tag_grid_x = 1
			}
		else
			add_cas_menu_item {
				text = "MODE:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_score_mode
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_score_mode
					type = <prefs>
					pref_field = score_mode
					string_field = 'score_mode'
					array = $score_type
				}
				tag_grid_x = 1
			}
		endif
		GetPreferenceString pref_type = <prefs> time_limit
		if innetgame
			add_cas_menu_item {
				text = "TIME LIMIT:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_time_limit
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_time_limit
					type = <prefs>
					pref_field = time_limit
					string_field = 'time_limit'
					array = $time_limit_options
					settime
				}
			}
		else
			if gotparam end_run
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			else
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			endif
		endif
		if innetgame
			GetPreferenceString pref_type = <prefs> stop_at_zero
			add_cas_menu_item {
				text = "STOP AT ZERO:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_stop_at_zero
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_stop_at_zero
					type = <prefs>
					pref_field = stop_at_zero
					string_field = 'stop_at_zero'
					array = $boolean_types
				}
			}
		endif
		if innetgame
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		else
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		endif
		case netwalls
		GetPreferenceString pref_type = <prefs> walls_mode_type
		add_cas_menu_item {
			text = "MODE:"
			extra_text = <ui_string>
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_wall_mode
			option_arrows
			option_arrows_callback = adjust_host_option_array2
			option_arrows_callback_params = {
				id = menu_network_host_options_wall_mode
				type = <prefs>
				pref_field = walls_mode_type
				string_field = 'walls_mode_type'
				array = $walls_mode_type_options
			}
			tag_grid_x = 1
		}
		GetPreferenceString pref_type = <prefs> time_limit
		add_cas_menu_item {
			text = "TIME LIMIT:"
			extra_text = <ui_string>
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = adjust_host_option_array2
			option_arrows_callback_params = {
				id = menu_network_host_options_time_limit
				type = <prefs>
				pref_field = time_limit
				string_field = 'time_limit'
				array = $time_limit_options
				settime
			}
		}
		getpreferencechecksum pref_type = <prefs> walls_mode_type
		printstruct <...>
		if (pointscoring = <checksum>)
			GetPreferenceString pref_type = <prefs> walls_mode_points
			printstruct <...>
			add_cas_menu_item {
				text = "POINTS:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_wall_points
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_wall_points
					type = <prefs>
					pref_field = walls_mode_points
					string_field = 'walls_mode_points'
					array = $walls_mode_points_options
					setScore
				}
			}
		endif
		add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		default
		GetPreferenceString pref_type = <prefs> time_limit
		if innetgame
			add_cas_menu_item {
				text = "TIME LIMIT:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_time_limit
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_time_limit
					type = <prefs>
					pref_field = time_limit
					string_field = 'time_limit'
					array = $time_limit_options
					settime
				}
			}
		else
			if gotparam end_run
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			else
				add_cas_menu_item {
					text = "TIME LIMIT:"
					extra_text = <ui_string>
					extras_offset = <the_extras_offset>
					id = menu_network_host_options_time_limit
					option_arrows
					option_arrows_callback = adjust_host_option_array2
					option_arrows_callback_params = {
						id = menu_network_host_options_time_limit
						type = <prefs>
						pref_field = time_limit
						string_field = 'time_limit'
						array = $time_limit_options
						settime
					}
				}
			endif
		endif
		if innetgame
			GetPreferenceString pref_type = <prefs> stop_at_zero
			add_cas_menu_item {
				text = "STOP AT ZERO:"
				extra_text = <ui_string>
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_stop_at_zero
				option_arrows
				option_arrows_callback = adjust_host_option_array2
				option_arrows_callback_params = {
					id = menu_network_host_options_stop_at_zero
					type = <prefs>
					pref_field = stop_at_zero
					string_field = 'stop_at_zero'
					array = $boolean_types
				}
			}
		endif
		if innetgame
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready pad_choose_script = ui_change_state pad_choose_params = {state = uistate_pausemenu}
		else
			add_cas_menu_item text = "DONE" id = menu_network_host_options_ready choose_state = UIstate_2player_create_game
		endif
	endswitch
	goalmanager_hidepoints
	if gotparam use_grid_index
		cas_menu_finish index = 1
	else
		cas_menu_finish
	endif
endscript

script create_network_host_options_menu 
	hide_console_window
	dialog_box_exit
	if (isxenon)
		title_text = "HOST OPTIONS"
	else
		title_text = "SERVER OPTIONS"
	endif
	make_cas_menu {
		title = <title_text>
		menu_id = host_options_menu
		vmenu_id = host_options_vmenu
		back_state = uistate_pausemenu
		pausemenu
		width = 550
		highlight_add = (40.0, 0.0)
	}
	if infrontend
		createscreenelement {
			type = spriteelement
			parent = menu_parts_anchor
			id = Globe
			texture = Globe
			scale = 1.5
			pos = (760.0, 240.0)
			just = [center center]
			alpha = 0.6
			z_priority = -1
		}
	endif
	setscreenelementprops {
		id = host_options_vmenu
		event_handlers = [
			{pad_back generic_pause_exit_sound}
			{pad_back ui_change_state params = {state = uistate_pausemenu}}
		]
	}
	if innetgame
		if OnServer
			actual_server = 1
		else
			actual_server = 0
		endif
	else
		actual_server = 1
	endif
	if NOT innetgame
		GetPreferenceString pref_type = network level
		add_cas_menu_item {
			parent = host_options_vmenu
			text = "Level"
			extra_text = <ui_string>
			id = menu_network_host_options_level
			pad_choose_script = launch_level_select_menu
			pad_choose_params = {from_server_options}
		}
	endif
	if OnServer
		if NOT innetgame
			<max_index> = 6
			GetPreferenceString pref_type = network level
			if (<max_index> = 0)
				GetPreferenceString pref_type = network num_players
				add_cas_menu_item {
					parent = host_options_vmenu
					text = "Players"
					extra_text = <ui_string>
					not_focusable = not_focusable
					id = menu_network_host_options_max_players
				}
			else
				GetPreferenceString pref_type = network num_players
				add_cas_menu_item {
					parent = host_options_vmenu
					text = "Players"
					extra_text = <ui_string>
					id = menu_network_host_options_max_players
					pad_choose_script = create_network_host_options_max_players_menu
					pad_choose_params = {max_index = <max_index>}
				}
			endif
		endif
		if ininternetmode
			getpreferencechecksum pref_type = network device_type
			printstruct <...>
			switch <checksum>
				case device_sony_modem
				case device_usb_modem
				nullscript
				default
				GetPreferenceString pref_type = network num_observers
				printstruct <...>
				if NOT netsessionfunc obj = match func = isranked
				endif
			endswitch
		endif
	endif
	if NOT innetgame
		GetPreferenceString pref_type = network team_mode
		theme_menu_add_item {
			parent = host_options_vmenu
			text = "Teams"
			extra_text = <ui_string>
			id = menu_network_host_options_player_team
			option_arrows
			option_arrows_callback = adjust_host_teams
		}
	else
		if gamemodeequals is_lobby
			if ishost
				if OnServer
					netsessionfunc func = getnumplayers
					if (<numplayers> > 1)
						GetPreferenceString pref_type = network team_mode
						add_cas_menu_item {
							parent = host_options_vmenu
							text = "Teams"
							extra_text = <ui_string>
							id = menu_network_host_options_player_team
							option_arrows
							option_arrows_callback = adjust_host_teams
						}
					else
						GetPreferenceString pref_type = network team_mode
						add_cas_menu_item {
							parent = host_options_vmenu
							text = "Teams"
							extra_text = <ui_string>
							id = menu_network_host_options_player_team
							option_arrows
							option_arrows_callback = adjust_host_teams
							not_focusable
						}
					endif
				else
					GetPreferenceString pref_type = network team_mode
					add_cas_menu_item {
						parent = host_options_vmenu
						text = "Teams"
						extra_text = <ui_string>
						id = menu_network_host_options_player_team
						option_arrows
						option_arrows_callback = adjust_host_teams
						first_item
					}
				endif
			endif
		endif
	endif
	if ishost
		if gamemodeequals is_lobby
			if NOT (<actual_server> = 1)
				<last_menu_item> = last_menu_item
			endif
			GetPreferenceString pref_type = network player_collision
			add_cas_menu_item {
				parent = host_options_vmenu
				text = "Collision"
				extra_text = <ui_string>
				last_menu_item = <last_menu_item>
				id = menu_network_host_options_player_collision
				option_arrows
				option_arrows_callback = adjust_host_collision
			}
		endif
	endif
	if (<actual_server> = 1)
		if innetgame
			if NOT gamemodeequals is_lobby
				last_menu_item = last_menu_item
			endif
		endif
		if gamemodeequals is_lobby
			if innetgame
				last_menu_item = last_menu_item
			endif
			if NOT ishost
				<not_focusables> = not_focusable
			endif
			printstruct <not_focusables>
			add_cas_menu_flag_item {
				text = "REVERTS"
				flag = $flag_g_expert_mode_no_reverts
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_reverts}
				reverse
				not_focusable = <not_focusables>
			}
			add_cas_menu_flag_item {
				text = "WALKING"
				flag = $flag_g_expert_mode_no_walking
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_walking}
				reverse
				not_focusable = <not_focusables>
			}
			add_cas_menu_flag_item {
				text = "MANUALS"
				flag = $flag_g_expert_mode_no_manuals
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_manuals}
				reverse
				not_focusable = <not_focusables>
			}
			add_cas_menu_flag_item {
				text = "BAL. METERS"
				flag = $no_g_display_balance
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = no_g_display_balance}
				reverse
				not_focusable = <not_focusables>
			}
		endif
	endif
	if NOT innetgame
		focusable = {}
		getpreferencechecksum pref_type = network level
		add_cas_menu_item {
			parent = host_options_vmenu
			text = "Ready"
			id = menu_network_host_options_ready
			pad_choose_script = chosen_host_game
			last_menu_item = last_menu_item
			<focusable>
		}
	endif
	if infrontend
		runscriptonscreenelement id = Globe rotate_internet_options_globe
	endif
	cas_menu_finish
	if NOT innetgame
		runscriptonscreenelement id = current_menu_anchor set_ready_focus
	endif
endscript

script adjust_host_option_array2 
	if NOT innetgame
		if (<pref_field> = score_mode)
			getcurrentlevel
			if (<level> = load_z_crib)
				soundevent event = Pause_Menu_Scroll_LEFT_SFX
				return
			endif
		endif
	endif
	getarraysize <array>
	if gotparam max_index
		<array_size> = (<max_index> + 1)
	endif
	GetPreferenceString pref_type = <type> <pref_field>
	getpreferencechecksum pref_type = <type> <pref_field>
	<currIndex> = 0
	begin
	printf "the UI checksum is '%s'" s = <checksum>
	printf "the array checksum is '%s'" s = (<array> [<currIndex>].checksum)
	if checksumequals a = <checksum> b = (<array> [<currIndex>].checksum)
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat <array_size>
	if (<currIndex> = <array_size>)
		<currIndex> = 0
	endif
	if gotparam left
		if (<currIndex> > 0)
			<currIndex> = (<currIndex> - 1)
			if gotparam settime
				theTime = (<array> [<currIndex>].time)
			else
				theTime = 0
			endif
			if gotparam setScore
				theScore = (<array> [<currIndex>].score)
			else
				theScore = 0
			endif
			SetPreferencesFromUI prefs = <type> field = <string_field> string = (<array> [<currIndex>].name) time = <theTime> score = <theScore> checksum = (<array> [<currIndex>].checksum)
			setscreenelementprops {
				id = {<id> child = extra_text}
				text = (<array> [<currIndex>].name)
			}
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if (<currIndex> < (<array_size> - 1))
				<currIndex> = (<currIndex> + 1)
				if gotparam settime
					printf "got time"
					theTime = (<array> [<currIndex>].time)
				else
					printf "no time"
					theTime = 0
				endif
				if gotparam setScore
					theScore = (<array> [<currIndex>].score)
				else
					theScore = 0
				endif
				SetPreferencesFromUI prefs = <type> field = <string_field> string = (<array> [<currIndex>].name) time = <theTime> score = <theScore> checksum = (<array> [<currIndex>].checksum)
				setscreenelementprops {
					id = {<id> child = extra_text}
					text = (<array> [<currIndex>].name)
				}
				soundevent event = Pause_Menu_Scroll_RIGHT_SFX
			endif
		endif
	endif
	possibly_hide_cas_arrows container_id = <id> index = <currIndex> size = <array_size>
	if (<pref_field> = score_mode)
		printf "!!!Redraw that shit!!!"
		if innetgame
			create_network_game_options_menu <...> use_grid_index
		else
			create_network_game_options_menu <...> end_run use_grid_index
		endif
	endif
	printstruct <...>
	printf "%d" d = <pref_field>
	if (<pref_field> = walls_mode_type)
		printf "!!!Redraw that shit!!!"
		if innetgame
			create_network_game_options_menu <...> use_grid_index
		else
			create_network_game_options_menu <...> end_run use_grid_index
		endif
	endif
endscript

script adjust_host_option_array 
	getarraysize <array>
	if gotparam max_index
		<array_size> = (<max_index> + 1)
	endif
	getpreferencechecksum pref_type = network <pref_field>
	GetPreferenceString pref_type = network <pref_field>
	<currIndex> = 0
	begin
	printf "the UI checksum is '%s'" s = <checksum>
	printf "the array checksum is '%s'" s = (<array> [<currIndex>].checksum)
	if checksumequals a = <checksum> b = (<array> [<currIndex>].checksum)
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat
	if gotparam left
		if (<currIndex> > 0)
			<currIndex> = (<currIndex> - 1)
			if structurecontains structure = (<array> [<currIndex>]) checksum
				checksum = (<array> [<currIndex>].checksum)
			endif
			SetPreferencesFromUI prefs = network field = <string_field> string = (<array> [<currIndex>].name) checksum = <checksum>
			setscreenelementprops {
				id = {<id> child = extra_text}
				text = (<array> [<currIndex>].name)
			}
		endif
	else
		if gotparam right
			if (<currIndex> < (<array_size> - 1))
				<currIndex> = (<currIndex> + 1)
				if structurecontains structure = (<array> [<currIndex>]) checksum
					checksum = (<array> [<currIndex>].checksum)
				endif
				SetPreferencesFromUI prefs = network field = <string_field> string = (<array> [<currIndex>].name) checksum = <checksum>
				setscreenelementprops {
					id = {<id> child = extra_text}
					text = (<array> [<currIndex>].name)
				}
			endif
		endif
	endif
endscript

script adjust_host_observers 
	if gotparam \{left}
		<dir> = left
		soundevent \{event = Pause_Menu_Scroll_LEFT_SFX}
	else
		<dir> = right
		soundevent \{event = Pause_Menu_Scroll_RIGHT_SFX}
	endif
	adjust_host_option_array pref_field = num_observers string_field = 'num_observers' array = $num_observers_info id = menu_network_host_options_max_observers <dir>
endscript

script adjust_host_teams 
	if gotparam left
		<dir> = left
		soundevent event = Pause_Menu_Scroll_LEFT_SFX
	else
		<dir> = right
		soundevent event = Pause_Menu_Scroll_RIGHT_SFX
	endif
	adjust_host_option_array pref_field = team_mode string_field = 'team_mode' array = $team_types id = menu_network_host_options_player_team <dir>
	printf "test"
	if gamemodeequals is_lobby
		printf "test2"
		getpreferencechecksum pref_type = network team_mode
		printstruct <...>
		switch <checksum>
			case teams_none
			printf "SetNumTeams 0"
			SetNumTeams 0
			case teams_two
			printf "SetNumTeams 2"
			SetNumTeams 2
			case teams_three
			printf "SetNumTeams 3"
			SetNumTeams 3
			case teams_four
			printf "SetNumTeams 4"
			SetNumTeams 4
			default
		endswitch
	endif
	if ininternetmode
		if innetgame
			if OnServer
				netsessionfunc obj = match func = update_game_options
			endif
		endif
	endif
endscript

script adjust_host_collision 
	if gotparam \{left}
		<dir> = left
		soundevent \{event = Pause_Menu_Scroll_LEFT_SFX}
	else
		<dir> = right
		soundevent \{event = Pause_Menu_Scroll_RIGHT_SFX}
	endif
	adjust_host_option_array pref_field = player_collision string_field = 'player_collision' array = $on_off_types id = menu_network_host_options_player_collision <dir>
	if ininternetmode
		if innetgame
			if OnServer
				netsessionfunc \{obj = match
					func = update_game_options}
			endif
		endif
	endif
endscript

script adjust_host_skill_level 
	if gotparam \{left}
		<dir> = left
		soundevent \{event = Pause_Menu_Scroll_LEFT_SFX}
	else
		<dir> = right
		soundevent \{event = Pause_Menu_Scroll_RIGHT_SFX}
	endif
	adjust_host_option_array pref_field = skill_level string_field = 'skill_level' array = $skill_level_info id = menu_network_host_options_skill_level <dir>
endscript

script adjust_host_observers_old 
	pref_type = network pref_field = 'num_observers' array = num_observers_info
	getarraysize $num_observers_info
	if gotparam max_index
		<array_size> = (<max_index> + 1)
	endif
	GetPreferenceString pref_type = network num_observers
	<currIndex> = 0
	begin
	printf "the UI string is '%s'" s = <ui_string>
	printf "the num_obs is '%s'" s = ($num_observers_info [<currIndex>].name)
	if stringequals a = <ui_string> b = ($num_observers_info [<currIndex>].name)
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat
	if gotparam left
		if (<currIndex> > 0)
			<currIndex> = (<currIndex> - 1)
			SetPreferencesFromUI prefs = network field = 'num_observers' string = ($num_observers_info [<currIndex>].name)
			setscreenelementprops {
				id = {menu_network_host_options_max_observers child = extra_text}
				text = ($num_observers_info [<currIndex>].name)
			}
		endif
	else
		if gotparam right
			if (<currIndex> < (<array_size> - 1))
				<currIndex> = (<currIndex> + 1)
				SetPreferencesFromUI prefs = network field = 'num_observers' string = ($num_observers_info [<currIndex>].name)
				setscreenelementprops {
					id = {menu_network_host_options_max_observers child = extra_text}
					text = ($num_observers_info [<currIndex>].name)
				}
			endif
		endif
	endif
endscript

script set_ready_focus 
	launchevent \{type = unfocus
		target = host_options_vmenu}
	launchevent \{type = focus
		target = host_options_vmenu
		data = {
			child_id = menu_network_host_options_ready
		}}
endscript

script chosen_start_game 
	if innetgame
		getpreferencechecksum pref_type = network game_type
		if (<checksum> = netctf)
			if NOT InTeamGame
				SetPreferencesFromUI prefs = network field = 'team_mode' checksum = teams_two string = "2"
				SetNumTeams 2
			endif
		endif
	else
	endif
	printf "--- chosen_start_game LoadPendingPlayers"
	loadpendingplayers
	if IsPendingPlayer
		ForceChangeObservingState state = false
	endif
	if startnetworkgame
		if insplitscreengame
			skater :runstarted
			skater2 :runstarted
		endif
		if objectexists id = current_menu_anchor
			generic_ui_destroy
			kill_start_key_binding
			ui_change_state state = uistate_gameplay
			do_actual_unpause
		endif
	endif
endscript

script stats_start_new_game 
	if netsessionfunc \{obj = match
			func = logged_in}
		netsessionfunc \{obj = stats
			func = start_new_game}
	endif
endscript

script network_options_selected 
	pausemusicandstreams
	hide_current_goal
	launch_network_host_options_menu
endscript

script network_game_options_selected 
	create_network_game_options_menu <...>
endscript

script network_start_selected 
	if OnServer
		chosen_start_game
	else
		FCFSRequestStartGame
		unpause_game_and_destroy_pause_menu
	endif
endscript

script fcfc_end_game_selected 
	report_stats \{final}
	do_backend_retry
endscript

script report_stats 
	if isxenon
		if OnServer
			if ininternetmode
				if netsessionfunc obj = match func = logged_in
					if gotparam final
						netsessionfunc obj = stats func = report_stats params = {final}
					else
						netsessionfunc obj = stats func = report_stats
					endif
				endif
			endif
		endif
	else
		if ininternetmode
			if netsessionfunc obj = match func = logged_in
				if gotparam final
					netsessionfunc obj = stats func = report_stats params = {final}
				else
					netsessionfunc obj = stats func = report_stats
				endif
			endif
		endif
	endif
endscript

script network_end_game_selected 
	printf \{"network_end_game_selected"}
	if gameisover
		pause_game_and_create_pause_menu
		return
	endif
	kill_all_panel_messages
	if insplitscreengame
		SetStatOverride
		gman_deactivateallgoals
		change_gamemode_freeskate_2p
		pause_trick_text
		create_end_run_menu
	else
		report_stats \{final}
		EndNetworkGame
	endif
endscript

script generic_array_menu_setup time = 60
	add_item_script = theme_menu_add_centered_item
	if NOT (<pref_field> = 'game_type')
		if NOT (<pref_field> = 'device_type')
		endif
	endif
	getarraysize <array>
	<array_size> = (<array_size> -1)
	begin
	getnextarrayelement <array>
	if gotparam element
		addparams <element>
		if (<pref_field> = 'game_type')
			focus_script = game_options_focus_script
			focus_params = {description = <description>}
			add_item_script = make_text_sub_menu_item
		endif
		show_option = 1
		if gotparam not_pal
			if ispal
				show_option = 0
			endif
		endif
		if NOT (<array_size> = 0)
			if (<show_option> = 1)
				if gotparam not_available
					theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale>
				else
					if gotparam team_only
						if InTeamGame
							theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...>} focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale>
						else
							theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale>
						endif
					else
						theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...>} focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale>
					endif
				endif
			endif
		else
			if (<show_option> = 1)
				if gotparam not_available
					theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1
				else
					if gotparam team_only
						if InTeamGame
							theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...>} focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1
						else
							theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1
						endif
					else
						theme_menu_add_item text = <name> id = <checksum> font = text_a1 centered = 1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...>} focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale> last_menu_item = 1
					endif
				endif
			endif
		endif
		<array_size> = (<array_size> -1)
		removeparameter not_available
		removeparameter not_in_custom_parks
		removeparameter not_pal
	else
		break
	endif
	repeat
endscript

script generic_array_menu_desc_setup time = 60
	add_item_script = theme_menu_add_centered_item
	printf "generic_array_menu_desc"
	printstruct <...>
	if NOT (<pref_field> = 'game_type')
		if NOT (<pref_field> = 'device_type')
		endif
	endif
	getarraysize <array>
	<array_size> = (<array_size> -1)
	theme_background parent = current_menu_anchor id = bg_box_vmenu width = 3.5 pos = (320.0, 625.0) num_parts = 10.5 z_priority = 1
	begin
	getnextarrayelement <array>
	if gotparam element
		addparams <element>
		if (<pref_field> = 'game_type')
			focus_script = game_options_focus_script
			focus_params = {description = <description>}
			add_item_script = make_text_sub_menu_item
		endif
		show_option = 1
		if gotparam not_pal
			if ispal
				show_option = 0
			endif
		endif
		formattext checksumname = icon_2p <icon>
		if NOT (<array_size> = 0)
			if (<show_option> = 1)
				if gotparam not_available
					theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = text_a1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = (2.7, 0.8) scale = <scale>
				else
					if gotparam team_only
						if InTeamGame
							theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = text_a1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>} unfocus_script = sprite_unfocus highlight_bar_scale = (2.7, 0.8) scale = <scale>
						else
							theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = text_a1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable highlight_bar_scale = (2.7, 0.8) scale = <scale>
						endif
					else
						theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = text_a1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>} unfocus_script = sprite_unfocus highlight_bar_scale = (2.7, 0.8) scale = <scale>
					endif
				endif
			endif
		else
			if (<show_option> = 1)
				if gotparam not_available
					theme_menu_add_item text = <name> id = <checksum> text_pos = (115.0, -5.0) centered no_bg font = text_a1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable static_width = 400 highlight_bar_scale = (2.7, 0.8) scale = <scale>
				else
					if gotparam team_only
						if InTeamGame
							theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = text_a1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>} unfocus_script = sprite_unfocus static_width = 400 highlight_bar_scale = (2.7, 0.8) scale = <scale>
						else
							theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = text_a1 rgba = [80 80 80 128] pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} not_focusable static_width = 400 highlight_bar_scale = (2.7, 0.8) scale = <scale>
						endif
					else
						theme_menu_add_item text = <name> id = <checksum> centered text_pos = (115.0, -5.0) no_bg font = text_a1 pad_choose_script = <call_script> pad_choose_params = {prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time>} focus_script = <focus_script> focus_params = {<focus_params> id = <checksum> icon = <icon_2p> text = <name>} unfocus_script = sprite_unfocus static_width = 400 highlight_bar_scale = (2.7, 0.8) scale = <scale>
					endif
				endif
			endif
		endif
		<array_size> = (<array_size> -1)
		removeparameter not_available
		removeparameter not_in_custom_parks
		removeparameter not_pal
	else
		break
	endif
	repeat
	<bg_box_scale> = (86.0, 15.0)
	<desc_text_scale> = 1
	<desc_text_dims> = (300.0, 75.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = item_bg_box
		padding_scale = 0.5
		texture = black
		z_priority = 0
		scale = <bg_box_scale>
		pos = (320.0, 880.0)
		just = [center top]
		rgba = [0 0 0 200]
	}
	on_rgba = [128 123 20 255]
	off_rgba = [128 128 128 240]
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = item_description_bar
		texture = white2
		scale = (43.0, 0.22)
		pos = (322.0, 894.0)
		just = [center top]
		rgba = <on_rgba>
	}
	createscreenelement {
		type = textblockelement
		parent = current_menu_anchor
		id = item_description_text
		text = ""
		font = text_a1
		dims = <desc_text_dims>
		scale = <desc_text_scale>
		line_spacing = 1
		pos = (320.0, 838.0)
		just = [center top]
		rgba = <off_rgba>
	}
endscript

script game_options_focus_script 
	setscreenelementprops id = item_description_text text = <description> line_spacing = 0.8
	main_theme_focus
	gettags
	icon_color = [122 65 12 240]
	if (no_focus_sound = 1)
		change \{no_focus_sound = 0}
	else
	endif
	wait \{3
		gameframes}
	if objectexists \{id = cur_2p_sprite}
		destroyscreenelement \{id = cur_2p_sprite}
	endif
endscript

script end_network_game 
	kill_all_panel_messages
	dialog_box_exit
	do_backend_retry <...>
endscript

script createserverquitdialog 
	if screenelementexists id = big_black_box
		return
	endif
	hideloadingscreen
	if NOT infrontend
		printf "**** Level was not the skateshop ****"
		gman_deactivateallgoals
		gman_uninitializeallgoals
		gman_setcanstartgoal 0
		kill_net_panel_messages
		destroy_onscreen_keyboard
		force_close_rankings dont_retry
		unpause_game_and_destroy_pause_menu
		hideloadingscreen
		if NOT isobserving
			if objectexists id = skater
				skater :vibrate off
			endif
			exitsurveyormode
		endif
		dialog_box_exit anchor_id = quit_dialog_anchor
		pausegame
		text = "The host has quit. Select OK to leave this game."
		if gotparam reason
			if checksumequals a = <reason> b = out_of_cash
				text = "The host is out of cash! Select OK to leave this game."
			endif
		endif
		create_error_box {
			title = "NOTICE"
			text = <text>
			buttons = [
				{text = "OK" pad_choose_script = quit_network_game}
			]
			delay_input
			delay_input_time = 3000
		}
	else
		printf "*** Level IS the skateshop ***"
	endif
endscript

script create_game_ended_dialog 
	if NOT infrontend
		gman_deactivateallgoals
		kill_net_panel_messages
		destroy_onscreen_keyboard
		force_close_rankings
		unpause_game_and_destroy_pause_menu
		dialog_box_exit anchor_id = quit_dialog_anchor
		if NOT isobserving
			spawnscriptlater create_error_box params = {title = "NOTICE"
				text = "The host has terminated the current game. Select OK to go back to FREESKATE."
				buttons = [{text = "OK" pad_choose_script = end_network_game pad_choose_params = {early_quit}}
				]
				delay_input
			}
		else
			end_network_game
		endif
	endif
endscript

script accept_lost_connection 
	dialog_box_exit
	ClientCleanupAndShutdown
	if EnteringNetGame
		cancel_join_server
	else
		quit_network_game
	endif
endscript

script createlostconnectiondialog 
	printf "--- CreateLostConnectionDialog"
	hideloadingscreen
	gman_deactivateallgoals
	gman_uninitializeallgoals
	gman_setcanstartgoal 0
	unpause_game_and_destroy_pause_menu
	destroy_onscreen_keyboard
	force_close_rankings dont_retry
	if innetgame
		if localskaterexists
			skater :vibrate off
		endif
	endif
	if NOT isobserving
		exitsurveyormode
	endif
	dialog_box_exit
	dialog_box_exit anchor_id = link_lost_dialog_anchor
	dialog_box_exit anchor_id = quit_dialog_anchor
	kill_start_key_binding
	create_error_box {title = "NOTICE"
		text = "You have lost connection to the host. Select OK to leave this game."
		buttons = [{text = "OK" pad_choose_script = accept_lost_connection}
		]
		delay_input
	}
endscript

script BackToServerListFromJoinRefusedDialog 
	printf \{"BackToServerListFromJoinRefusedDialog"}
	dialog_box_exit
	back_to_game_selection_menu
	ui_change_state \{state = UIstate_net_view_goals}
endscript

script createjoinrefuseddialog 
	printf \{"--- CreateJoinRefusedDialog"}
	if innetgame
		printstruct <...>
		create_dialog_box {title = $net_refused_msg
			text = $<reason>
			buttons = [{text = "OK" pad_choose_script = dialog_box_exit}
			]
		}
	else
		if gotparam \{just_dialog}
			spawnscriptlater CreateJoinRefusedDialog_spawned params = {<...>}
		else
			cancel_join_server show_refused_dialog <...>
		endif
	endif
endscript

script CreateJoinRefusedDialog_spawned 
	printf \{"--- CreateJoinRefusedDialog_spawned"}
	wait \{1
		second}
	create_dialog_box {title = $net_refused_msg
		text = $<reason>
		buttons = [{text = "OK" pad_choose_script = BackToServerListFromJoinRefusedDialog}
		]
	}
endscript

script create_refused_dialog 
	if innetgame
		create_dialog_box {title = $net_refused_msg
			text = $<reason>
			buttons = [{text = "OK" pad_choose_script = dialog_box_exit}
			]
		}
	else
		create_dialog_box {title = $net_refused_msg
			text = $<reason>
			buttons = [{text = "OK" pad_choose_script = BackToServerListFromJoinRefusedDialog}
			]
		}
	endif
endscript

script reattempt_join_server 
	ReattemptJoinServer
endscript

script cancel_join_server 
	hideloadingscreen
	printf "cancel_join_server"
	printstruct <...>
	if gotparam cancel_nn
		netsessionfunc obj = match func = cancel_nat_negotiation
	endif
	destroy_onscreen_keyboard
	dialog_box_exit
	if ininternetmode
		netsessionfunc obj = match func = cancel_join_server
		restart_local_server
		setnetworkmode $internet_mode
	endif
	printf "Here we are!!!"
	if gotparam show_timeout
		printf "GotParam show_timeout"
		create_join_timeout_dialog
	else
		if gotparam show_refused_dialog
			create_refused_dialog <...>
		else
			if ($net_entered_from_singleplayer = 1)
				printf "entered from singleplayer"
				net_view_goals_cancel_join
			elseif gotparam ps3_frontend_conn_lost_hack
			else
				back_to_game_selection_menu
			endif
		endif
	endif
	if NOT infrontend
		change_gamemode_career
	endif
	if ($net_entered_from_singleplayer = 0)
		kill_start_key_binding
	endif
endscript

script createenterpasswordcontrol 
	dialog_box_exit
endscript

script try_password 
	keyboard_current_string :text_getstring
	destroy_onscreen_keyboard
	JoinWithPassword <...>
endscript

script creategameinprogressdialog 
	dialog_box_exit
	kill_start_key_binding
	create_dialog_box \{title = $net_status_msg
		text = $net_message_game_in_progress
		buttons = [
			{
				text = "CANCEL"
				pad_choose_script = cancel_join_server
			}
		]}
endscript

script createconnectingdialog 
	kill_start_key_binding
	pausemusicandstreams
	create_dialog_box \{title = $net_status_msg
		text = $net_status_connecting
		no_animate
		buttons = [
			{
				text = "CANCEL"
				pad_choose_script = cancel_join_server
			}
		]
		vmenu_width = 500}
	if screenelementexists \{id = {
				dialog_box_vmenu
				child = dialog_text
			}}
		runscriptonscreenelement \{id = {
				dialog_box_vmenu
				child = dialog_text
			}
			net_animate_dotdotdot_text}
	endif
endscript

script net_animate_dotdotdot_text 
	printf "--- net_animate_dotdotdot_text"
	obj_getid
	<objid> :gettags
	<objid> :getprops
	printstruct <...>
	if gotparam the_text
		orig_text = <the_text>
		full_text = <the_text>
		i = 0
		dots = ""
		begin
		switch <i>
			case 0
			dots = ""
			case 1
			dots = "."
			case 2
			dots = ".."
			case 3
			dots = "..."
		endswitch
		formattext textname = full_text "%d%e" d = <orig_text> e = <dots>
		printstruct <...>
		<objid> :setprops text = <full_text>
		wait 1 seconds
		i = (<i> + 1)
		if (<i> = 4)
			i = 0
		endif
		repeat
	endif
endscript

script createjoiningdialog 
	dialog_box_exit
	kill_start_key_binding
	create_dialog_box \{title = $net_status_msg
		text = $net_status_joining
		no_animate
		buttons = [
			{
				text = "CANCEL"
				pad_choose_script = cancel_join_server
			}
		]}
endscript

script createtryingpassworddialog 
	kill_start_key_binding
	pausemusicandstreams
	create_dialog_box \{title = $net_status_msg
		text = $net_status_trying_password
		no_animate
		buttons = [
			{
				text = "CANCEL"
				pad_choose_script = cancel_join_server
			}
		]}
endscript

script wait_for_players 
	dialog_box_exit
	create_net_panel_message \{text = net_message_game_will_start}
endscript

script dont_wait_for_players 
	dialog_box_exit
	DropPendingPlayers
endscript

script createwaitforplayersdialog 
	if objectexists id = pause_menu
		unpause_game_and_destroy_pause_menu
	endif
	destroy_onscreen_keyboard
	if screenelementexists id = link_lost_dialog_anchor
		return
	endif
	if netsessionfunc obj = match func = isranked
		dont_wait_for_players
	else
		create_error_box {title = $net_status_msg
			text = $net_message_waiting_for_players
			no_animate
			buttons = [
				{text = "WAIT" pad_choose_script = wait_for_players}
				{text = "CANCEL" pad_choose_script = dont_wait_for_players}
			]
			no_animate
			delay_input
		}
	endif
endscript

script back_from_join_timeout 
	dialog_box_exit
	back_to_game_selection_menu
endscript

script showjointimeoutnotice 
	cancel_join_server \{show_timeout}
endscript

script create_join_timeout_dialog 
	dialog_box_exit
	create_dialog_box \{title = $net_status_msg
		text = $net_status_join_timeout
		buttons = [
			{
				text = "OK"
				pad_choose_script = back_from_join_timeout
			}
		]}
endscript

script create_join_failed_dialog 
	create_dialog_box \{title = $net_status_msg
		text = $net_status_join_failed
		buttons = [
			{
				text = "OK"
				pad_choose_script = cancel_join_server
			}
		]}
endscript

script exit_net_menus 
	dialog_box_exit
	setgametype \{career}
	setcurrentgametype
	create_main_menu
endscript

script create_link_unplugged_front_end_dialog 
	printf \{"script create_link_unplugged_front_end_dialog"}
	if (isxenon)
		lost_connection_to_live \{menu_text = net_error_unplugged_front_end}
	else
		lost_connection_to_gamespy \{via_cable_unplugged}
	endif
endscript

script link_unplugged_ok 
	dialog_box_exit anchor_id = quit_dialog_anchor no_pad_start
	dialog_box_exit anchor_id = link_lost_dialog_anchor no_pad_start
	<found_menu> = 0
	if screenelementexists id = current_menu_anchor
		<found_menu> = 1
		doscreenelementmorph {
			id = current_menu_anchor
			scale = 1
		}
		launchevent type = focus target = current_menu_anchor
	endif
	if screenelementexists id = homie_menu_anchor
		launchevent type = focus target = homie_vmenu
		<found_menu> = 1
	else
		if screenelementexists id = current_menu
			<found_menu> = 1
			launchevent type = focus target = current_menu
		endif
		if screenelementexists id = sub_menu
			<found_menu> = 1
			launchevent type = focus target = sub_menu
		endif
	endif
	if NOT infrontend
		if (<found_menu> = 0)
			if skatercamanimfinished
				pause_game_and_create_pause_menu
			else
			endif
		endif
	endif
endscript

script link_unplugged_quit 
	dialog_box_exit \{anchor_id = link_lost_dialog_anchor
		no_pad_start}
	launch_quit_game_dialog
endscript

script create_link_unplugged_dialog 
	printf "script create_link_unplugged_dialog"
	if (isxenon)
		if infrontend
			return
		endif
	else
		if infrontend
			printf "setting the hack"
			ps3_frontend_conn_lost_hack = 1
		endif
	endif
	if screenelementexists id = net_horse_layout_info_dialog
		destroyscreenelement id = net_horse_layout_info_dialog
		destroyscreenelement id = net_horse_menu_cont
	endif
	if screenelementexists id = dialog_box_anchor
	endif
	if screenelementexists id = quit_dialog_anchor
		return
	endif
	if screenelementexists id = controller_unplugged_dialog_anchor
		return
	endif
	if screenelementexists id = current_menu_anchor
		doscreenelementmorph {
			id = current_menu_anchor
			scale = 0
		}
		launchevent type = unfocus target = current_menu_anchor
	endif
	if screenelementexists id = current_menu
		launchevent type = unfocus target = current_menu
	endif
	destroy_onscreen_keyboard
	text = $net_error_unplugged_front_end
	if gamemodeequals is_career
		text = "Your network connection has been disconnected. Select Ok to exit out of this menu."
	else
		pausegame
	endif
	dialog_box_exit
	hideloadingscreen
	create_error_box {
		title = $net_status_msg
		anchor_id = link_lost_dialog_anchor
		text = <text>
		buttons = [
			{text = "ok" pad_choose_script = live_connection_loss_back pad_choose_params = {ps3_frontend_conn_lost_hack = <ps3_frontend_conn_lost_hack>}}
		]
		no_animate
	}
	kill_start_key_binding
endscript

script exit_async_dialog 
	dialog_box_exit
	if gameisover
		do_backend_retry
	endif
endscript

script createnotposteddialog 
	kill_all_panel_messages
	create_error_box \{title = net_error_msg
		text = net_status_not_posted
		buttons = [
			{
				text = "ok"
				pad_choose_script = exit_async_dialog
			}
		]
		no_animate
		delay_input
		z_priority = 50}
endscript

script create_net_panel_message msg_time = 2000 pos = (500.0, 280.0) final_pos = (500.0, 280.0)
	root_window :getsingletag menu_state
	<show_message> = 0
	if gotparam force
		<show_message> = 1
	endif
	if (<menu_state> = off)
		<show_message> = 1
	endif
	printf "--- create_net_panel_message"
	printstruct <...>
	if (<show_message> = 1)
		if gotparam waiting_style
			printf "do the waiting style!"
			create_wheel_panel_block {
				id = net_panel_msg
				text = <text>
				parent = root_window
				time = <msg_time>
				net_die
			}
		else
			if innetgame
				net_rounds_create_panel_message text = <text> msg_time = <msg_time>
			else
				create_panel_block {
					id = net_panel_msg
					<...>
					parent = root_window
					time = <msg_time>
					style = panel_message_goal
					pos = <pos>
					final_pos = <final_pos>
					rgba = [144 144 144 128]
					dims = (400.0, 0.0)
					z_priority = 200
					font_face = text_a1
					net_die
				}
			endif
		endif
	endif
endscript

script kill_net_panel_messages 
	console_clear
	if objectexists id = net_panel_msg
		destroyscreenelement id = net_panel_msg
	endif
	if objectexists id = taunt_msg_id
		destroyscreenelement id = taunt_msg_id
	endif
	if screenelementexists id = perfect
		destroyscreenelement id = perfect
	endif
	if screenelementexists id = perfect2
		destroyscreenelement id = perfect2
	endif
	if screenelementexists id = death_message
		destroyscreenelement id = death_message
	endif
	if objectexists id = speech_box_anchor
		doscreenelementmorph id = speech_box_anchor scale = 0
	endif
	if screenelementexists id = goal_start_dialog
		destroyscreenelement id = goal_start_dialog
	endif
	if objectexists id = ped_speech_dialog
		destroyscreenelement id = ped_speech_dialog
	endif
	if objectexists id = goal_retry_anchor
		destroyscreenelement id = goal_retry_anchor
	endif
	if objectexists id = first_time_goal_info
		destroyscreenelement id = first_time_goal_info
	endif
	getarraysize $goal_panel_message_ids
	<index> = 0
	begin
	if screenelementexists id = ($goal_panel_message_ids [<index>])
		destroyscreenelement id = ($goal_panel_message_ids [<index>])
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script cancel_connect_to_internet 
	dialog_box_exit
	CancelConnectToInternet
endscript

script disconnect_from_live 
	killspawnedscript \{name = async_xbox_login}
	if istrue \{$signedin}
		cleanup_sessionfuncs
		change \{signedin = 0}
		xboxlive_lost_connection_ui_cleanup
	endif
	xboxlive_logon_status_update \{text = "Not Signed In"}
endscript

script live_connection_loss_back 
	printf "live_connection_loss_back"
	dialog_box_exit
	dialog_box_exit anchor_id = link_lost_dialog_anchor
	if NOT infrontend
		printf "live_connection_loss_back."
		if NOT innetgame
			printf "live_connection_loss_back.."
			net_view_goals_normal_back
		else
			printf "live_connection_loss_back..."
			quit_network_game dont_reset_net_game_type
		endif
	else
		printf "live_connection_loss_back..."
		if screenelementexists id = pause_map_container
			destroyscreenelement id = pause_map_container
		endif
		if netsessionfunc obj = session func = has_active_session
			if NOT (netsessionfunc obj = session func = is_singleplayer_session)
				netsessionfunc obj = session func = unpost_game
				leaveserver
				cancel_join_server ps3_frontend_conn_lost_hack
				ui_change_state state = uistate_mainmenu
			endif
		else
			back_from_internet_options sign_out
		endif
	endif
endscript

script lost_connection_to_live menu_text = net_status_live_lost_connection
	show_dialog = 0
	if gamemodeequals is_net
		<show_dialog> = 1
	endif
	if innetgame
		<show_dialog> = 1
	endif
	disconnect_from_live
	if (<show_dialog> = 0)
		if Is xenon
			create_panel_block id = test_msg text = <menu_text> time = 7000 parent = root_window pos = (320.0, 320.0) rgba = [144 144 144 128] dims = (450.0, 0.0) z_priority = 200 time = <msg_time> font_face = text_a1
		else
			create_panel_block id = test_msg text = $net_status_live_lost_connection_non_xbox time = 7000 parent = root_window pos = (320.0, 320.0) rgba = [144 144 144 128] dims = (450.0, 0.0) z_priority = 200 time = <msg_time> font_face = text_a1
		endif
		return
	endif
	if screenelementexists id = quit_dialog_anchor
		return
	endif
	if screenelementexists id = link_lost_dialog_anchor
		return
	endif
	if screenelementexists id = controller_unplugged_dialog_anchor
		return
	endif
	if screenelementexists id = dialog_box_anchor
		dialog_box_exit
	endif
	if screenelementexists id = current_menu_anchor
		doscreenelementmorph {
			id = current_menu_anchor
			scale = 0
		}
		launchevent type = unfocus target = current_menu_anchor
	endif
	if screenelementexists id = current_menu
		launchevent type = unfocus target = current_menu
	endif
	destroy_onscreen_keyboard
	create_error_box {title = $net_status_msg
		text = <menu_text>
		anchor_id = link_lost_dialog_anchor
		buttons = [
			{text = "ok" pad_choose_script = live_connection_loss_back}
		]
	}
	kill_start_key_binding
endscript

script add_multiplayer_mode_goals 
endscript

script create_score_menu 
	if NOT objectexists id = net_score_menu
		setscreenelementlock id = root_window off
		createscreenelement {
			type = containerelement
			parent = root_window
			id = net_score_menu
			pos = (80.0, 20.0)
			just = [left top]
			scale = 0
			dims = (640.0, 480.0)
			not_focusable
		}
		createscreenelement {
			type = vmenu
			parent = net_score_menu
			id = net_score_vmenu
			just = [left top]
			pos = (45.0, 80.0)
			scale = 0.5
			padding_scale = 1
			internal_scale = 1
			internal_just = [left top]
		}
		<index> = 1
		begin
		formattext checksumname = current_id 'net_score_%i' i = <index>
		createscreenelement {
			type = containerelement
			parent = net_score_vmenu
			id = <current_id>
			not_focusable
			z_priority = -5
			dims = (30.0, 40.0)
			scale = (1.0, 0.7)
		}
		<index> = (<index> + 1)
		repeat $MAXNUMBEROFPLAYERS
		runscriptonscreenelement id = net_score_menu menu_onscreen params = {preserve_menu_state}
	endif
endscript

script clear_scores 
	if objectexists id = net_score_menu
		<index> = 1
		begin
		formattext checksumname = current_id 'net_score_%i' i = <index>
		if screenelementexists id = <current_id>
			if screenelementexists id = {<current_id> child = gamertag}
				setscreenelementprops {
					id = {<current_id> child = gamertag}
					text = ""
				}
			endif
			if screenelementexists id = {<current_id> child = score}
				setscreenelementprops {
					id = {<current_id> child = score}
					text = ""
				}
			endif
			if screenelementexists id = {<current_id> child = highlight}
				setscreenelementprops {
					id = {<current_id> child = highlight}
					rgba = [0 0 0 0]
				}
			endif
			if screenelementexists id = {<current_id> child = combo_icon}
				destroyscreenelement id = {<current_id> child = combo_icon}
			endif
			resolvescreenelementid id = {<current_id> child = voice}
			if screenelementexists id = <resolved_id>
				destroyscreenelement id = <resolved_id>
			endif
		else
			printf "clear_scores : element %s doesn't exist" s = current_id
		endif
		<index> = (<index> + 1)
		repeat $MAXNUMBEROFPLAYERS
	endif
endscript

script update_score 
	if getglobalflag flag = $no_display_net_scores
		hide_net_scores
	elseif objectexists id = current_menu_anchor
		hide_net_scores
	else
		unhide_net_scores
	endif
	obj_getid
	z_priority = 1
	text_scale = (0.7, 0.9)
	text_color = [255 255 255 255]
	just = [left top]
	shadow = shadow
	shadow_offs = (4.0, 4.0)
	shadow_rgba = [64 64 64 255]
	if NOT screenelementexists id = {<objid> child = gamertag}
		createscreenelement {
			local_id = gamertag
			parent = <objid>
			type = textelement
			font = text_a1
			rgba = <text_color>
			text = ""
			scale = <text_scale>
			just = <just>
			z_priority = <z_priority>
			shadow = <shadow>
			shadow_offs = <shadow_offs>
			shadow_rgba = <shadow_rgba>
		}
	endif
	setscreenelementprops {
		id = {<objid> child = gamertag}
		text = <player_name>
	}
	getscreenelementdims id = {<objid> child = gamertag}
	max_gamertag_width = 180
	if (<width> > <max_gamertag_width>)
		setscreenelementprops {
			id = {<objid> child = gamertag}
			scale = ((1.0, 0.0) + (0.0, 1.0) * (<text_scale>.(0.0, 1.0)))
		}
		scale_element_to_size {
			id = {<objid> child = gamertag}
			target_width = <max_gamertag_width>
		}
	endif
	getscreenelementdims id = {<objid> child = gamertag}
	text_height = <height>
	text_width = <width>
	score_pos = ((1.0, 0.0) * <max_gamertag_width> + (20.0, 0.0))
	if NOT screenelementexists id = {<objid> child = score}
		createscreenelement {
			local_id = score
			parent = <objid>
			type = textelement
			font = text_a1
			rgba = <text_color>
			text = ""
			pos = <score_pos>
			scale = <text_scale>
			just = <just>
			z_priority = <z_priority>
			shadow = <shadow>
			shadow_offs = <shadow_offs>
			shadow_rgba = <shadow_rgba>
		}
	endif
	if checksumequals a = <show_score> b = true
		formattext textname = score_text "%d" d = <score>
		setscreenelementprops {
			id = {<objid> child = score}
			text = <score_text>
		}
	else
		setscreenelementprops {
			id = {<objid> child = score}
			text = ""
		}
	endif
	if NOT screenelementexists id = {<objid> child = highlight}
		createscreenelement {
			local_id = highlight
			type = spriteelement
			parent = <objid>
			texture = menu_highlight
			rgba = [0 0 0 0]
			just = <just>
			z_priority = <bg_priority>
		}
	endif
	if gotparam is_me
		setscreenelementprops {
			id = {<objid> child = highlight}
			rgba = ($graffitiColors [<color_index>])
			scale = 1
			pos = (-20.0, -3.0)
		}
		scale_element_to_size {
			id = {<objid> child = highlight}
			target_height = (<text_height> + 6)
			target_width = (<text_width> + 40)
		}
	elseif InTeamGame
		setscreenelementprops {
			id = {<objid> child = highlight}
			rgba = ($graffitiColors [<color_index>])
			scale = 1
			pos = (-20.0, -3.0)
		}
		scale_element_to_size {
			id = {<objid> child = highlight}
			target_height = (<text_height> + 6)
			target_width = (<text_width> + 40)
		}
	else
		setscreenelementprops {
			id = {<objid> child = highlight}
			rgba = [0 0 0 0]
			scale = 1
			pos = (-20.0, -3.0)
		}
	endif
	if screenelementexists id = {<objid> child = combo_icon}
		destroyscreenelement id = {<objid> child = combo_icon}
	endif
	if (<combo_state> = 0)
	elseif (<combo_state> = 1)
		icon_tex = icon_small_am
		icon_dim = 25
	elseif (<combo_state> = 2)
		icon_tex = icon_small_pro
		icon_dim = 40
	elseif (<combo_state> = 3)
		icon_tex = icon_small_sick
		icon_dim = 40
	endif
	yo = 0
	if gotparam is_me
		yo = 1
	endif
	if (<combo_state> > 0)
		x_offset = 0
		if screenelementexists id = {<objid> child = score}
			getscreenelementdims id = {<objid> child = score}
		endif
		x_offset = (<width> + 10)
		createscreenelement {
			type = containerelement
			parent = <objid>
			local_id = combo_icon
			pos = (<score_pos> + <x_offset> * (1.0, 0.0))
			just = [left top]
		}
		icon_cont = <id>
		createscreenelement {
			type = spriteelement
			parent = <icon_cont>
			texture = <icon_tex>
			rgba = ($graffitiColors [<color_index>])
			just = [left top]
			z_priority = 10
		}
		scale_element_to_size {
			id = <id>
			target_width = <icon_dim>
			target_height = <icon_dim>
		}
	endif
	resolvescreenelementid id = {<objid> child = voice}
	if screenelementexists id = <resolved_id>
		destroyscreenelement id = <resolved_id>
	endif
	if (isxenon)
		if NOT gotparam noicon
			rgba = [128 128 128 128]
			if gotparam ismuted
				texture = voicemute
			else
				if gotparam hasheadset
					texture = voiceon
				else
					if gotparam voiceoverspeaker
						texture = voicetv
					endif
				endif
			endif
			getscreenelementprops id = <objid>
			if gotparam talking
				rgba = [0 128 0 128]
				scale = 1
			else
				scale = 1
			endif
			createscreenelement {
				type = spriteelement
				parent = <objid>
				local_id = voice
				texture = <texture>
				rgba = <rgba>
				just = [left center]
				pos = (-45.0, 25.0)
				scale = <scale>
				z_priority = 10
			}
		endif
	endif
endscript

script entered_network_game 
	printf \{"script entered_network_game"}
	kill_net_panel_messages
	console_unhide
	restore_start_key_binding
	if localskaterexists
		refresh_skater_model_for_cheats
	endif
	if OnServer
		ClearOmnigons
	endif
	EnteredNetworkGame
endscript

script restart_local_server 
	printf \{"--- restart_local_server"}
	setnetworkmode
	setservermode \{on}
	setjoinmode \{$join_mode_play}
	startserver
	joinserver <...>
endscript

script back_from_profile_options 
	launchevent \{type = unfocus
		target = profile_options_menu}
	destroyscreenelement \{id = profile_options_anchor}
	launchevent \{type = focus
		target = sub_menu}
endscript

script back_from_profile_error 
	dialog_box_exit
	create_internet_options
endscript

script start_track_usage 
	spawnscriptlater \{track_usage}
endscript

script track_usage 
	printf "--- track_usage"
	printf "*** track_usage ***"
	dialog_box_exit
	create_dialog_box {
		title = $net_status_msg
		text = net_status_checking_motd
		no_animate
	}
	wait 10 frames
	netsessionfunc func = content_init
	netsessionfunc obj = content func = track_usage
	begin
	netsessionfunc obj = content func = transfer_think
	if netsessionfunc obj = content func = is_transfer_complete
		break
	endif
	wait 1 frame
	repeat
	wait 1 frame
	netsessionfunc func = content_uninit
	proceed_to_motd
endscript

script proceed_to_motd 
	printf \{"--- proceed_to_motd"}
	if istrue \{$NeedsToDownloadMOTD}
		spawnscriptlater \{download_motd}
	else
		if objectexists \{id = current_menu_anchor}
			destroyscreenelement \{id = current_menu_anchor}
		endif
		if netsessionfunc \{obj = presence
				func = profile_exists}
			netsessionfunc \{obj = presence
				func = profile_login}
		else
			create_profile_warning_dialog
		endif
	endif
endscript

script profile_connect 
	dialog_box_exit
	if NOT netsessionfunc \{func = presence_started}
		netsessionfunc \{func = presence_init}
	endif
	if netsessionfunc \{obj = presence
			func = profile_exists}
		netsessionfunc \{obj = presence
			func = profile_login}
	else
		create_profile_warning_dialog
	endif
endscript

script launch_profile_menu 
	dialog_box_exit
	if NOT screenelementexists \{id = menu_play_online}
		create_internet_options
	endif
	create_profile_menu
endscript

script launch_player_list_menu 
	hide_current_goal
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if insplitscreengame
		goalmanager_hidepoints
	endif
	make_new_themed_sub_menu title = "PLAYER LIST" dims = (200.0, 237.0) pos = (229.0, 80.0) right_bracket_z = 1
	setscreenelementprops {id = sub_menu event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = pause_game_and_create_pause_menu}}
		]
	}
	create_helper_text $generic_helper_text
	netsessionfunc obj = presence func = fill_potential_friends_list params = {start = 0 num = 16}
	theme_menu_add_item text = " " not_focusable centered
	theme_menu_add_item text = "Done" pad_choose_script = pause_game_and_create_pause_menu centered last_menu_item = last_menu_item
	finish_themed_sub_menu
	printf "endscript laungh_player_list_menu"
endscript

script StartFreeSkate 
	MakeSkaterGosub \{add_skater_to_world
		skater = 0}
	MakeSkaterGosub \{add_skater_to_world
		skater = 1}
	setgametype \{freeskate2p}
	setcurrentgametype
	SetScreenModeFromGameMode
	ScreenElementSystemCleanup
endscript

script kill_all_panel_messages 
	do_actual_unpause <...>
	dialog_box_exit anchor_id = quit_dialog_anchor
	dialog_box_exit
	speech_box_exit
	force_close_rankings
	close_goals_menu
	kill_net_panel_messages
	destroy_onscreen_keyboard
	if objectexists id = perfect
		destroyscreenelement id = perfect
	endif
	if objectexists id = perfect2
		destroyscreenelement id = perfect2
	endif
	if objectexists id = death_message
		destroyscreenelement id = death_message
	endif
	if objectexists id = leaving_message
		destroyscreenelement id = leaving_message
	endif
	if objectexists id = goal_message
		destroyscreenelement id = goal_message
	endif
endscript

script startingnewnetgame 
	sound_options_exit \{just_remove}
	edit_tricks_menu_exit \{just_remove}
	kill_all_panel_messages
	ui_change_state \{state = uistate_gameplay}
	if NOT isobserving
		skater :runstarted
	endif
	ClearPowerups
	if NOT isobserving
		exitsurveyormode
	endif
endscript

script unlock_root_window 
	setscreenelementlock \{id = root_window
		off}
endscript

script create_object_label 
	if NOT gotparam \{pos3d}
		pos3d = (0.0, 0.0, 0.0)
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement {
		id = <id>
		type = textelement
		parent = root_window
		font = text_a1
		text = ""
		scale = 10.0
		pos3d = <pos3d>
		rgba = [128 128 0 128]
		z_priority = -1
	}
endscript

script destroy_object_label 
	if objectexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script destroy_all_player_names 
	if objectexists id = skater_name_0
		destroyscreenelement id = skater_name_0
	endif
	if objectexists id = skater_name_1
		destroyscreenelement id = skater_name_1
	endif
	if objectexists id = skater_name_2
		destroyscreenelement id = skater_name_2
	endif
	if objectexists id = skater_name_3
		destroyscreenelement id = skater_name_3
	endif
	if objectexists id = skater_name_4
		destroyscreenelement id = skater_name_4
	endif
	if objectexists id = skater_name_5
		destroyscreenelement id = skater_name_5
	endif
	if objectexists id = skater_name_6
		destroyscreenelement id = skater_name_6
	endif
	if objectexists id = skater_name_7
		destroyscreenelement id = skater_name_7
	endif
endscript

script create_net_metrics 
	setscreenelementlock id = root_window off
	createscreenelement {
		id = net_metrics
		type = textelement
		parent = root_window
		font = text_a1
		text = ""
		scale = 0.4
		pos = (150.0, 400.0)
		rgba = [128 128 128 128]
	}
	createscreenelement {
		id = net_metrics1
		type = textelement
		parent = root_window
		font = text_a1
		text = ""
		scale = 0.4
		pos = (150.0, 415.0)
		rgba = [128 128 128 128]
	}
	createscreenelement {
		id = net_metrics2
		type = textelement
		parent = root_window
		font = text_a1
		text = ""
		scale = 0.4
		pos = (150.0, 430.0)
		rgba = [128 128 128 128]
	}
endscript

script update_net_metrics 
	if NOT objectexists \{id = net_metrics}
		create_net_metrics
	endif
	setscreenelementprops {
		id = net_metrics
		text = <text>
	}
	if gotparam \{text1}
		setscreenelementprops {
			id = net_metrics1
			text = <text1>
		}
	endif
	if gotparam \{text2}
		setscreenelementprops {
			id = net_metrics2
			text = <text2>
		}
	endif
endscript

script create_net_time 
	printf \{"create_net_time"}
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{id = net_time
		type = textelement
		parent = root_window
		font = text_a1
		text = "test"
		scale = 0.8
		pos = (1100.0, 100.0)
		rgba = [
			128
			128
			128
			255
		]
		z_priority}
endscript

script update_net_time 
	if NOT objectexists \{id = net_time}
		create_net_time
	endif
	formattext textname = timetext "- %d -" d = <nettime>
	setscreenelementprops {
		id = net_time
		text = <timetext>
	}
endscript

script notify_cheating 
	create_net_panel_message \{msg_time = 6000
		text = net_message_server_cheating}
endscript

script notify_client_cheating 
	formattext textname = msg_text "Player %s is cheating!" s = <string0>
	create_net_panel_message \{msg_time = 6000
		text = "At least one player is cheating!"
		style = net_team_panel_message}
endscript

script warn_all_same_team 
	ui_display_message \{type = uberalert
		text = "WARNING: All players are on the same team"
		color = red
		time = 5}
endscript

script initselectedgoals 
	GoalManager_InitializeAllSelectedGoals
	GetGoalsMode
	GoalManager_ActivateAllSelectedGoals
endscript
judge_full_name = "Judge"

script main_menu_exit_to_online 
	printf \{"--- main_menu_exit_to_online"}
	xenon_live_start
	select_thug_online_play \{change_gamemode = change_gamemode_net
		do_loading_logo}
endscript

script net_display_background_movie 
	printf \{"--- net_display_background_movie"}
	spawnscriptnow \{pause_menu_fmv_play}
	create_dialog_box \{title = "STATUS"
		text = "Searching for your invited game..."
		text_dims = (500.0, 0.0)
		text_font = text_a1}
endscript

script get_current_level_name 
	if gotparam \{level}
		GetLevelStructureName <...>
	else
		GetLevelStructureName
	endif
	level_struct = <level_structure_name>
	return level_name = (<level_structure_name>.name) level_load_script = (<level_structure_name>.load_script) level = (<level>)
endscript

script signinchanged 
	lost_connection_to_live \{menu_text = net_status_live_lost_connection_dupe}
endscript

script startgamewithrainbowwalls 
	printf \{"StartGameWithRainbowWalls on with 2 players!"}
	StartGoal_WallGame
endscript

script stopgamewithrainbowwalls 
endscript

script test_leaderboard_gui 
	netsessionfunc \{obj = stats
		func = get_stats
		params = {
			leaderboard_id = leaderboard_test
			callback = test_leaderboard_callback
			num_rows = 10
			offset = 1
		}}
endscript

script testOnlineLevels 
	loadpak \{'zones/z_online_skatepark/Z_Online_Skatepark.pak'}
endscript

script unTestOnlineLevels 
	unloadpak \{'zones/z_online_skatepark/Z_Online_Skatepark.pak'}
endscript
net_observer_bg_active = 0

script throwupobserverbg 
	printf \{"ThrowUpObserverBG"}
	EnteredNetworkGame
endscript

script removeobserverbg 
	printf \{"RemoveObserverBG"}
	if NOT gotparam \{nowait}
		wait \{2
			seconds}
	endif
	pause_menu_fmv_kill
	if ($net_observer_bg_active = 1)
		change \{net_observer_bg_active = 0}
		killmovie \{textureslot = 0}
	endif
	kill_panel_message_if_it_exists \{id = mp_observer_text}
	if screenelementexists \{id = net_observer_bg}
		destroyscreenelement \{id = net_observer_bg}
	endif
endscript

script DisplayBytesPerSecond 
	if NOT screenelementexists id = NetBytesAnchor
		printf "recreating NetBytesAnchor"
		setscreenelementlock id = root_window off
		createscreenelement {
			type = containerelement
			parent = root_window
			id = NetBytesAnchor
			pos = (200.0, 40.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = NetBytesAnchor
			id = net_bytes_per_second
			font = text_a1
			text = "hello!"
			scale = 0.4
			pos = (340.0, 345.0)
			rgba = [60 128 60 128]
		}
		createscreenelement {
			type = textelement
			parent = NetBytesAnchor
			id = net_bytes_per_second2
			font = text_a1
			text = "Nurse!"
			scale = 0.4
			pos = (340.0, 360.0)
			rgba = [60 128 60 128]
		}
		createscreenelement {
			type = textelement
			parent = NetBytesAnchor
			id = net_bytes_per_second3
			font = text_a1
			text = "Nurse!"
			scale = 0.4
			pos = (340.0, 375.0)
			rgba = [60 128 60 128]
		}
		setscreenelementlock id = root_window on
	endif
	formattext textname = msg_text "Recv: %d (%f / %a)" d = <recv_kbytes> f = <peak_recv> a = <avg_recv>
	setscreenelementprops {
		id = net_bytes_per_second
		text = <msg_text>
	}
	formattext textname = msg_text "Send: %d (%f / %a)" d = <send_kbytes> f = <peak_send> a = <avg_send>
	setscreenelementprops {
		id = net_bytes_per_second2
		text = <msg_text>
	}
	formattext textname = msg_text "AvgThread: %d" d = <avg_time_taken_in_thread>
	setscreenelementprops {
		id = net_bytes_per_second3
		text = <msg_text>
	}
endscript

script UnDisplayBytesPerSecond 
	if screenelementexists \{id = NetBytesAnchor}
		destroyscreenelement \{id = NetBytesAnchor}
	endif
	if screenelementexists \{id = net_bytes_per_second}
		destroyscreenelement \{id = net_bytes_per_second}
	endif
	if screenelementexists \{id = net_bytes_per_second2}
		destroyscreenelement \{id = net_bytes_per_second2}
	endif
	if screenelementexists \{id = net_bytes_per_second3}
		destroyscreenelement \{id = net_bytes_per_second3}
	endif
endscript

script net_should_ignore_area_pak 
	if ((<area> = '') || (<area> = 'Z_Crib'))
		return \{true}
	else
		return \{false}
	endif
endscript

script load_net_area_pak 
	printf "******** load_net_area_pak : %d" d = $newarea
	formattext textname = newareapak 'zones/%s/%s.pak' s = $newarea
	if net_should_ignore_area_pak area = ($newarea)
		unload_net_area_pak
	else
		loadpak <newareapak> nonasync_load_callback = net_area_pak_callback
		formattext textname = nodeArrayName '%s_NodeArray' s = $newarea
		parsenodearray queue array_name = <textname>
		formattext textname = scene_name 'zones/%s/%s.scn' s = $newarea
		netsessionfunc func = do_hacky_pak_magic params = {scene_name = <scene_name>}
		change prevarea = $newarea
		printf "_------_ prevArea = %d" d = $prevarea
		change newarea = ''
	endif
endscript

script unload_net_area_pak 
	printf "******** unload_net_area_pak : %d" d = $prevarea
	if NOT ($prevarea = '')
		if NOT net_should_ignore_area_pak area = ($prevarea)
			formattext textname = prevareapak 'zones/%s/%s.pak' s = $prevarea
			unloadpak <prevareapak>
		endif
		change prevarea = ''
	endif
	getarraysize $multiplayer_spawn_in
	if (<array_size> > 0)
		change multiplayer_spawn_in = []
	endif
endscript

script isusingbarrier 
	printf \{"IsUsingBarrier barrier = %d %x"
		d = $prevarea
		x = $newarea}
	AreUsingBarrier = 0
	if NOT ($prevarea = '')
		<usingbarrier> = 1
		AreUsingBarrier = 1
	else
		if NOT ($newarea = '')
			<usingbarrier> = 1
			AreUsingBarrier = 1
		endif
	endif
	return AreUsingBarrier = <AreUsingBarrier>
endscript

script SetSpawnIn 
	getarraysize $online_level_select_menu_level_info
	printf "SETSPAWNIN -----"
	printstruct <...>
	<index> = 0
	begin
	if ($newarea = ($online_level_select_menu_level_info [<index>].area_pak))
		change multiplayer_spawn_in = ($online_level_select_menu_level_info [<index>].spawn_in)
		printstruct ($online_level_select_menu_level_info [<index>].area_pak)
		printstruct ($online_level_select_menu_level_info [<index>].spawn_in)
		break
	endif
	<index> = (<index> + 1)
	if (<index> = <array_size>)
		change multiplayer_spawn_in = []
		break
	endif
	repeat
endscript

script getcurrentareastringandchecksum 
	getarraysize $online_level_select_menu_level_info
	getarraysize $online_level_select_menu_level_info
	if NOT ($prevarea = '')
		<index> = 0
		begin
		if ($prevarea = ($online_level_select_menu_level_info [<index>].area_pak))
			<area_string> = ($online_level_select_menu_level_info [<index>].text)
			<area_checksum> = ($online_level_select_menu_level_info [<index>].checksum)
			break
		endif
		<index> = (<index> + 1)
		if (<index> = <array_size>)
			break
		endif
		repeat
	else
		<index> = 0
		if NOT ($newarea = '')
			begin
			getcurrentlevel
			if checksumequals a = <level> b = load_z_crib
				index = $net_crib_index
				<area_string> = ($online_level_select_menu_level_info [<index>].text)
				<area_checksum> = ($online_level_select_menu_level_info [<index>].checksum)
				break
			endif
			if ($prevarea = ($online_level_select_menu_level_info [<index>].area_pak))
				<area_string> = ($online_level_select_menu_level_info [<index>].text)
				<area_checksum> = ($online_level_select_menu_level_info [<index>].checksum)
				break
			endif
			<index> = (<index> + 1)
			if (<index> = <array_size>)
				break
			endif
			repeat
		else
			getcurrentlevel
			if checksumequals a = <level> b = load_z_crib
				index = $net_crib_index
			endif
			<area_string> = ($online_level_select_menu_level_info [<index>].text)
			<area_checksum> = ($online_level_select_menu_level_info [<index>].checksum)
		endif
	endif
endscript

script getareastringfromchecksum 
	getarraysize \{$online_level_select_menu_level_info}
	<index> = 0
	begin
	if (<area_checksum> = ($online_level_select_menu_level_info [<index>].checksum))
		<area_string> = ($online_level_select_menu_level_info [<index>].text)
		break
	endif
	<index> = (<index> + 1)
	if (<index> = <array_size>)
		break
	endif
	repeat
endscript

script change_multiplayer_spawn_in 
	change multiplayer_spawn_in = <spawn_in>
	change newarea = <area_pak>
endscript

script back_to_game_selection_menu 
	dialog_box_exit
	xboxlive_menu_create <...>
endscript

script test_crap 
	if iscreated \{Z_Online_Funpark_g_barrier_00}
		printf \{"We have it!"}
	else
		loadpak \{'zones/z_online_central/z_online_central.pak'}
		parsenodearray
		netsessionfunc \{func = do_hacky_pak_magic}
		printf \{"we don't have it"}
	endif
endscript

script test_crap2 
	netsessionfunc \{func = getnumplayers}
	printstruct <...>
endscript

script test_matchmaking 
	netsessionfunc \{func = match_init}
	netsessionfunc \{obj = match
		func = start_server_list
		params = {
			callback = try_server_list_out
			callback_complete = try_server_list_out_complete
		}}
endscript
NET_SINGLEPLAYER_LEVEL_TO_RETURN_TO = 'none'

script test_choose_server 
	printf \{"test_choose_server"}
	printstruct <...>
	setnetworkmode \{$internet_mode}
	setup_sessionfuncs
	netsessionfunc obj = match func = choose_server params = {id = <server_id>}
endscript

script try_starting_game 
	netsessionfunc \{obj = session
		func = unpost_game}
	setnetworkmode \{$internet_mode}
	setup_sessionfuncs
	chosen_host_game
endscript

script untest_matchmaking 
	netsessionfunc \{obj = session
		func = unpost_game}
	netsessionfunc \{func = match_uninit}
endscript

script quit_back_to_singleplayer 
	ui_destroy_pausemenu
	quit_network_game \{singlemulti_level = $net_last_singleplayer_level}
endscript

script testach 
	writeachievements \{achievement = ach_sk9_film_am}
	writeachievements \{achievement = ach_sk9_cash}
endscript

script test_back 
	menu_stack_pop
	menu_stack_clear
endscript

script show_net_singleplayer_menu 
	printf "--- xboxlive_menu_lobby_push"
	printstruct <...>
	change xboxlive_num_results = 0
	if ismovieplaying textureslot = 0
		SeekMovie textureslot = 0 frame = 328 loop_start = 328 loop_end = 435
	endif
	setbuttoneventmappings unblock_menu_input
	menu_stack_push {
		menu_script = menu_template_create
		menu_params = {
			$menu_template_style_ticker
			menu_id = lobby_menu
			pad_back_script = test_back
			title = "xbox live in single test"
			title_bg_scale = (1.4, 1.0)
			items = [
				{text = "custom match" pad_choose_script = do_custom_match pad_choose_params = {player} label_offset = (0.0, 0.0) length = 220}
				{text = "create match" pad_choose_script = do_create_match_from_single label_offset = (10.0, 20.0) length = 180 pad_choose_params = {set_default_focus}}
			]
			$xbox360_live_menu_with_options_button
		}
	}
endscript

script do_custom_match 
	test_singleplayer_online_match_menu_create
endscript

script do_create_match_from_single 
	try_starting_game
endscript

script test_singleplayer_online_match_menu_create {
		menu_id = optimatch_results_menu
		vmenu_id = optimatch_results_vmenu
		pad_back_script = menu_stack_pop
		pos = (100.0, 120.0)
		dims = (350.0, 480.0)
		parent = root_window
		internal_text_just = left
		internal_text_offset = (0.0, 0.0)
		spacing = 1
		arrow_up = arrow_up
		arrow_down = arrow_down
		arrow_rgba = ($cas_color_scheme.arrow_color)
		pad_back_sound = generic_pause_exit_sound
		add_tab = 1
		title_rotation = 0
		title_rgba = ($cas_color_scheme.title_color)
		vert_bg_scale = (0.75, 0.75)
	}
	printf "--- test_singleplayer_online_match_menu_create"
	if screenelementexists id = lobby_menu
		destroyscreenelement id = lobby_menu
	endif
	if screenelementexists id = optimatch_results_menu
		destroyscreenelement id = optimatch_results_menu
	endif
	change xboxlive_num_results = 0
	current_color_scheme = $ss_color_scheme
	main_title = "SESSIONS"
	make_cas_menu {
		title = <main_title>
		pad_back_script = <pad_back_script>
		menu_id = optimatch_results_menu
		vmenu_id = optimatch_results_vmenu
		color_scheme = <current_color_scheme>
	}
	current_menu_anchor :settags current_color_scheme = <current_color_scheme>
	setscreenelementprops {
		id = optimatch_results_vmenu
		event_handlers = [
			{pad_option menu_stack_create_latest}
		]
	}
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		local_id = <server_id>
		pos = (142.0, 93.0)
	}
	parent_id = <id>
	curPos = (0.0, 0.0)
	createscreenelement {
		type = textelement
		parent = <parent_id>
		local_id = name
		pos = <curPos>
		text = "GAMERTAG"
		font = text_a1
		rgba = [128 128 128 128]
		scale = 0.5
		just = [left top]
		z_priority = 2
	}
	test_matchmaking
	current_menu :getsingletag highlight_parent
	if screenelementexists id = {<highlight_parent> child = cas_menu_highlight}
		doscreenelementmorph id = {<highlight_parent> child = cas_menu_highlight} pos = (0.0, -500.0)
	endif
	doscreenelementmorph id = {current_menu_anchor child = 0} alpha = 1 time = 0.2
endscript

script try_server_list_out_complete 
	netsessionfunc obj = match func = stop_server_list
	printf "try_server_list_out_complete : %d" d = <xboxlive_num_results>
	if screenelementexists id = optimatch_results_menu
		extra_padding = (10)
		if (<extra_padding> > 0)
			begin
			createscreenelement {
				type = textelement
				parent = current_menu
				font = text_a1
				scale = 0.45000002
				text = ""
				not_focusable
			}
			repeat <extra_padding>
		endif
	endif
	spawnscript xboxlive_menu_optimatch_results_wait_and_focus
endscript

script try_server_list_out 
	printf "try_server_list_out"
	change xboxlive_num_results = (($xboxlive_num_results) + 1)
	if NOT screenelementexists id = optimatch_results_vmenu
		printf "Warning! tried to add a server when results menu not up"
		return
	endif
	dims = ((0.0, 25.0))
	printf "--- xboxlive_menu_optimatch_results_item_add"
	printstruct <...>
	if NOT screenelementexists id = {current_menu child = <server_id>}
		printf "server not in list, adding new result"
		setscreenelementlock id = current_menu off
		add_cas_menu_item {
			local_id = <server_id>
			text = "temp"
			pad_choose_script = test_choose_server
			pad_choose_params = {id = <server_id>}
		}
		setscreenelementprops {
			id = {current_menu child = <server_id>}
			event_handlers = [
				{focus test_single_online_focus}
				{unfocus test_single_online_unfocus}
			]
		}
		parent_id = <item_container_id>
		getscreenelementprops id = {<parent_id> child = text}
		server_name_pos = <pos>
		text_scale = <scale>
		text_z = <z_priority>
		setscreenelementprops {
			id = {<parent_id> child = text}
			pos = (<server_name_pos> + (50.0, 0.0))
		}
	endif
	setscreenelementprops {
		id = {current_menu child = {<server_id> child = text}}
		text = <server_name>
	}
	resolvescreenelementid id = {current_menu child = <server_id>}
	setscreenelementprops {
		id = <resolved_id>
		tags = {
			game_type = text
			has_focus
		}
	}
	if screenelementexists id = optimatch_results_vmenu
		setscreenelementlock id = optimatch_results_vmenu on
		setscreenelementlock id = optimatch_results_vmenu off
	endif
	if <resolved_id> :getsingletag has_focus
	endif
endscript

script test_single_online_focus 
	printf \{"test_single_online_focus"}
	obj_getid
	current_menu_anchor :getsingletag \{current_color_scheme}
	setscreenelementprops id = {<objid> child = text} rgba = (<current_color_scheme>.text_focus_color)
	settags \{has_focus}
	gettags
endscript

script test_single_online_unfocus 
	printf \{"test_single_online_focus"}
	obj_getid
	current_menu_anchor :getsingletag \{current_color_scheme}
	setscreenelementprops id = {<objid> child = text} rgba = (<current_color_scheme>.text_color)
	removetags \{[
			has_focus
		]}
endscript

script enteredobservermode 
	if checksumequals a = <mode> b = ghost
		ob_text = "Entered Observer mode, you are free to skate but no one can see you."
	else
		if checksumequals a = <mode> b = chase_cam
			ob_text = "Entered Observer mode"
		else
			scriptassert "No observer state passed!!!"
		endif
	endif
	if innetgame
		create_net_panel_message text = <ob_text> style = net_team_panel_message msg_time = 500
	endif
endscript

script leftobservermode 
	if NOT innetgame
		return
	endif
	if screenelementexists \{id = net_observer_helper_text}
		destroyscreenelement \{id = net_observer_helper_text}
	endif
endscript

script test_net 
	getskaterid
	<objid> :obj_getposition
	printstruct <...>
	create_object_label text = "\\c2BinaryM" pos3d = <pos> id = skater_name_0
endscript

script net_wait_and_show_message 
	wait \{2
		seconds}
	spawnscriptlater \{create_net_panel_message
		params = {
			text = "The game was ended, there are no players left."
		}}
endscript
