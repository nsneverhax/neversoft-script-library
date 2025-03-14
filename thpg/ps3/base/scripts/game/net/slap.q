goal_slap_genericParams = {
	goal_text = "You must slap the most players to win!"
	time = 10
	net
	goal_type_checksum = net
	init = goal_slap_init
	activate = goal_slap_activate
	deactivate = goal_slap_deactivate
	expire = goal_slap_expire
	goal_description = "Slap!"
}

script goal_slap_init 
endscript

script goal_slap_activate 
	if InTeamGame
		formattext textname = msg_text "\\c2Slap! \\n\\c0The team with the most slaps wins."
	else
		formattext textname = msg_text "\\c2Slap! \\n\\c0The player with the most slaps wins."
	endif
	if insplitscreengame
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	DisplayGameDescription description = <msg_text>
	runscriptonscreenelement id = the_time clock_morph
	ResetScore
endscript

script goal_slap_deactivate 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script slap_done 
	dialog_box_exit
	do_backend_retry
endscript

script goal_slap_expire 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	printf \{"goal_slap_expire"}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings
			params = {
				score_title_text = "SLAPS"
			}}
	else
		create_rankings \{score_title_text = "SLAPS"}
	endif
endscript

script AddGoal_Slap 
	GoalManager_AddGoal name = slap {
		params = {goal_slap_genericParams
			<...>
		}
	}
endscript

script StartGoal_Slap 
	if insplitscreengame
		SetScreenModeFromGameMode
	endif
	GoalManager_EditGoal name = slap params = <...>
	GoalManager_ActivateGoal \{name = slap}
endscript
