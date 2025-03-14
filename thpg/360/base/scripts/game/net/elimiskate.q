NotifiedLastPlacePlayer = 0
NotifiedSecondToLastPlacePlayer = 0
ResetElimiskateScores = 1
goal_elimiskate_genericParams = {
	goal_text = "Avoid elimination by staying out of last place!"
	time = 10
	net
	goal_type_checksum = net
	game_continues_after_expiration
	init = goal_elimiskate_init
	active = goal_elimiskate_active
	activate = goal_elimiskate_activate
	deactivate = goal_elimiskate_deactivate
	expire = goal_elimiskate_expire
	goal_description = "Elimiskate!"
}
goal_elimiskate_break_period_genericParams = {
	goal_text = "Next round starting..."
	time = 5
	net
	goal_type_checksum = net
	game_continues_after_expiration
	init = goal_elimiskate_break_period_init
	activate = goal_elimiskate_break_period_activate
	deactivate = goal_elimiskate_break_period_deactivate
	expire = goal_elimiskate_break_period_expire
	goal_description = "Elimiskate!"
}
goal_elimiskate_interval_genericParams = {
	goal_text = ""
	time = 5
	net
	goal_type_checksum = net
	init = goal_elimiskate_interval_init
	activate = goal_elimiskate_interval_activate
	deactivate = goal_elimiskate_interval_deactivate
	expire = goal_elimiskate_interval_expire
	game_continues_after_expiration
	goal_description = ""
}

script goal_elimiskate_init 
endscript

script goal_elimiskate_active 
	GoalManager_GetTimeLeftInNetGame
	if gotparam time_left
		if (<time_left> < 5000)
			if InLastPlace
				if NOT istrue $NotifiedLastPlacePlayer
					change NotifiedLastPlacePlayer = 1
					if (<points> = 0)
						formattext textname = msg_text "You're tied for last place!"
					else
						formattext textname = msg_text "You're in last place by %s points!" s = <points>
					endif
					create_net_panel_message text = <msg_text> msg_time = 3000
				endif
			else
				if InSecondToLastPlace
					if NOT istrue $NotifiedSecondToLastPlacePlayer
						change NotifiedSecondToLastPlacePlayer = 1
						formattext textname = msg_text "You're only %s points ahead of last place!" s = <points>
						create_net_panel_message text = <msg_text> msg_time = 3000
					endif
				endif
			endif
		endif
	endif
endscript

script goal_elimiskate_activate 
	printf "script goal_elimiskate_activate"
	if gotparam score_mode
		if (<score_mode> = tag_scoring)
			SetModulateColors 1
		endif
	endif
	RoundIncrement
	SetTrickScoreTracking 1
	change NotifiedLastPlacePlayer = 0
	change NotifiedSecondToLastPlacePlayer = 0
	if InTeamGame
		formattext textname = msg_text "Elimiskate:\\nAvoid Elimination!"
	else
		formattext textname = msg_text "Elimiskate:\\nAvoid Elimination!"
	endif
	DisplayGameDescription description = <msg_text>
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			unhide
		}
	endif
	runscriptonscreenelement id = the_time clock_morph
	if gamemodeequals should_reset_scores
		ResetScore reset_all
		ResetComboRecords
		if gotparam score_mode
			if (<score_mode> = tag_scoring)
				ClearTrickObjects
			endif
		endif
	endif
endscript

script goal_elimiskate_deactivate 
	if NOT gman_goalisactive \{goal = elimiskate_break_period}
		if NOT gman_goalisactive \{goal = elimiskate_interval}
			if objectexists \{id = mp_goal_text}
				destroyscreenelement \{id = mp_goal_text}
			endif
		endif
	endif
endscript

script goal_elimiskate_expire 
	SetTrickScoreTracking \{0}
	startgoal_elimiskate_interval
endscript

script goal_elimiskate_finished 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	spawnscriptlater \{wait_then_create_rankings}
endscript

script AddGoal_Elimiskate 
	GoalManager_AddGoal \{name = elimiskate
		params = {
			$goal_elimiskate_genericParams
		}}
endscript

script StartGoal_ElimiSkate 
	GoalManager_EditGoal name = elimiskate params = <...>
	GoalManager_ActivateGoal \{name = elimiskate}
	GoalManager_SetGoalTimer \{name = elimiskate}
endscript

script goal_elimiskate_break_period_init 
endscript

script goal_elimiskate_break_period_activate 
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			unhide}
	endif
	runscriptonscreenelement \{id = the_time
		clock_morph}
	SetTrickScoreTracking \{0}
	create_net_panel_message \{text = "Getting ready to start next round. Scoring will begin when round starts."}
endscript

script goal_elimiskate_break_period_deactivate 
endscript

script goal_elimiskate_break_period_expire 
	StartGoal_ElimiSkate
endscript

script AddGoal_Elimiskate_Break_Period 
	GoalManager_AddGoal \{name = elimiskate_break_period
		params = {
			$goal_elimiskate_break_period_genericParams
		}}
endscript

script startgoal_elimiskate_break_period 
	GoalManager_EditGoal name = elimiskate_break_period params = <...>
	GoalManager_ActivateGoal \{name = elimiskate_break_period}
endscript

script goal_elimiskate_interval_init 
endscript

script goal_elimiskate_interval_activate 
	SetTrickScoreTracking 0
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			hide
		}
	endif
	create_net_panel_message text = "Calculating final scores. Points scored in this time period will not count."
	if OnServer
		spawnscriptlater wait_and_eliminate
	endif
	if gamemodeequals should_reset_scores
		spawnscriptlater wait_and_accumulate
	endif
endscript

script wait_and_eliminate 
	wait \{2
		seconds}
	EliminateLastPlacePlayer
endscript

script wait_and_accumulate 
	AccumulateScores
endscript

script goal_elimiskate_interval_deactivate 
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			unhide}
	endif
endscript

script goal_elimiskate_interval_expire 
	if OnlyOnePlayerLeft
		goal_elimiskate_finished
	else
		startgoal_elimiskate_break_period
	endif
endscript

script AddGoal_Elimiskate_Interval 
	GoalManager_AddGoal \{name = elimiskate_interval
		params = {
			$goal_elimiskate_interval_genericParams
		}}
endscript

script startgoal_elimiskate_interval 
	GoalManager_ActivateGoal \{name = elimiskate_interval}
endscript

script CheckForElimiskateGameOver 
	if OnlyOnePlayerLeft
		GoalManager_DeactivateGoal \{name = elimiskate}
		GoalManager_DeactivateGoal \{name = elimiskate_break_period}
		GoalManager_DeactivateGoal \{name = elimiskate_interval}
		goal_elimiskate_finished
	endif
endscript
