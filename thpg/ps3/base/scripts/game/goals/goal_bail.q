bail_goal_type_target = 0
bail_goal_target_name = null
bail_goal_type_bowling = 0

script Bail_RunAnimOnMarker 
	printf \{"starting Bail_RunAnimOnMarker"}
	runscriptonobject {
		id = <bail_marker_id>
		Bail_AnimateMarker
	}
endscript

script Bail_AnimateMarker 
	printf \{"starting Bail_AnimateMarker"}
	obj_roty \{speed = 200}
	obj_hover \{amp = 0.25
		freq = 2}
endscript

script Bail_EvaluateGoal 
	printf "starting Bail_EvaluateGoal"
	goal_exit_area_end
	if (gman_flagfunc goal = <bail_goal> checkpoint = checkpoint1 tool = flag_bail_sick func = is_set params = {flag = flag_1})
		printf "getting sick grade"
		<bail_current_grade> = 3
		<bail_status> = pass
	else
		if (gman_flagfunc goal = <bail_goal> checkpoint = checkpoint1 tool = flag_bail_pro func = is_set params = {flag = flag_1})
			printf "getting pro grade"
			<bail_current_grade> = 2
			<bail_status> = pass
		else
			if (gman_flagfunc goal = <bail_goal> checkpoint = checkpoint1 tool = flag_bail_am func = is_set params = {flag = flag_1})
				printf "getting am grade"
				<bail_current_grade> = 1
				<bail_status> = pass
			else
				printf "getting failing grade"
				<bail_current_grade> = 0
				<bail_status> = fail
			endif
		endif
	endif
	switch <bail_current_grade>
		case 3
		<bail_status> = pass
		case 2
		<bail_status> = pass
		case 1
		<bail_status> = pass
		case 0
		<bail_status> = fail
	endswitch
	gman_setgrade goal = <bail_goal> grade = <bail_current_grade>
	goal_generic_view_goal_endrun {
		goal = <bail_goal>
		performance_text = <bail_evaluationText>
		callback_script = Bail_GoalCompletion
		callback_params = {
			bail_goal = <bail_goal>
			bail_status = <bail_status>
		}
	}
endscript

script Bail_GoalCompletion 
	printf \{"starting Bail_GoalCompletion"}
	goal_exit_area_end
	if (<bail_status> = pass)
		gman_passcheckpoint goal = <bail_goal>
	else
		gman_failcheckpoint goal = <bail_goal>
	endif
endscript

script Bail_WaitingForBailToStart 
	printf \{"starting Bail_WaitingForBailToStart"}
	block \{untilevent = SkaterEnterBail}
	spawnscriptnow Bail_StartBailing id = bail_goal params = {
		bail_goal = <bail_goal>
		starting_bail_script = <starting_bail_script>
		bail_skater_exit_bail_script = <bail_skater_exit_bail_script>
	}
endscript

script Bail_StartBailing 
	printf "starting Bail_StartBailing"
	if gotparam starting_bail_script
		<starting_bail_script>
	endif
	<show_instructions> = 0
	if ($bail_goal_type_target = 1)
		gman_getdata goal = $bail_goal_target_name
		if (<current_round> > 1)
			<show_instructions> = 0
		else
			<show_instructions> = 1
		endif
	else
		<show_instructions> = 1
	endif
	if (<show_instructions> = 1)
	endif
	block untilevent = SkaterExitBail
	if ($bail_goal_type_bowling = 1)
		skater :obj_getposition
		skater :obj_getquat
		<restart_pos> = {pos = <pos> quat = <quat>}
		goal_move_skater restart_pos = <restart_pos>
		kill_start_key_binding
		skater :pausephysics
		skater :disableplayerinput
		skater :setspeed 0
		wait 2 seconds
		skater :unpausephysics
		skater :enableplayerinput
		restore_start_key_binding
	endif
	spawnscriptnow <bail_skater_exit_bail_script> id = bail_goal
endscript

script Bail_StartAreaLeaving 
	printf \{"starting Bail_StartAreaLeaving"}
	goal_exit_area_begin {
		goal = <bail_goal>
		timer = area_warning_timer
		verbose = 1
	}
endscript

script Bail_StartAreaReturning 
	printf \{"starting Bail_StartAreaReturning"}
	goal_exit_area_end
endscript

script Bail_OutOfBounds_Expire 
	printf \{"starting Bail_OutOfBounds_Expire"}
	killspawnedscript \{name = Bail_StartBailing}
	killspawnedscript \{name = Bail_WaitingForBailToStart}
	soundevent \{event = Goal_UI_Negative_Text}
	spawnscriptnow \{goal_retry_current_goal}
endscript

script Bail_Complete_Failure 
	printf \{"starting Bail_Complete_Failure"}
	soundevent \{event = Goal_UI_Negative_Text}
	spawnscriptnow \{goal_retry_current_goal}
endscript

script Bail_CleanUp 
	printf \{"starting Bail_CleanUp"}
	skater :enableplayerinput
	goal_exit_area_end
	killspawnedscript \{id = bail_goal}
	killspawnedscript \{name = Bail_StartBailing}
	killspawnedscript \{name = Bail_WaitingForBailToStart}
	if gotparam \{goal_string}
		goal_viewport_kill goal_string = <goal_string>
	endif
	goal_ui_kill_all_messages
	goal_destroy_counter
endscript

script bail_set_skater_tags 
	skater :settags \{bail_settings = {
			Cap_Bail_Time = 30.0
			Stick_Force_Multiplier = 2.5
			Ollie_Force_Multiplier = 5.0
		}}
endscript

script bail_splat_sound_play 
	if skater :isinbail
		soundevent \{event = sk8_BodySplat}
	endif
endscript
