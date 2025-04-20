crown_object_components = [
	{
		component = crown
	}
	{
		component = motion
	}
	{
		component = model
		model = 'crown\\crown.mdl'
	}
]
goal_king_genericParams = {
	goal_text = "Capture the crown and keep it away from others!"
	unlimited_time = 1
	score = 10000
	net
	goal_type_checksum = net
	init = goal_king_init
	activate = goal_king_activate
	deactivate = goal_king_deactivate
	active = goal_king_active
	goal_description = "King of the Hill!"
}

script goal_king_init 
endscript

script goal_king_activate 
	printf "script goal_king_activate"
	if insplitscreengame
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	switch <score>
		case 30000
		time_string = "30 seconds"
		case 60000
		time_string = "1 minute"
		case 120000
		time_string = "2 minutes"
		case 300000
		time_string = "5 minutes"
		case 600000
		time_string = "10 minutes"
	endswitch
	if InTeamGame
		formattext textname = msg_text "King of the Hill:\\nHold the crown for \\n%s to win." s = <time_string>
	else
		formattext textname = msg_text "King of the Hill:\\nHold the crown for \\n%s to win." s = <time_string>
	endif
	DisplayGameDescription description = <msg_text>
	SpawnCrown
	show_crown_arrow player_1 player_2 force_show
	ResetScore
endscript

script goal_king_active 
	if AnySkaterTotalScoreAtLeast <score>
		if OnServer
			if CalculateFinalScores
				GoalManager_DeactivateGoal name = <goal_id>
				goal_king_finished
			endif
		else
			GoalManager_DeactivateGoal name = <goal_id>
			goal_king_finished
		endif
	endif
endscript

script goal_king_finished 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	hide_crown_arrow \{player_1
		player_2}
	printf \{"goal_king_deactivate"}
	report_stats \{final}
	create_rankings \{score_title_text = "TIME"}
endscript

script goal_king_deactivate 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	hide_crown_arrow \{player_1
		player_2}
endscript

script king_done 
	dialog_box_exit
	do_backend_retry
endscript

script AddGoal_King 
	GoalManager_AddGoal name = king {
		params = {goal_king_genericParams
			<...>
		}
	}
endscript

script show_crown_arrow 
	if NOT gotparam force_show
		if NOT gman_goalisactive goal = king
			return
		endif
	endif
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			if gotparam player_1
				if NOT objectexists id = crown_arrow
					Create3dArrowPointer id = crown_arrow name = crown_object pos = (395.0, 50.0) scale = 0.02
				endif
			endif
			if gotparam player_2
				if NOT objectexists id = crown_arrow_2
					Create3dArrowPointer id = crown_arrow_2 name = crown_object pos = (395.0, 50.0) scale = 0.02 active_viewport = 1
				endif
			endif
			case split_horizontal
			if gotparam player_1
				if NOT objectexists id = crown_arrow
					Create3dArrowPointer id = crown_arrow name = crown_object pos = (320.0, 140.0) scale = 0.02
				endif
			endif
			if gotparam player_2
				if NOT objectexists id = crown_arrow_2
					Create3dArrowPointer id = crown_arrow_2 name = crown_object pos = (320.0, 140.0) scale = 0.02 active_viewport = 1
				endif
			endif
		endswitch
	else
		if gotparam player_1
			if NOT objectexists id = crown_arrow
				Create3dArrowPointer id = crown_arrow name = crown_object
			endif
		endif
	endif
endscript

script hide_crown_arrow 
	if gotparam \{player_1}
		if objectexists \{id = crown_arrow}
			destroyscreenelement \{id = crown_arrow}
		endif
	endif
	if gotparam \{player_2}
		if objectexists \{id = crown_arrow_2}
			destroyscreenelement \{id = crown_arrow_2}
		endif
	endif
endscript

script StartGoal_King 
	printf \{"StartGoal_Gold"}
	if insplitscreengame
		SetScreenModeFromGameMode
	endif
	GoalManager_EditGoal name = king params = <...>
	GoalManager_ActivateGoal name = king <...>
endscript
