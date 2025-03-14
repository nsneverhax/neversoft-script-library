goal_chalk_type = null

script Chalk_GoalInitializerTriggerScript 
	printf "starting Chalk_GoalInitializerTriggerScript"
	if skater :export_isrecording
		return
	endif
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if ($ingame_save_active = 1)
		return false
	endif
	formattext checksumname = chalk_name '%a' a = <goal_name>
	if NOT gman_goalexists goal = <chalk_name>
		return
	endif
	if NOT gman_goalisinitialized goal = <chalk_name>
		return
	endif
	if checksumequals a = <chalk_name> b = m_training_grind
		if NOT getnodeflag nodeflag_slums_training_grind
			return
		endif
	endif
	if checksumequals a = <chalk_name> b = m_training_manual
		if NOT getnodeflag nodeflag_slums_training_manual
			return
		endif
	endif
	if NOT gman_goalisactive goal = <chalk_name>
		if NOT gman_hasactivegoals
			<chalk_start_gap_ids> = [none none none]
			formattext checksumname = am_gap '%a_am_gap' a = <goal_name>
			setarrayelement arrayname = chalk_start_gap_ids index = 0 newvalue = <am_gap>
			formattext checksumname = pro_gap '%a_pro_gap' a = <goal_name>
			setarrayelement arrayname = chalk_start_gap_ids index = 1 newvalue = <pro_gap>
			formattext checksumname = sick_gap '%a_sick_gap' a = <goal_name>
			setarrayelement arrayname = chalk_start_gap_ids index = 2 newvalue = <sick_gap>
			switch <type>
				case Grind
				if skater :onrail
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
							SkaterEnterWalking
							SkaterEnterManual
							SkaterEnterFootplant
							SkaterEnterRevert
						]
					}
				endif
				case distanceair
				if skater :inair
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							SkaterExitAir
							skaterlanded
							SkaterEnterWalking
							SkaterEnterManual
							SkaterEnterRail
						]
					}
				endif
				case height
				if skater :inair
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							SkaterExitAir
							skaterlanded
							SkaterEnterWalking
							SkaterEnterManual
							SkaterEnterLip
							SkaterEnterRail
						]
					}
				endif
				case Manual
				if skater :InManual
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
							SkaterEnterWalking
							SkaterEnterRail
							SkaterEnterFootplant
						]
					}
				endif
				case AcidDrop
				if skater :inair
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
							SkaterEnterWalking
						]
					}
				endif
				case wallride
				if skater :OnWall
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
						]
					}
				endif
				case stall
				if triggertype stall Onto
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
						]
					}
				endif
				case Wallplant
				wait 1 gameframe
				if skater :inwallplant
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
						]
					}
				endif
				case natasspin
				if triggertype spin Onto
					gman_activategoal goal = <chalk_name>
					change goal_chalk_type = <type>
					obj_spawnscriptnow Chalk_StartGap params = {
						chalk_start_gap_ids = <chalk_start_gap_ids>
						chalk_name = <chalk_name>
						exceptions_types = [
							skaterlanded
						]
					}
				endif
			endswitch
		endif
	endif
endscript

