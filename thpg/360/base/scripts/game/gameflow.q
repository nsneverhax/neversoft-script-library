dont_unhide_loading_screen = 0
in_cinematic_sequence = 0
autoload_when_autolaunching = 0

script game_update 
	GMan_UpdateAllGoals
endscript

script load_requested_level 
	getcurrentlevel
	LoadLevel level = <level>
endscript

script initializegameflow 
	printf \{"InitializeGameFlow"}
	load_requested_level
	if innetgame
		GetLevelStructureName
		formattext checksumname = levelchecksum '%s' s = (<level_structure_name>.level)
		resetskaters zone = <levelchecksum>
	endif
	standardgameflow
endscript

script changelevelgameflow 
	change FirstTimeInSplitScreen = 1
	load_requested_level
	if NOT insplitscreengame
		resetskaters
	endif
	if innetgame
		if NOT gamemodeequals is_lobby
			setgametype netlobby
			setcurrentgametype
		endif
		if OnServer
			getpreferencechecksum pref_type = network team_mode
			switch <checksum>
				case teams_none
				SetNumTeams 0
				printf "Team mode off"
				case teams_two
				SetNumTeams 2
				printf "2 Teams"
				case teams_three
				SetNumTeams 3
				printf "3 Teams"
				case teams_four
				SetNumTeams 4
				printf "4 Teams"
			endswitch
		endif
	endif
	begin
	if SkatersAreReady
		break
	endif
	wait 1 gameframe
	repeat
	SetScreenModeFromGameMode
	standardgameflow
endscript

script GameFlow_Startup 
	if NOT innetgame
		kill_panel_messages
		net_reset_server_cheats
	endif
	goal_panel_reset_queue
	if insplitscreengame
		if VibrationIsOn 0
			VibrationOff 0
			turn_vibration_back_on = 1
		endif
		if VibrationIsOn 1
			VibrationOff 1
			turn_player2_vibration_back_on = 1
		endif
	endif
	if innetgame
		begin
		wait 1 gameframe
		if SkatersAreReady
			break
		endif
		repeat 120
		begin
		if SkatersAreReady
			if NOT ($dont_restore_start_key_binding = 1)
				dialog_box_exit
			else
				dialog_box_exit no_pad_start
			endif
			break
		endif
		if NOT SkatersAreReady
			if NOT screenelementexists id = dialog_box_anchor
				if NOT screenelementexists id = quit_dialog_anchor
					hideloadingscreen
					unpause_game_and_destroy_pause_menu
					create_dialog_box {title = $net_status_msg
						text = $net_message_waiting
						buttons = [{text = "Quit" pad_choose_script = quit_network_game}
						]
						no_animate
					}
				endif
			endif
		endif
		wait 1 gameframe
		repeat
	else
		begin
		wait 1 gameframe
		if SkatersAreReady
			break
		endif
		repeat
	endif
	if gotparam turn_vibration_back_on
		wait 2 gameframes
		vibrationon 0
	endif
	if gotparam turn_player2_vibration_back_on
		if NOT gotparam turn_vibration_back_on
			wait 2 gameframes
		endif
		vibrationon 1
	endif
	RestartLevel
	InitializeSkaters
	KillMessages
	pausestream 0
	printf "GameFlowStartup"
	if innetgame
		netsessionfunc obj = voice func = entering_free_skate
		printf "In a net game..."
		if gamemodeequals is_lobby
			printf "GameModeEquals is_lobby"
			if OnServer
				server_enter_free_skate
			else
				if ishost
					server_enter_free_skate
				endif
				client_enter_free_skate
			endif
			if IsPendingPlayer
				ForceChangeObservingState state = false
			endif
			printf "We should be InInternetMode"
			if ininternetmode
				if OnServer
					if netsessionfunc obj = session func = is_game_posted
						netsessionfunc obj = session func = update_game_options
					else
						if ($DONT_ALLOW_INPUT_IN_ONLINE = 0)
							printf "Posting game!"
							netsessionfunc obj = session func = post_game
						endif
					endif
				endif
			endif
		endif
	endif
	if innetgame
		if ($enable_net_rounds = 1)
			net_rounds_ui_setup
			NetRoundFunc {
				func = activate_round_mode
			}
		endif
	else
		NetRoundFunc {
			func = deactivate_round_mode
		}
	endif
	if NOT innetgame
		ReinsertSkaters
	endif
	if innetgame
		spawnscript net_wager_check_match_start
	endif
	if gamemodeequals is_horse
		StartHorse
	endif
	SetScreenModeFromGameMode
endscript
dont_restore_start_key_binding = 0

