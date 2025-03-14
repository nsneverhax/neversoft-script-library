goal_combochallenge_genericParams = {
	goal_text = "You must score the most points to win!"
	unlimited_time = 1
	score = 1000000
	net
	goal_type_checksum = net
	init = goal_combochallenge_init
	activate = goal_combochallenge_activate
	active = goal_combochallenge_active
	deactivate = goal_combochallenge_deactivate
	goal_description = "Score Challenge!"
}

script goal_combochallenge_init 
endscript

script combochallenge_display_tags_or_points 
	if innetgame
		score_mode = <type>
	else
		GetScoreModeSettings
	endif
	if NOT gotparam target_tags
		target_tags = <tags>
	endif
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
		case point_scoring
		getpreferencechecksum pref_type = network target_score
		printf <score>
		switch <score>
			case 10000
			score_string = "10,000 pts"
			case 25000
			score_string = "25,000 pts"
			case 50000
			score_string = "50,000 pts"
			case 75000
			score_string = "75,000 pts"
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
	endswitch
	if innetgame
		formattext textname = msg_text "Get %s\\nto win" s = <score_string>
	else
		formattext textname = msg_text "COMBO CHALLENGE:\\nGet %s\\nto win" s = <score_string>
	endif
	soundevent event = Goal_Chalk_Challenge_Start
	DisplayGameDescription description = <msg_text>
endscript

script goal_combochallenge_activate 
	InitializeTagScoring \{accumulate_score = 0}
	if insplitscreengame
		MakeSkaterGosub \{add_skater_to_world
			skater = 0}
		MakeSkaterGosub \{add_skater_to_world
			skater = 1}
	endif
	combochallenge_display_tags_or_points msg_pos <...>
	printf \{"************** ACTIVATING combochallenge **********************"}
	ResetScore
endscript

script goal_combochallenge_active 
	begin
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
	if AnySkaterTotalScoreAtLeast $ScoreChallengeScore
		printf "someone has beat the big score!"
		if OnServer
			if CalculateFinalScores
				printf "final scores have been calculated"
				goal_combochallenge_finished
				break
			endif
		else
			goal_combochallenge_finished
			break
		endif
	endif
	wait 1 frame
	repeat
endscript

script combochallenge_chk_enter 
	spawnscript goal_combochallenge_active score = <score>
endscript

script combochallenge_chk_exit 
	printf \{"combochallenge_chk_exit"}
	destroy_goal_panel_messages
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	killspawnedscript \{name = goal_combochallenge_active}
	ClearTrickObjects
	SetModulateColors \{0}
endscript

script combochallenge_chk_deactivate 
endscript

script combochallenge_post_deactivate 
	destroy_goal_panel_messages
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script goal_combochallenge_finished 
	destroy_goal_panel_messages
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	printf \{"goal_combochallenge_deactivate"}
	ResetScorePot \{allskaters}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings}
	else
		create_rankings
	endif
endscript

script StartGoal_ComboChallenge 
	if insplitscreengame
		SetScreenModeFromGameMode
		ScreenElementSystemCleanup
	endif
	printf "StartGoal_ComboChallenge"
	printstruct <...>
	goal_combochallenge_activate <...>
	if innetgame
		score_mode = <type>
		target_tags = <tags>
	endif
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
		change ScoreChallengeScore = <tags>
		OverrideGameModeOptions victory_conditions = [{type = target_score score = <tags>}]
		OverrideGameModeOptions should_modulate_color = 1
	else
		change ScoreChallengeScore = <score>
		OverrideGameModeOptions victory_conditions = [{type = target_score score = <score>}]
	endif
	gman_activategoal goal = combochallenge
endscript
