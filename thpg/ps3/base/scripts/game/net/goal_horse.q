HorseTimerExpired = 0
goal_horse_mp_genericParams = {
	goal_text = "Complete the other players' tricks!"
	time = 10
	net
	goal_type_checksum = net
	init = goal_horse_mp_init
	activate = goal_horse_mp_activate
	deactivate = goal_horse_mp_deactivate
	expire = goal_horse_mp_expire
	goal_description = "Horse!"
}

script horse_chk1_activate 
	printf \{"ACTIVATE HORSE"}
	gman_setdata \{goal = horse
		params = {
			score_to_beat = 0
		}}
	ResetScore
endscript

script horse_chk2_activate 
	printf \{"ACTIVATE HORSE"}
	gman_setdata \{goal = horse
		params = {
			score_to_beat = 0
		}}
	ResetScore
endscript

script horse_chk3_activate 
	printf \{"ACTIVATE HORSE"}
	gman_setdata \{goal = horse
		params = {
			score_to_beat = 0
		}}
	ResetScore
endscript

script horse_chk4_activate 
	printf \{"ACTIVATE HORSE"}
	gman_setdata \{goal = horse
		params = {
			score_to_beat = 0
		}}
	ResetScore
endscript

script horse_chk5_activate 
	printf \{"ACTIVATE HORSE"}
	gman_setdata \{goal = horse
		params = {
			score_to_beat = 0
		}}
	ResetScore
endscript

script horse_chk1_deactivate 
	if objectexists \{id = horse_score_menu}
		destroyscreenelement \{id = horse_score_menu}
	endif
	printf \{"DEACTIVATE HORSE"}
endscript

script horse_chk2_deactivate 
	if objectexists \{id = horse_score_menu}
		destroyscreenelement \{id = horse_score_menu}
	endif
	printf \{"DEACTIVATE HORSE"}
endscript

script horse_chk3_deactivate 
	if objectexists \{id = horse_score_menu}
		destroyscreenelement \{id = horse_score_menu}
	endif
	printf \{"DEACTIVATE HORSE"}
endscript

script horse_chk4_deactivate 
	if objectexists \{id = horse_score_menu}
		destroyscreenelement \{id = horse_score_menu}
	endif
	printf \{"DEACTIVATE HORSE"}
endscript

script horse_chk5_deactivate 
	destroy_horse_score_menu
	dialog_box_exit
	do_backend_retry
endscript

script StopSkater 
	if IsCurrentHorseSkater \{0}
		getskaterid \{skater = 0}
	else
		getskaterid \{skater = 1}
	endif
	if gotparam \{objid}
		<objid> :obj_killallspawnedscripts
		<objid> :endofrundone
	endif
endscript

script horse_chk1_tmr_expire 
	printf \{"EXPIRE HORSE Timer"}
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	change \{HorseTimerExpired = 1}
	printf \{"goal_horse_mp_expire 1"}
	spawnscript \{StopSkater}
endscript

script horse_chk2_tmr_expire 
	printf \{"EXPIRE HORSE Timer"}
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_horse_mp_expire 2"}
	change \{HorseTimerExpired = 1}
endscript

script horse_chk3_tmr_expire 
	printf \{"EXPIRE HORSE Timer"}
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_horse_mp_expire 3"}
	change \{HorseTimerExpired = 1}
endscript

script horse_chk4_tmr_expire 
	printf \{"EXPIRE HORSE Timer"}
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_horse_mp_expire 4"}
	change \{HorseTimerExpired = 1}
endscript

script horse_chk5_tmr_expire 
	printf \{"EXPIRE HORSE Timer"}
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_horse_mp_expire 5"}
	change \{HorseTimerExpired = 1}
endscript

script StartGoal_Horse_Mp 
	if insplitscreengame
	endif
	gman_timerfunc goal = horse tool = tmr checkpoint = chk1 func = set_start_time params = {time = (<time> + 1)}
	gman_timerfunc goal = horse tool = tmr checkpoint = chk2 func = set_start_time params = {time = (<time> + 1)}
	gman_timerfunc goal = horse tool = tmr checkpoint = chk3 func = set_start_time params = {time = (<time> + 1)}
	gman_timerfunc goal = horse tool = tmr checkpoint = chk4 func = set_start_time params = {time = (<time> + 1)}
	gman_timerfunc goal = horse tool = tmr checkpoint = chk5 func = set_start_time params = {time = (<time> + 1)}
	gman_activategoal goal = horse
	destroy_panel_stuff
	create_panel_stuff
	if IsCurrentHorseSkater 0
		doscreenelementmorph {id = player2_panel_container alpha = 0}
		doscreenelementmorph {id = player1_panel_container alpha = 1}
	endif
	if IsCurrentHorseSkater 1
		doscreenelementmorph {id = player2_panel_container alpha = 1}
		doscreenelementmorph {id = player1_panel_container alpha = 0}
	endif
	goal_timer_create_timer show_on_enter screen_element_id = horse_chk1_tmr_screenElementId
	create_horse_score_menu
