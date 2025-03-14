
script goal_graffiti_init 
endscript

script graffiti_post_deactivate 
	ClearTrickObjects
	SetModulateColors \{0}
endscript

script graffiti_chk_enter 
	ClearTrickObjects
	SetModulateColors 0
	printf "graffiti_chk_enter"
	SetModulateColors 1
	if InTeamGame
		if innetgame
			formattext textname = msg_text "The team with the most tags wins."
		else
			formattext textname = msg_text "GRAFFITI:\\nThe team with the most tags wins."
		endif
		soundevent event = Goal_Chalk_Challenge_Start
	else
		if innetgame
			formattext textname = msg_text "The player with the most tags wins."
		else
			formattext textname = msg_text "GRAFFITI:\\nThe player with the most tags wins."
		endif
		soundevent event = Goal_Chalk_Challenge_Start
	endif
	if insplitscreengame
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	DisplayGameDescription description = <msg_text>
	ResetScore
endscript

script graffiti_chk_exit 
	printf "graffiti_chk_exit"
	ClearTrickObjects
	SetModulateColors 0
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	if ((gamemodeequals is_singlesession) || (gamemodeequals is_classic))
		GoalManager_SetGoalTimer name = <goal_id>
		SetScoreAccumulation 0
		SetScoreDegradation 0
		if NOT objectexists id = dialog_bg_anchor
			if NOT gotparam retry
				pausegame
				root_window :settags menu_state = on
				spawnscriptlater goal_graffiti_high_score_menu params = {restart_node = <restart_node>}
			else
				resetskaters node = <restart_node>
			endif
		else
			resetskaters node = <restart_node>
		endif
	endif
endscript

script goal_graffiti_high_score_menu 
	printf "======= goal_graffiti_high_score_menu"
	if istrue $is_changing_levels
		return
	endif
	kill_start_key_binding
	pausegame
	pause_trick_text
	if screenelementexists id = goal_start_dialog
		destroyscreenelement id = goal_start_dialog
	endif
	kill_speech_boxes
	UpdateRecords
	if NewRecord
		high_scores_menu_enter_initials restart_node = <restart_node>
		launchevent type = focus target = keyboard_vmenu
	else
		high_scores_menu_create restart_node = <restart_node>
	endif
	ResetComboRecords
endscript

script graffiti_done 
	dialog_box_exit
	do_backend_retry
endscript

script goal_graffiti_expire 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_graffiti_expire"}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings
			params = {
				score_title_text = "TAGS"
			}}
	else
		create_rankings \{score_title_text = "TAGS"}
	endif
endscript

script graffiti_chk_tmr_expire 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_graffiti_expire"}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings
			params = {
				score_title_text = "TAGS"
			}}
	else
		create_rankings \{score_title_text = "TAGS"}
	endif
endscript

script StartGoal_Graffiti 
	if insplitscreengame
		SetScreenModeFromGameMode
		ScreenElementSystemCleanup
	endif
	gman_timerfunc goal = graffiti tool = tmr checkpoint = chk func = set_start_time params = {time = <time>}
	gman_activategoal \{goal = graffiti}
endscript
