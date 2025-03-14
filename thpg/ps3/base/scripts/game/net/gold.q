gold_object_components = [
	{
		component = gold
	}
	{
		component = motion
	}
	{
		component = model
		model = 'gameobjects\\pot_o_gold\\pot_o_gold.mdl'
	}
]
goal_gold_genericParams = {
	goal_text = "Grab the Pot of Gold and start scoring!"
	score = 10
	net
	goal_type_checksum = net
	init = goal_gold_init
	activate = goal_gold_activate
	deactivate = goal_gold_deactivate
	active = goal_gold_active
	expire = goal_gold_finished
	goal_description = "Pot O' Gold"
}

script goal_gold_init 
endscript

script gold_display_tags_or_points 
	printf "script gold_display_tags_or_points"
	if (<unlimited_time> = 0)
		formattext textname = msg_text "Pot O' Gold:\\nHold the gold and score before time runs out."
	else
		switch <score_mode>
			case tag_scoring
			switch <target_tags>
				case tags_10
				score_string = "10 tags"
				case tags_20
				score_string = "20 tags"
				case tags_30
				score_string = "30 tags"
				case tags_40
				score_string = "40 tags"
				case tags_50
				score_string = "50 tags"
			endswitch
			formattext textname = msg_text "Pot O' Gold:\\nHold the gold and\\nscore %s to win." s = <score_string>
			case point_scoring
			switch <score>
				case 100000
				score_string = "100,000 pts"
				case 250000
				score_string = "250,000 pts"
				case 500000
				score_string = "500,000 pts"
				case 1000000
				score_string = "1,000,000 pts"
				case 2000000
				score_string = "2,000,000 pts"
				case 5000000
				score_string = "5,000,000 pts"
				case 10000000
				score_string = "10,000,000 pts"
				case 50000000
				score_string = "50,000,000 pts"
				case 100000000
				score_string = "100,000,000 pts"
			endswitch
			formattext textname = msg_text "Pot O' Gold:\\nHold the gold and\\nscore %s to win." s = <score_string>
		endswitch
	endif
	DisplayGameDescription description = <msg_text>
endscript

script goal_gold_activate 
	printf \{"script goal_gold_activate"}
	if (<score_mode> = tag_scoring)
		InitializeTagScoring <...>
	endif
	if insplitscreengame
		MakeSkaterGosub \{add_skater_to_world
			skater = 0}
		MakeSkaterGosub \{add_skater_to_world
			skater = 1}
	endif
	gold_display_tags_or_points <...>
	SpawnGold
	show_gold_arrow \{player_1
		player_2
		force_show}
	ResetScore
	if (<unlimited_time> = 1)
		goal_hide_timer
	endif
endscript

script goal_gold_active 
	if (<unlimited_time> = 1)
		goal_hide_timer
	endif
	game_finished = 0
	if NOT gotparam unlimited_time
		GoalManager_GetTimeLeftInNetGame
		if gotparam time_left
			if (<time_left> < 1)
				printf "game finished because timer ran out"
				<game_finished> = 1
			endif
		endif
	else
		if AnySkaterTotalScoreAtLeast <score>
			printf "game finished because a player scored enough points"
			<game_finished> = 1
		endif
	endif
	if (<game_finished> = 1)
		if OnServer
			if CalculateFinalScores
				GoalManager_DeactivateGoal name = <goal_id>
				goal_gold_finished
			endif
		else
			GoalManager_DeactivateGoal name = <goal_id>
			goal_gold_finished
		endif
	endif
endscript

script goal_gold_finished 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	hide_gold_arrow \{player_1
		player_2}
	report_stats \{final}
	create_rankings \{score_title_text = "SCORE"}
endscript

script goal_gold_deactivate 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	hide_gold_arrow \{player_1
		player_2}
endscript

script gold_done 
	dialog_box_exit
	do_backend_retry
endscript

script show_gold_arrow 
	if NOT gotparam force_show
		if NOT gman_goalisactive goal = gold
			return
		endif
	endif
	if isobserving
		return
	endif
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			if gotparam player_1
				if NOT objectexists id = gold_arrow
					Create3dArrowPointer id = gold_arrow name = gold_object pos = (395.0, 50.0) scale = 0.02
				endif
			endif
			if gotparam player_2
				if NOT objectexists id = gold_arrow_2
					Create3dArrowPointer id = gold_arrow_2 name = gold_object pos = (395.0, 50.0) scale = 0.02 active_viewport = 1
				endif
			endif
			case split_horizontal
			if gotparam player_1
				if NOT objectexists id = gold_arrow
					Create3dArrowPointer id = gold_arrow name = gold_object pos = (320.0, 140.0) scale = 0.02
				endif
			endif
			if gotparam player_2
				if NOT objectexists id = gold_arrow_2
					Create3dArrowPointer id = gold_arrow_2 name = gold_object pos = (320.0, 140.0) scale = 0.02 active_viewport = 1
				endif
			endif
		endswitch
	else
		if gotparam player_1
			if NOT objectexists id = gold_arrow
				Create3dArrowPointer id = gold_arrow name = gold_object
			endif
		endif
	endif
endscript

script hide_gold_arrow 
	if gotparam \{player_1}
		if objectexists \{id = gold_arrow}
			destroyscreenelement \{id = gold_arrow}
		endif
	endif
	if gotparam \{player_2}
		if objectexists \{id = gold_arrow_2}
			destroyscreenelement \{id = gold_arrow_2}
		endif
	endif
endscript

script AddGoal_gold 
	printf \{"AddGoal_gold"}
	GoalManager_AddGoal name = gold {
		params = {$goal_gold_genericParams <...>
		}
	}
endscript

script StartGoal_Gold 
	printf "StartGoal_Gold"
	if insplitscreengame
		prefs = splitscreen
	else
		prefs = network
	endif
	GetScoreModeSettings
	if (<score_mode> = tag_scoring)
		switch <target_tags>
			case tags_10
			tags = 10
			case tags_20
			tags = 20
			case tags_30
			tags = 30
			case tags_40
			tags = 40
			case tags_50
			tags = 50
		endswitch
		<score> = <tags>
	endif
	GoalManager_RemoveGoal name = gold
	AddGoal_gold <...>
	if gotparam unlimited_time
		if (<unlimited_time> = 0)
			GoalManager_RemoveUnlimitedTimeFlag name = gold
			printf "removed unlimited time flag"
		endif
	endif
	GoalManager_ActivateGoal name = gold
endscript