script Chalk_StartGap 
	printf "starting Chalk_StartGap"
	cleareventhandlergroup Chalk_Exceptions
	getarraysize chalk_start_gap_ids
	<index> = 0
	begin
	printf (<chalk_start_gap_ids> [<index>])
	StartGap GapID = (<chalk_start_gap_ids> [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = announce chalk_announce_time = 60}
	soundevent event = Goal_Chalk_Challenge_Start
	getarraysize exceptions_types
	<index> = 0
	begin
	<chalk_current_exception_type> = (<exceptions_types> [<index>])
	seteventhandler event = <chalk_current_exception_type> scr = Chalk_Evaluation group = Chalk_Exceptions response = switch_script params = {
		chalk_name = <chalk_name>
	}
	<index> = (<index> + 1)
	repeat <array_size>
	seteventhandler event = skaterbailed scr = Chalk_Fail group = Chalk_Exceptions response = switch_script params = {chalk_name = <chalk_name>}
	block
endscript

script Chalk_EndGap 
	printf "starting Chalk_EndGap"
	formattext checksumname = chalk_name '%a' a = <goal_name>
	if NOT gman_goalexists goal = <chalk_name>
		return
	endif
	if NOT gman_goalisinitialized goal = <chalk_name>
		return
	endif
	if gman_goalisactive goal = <chalk_name>
		switch ($goal_chalk_type)
			case Wallplant
			wait 1 gameframe
			if NOT skater :inwallplant
				return
			endif
			case wallride
			if NOT skater :OnWall
				return
			endif
			case stall
			if NOT triggertype stall Onto
				return
			endif
			case natasspin
			if NOT triggertype spin Onto
				return
			endif
			case Grind
			if NOT skater :onrail
				return
			endif
			case Manual
			if NOT skater :InManual
				return
			endif
			case AcidDrop
			case distanceair
			case height
			if NOT skater :inair
				return
			endif
		endswitch
		switch <rank>
			case am
			formattext checksumname = am_gap '%a_am_gap' a = <goal_name>
			endgap GapID = <am_gap> gapscript = Chalk_EndGap_Got gapscriptparams = {
				rank = <rank>
				chalk_name = <chalk_name>
			}
			case pro
			if ((($goal_chalk_type) = AcidDrop) || gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = am})
				formattext checksumname = pro_gap '%a_pro_gap' a = <goal_name>
				endgap GapID = <pro_gap> gapscript = Chalk_EndGap_Got gapscriptparams = {
					rank = <rank>
					chalk_name = <chalk_name>
				}
			endif
			case sick
			if ((($goal_chalk_type) = AcidDrop) || gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = pro})
				formattext checksumname = sick_gap '%a_sick_gap' a = <goal_name>
				endgap GapID = <sick_gap> gapscript = Chalk_EndGap_Got gapscriptparams = {
					rank = <rank>
					chalk_name = <chalk_name>
				}
			endif
		endswitch
	endif
endscript

script Chalk_EndGap_Got 
	printf "starting Chalk_EndGap_Got"
	<type> = ($goal_chalk_type)
	<continue> = false
	if (($goal_chalk_type) = AcidDrop)
		if ((gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = am}) ||
				(gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = pro}) ||
				(gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = sick}))
			return
		else
			<continue> = true
		endif
	endif
	switch <rank>
		case am
		gman_flagfunc goal = <chalk_name> tool = flags1 func = set params = {flag = am value = 1}
		spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = am_possible chalk_announce_time = 60}
		soundevent event = medal_am_sfx
		case pro
		if ((<continue> = true) || gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = am})
			gman_flagfunc goal = <chalk_name> tool = flags1 func = set params = {flag = pro value = 1}
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = pro_possible chalk_announce_time = 60}
			soundevent event = medal_pro_sfx
		endif
		case sick
		if ((<continue> = true) || gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = pro})
			gman_flagfunc goal = <chalk_name> tool = flags1 func = set params = {flag = sick value = 1}
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = sick_possible chalk_announce_time = 60}
			soundevent event = medal_sick_sfx
		endif
	endswitch
endscript

