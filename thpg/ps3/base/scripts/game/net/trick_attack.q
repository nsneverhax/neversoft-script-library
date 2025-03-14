
script goal_trickattack_init 
endscript

script trickattack_chk_enter 
	ResetComboRecords
	if InTeamGame
		if innetgame
			formattext textname = msg_text "Most points wins"
		else
			formattext textname = msg_text "TRICK ATTACK:\\nMost points wins"
		endif
		soundevent event = Goal_Chalk_Challenge_Start
	else
		if gamemodeequals is_singlesession
			msg_text = " "
		else
			if innetgame
				formattext textname = msg_text "Most points wins"
			else
				formattext textname = msg_text "TRICK ATTACK:\\nMost points wins"
			endif
			soundevent event = Goal_Chalk_Challenge_Start
		endif
	endif
	if insplitscreengame
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	DisplayGameDescription description = <msg_text>
	if ((gamemodeequals is_singlesession) || (gamemodeequals is_classic))
		skater :runstarted
		SetScoreAccumulation 1
		SetScoreDegradation 1
	endif
	ResetScore
endscript

script trickattack_chk_exit 
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
				spawnscriptlater goal_trick_attack_high_score_menu params = {restart_node = <restart_node>}
			else
				resetskaters node = <restart_node>
			endif
		else
			resetskaters node = <restart_node>
		endif
	endif
endscript

script goal_trick_attack_high_score_menu 
	printf "======= goal_trick_attack_high_score_menu"
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

script trickattack_chk_tmr_expire 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	if NOT gamemodeequals \{is_singlesession}
		if NOT gamemodeequals \{is_classic}
			if insplitscreengame
				create_rankings
			else
				if OnServer
					spawnscriptlater \{wait_then_create_rankings}
				else
					create_rankings
				endif
			endif
		endif
	endif
endscript

script StartGoal_TrickAttack 
	printf \{"StartGoal_TrickAttack!!!"}
	if insplitscreengame
		SetScreenModeFromGameMode
		ScreenElementSystemCleanup
	endif
	gman_timerfunc goal = trickattack tool = tmr checkpoint = chk func = set_start_time params = {time = <time>}
	gman_activategoal \{goal = trickattack}
endscript

script TrickAttack_MenuStartRun 
	printf \{"TrickAttack_MenuStartRun!!!"}
	GoalManager_EditGoal \{name = trickattack
		params = {
			can_retry_goal
			cross_zone
		}}
	GoalManager_ActivateGoal \{name = trickattack}
	unpause_game_and_destroy_pause_menu
endscript

script end_high_score_run 
	unpause_game_and_destroy_pause_menu
	GoalManager_DeactivateGoal \{name = trickattack}
endscript
