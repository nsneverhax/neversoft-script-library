goal_combomambo_genericParams = {
	goal_text = "You must score the most points to win!"
	time = 10
	net
	goal_type_checksum = net
	init = goal_combomambo_init
	deactivate = goal_combomambo_deactivate
	expire = goal_combomambo_expire
	activate = goal_combomambo_activate
	goal_description = "COMBO MAMBO!"
}

script goal_combomambo_init 
endscript

script combomambo_post_deactivate 
	ClearTrickObjects
	SetModulateColors \{0}
endscript

script combomambo_chk_enter 
	printf "-- combomambo_post_activate --"
	if innetgame
		first_part = ""
	else
		first_part = "COMBO MAMBO:\\n"
	endif
	if InTeamGame
		formattext textname = msg_text "%d Highest-scoring combo wins." d = <first_part>
		soundevent event = Goal_Chalk_Challenge_Start
	else
		formattext textname = msg_text "%d Highest-scoring combo wins." d = <first_part>
		soundevent event = Goal_Chalk_Challenge_Start
	endif
	if insplitscreengame
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	InitializeTagScoring
	GetScoreModeSettings
	printf <score_mode>
	if (<score_mode> = tag_scoring)
		formattext textname = msg_text "%d Highest number of tags wins." d = <first_part>
	endif
	DisplayGameDescription description = <msg_text>
	ResetComboRecords
endscript

script combomambo_chk_exit 
	printf \{"-- combomambo_chk_enter --"}
	ClearTrickObjects
	SetModulateColors \{0}
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script combomambo_done 
	dialog_box_exit
	do_backend_retry
endscript

script combomambo_chk_tmr_expire 
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	printf "goal_combomambo_expire"
	if gamemodeequals is_singlesession
		UpdateRecords
		high_scores_menu_create
		ResetComboRecords
	else
		if OnServer
			spawnscriptlater wait_then_create_rankings params = {score_title_text = "BEST COMBO"}
		else
			create_rankings score_title_text = "BEST COMBO"
		endif
	endif
endscript

script StartGoal_combomambo 
	if insplitscreengame
		SetScreenModeFromGameMode
		ScreenElementSystemCleanup
	endif
	gman_timerfunc goal = combomambo tool = tmr checkkpoint = chk func = set_start_time params = {time = <time>}
	gman_activategoal \{goal = combomambo}
endscript