script gameflow_startrun 
	printf "GameFlow_StartRun"
	tod_proxim_reapply_lightfx
	ProximEnable num_defer_frames = 1
	if NOT infrontend
		GetLevelStructureName
		formattext checksumname = levelchecksum '%s' s = (<level_structure_name>.level)
		if NOT innetgame
			resetskaters zone = <levelchecksum>
		else
			resetskaters zone = <levelchecksum> dont_respawn_skaters
			MakeSkaterGoto SkaterInit
		endif
	else
		if scriptexists main_menu_startup_wait_and_signal_clear
			spawnscriptlater main_menu_startup_wait_and_signal_clear
			if NOT innetgame
				resetskaters
			endif
		endif
	endif
	printf "starting a run....skip tracks and crank up the music" bg_color
	if IsCareerMode
		if istrue $ALWAYSPLAYMUSIC
			pausemusic 0
		else
			pausemusic 1
		endif
		game_progress_create_permanent_compass_blips
		UI_Show_Goal_Waypoint_If_Set
		goal_handle_startup_goal
		change goal_zone_loading = 0
	else
		game_progress_destroy_permanent_compass_blips
		pausemusic 0
	endif
	if gamemodeequals default_time_limit
		resetclock
	else
	endif
	if gamemodeequals is_horse
		horse_start_run
	endif
	if innetgame
		if OnServer
			netsessionfunc obj = voice func = entering_free_skate
		else
			LaunchQueuedScripts
			if isobserving
				if gamemodeequals is_goal_attack
					GoalManager_InitializeAllSelectedGoals
				endif
			endif
		endif
	endif
	if NOT ($next_level_script = nullscript)
		if ($next_level_script = select_sponsor_select_after_movies)
			displayloadingscreen blank
			change dont_unhide_loading_screen = 1
			change dont_restore_start_key_binding = 1
		endif
		spawnscriptlater next_level_script
		change next_level_script = nullscript
	endif
	if NOT infrontend
		if gamemodeequals is_career
			spawnscriptlater game_progress_process_status params = {level_startup = 1}
		endif
		if insplitscreengame
			setactivecamera id = skatercam0 viewport = 0
			setactivecamera id = skatercam1 viewport = 1
		endif
		if gamemodeequals is_classic
			classic_mode_play_intro_cams
		else
			if NOT ($dont_restore_start_key_binding = 1)
				restore_start_key_binding
			endif
		endif
	endif
	if inmultiplayergame
	endif
	if NOT cd
		if levelis viewer
			printf 'GameFlow_StartRun - Setting up for viewer.'
			setanalogstickactiveformenus 0
			change view_mode = 1
			setenablemovies 0
			setviewmode $view_mode
			userviewerx
			start_viewer_screen_fx
		endif
	endif
	unpausespawnedscript game_progress_process_status
	begin
	if NOT scriptisrunning game_progress_process_status
		break
	endif
	wait 1 gameframe
	repeat
	if ($autolaunch_into_career = 1)
		change autolaunch_into_career = 0
		if ($autoload_when_autolaunching = 1)
			change autoload_when_autolaunching = 0
			change ignore_auto_load_end_state = 1
			spawnscriptnow ingame_auto_load
		endif
	endif
	if innetgame
		if ($memcard_using_autosave = 1)
			if ($net_need_autosave = 1)
				spawnscriptlater do_autosave
				change net_need_autosave = 0
			else
				if ($ingame_save_active = 1)
					printf "Fixing DT38256"
					mc_waitasyncopsfinished
					autosave_wake_scripts
					wait 4 gameframes
					game_progress_autosave_inactive
				endif
			endif
		endif
		if ishost
			if NOT gamemodeequals is_lobby
				netsessionfunc func = getnumplayers
				if (<numplayers> = 1)
					network_end_game_selected
					change net_game_was_auto_ended = 1
				endif
			endif
			if ($net_game_was_auto_ended = 1)
				spawnscript net_wait_and_show_message
				change net_game_was_auto_ended = 0
			endif
		endif
	else
		change net_need_autosave = 1
	endif
	spawnscriptnow crib_start_music
endscript
net_game_was_auto_ended = 0
net_need_autosave = 1

