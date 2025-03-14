WallPoints = 0

script netwalls_chk_combo_started 
	printf \{"netwalls_chk_combo_started!"}
	getskaterid
	<objid> :skaterwallgame_startcombo
endscript

script netwalls_chk_combo_ended 
	printf "netwalls_chk_combo_ended! landed = %d" d = <landed>
	getskaterid
	if (<landed> = 0)
		printf \{"<ObjId>:SkaterWallGame_CleanWall"}
		<objid> :skaterwallgame_cleanwall
	endif
	<objid> :skaterwallgame_stopcombo
endscript

script netwalls_start_bail 
	getskaterid
	<objid> :skaterwallgame_cleanwall
endscript

script StartGoal_WallGame 
	if insplitscreengame
		SetScreenModeFromGameMode
	endif
	if compositeobjectexists skater
		getskaterid
		if gotparam lineLen
			<objid> :skaterwallgame_changemaxlen length = <lineLen>
		endif
	endif
	gman_timerfunc goal = netwalls tool = tmr checkpoint = chk func = set_start_time params = {time = <time>}
	gman_activategoal goal = netwalls
	printf "--- StartGoal_WallGame"
	printstruct <...>
	if compositeobjectexists skater
		<objid> :skaterwallgame_startgame game_mode = <game_mode>
	endif
	if gotparam game_mode
		if (<game_mode> = pointscoring)
			if NOT gotparam wall_points
				getpreferencechecksum pref_type = network walls_mode_points
			else
				SetPreference
				<checksum> = <wall_points>
			endif
			printstruct <...>
			switch <target_tags>
				case num_1
				points = 1
				case num_3
				points = 3
				case num_5
				points = 5
				case num_10
				points = 10
			endswitch
			printf "target points = %d" d = <points>
			change WallPoints = <points>
			OverrideGameModeOptions victory_conditions = [{type = target_score score = <points>}]
			GMan_ScoreFunc func = set_target_score goal = netwalls checkpoint = chk tool = scr params = {target_score = <score>}
			GMan_ScoreFunc goal = netwalls checkpoint = chk tool = scr func = start
			spawnscript netwalls_score_check
		else
			spawnscript CheckForNetWallsGameOver
		endif
	endif
	seteventhandler event = SkaterEnterBail scr = netwalls_start_bail group = wallGame response = call_script
	netwalls_chk_enter2
endscript

script netwalls_chk_enter2 
	if compositeobjectexists skater
		getskaterid
		<objid> :skaterwallgame_getgamemode
		printf "--- netwalls_chk_enter2"
		printstruct <...>
		if checksumequals a = <game_type> b = pointscoring
			printf "POINTSCORING"
			GMan_ScoreFunc goal = netwalls checkpoint = chk tool = scr func = start
			if innetgame
				formattext textname = msg_text "First to %d wins." d = $WallPoints
			else
				formattext textname = msg_text "Wall Game:\\nFirst to %d wins." d = $WallPoints
			endif
			soundevent event = Goal_Chalk_Challenge_Start
		else
			printf "LASTMANSTANDING"
			if innetgame
				formattext textname = msg_text "Last person standing wins."
			else
				formattext textname = msg_text "Wall Game:\\nLast person standing wins."
			endif
			soundevent event = Goal_Chalk_Challenge_Start
		endif
		DisplayGameDescription description = <msg_text>
	endif
endscript

script netwalls_chk_exit 
	printf \{"netwalls_chk_exit!!!!"}
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	if compositeobjectexists \{skater}
		getskaterid
		<objid> :skaterwallgame_stopgame
	endif
	goal_timer_destroy_timer \{id = netwalls_tmr_timerScreenElement}
endscript

script netwalls_chk_tmr_expire 
	printf "netwalls_chk_tmr_expire"
	killspawnedscript name = netwalls_score_check
	killspawnedscript name = CheckForNetWallsGameOver
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	getskaterid
	<objid> :skaterwallgame_stopgame
	if NOT gamemodeequals is_singlesession
		if NOT gamemodeequals is_classic
			if insplitscreengame
				create_rankings
			else
				if OnServer
					printf "wait_then_create_rankings"
					spawnscriptlater wait_then_create_rankings
				else
					spawnscript create_rankings
				endif
			endif
		endif
	endif
endscript

script netwalls_chk_pass 
	printf \{"netwalls_chk_pass"}
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	getskaterid
	<objid> :skaterwallgame_stopgame
	if OnServer
		printf \{"wait_then_create_rankings"}
		spawnscriptlater \{wait_then_create_rankings}
	else
		create_rankings
	endif
endscript

script netwalls_chk_tmr_deactivate 
	printf \{"netwalls_chk_tmr_deactivate"}
	if compositeobjectexists \{skater}
		getskaterid
		<objid> :skaterwallgame_stopgame
	endif
endscript

script netwalls_score_check 
	begin
	if ShouldEndRun
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{5
		gameframes}
	if NOT OnServer
		netwalls_chk_exit
		create_rankings
	else
		printf \{"CheckForNetWallsGameOver - passing flag"}
		netwalls_chk_pass
	endif
endscript

script CheckForNetWallsGameOver 
	printf "CheckForNetWallsGameOver"
	begin
	if OnlyOnePlayerLeft
		getskaterid
		<objid> :skaterwallgame_scorelastmanstanding
		wait 5 gameframes
		if NOT OnServer
			netwalls_chk_pass
		else
			printf "CheckForNetWallsGameOver - passing flag"
			netwalls_chk_pass
		endif
		return
	endif
	wait 0.5 seconds
	repeat
endscript

script netwalls_post_deactivate 
	printf \{"--- netwalls_post_deactivate"}
	killspawnedscript \{name = netwalls_score_check}
	killspawnedscript \{name = CheckForNetWallsGameOver}
endscript