endscript

script EndGoal_Horse_Mp 
	goal_timer_destroy_timer \{id = horse_tmr_timerScreenElement}
	destroy_horse_score_menu
	if gman_getgoalstate \{goal = horse
			states = [
				goal_activated
			]}
		gman_deactivategoal \{goal = horse}
	endif
endscript

script destroy_horse_score_menu 
	if screenelementexists \{id = horse_score_menu}
		destroyscreenelement \{id = horse_score_menu}
	endif
endscript

script create_horse_score_menu 
	if NOT objectexists id = horse_score_menu
		printf "create_horse_score_menu"
		setscreenelementlock id = root_window off
		createscreenelement {
			type = containerelement
			parent = root_window
			id = horse_score_menu
			font = text_a1
			pos = (0.0, 60.0)
			just = [left top]
			scale = 0
			dims = (640.0, 480.0)
		}
		createscreenelement {
			type = vmenu
			parent = horse_score_menu
			id = horse_score_vmenu
			font = text_a1
			just = [left top]
			pos = (45.0, 45.0)
			scale = 0.5
			padding_scale = 0.9
			internal_scale = 1
			internal_just = [left top]
		}
		<index> = 1
		begin
		formattext checksumname = current_id 'horse_score_%i' i = <index>
		createscreenelement {
			type = textelement
			parent = horse_score_vmenu
			id = <current_id>
			font = text_a1
			text = ""
			scale = 0.7
			rgba = [180 180 180 255]
			not_focusable
			z_priority = -5
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		<index> = (<index> + 1)
		repeat 3
		runscriptonscreenelement id = horse_score_menu menu_onscreen params = {preserve_menu_state}
	endif
endscript

script update_horse_score 
	if objectexists \{id = horse_score_menu}
		setscreenelementprops {
			id = <id>
			text = <text>
		}
	endif
endscript

script horse_chk1_combo_started 
	printf \{"horse_chk_combo_started!"}
	gman_timerfunc \{goal = horse
		checkpoint = chk1
		tool = tmr
		func = hide}
	gman_timerfunc \{goal = horse
		checkpoint = chk1
		tool = tmr
		func = stop}
	gman_timerfunc \{goal = horse
		checkpoint = chk1
		tool = tmr
		func = reset}
endscript

script horse_chk2_combo_started 
	scriptassert
	printf \{"horse_chk_combo_started!"}
	gman_timerfunc \{goal = horse
		checkpoint = chk2
		tool = tmr
		func = hide}
	gman_timerfunc \{goal = horse
		checkpoint = chk2
		tool = tmr
		func = stop}
	gman_timerfunc \{goal = horse
		checkpoint = chk2
		tool = tmr
		func = reset}
endscript

script horse_chk3_combo_started 
	printf \{"horse_chk_combo_started!"}
	gman_timerfunc \{goal = horse
		checkpoint = chk3
		tool = tmr
		func = hide}
	gman_timerfunc \{goal = horse
		checkpoint = chk3
		tool = tmr
		func = stop}
	gman_timerfunc \{goal = horse
		checkpoint = chk3
		tool = tmr
		func = reset}
endscript

script horse_chk4_combo_started 
	printf \{"horse_chk_combo_started!"}
	gman_timerfunc \{goal = horse
		checkpoint = chk4
		tool = tmr
		func = hide}
	gman_timerfunc \{goal = horse
		checkpoint = chk4
		tool = tmr
		func = stop}
	gman_timerfunc \{goal = horse
		checkpoint = chk4
		tool = tmr
		func = reset}
endscript

script horse_chk5_combo_started 
	printf \{"horse_chk_combo_started!"}
	gman_timerfunc \{goal = horse
		checkpoint = chk5
		tool = tmr
		func = hide}
	gman_timerfunc \{goal = horse
		checkpoint = chk5
		tool = tmr
		func = stop}
	gman_timerfunc \{goal = horse
		checkpoint = chk5
		tool = tmr
		func = reset}
endscript

script horse_chk1_combo_ended 
	gman_getdata \{goal = horse}
	printstruct <...>
	printf "horse_chk_combo_ended! landed = %d" d = <landed>
	if (<landed> = 1)
		if (<score_to_beat> = 0)
			gman_setdata goal = horse params = {score_to_beat = <score>}
		else
			if (<score> > <score_to_beat>)
			endif
		endif
	endif
	spawnscriptnow \{StopSkater}
endscript
