goal_line_challenge_current_ending_goal = null

script goal_line_challenge_gotObject 
	printf "goal_line_challenge_gotObject"
	<reset_tool> = true
	if NOT skater :isinbail
		if skater :skating
			if gman_goalisinitialized goal = <goal_id>
				if NOT GMan_GoalIsRetrying goal = <goal_id>
					root_window :getsingletag menu_state
					if checksumequals a = <menu_state> b = off
						if NOT skater :export_isrecording
							if ($video_editor_in_video_editor = 0)
								if ($ingame_save_active = 0)
									if gman_hasactivegoals
										if gman_getactivatedgoalid
											if checksumequals a = <activated_goal_id> b = <goal_id>
												<reset_tool> = false
												goal_line_challenge_gotNextObject {
													goal = <goal_id>
													trick_object_index = <trick_object_index>
													score = <score>
													trick_object_id = <trick_object_id>
												}
											endif
										endif
									else
										<reset_tool> = false
										gman_activategoal goal = <goal_id>
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	if checksumequals a = <reset_tool> b = true
		GMan_TrickObjFunc goal = <goal_id> tool = <tool_id> func = reset_objects
	endif
endscript

script goal_line_challenge_enter 
	printf "goal_line_challenge_enter"
	soundevent event = Goal_Chalk_Challenge_Start
	goal_ui_kill_message type = uberalert
	goal_ui_display_message type = instruction text = "Skate as many objects in the line as you can in one combo!"
	if NOT gman_getconstant goal = <goal_id> name = line_challenge_num_total
		scriptassert "Line Challenge goal started but line_challenge_num_total value not set in constants."
		gman_failcheckpoint goal = <goal_id> do_rollout = 0
		soundevent event = ChalkChallenge_FailGoal
	endif
	goal_create_counter initial_count = 1 total_number = <line_challenge_num_total> hud_counter_caption = "Line objects hit"
	Chalk_AnnounceStateUI chalk_announce = announce_line
	spawnscriptnow goal_line_challenge_score_update params = {goal_id = <goal_id>}
endscript

script goal_line_challenge_exit 
	printf \{"goal_line_challenge_exit"}
	gman_flagfunc goal = <goal_id> tool = flags func = reset
	goal_ui_kill_message \{type = instruction}
	goal_destroy_counter
	killspawnedscript \{name = goal_line_challenge_score_update}
	change \{goal_line_challenge_current_ending_goal = null}
endscript

script goal_line_challenge_score_update 
	printf "goal_line_challenge_score_update"
	SkaterGetScoreInfo
	<initial_score> = <ScorePot>
	gman_setdata goal = <goal_id> params = {initial_score = <initial_score>}
	begin
	SkaterGetScoreInfo
	<display_score> = (<ScorePot> - <initial_score>)
	GMan_ScoreAccumulatorFunc goal = <goal_id> tool = accumulator func = reset
	GMan_ScoreAccumulatorFunc goal = <goal_id> tool = accumulator func = add_score params = {score = <display_score>}
	wait 3 gameframes
	repeat
endscript

script goal_line_challenge_gotNextObject 
	printf "goal_line_challenge_gotNextObject"
	gman_flagfunc goal = <goal_id> tool = flags func = get_num_set
	goal_update_counter number_collected = <num_flags_set>
	if NOT gman_getconstant goal = <goal_id> name = line_challenge_num_for_am
		scriptassert "Line Challenge got object but line_challenge_num_for_am value not set in constants."
		gman_failcheckpoint goal = <goal_id> do_rollout = 0
		soundevent event = ChalkChallenge_FailGoal
	endif
	if (<num_flags_set> = <line_challenge_num_for_am>)
		Chalk_AnnounceStateUI chalk_announce = am_possible
	endif
	if (<num_flags_set> < <line_challenge_num_for_am>)
		if (<num_flags_set> < 3)
			soundevent event = TurfWar_LandOnObject_FirstObject
		else
			soundevent event = TurfWar_LandOnObject_BelowAm
		endif
	else
		gman_getconstant goal = <goal_id> name = line_challenge_num_total
		printf <line_challenge_num_total>
		if (<num_flags_set> = <line_challenge_num_total>)
			soundevent event = TurfWar_LandOnObject_HitTarget
		else
			soundevent event = TurfWar_LandOnObject_Am
		endif
	endif
endscript

script goal_line_challenge_comboEnded 
	printf "goal_line_challenge_comboEnded"
	if gotparam retry
		printf "goal_line_challenge_comboEnded - exiting early for retry"
		return
	endif
	if checksumequals a = ($goal_line_challenge_current_ending_goal) b = null
		change goal_line_challenge_current_ending_goal = <goal_id>
	else
		return
	endif
	if (<landed> = 1)
		goal_line_challenge_evaluate goal_id = <goal_id>
	else
		goal_ui_display_message type = uberalert text = "FAILED!" color = red
		gman_failcheckpoint goal = <goal_id> do_rollout = 0
		soundevent event = ChalkChallenge_FailGoal
	endif
endscript

script goal_line_challenge_evaluate 
	printf "goal_line_challenge_evaluate"
	if gotparam retry
		printf "goal_line_challenge_evaluate - exiting early for retry"
		return
	endif
	gman_getconstants goal = <goal_id>
	<continue> = true
	if NOT gotparam line_challenge_num_total
		<continue> = false
		<text> = "Line Challenge goal ended but line_challenge_num_total value not set in constants."
	endif
	if NOT gotparam line_challenge_num_for_am
		<continue> = false
		<text> = "Line Challenge goal ended but line_challenge_num_for_am value not set in constants."
	endif
	if NOT gotparam line_challenge_score_for_sick
		<continue> = false
		<text> = "Line Challenge goal ended but line_challenge_score_for_sick value not set in constants."
	endif
	if (<continue> = false)
		softassert <text>
	else
		gman_flagfunc goal = <goal_id> tool = flags func = get_num_set
		SkaterGetScoreInfo
		gman_getdata goal = <goal_id> name = initial_score
		<accumulated_score> = (<ScorePot> - <initial_score>)
		<pass> = true
		if ((<num_flags_set> = <line_challenge_num_total>) && (<accumulated_score> > (<line_challenge_score_for_sick> - 1)))
			gman_setgrade goal = <goal_id> grade = 3
			Chalk_AnnounceStateUI chalk_announce = sick_success
			soundevent event = medal_sick_sfx
		elseif (<num_flags_set> = <line_challenge_num_total>)
			gman_setgrade goal = <goal_id> grade = 2
			Chalk_AnnounceStateUI chalk_announce = pro_success
			soundevent event = medal_pro_sfx
		elseif (<num_flags_set> > (<line_challenge_num_for_am> - 1))
			gman_setgrade goal = <goal_id> grade = 1
			Chalk_AnnounceStateUI chalk_announce = am_success
			soundevent event = medal_am_sfx
		else
			gman_setgrade goal = <goal_id> grade = 0
			Chalk_AnnounceStateUI chalk_announce = failed
			soundevent event = ChalkChallenge_FailGoal
			<pass> = false
		endif
		if (<pass> = true)
			gman_passcheckpoint goal = <goal_id> do_rollout = 0
		else
			gman_failcheckpoint goal = <goal_id> do_rollout = 0
			soundevent event = ChalkChallenge_FailGoal
		endif
	endif
endscript