script Chalk_Evaluation 
	printf "starting Chalk_Evaluation"
	cleareventhandlergroup Chalk_Exceptions
	killspawnedscript name = Chalk_StartGap
	if NOT gman_goalexists goal = <chalk_name>
		return
	endif
	if GMan_GoalIsRetrying goal = <chalk_name>
		return
	endif
	if skater :isinbail
		Chalk_Fail chalk_name = <chalk_name>
		return
	endif
	gman_getdata goal = <chalk_name>
	if (($goal_chalk_type) = AcidDrop)
		if gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = sick}
			<evaluationText> = "Congrats! You're Sick!"
			<chalk_status> = pass
			<chalk_grade> = 3
		elseif gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = pro}
			<evaluationText> = "Nice! You got Pro!"
			<chalk_status> = pass
			<chalk_grade> = 2
		elseif gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = am}
			<evaluationText> = "Good Job! You got Am."
			<chalk_status> = pass
			<chalk_grade> = 1
		else
			<evaluationText> = "Did you even try?!"
			<chalk_status> = fail
			<chalk_grade> = 0
		endif
	else
		if gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = am}
			if gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = pro}
				if gman_flagfunc goal = <chalk_name> tool = flags1 func = is_set params = {flag = sick}
					<evaluationText> = "Congrats! You're Sick!"
					<chalk_status> = pass
					<chalk_grade> = 3
				else
					<evaluationText> = "Nice! You got Pro!"
					<chalk_status> = pass
					<chalk_grade> = 2
				endif
			else
				<evaluationText> = "Good Job! You got Am."
				<chalk_status> = pass
				<chalk_grade> = 1
			endif
		else
			<evaluationText> = "Did you even try?!"
			<chalk_status> = fail
			<chalk_grade> = 0
		endif
	endif
	gman_getgrade goal = <chalk_name>
	if (<chalk_grade> > <grade>)
		gman_setgrade goal = <chalk_name> grade = <chalk_grade>
		switch <chalk_grade>
			case 3
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = sick_success}
			soundevent event = General_Goal_Success_Sound_sfx
			case 2
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = pro_success}
			soundevent event = General_Goal_Success_Sound_sfx
			case 1
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = am_success}
			soundevent event = General_Goal_Success_Sound_sfx
			case 0
			default
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = failed_prompt_retry}
			soundevent event = ChalkChallenge_FailGoal
		endswitch
		Chalk_GoalCompletion {
			chalk_name = <chalk_name>
			chalk_status = <chalk_status>
		}
	else
		gman_setgrade goal = <chalk_name> grade = <grade>
		switch <chalk_grade>
			case 3
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = success_but_already_achieved_sick}
			case 2
			case 1
			if (<grade> = 3)
				spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = success_but_already_achieved_sick}
			else
				spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = success_but_not_better_than_previous_grade}
			endif
			case 0
			default
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = failed_prompt_retry}
			soundevent event = ChalkChallenge_FailGoal
		endswitch
		Chalk_GoalCompletion {
			chalk_name = <chalk_name>
			chalk_status = <chalk_status>
		}
	endif
endscript

script Chalk_GoalCompletion 
	printf "starting Chalk_GoalCompletion"
	GMan_ScoreAccumulatorFunc func = get_score goal = <chalk_name> tool = accumulator
	if gotparam accumulated_score
		if (<accumulated_score> = 0)
			SkaterGetScoreInfo
			GMan_ScoreAccumulatorFunc func = add_score goal = <chalk_name> tool = accumulator params = {score = <ScorePot>}
			GMan_ScoreAccumulatorFunc func = stop goal = <chalk_name> tool = accumulator
		endif
	endif
	if (<chalk_status> = pass)
		gman_passcheckpoint goal = <chalk_name> do_rollout = 0
	else
		goal_ui_kill_message type = alert_goal
		gman_failcheckpoint goal = <chalk_name> do_rollout = 0
	endif
endscript

script Chalk_Fail 
	printf \{"starting Chalk_Fail"}
	cleareventhandlergroup \{Chalk_Exceptions}
	spawnscriptnow \{noqbid
		Chalk_AnnounceStateUI
		params = {
			chalk_announce = failed_prompt_retry
		}}
	soundevent \{event = ChalkChallenge_FailGoal}
	gman_failcheckpoint goal = <chalk_name> do_rollout = 0
endscript

script Chalk_Quit 
	killspawnedscript \{name = Chalk_StartGap}
endscript
