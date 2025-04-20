ScoreChallengeScore = 0
goal_scorechallenge_genericParams = {
	goal_text = "You must score the most points to win!"
	unlimited_time = 1
	score = 1000000
	net
	goal_type_checksum = net
	init = goal_scorechallenge_init
	activate = goal_scorechallenge_activate
	active = goal_scorechallenge_active
	goal_description = "Score Challenge!"
}

script goal_scorechallenge_init 
endscript

script DisplayGameDescription {description = "Game Description"}
	soundevent event = turfwar_cell_menu_back_sfx
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			msg_pos = (640.0, 100.0)
			case split_horizontal
			msg_pos = (640.0, 310.0)
		endswitch
	else
		spawnscript net_rounds_create_current_round_description params = {description = <description>}
		return
	endif
	if NOT isobserving
		create_panel_block id = mp_goal_text parent = root_window text = <description> dims = (500.0, 0.0) style = panel_message_goal final_pos = <msg_pos> net_die
	endif
endscript

script InitializeTagScoring {accumulate_score = 1 track_trick_score = 1 degrade_score = 1 should_modulate_color = 1}
	printf "script InitializeTagScoring"
	GetScoreModeSettings
	printf <score_mode>
	if (<score_mode> = tag_scoring)
		SetScoreAccumulation <accumulate_score>
		SetTrickScoreTracking <track_trick_score>
		SetScoreDegradation <degrade_score>
		SetModulateColors <should_modulate_color>
		printf <target_tags>
	else
		printf "not in a tag scoring mode"
	endif
endscript

script display_tags_or_points 
	GetScoreModeSettings
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
		formattext textname = msg_text "Get %s to win" s = <score_string>
	else
		formattext textname = msg_text "Score Challenge:\\nGet %s to win" s = <score_string>
	endif
	soundevent event = Goal_Chalk_Challenge_Start
	DisplayGameDescription description = <msg_text>
endscript

script goal_scorechallenge_activate 
	InitializeTagScoring
	if insplitscreengame
		MakeSkaterGosub \{add_skater_to_world
			skater = 0}
		MakeSkaterGosub \{add_skater_to_world
			skater = 1}
	endif
	display_tags_or_points msg_pos <...>
	printf \{"************** ACTIVATING SCORECHALLENGE **********************"}
	ResetScore
endscript

script goal_scorechallenge_active 
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
	printf "checking if anyone got top score = %d" d = $ScoreChallengeScore
	if AnySkaterTotalScoreAtLeast $ScoreChallengeScore
		printf "someone has beat the big score!"
		if OnServer
			if CalculateFinalScores
				printf "final scores have been calculated"
				goal_scorechallenge_finished
				break
			endif
		else
			goal_scorechallenge_finished
			break
		endif
	endif
	wait 1 frame
	repeat
endscript

script scorechallenge_chk_enter 
	ResetComboRecords
	spawnscript goal_scorechallenge_active score = <score>
endscript

script scorechallenge_chk_exit 
	killspawnedscript \{name = goal_scorechallenge_active}
	ClearTrickObjects
	SetModulateColors \{0}
endscript

script scorechallenge_post_deactivate 
	destroy_goal_panel_messages
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script goal_scorechallenge_finished 
	destroy_goal_panel_messages
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	printf \{"goal_scorechallenge_deactivate"}
	ResetScorePot \{allskaters}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings}
	else
		create_rankings
	endif
	printf \{"Back from create rankings"}
endscript

script StartGoal_ScoreChallenge 
	if insplitscreengame
		SetScreenModeFromGameMode
		ScreenElementSystemCleanup
	endif
	printstruct <...>
	goal_scorechallenge_activate <...>
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
	gman_activategoal goal = scorechallenge
endscript