script gameflow_playrun 
	broadcastevent type = gameflow_playrun
	if istrue $alwaysdump
		dumpheaps
		change alwaysdump = 0
	endif
	if NOT infrontend
		if screenelementexists id = controller_unplugged_dialog_anchor
			kill_start_key_binding
		else
			if NOT ($dont_restore_start_key_binding = 1)
				restore_start_key_binding
			endif
		endif
	endif
	if insplitscreengame
		if NOT gamemodeequals is_coop
			if istrue $FirstTimeInSplitScreen
				pausegame
			endif
		endif
	endif
	wait 1 gameframe
	if IsMovieQueued
		begin
		if HasMovieStarted
			break
		endif
		wait 1 gameframe
		repeat
	endif
	wait 2 gameframe
	change is_changing_levels = 0
	if NOT ($dont_unhide_loading_screen = 1)
		<dont_unhide_loading_screen_for_game_intro_cams> = 0
		if gamemodeequals is_career
			if getglobalflag flag = $CAREER_STARTED_FROM_MAINMENU
				if NOT getglobalflag flag = $CAREER_INTRO_MOVIE_WATCHED
					<dont_unhide_loading_screen_for_game_intro_cams> = 1
				endif
			endif
		endif
		if (<dont_unhide_loading_screen_for_game_intro_cams> = 0)
			if NOT insplitscreengame
				hideloadingscreen
			endif
		endif
	endif
	if NOT (($ve_zone_change_level_action) = none)
		createscreenelement {
			type = spriteelement
			texture = white2
			rgba = [0 0 0 255]
			alpha = 1.0
			just = [center center]
			dims = (1280.0, 720.0)
			pos = (640.0, 360.0)
			parent = root_window
			z_priority = 3500
			id = ve_zone_change_blackout
		}
		net_view_goals_create_searching_text {
			text = "Please Wait..."
			scale = 0.75
			parent = root_window
			id = ve_zone_change_animation_icon
		}
		pauseskaters
	endif
	if insplitscreengame
		setactivecamera id = skatercam0 viewport = 0
		setactivecamera id = skatercam1 viewport = 1
		if NOT gamemodeequals is_coop
			if istrue $FirstTimeInSplitScreen
				ScreenElementSystemCleanup
				change FirstTimeInSplitScreen = 0
				change two_player_first_time_in = 1
				pausegame
				ui_change_state state = UIstate_2player_create_game
			endif
		endif
	endif
	if inmultiplayergame
	else
		UseOnePadInFrontEnd
	endif
	if istrue $AutoLaunchHostNetLevel
		if NOT istrue $net_autotest_started
			if istrue $AutoLaunchClient
				spawnscript net_start_client_test
			else
				spawnscript net_start_server_test
			endif
		endif
	endif
	enableactuators
	if ($toggled_fps_on = 1)
		togglefps
		togglefps
	endif
	if ($toggled_geom_stats_on = 1)
		ToggleGeomStats
		ToggleGeomStats
	endif
	spawnscriptlater ve_change_level_done
	begin
	if ShouldEndRun
		printf "************ SHOULD BREAK"
		break
	endif
	if gamemodeequals is_horse
		if FirstTrickStarted
			printf "************ TRICK STARTED"
			break
		endif
		if istrue $HorseTimerExpired
			printf "************ HORSE TIMER EXPIRED"
			break
		endif
	endif
	wait 1 gameframe
	repeat
endscript
Inside_GameFlow_WaitEnd = 0

script GameFlow_WaitEnd 
	printf "************ IN GAMEFLOW_WAITEND"
	change Inside_GameFlow_WaitEnd = 1
	begin
	if EndRunSelected
		break
	endif
	if IsCareerMode
	else
		if gamemodeequals is_singlesession
			break
		else
			if NOT infrontend
				if AllSkatersAreIdle
					break
				endif
				ForEachPlayer GameFlow_KillBail
			endif
		endif
	endif
	wait 1 gameframe
	repeat
	change Inside_GameFlow_WaitEnd = 0
	enableactuators 0
	wait 2 game frames
	if NOT gamemodeequals is_singlesession
		if NOT insplitscreengame
			unpausegame
		endif
	endif
	wait 2 game frames
	KillMessages
	killspawnedscript name = Sk_Killskater_Finish
endscript

script GameFlow_KillBail 
	if islocalskater
		if ragdoll_isactive
			printf \{'GameFlow_KillBail - DONE'}
			MakeSkaterGoto \{SkaterInit}
		endif
	endif
endscript

script gameflow_end 
	printf "************** IN GAMEFLOW END************"
	begin
	if CalculateFinalScores
		break
	endif
	wait 1 gameframe
	repeat
	if innetgame
		if OnServer
			wait 5 gameframes
			printf "--- GameFlow_End LoadPendingPlayers"
			loadpendingplayers
		endif
		if IsPendingPlayer
			ForceChangeObservingState state = false
		endif
	endif
endscript

script standardgameflow 
	printf \{"starting standard gameflow"}
	GameFlow_Startup
	standardgameflowbody
endscript

script standardgameflowtoggleview 
	printf \{"starting standard gameflow"}
	GameFlow_Startup
	toggleviewmode
	printf \{"starting standard gameflow 2"}
	standardgameflowbody
endscript

script standardgameflowbody 
	printf "StandardGameFlowBody"
	begin
	gameflow_startrun
	gameflow_playrun
	GameFlow_WaitEnd
	if gamemodeequals is_horse
		if EndRunSelected
			break
		endif
		horse_end_run
		if HorseEnded
			break
		else
			InitializeSkaters
		endif
	else
		break
	endif
	repeat
	if gamemodeequals is_horse
		horse_uninit
	endif
	gameflow_end
	begin
	wait 1 gameframe
	repeat
endscript
