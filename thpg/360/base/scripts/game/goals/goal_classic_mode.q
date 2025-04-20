goal_classic_mode_am_requirement = 6
goal_classic_mode_pro_requirement = 10
goal_classic_mode_sick_requirement = 10
goal_classic_mode_view_goals = {
	view_goals_dialog = ""
	view_goals_text_am = "AM: Complete 6 objectives."
	view_goals_text_pro = "PRO: Complete all objectives."
	view_goals_text_sick = "SICK: Complete all objectives in a single run."
}

script goal_classic_mode_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	goal_arcade_lock_secret
	goal_arcade_set_arcade_skater goal = <goal_id>
	start_hawkman_classic_camera
endscript

script goal_classic_mode_checkpoint_enter 
	goal_arcade_clear_trigger
	gman_setdata goal = <goal_id> params = {ended_from_end_run = false}
	gman_getgoalstring goal = <goal_id>
	formattext checksumname = sub_goal_info '%s_sub_goal_info' s = <goal_string>
	goal_classic_mode_set_data goal = <goal_id> sub_goal_info = <sub_goal_info>
	goal_classic_mode_reset_objects goal = <goal_id> sub_goal_info = <sub_goal_info>
	if gotparam retry
		goal_classic_mode_goal_cams_stopped goal_id = <goal_id>
	else
		gman_presentationfunc {
			goal = <goal_id>
			tool = goal_cams
			func = start
		}
	endif
endscript

script goal_classic_mode_set_data 
	goal_classic_mode_grade_icon_update goal = <goal>
	<cams> = [{} {} {} {} {} {} {} {} {} {}]
	<flags> = [high_score pro_score sick_score high_combo collect_skate collect_combo secret_disc trick1 trick2 smash]
	<index> = 0
	begin
	setarrayelement arrayname = cams index = <index> newvalue = {
		text = ($<sub_goal_info>.(<flags> [<index>]).text)
		soundevent = SK9_New_Show_Goal_in_Classic
		morphs = ($<sub_goal_info>.(<flags> [<index>]).cams)
		control_flag = {
			tool_name = control_flags
			flag_name = (<flags> [<index>])
		}
	}
	<index> = (<index> + 1)
	repeat 10
	gman_presentationfunc goal = <goal> tool = goal_cams func = set_data params = {data = <cams>}
	GMan_ScoreFunc goal = <goal> tool = high_score func = set_target_score params = {target_score = ($<sub_goal_info>.high_score.score)}
	GMan_ScoreFunc goal = <goal> tool = pro_score func = set_target_score params = {target_score = ($<sub_goal_info>.pro_score.score)}
	GMan_ScoreFunc goal = <goal> tool = sick_score func = set_target_score params = {target_score = ($<sub_goal_info>.sick_score.score)}
	GMan_ComboFunc goal = <goal> tool = high_combo func = set_target_score params = {target_score = ($<sub_goal_info>.high_combo.score)}
	GMan_TrickTrackerFunc {
		goal = <goal>
		tool = trick1
		func = set_tricks
		params = {trick_info = {trick = ($<sub_goal_info>.trick1.trick) target_num_tricks = 1}}
	}
	GMan_TrickTrackerFunc {
		goal = <goal>
		tool = trick2
		func = set_tricks
		params = {trick_info = {trick = ($<sub_goal_info>.trick2.trick) target_num_tricks = 1}}
	}
endscript

script goal_classic_mode_reset_objects 
	gman_getgrade goal = <goal>
	if (<grade> > $goal_utilities_am_grade)
		gman_flagfunc goal = <goal> tool = control_flags func = reset
	endif
	goal_classic_mode_kill_letters
	gman_getgoalstring goal = <goal>
	if gman_flagfunc goal = <goal> tool = control_flags func = is_set params = {flag = collect_skate}
		goal_classic_mode_clear_collect_objects goal_string = <goal_string> type = 'skate'
	elseif structurecontains structure = ($<sub_goal_info>.collect_skate) positions
		<index> = 0
		begin
		GMan_CollectFunc goal = <goal> tool = collect_skate func = set_pos params = {
			object_index = <index>
			pos = ($<sub_goal_info>.collect_skate.positions [<index>])
		}
		<index> = (<index> + 1)
		repeat 5
	endif
	if gman_flagfunc goal = <goal> tool = control_flags func = is_set params = {flag = collect_combo}
		goal_classic_mode_clear_collect_objects goal_string = <goal_string> type = 'combo'
	elseif structurecontains structure = ($<sub_goal_info>.collect_combo) positions
		<index> = 0
		begin
		GMan_CollectFunc goal = <goal> tool = collect_combo func = set_pos params = {
			object_index = <index>
			pos = ($<sub_goal_info>.collect_combo.positions [<index>])
		}
		<index> = (<index> + 1)
		repeat 5
	endif
	if gman_flagfunc goal = <goal> tool = control_flags func = is_set params = {flag = secret_disc}
		formattext checksumname = secret_disc_object '%s_secret_disc' s = <goal_string>
		runscriptonobject {
			id = <secret_disc_object>
			goal_classic_mode_clear_collect_object
		}
	elseif structurecontains structure = ($<sub_goal_info>.secret_disc) position
		GMan_CollectFunc goal = <goal> tool = secret_disc func = set_pos params = {
			object_index = 0
			pos = ($<sub_goal_info>.secret_disc.position)
		}
	endif
	if gman_flagfunc goal = <goal> tool = control_flags func = is_set params = {flag = smash}
		goal_classic_mode_clear_collect_objects goal_string = <goal_string> type = 'smash'
	elseif structurecontains structure = ($<sub_goal_info>.smash) positions
		<index> = 0
		begin
		GMan_CollectFunc goal = <goal> tool = smash func = set_pos params = {
			object_index = <index>
			pos = ($<sub_goal_info>.smash.positions [<index>])
		}
		<index> = (<index> + 1)
		repeat 5
	endif
endscript

script goal_classic_mode_clear_collect_objects 
	<index> = 1
	begin
	formattext checksumname = collect_object '%s_%t_0%i' s = <goal_string> t = <type> i = <index>
	runscriptonobject id = <collect_object> goal_classic_mode_clear_collect_object
	<index> = (<index> + 1)
	repeat 5
endscript

script goal_classic_mode_clear_collect_object 
	cleareventhandlergroup \{`default`}
	obj_invisible
endscript

script goal_classic_mode_goal_cams_stopped 
	if NOT gman_flagfunc goal = <goal_id> tool = control_flags func = is_set params = {flag = smash}
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = sub_goal_info '%s_sub_goal_info' s = <goal_string>
		goal_create_counter {
			type = counter
			initial_count = 0
			separator = "of"
			total_number = 5
			hud_counter_caption = ($<sub_goal_info>.smash.counter_text)
		}
	endif
	gman_timerfunc goal = <goal_id> tool = timer func = start
	gman_timerfunc goal = <goal_id> tool = timer func = show
	panel_show_arcadescore_in_goal
endscript

script goal_classic_mode_got_sub_goal 
	gman_getgoalstring goal = <goal_id>
	formattext checksumname = sub_goal_info '%s_sub_goal_info' s = <goal_string>
	if NOT gman_flagfunc goal = <goal_id> tool = control_flags func = is_set params = {flag = <tool_id>}
		gman_flagfunc goal = <goal_id> tool = control_flags func = set params = {flag = <tool_id> value = 1}
		spawnscriptnow goal_classic_mode_show_got_goal_msg params = {
			goal = <goal_id> timer_tool = timer flags_tool = control_flags goal_text = ($<sub_goal_info>.<tool_id>.text)
		}
	endif
endscript

script goal_classic_mode_sub_goal_rewards 
	printf '-- goal_classic_mode_sub_goal_rewards'
	requireparams [goal] all
	<cash_per_subgoal> = 10
	<skill_pts_per_subgoal> = 1
	<goal_pts_per_subgoal> = 1
	gman_getgrade goal = <goal>
	gman_getcurrentcheckpoint goal = <goal>
	if (<grade> < 2)
		if NOT goal_get_descrip_list goal = <goal>
			softassert "no view_goals_descrip_list for goal %g" c = <goal>
			return
		endif
		gman_flagfunc func = get_num_set_this_try goal = <goal> checkpoint = <current_checkpoint> tool = (<view_goals_descrip_list> [0].flag_tool)
		if (<num_flags_set_this_try> > 0)
			AwardSkillPoints skill_points = (<skill_pts_per_subgoal> * <num_flags_set_this_try>)
			careerfunc func = AddCash params = {cash = (<cash_per_subgoal> * <num_flags_set_this_try>)}
			careerfunc func = addgoalpoints params = {goal_points = (<goal_pts_per_subgoal> * <num_flags_set_this_try>) type = generic}
		endif
	endif
endscript

script goal_classic_mode_end_run 
	wait \{1
		gameframe}
	gman_getactivatedgoalid
	gman_setdata goal = <activated_goal_id> params = {ended_from_end_run = true}
	goal_classic_mode_end goal_id = <activated_goal_id>
endscript

script goal_classic_mode_end 
	goal_exit_area_end
	gman_timerfunc goal = <goal_id> tool = timer func = stop
	gman_timerfunc goal = <goal_id> tool = timer func = hide
	goal_classic_mode_kill_letters
	goal_classic_mode_kill_msgs
	goal_classic_mode_sub_goal_rewards goal = <goal_id>
	goal_classic_mode_grade goal = <goal_id>
endscript

script goal_classic_mode_grade 
	gman_getdata goal = <goal>
	if NOT gotparam classic_mode_accumulated_time
		<classic_mode_accumulated_time> = 0
	endif
	gman_timerfunc goal = <goal> tool = timer func = get_precise_time
	<time_in_ms> = <time>
	gman_timerfunc goal = <goal> tool = timer func = get_time
	<classic_mode_accumulated_time> = (<classic_mode_accumulated_time> + (120000 - <time_in_ms>))
	gman_setdata goal = <goal> params = {timeleft = <time>}
	gman_flagfunc goal = <goal> tool = control_flags func = get_num_set
	gman_flagfunc goal = <goal> tool = control_flags func = get_num_set_this_try
	if (<num_flags_set_this_try> = $goal_classic_mode_sick_requirement)
		<classic_mode_accumulated_time> = (120000 - <time_in_ms>)
		<new_grade> = $goal_utilities_sick_grade
	elseif (<num_flags_set> > ($goal_classic_mode_pro_requirement - 1))
		<new_grade> = $goal_utilities_pro_grade
	elseif (<num_flags_set> > ($goal_classic_mode_am_requirement - 1))
		<new_grade> = $goal_utilities_am_grade
	else
		<new_grade> = $goal_utilities_no_grade
	endif
	gman_setdata goal = <goal> params = {classic_mode_accumulated_time = <classic_mode_accumulated_time>}
	gman_setpendinggrade goal = <goal> grade = <new_grade>
	if (<new_grade> > ($goal_utilities_am_grade - 1))
		gman_setgrade goal = <goal>
		gman_passcheckpoint goal = <goal>
	else
		gman_failcheckpoint goal = <goal> do_rollout = 0
	endif
endscript

script goal_classic_mode_checkpoint_exit 
	if gotparam \{retry}
		<do_reset> = true
		if gman_getdata goal = <goal_id> name = retry_from_fail
			if (<retry_from_fail> = true)
				<do_reset> = false
			endif
		endif
		if (<do_reset> = true)
			goal_classic_mode_retry_reset goal_id = <goal_id>
		endif
	endif
	goal_classic_mode_kill_letters
	goal_classic_mode_kill_msgs
	goal_destroy_counter
	panel_hide_score_in_goal
	killspawnedscript id = <goal_id>
endscript

script goal_classic_mode_post_deactivate 
	goal_restore_all_peds
	goal_arcade_unlock_secret
	goal_arcade_screen_effects_end
	end_hawkman_classic_camera
	goal_arcade_refresh_trigger sub_goal_id = <goal_id>
endscript

script goal_classic_mode_retry_reset 
	gman_getdata goal = <goal_id>
	<flags> = [high_score pro_score sick_score high_combo collect_skate collect_combo secret_disc trick1 trick2 smash]
	<index> = 0
	begin
	if gman_flagfunc goal = <goal_id> tool = control_flags func = was_set_this_try params = {flag = (<flags> [<index>])}
		gman_flagfunc goal = <goal_id> tool = control_flags func = set params = {flag = (<flags> [<index>]) value = 0}
	endif
	<index> = (<index> + 1)
	repeat 10
endscript

script goal_classic_mode_grade_icon_update 
	<am_status> = null
	<pro_status> = null
	<sick_status> = null
	gman_getdata goal = <goal>
	gman_flagfunc goal = <goal> tool = control_flags func = get_num_set
	gman_flagfunc goal = <goal> tool = control_flags func = get_num_set_this_try
	if (<num_flags_set_this_try> = <num_flags_set>)
		<am_status> = possible
		<pro_status> = possible
		<sick_status> = possible
	else
		<am_status> = possible
		<pro_status> = possible
		<sick_status> = impossible
	endif
	if (<num_flags_set_this_try> > ($goal_classic_mode_sick_requirement - 1))
		<am_status> = earned
		<pro_status> = earned
		<sick_status> = earned
	else
		if (<num_flags_set> > ($goal_classic_mode_pro_requirement - 1))
			<am_status> = earned
			<pro_status> = earned
		else
			if (<num_flags_set> > ($goal_classic_mode_am_requirement - 1))
				<am_status> = earned
			endif
		endif
	endif
	change_grade_status grade = am status = <am_status>
	change_grade_status grade = pro status = <pro_status>
	change_grade_status grade = sick status = <sick_status>
endscript

script goal_classic_mode_kill_letters 
	goal_classic_mode_kill_skate_letters
	goal_classic_mode_kill_combo_letters
endscript

script goal_classic_mode_got_skate_letter 
	<object_id> :gettags
	switch <letter>
		case s
		id = skate_letter_s
		offset = 0
		text = "S"
		case k
		id = skate_letter_k
		offset = 60
		text = "K"
		case a
		id = skate_letter_a
		offset = 120
		text = "A"
		case t
		id = skate_letter_t
		offset = 180
		text = "T"
		case e
		id = skate_letter_e
		offset = 240
		text = "E"
		default
		script_assert "unkown letter"
	endswitch
	create_panel_message {
		id = <id>
		text = <text>
		style = goal_classic_mode_skate_letters_style
		offset = <offset>
	}
endscript

script goal_classic_mode_skate_letters_style offset = 0
	setprops font = text_a1 just = [center center] rgba = [240 180 40 255]
	domorph time = 0.08 scale = 0.3 pos = ((1330.0, 400.0) + ((0.0, 1.0) * <offset>))
	domorph time = 0.120000005 scale = 2.5 pos = ((1175.0, 400.0) + ((0.0, 1.0) * <offset>))
	domorph time = 0.14 scale = 0.4
	domorph time = 0.16 scale = 1.2
	domorph time = 0.18 scale = 0.55
	domorph time = 0.2 scale = 1.5
endscript

script goal_classic_mode_kill_skate_letters 
	if objectexists \{id = skate_letter_s}
		runscriptonscreenelement \{id = skate_letter_s
			kill_panel_message}
	endif
	if objectexists \{id = skate_letter_k}
		runscriptonscreenelement \{id = skate_letter_k
			kill_panel_message}
	endif
	if objectexists \{id = skate_letter_a}
		runscriptonscreenelement \{id = skate_letter_a
			kill_panel_message}
	endif
	if objectexists \{id = skate_letter_t}
		runscriptonscreenelement \{id = skate_letter_t
			kill_panel_message}
	endif
	if objectexists \{id = skate_letter_e}
		runscriptonscreenelement \{id = skate_letter_e
			kill_panel_message}
	endif
endscript

script goal_classic_mode_got_combo_letter 
	<object_id> :gettags
	switch <letter>
		case c
		id = combo_letter_c
		offset = 0
		text = "C"
		case o
		id = combo_letter_o
		offset = 60
		text = "O"
		case m
		id = combo_letter_m
		offset = 120
		text = "M"
		case b
		id = combo_letter_b
		offset = 180
		text = "B"
		case o2
		id = combo_letter_o2
		offset = 240
		text = "O"
		default
		script_assert "unkown letter"
	endswitch
	create_panel_message {
		id = <id>
		text = <text>
		style = goal_classic_mode_combo_letters_style
		offset = <offset>
	}
endscript

script goal_classic_mode_combo_letters_style 
	setprops font = text_a1 just = [center center] rgba = [20 180 100 255]
	domorph time = 0.08 scale = 0.3 pos = ((1330.0, 100.0) + ((0.0, 1.0) * <offset>))
	domorph time = 0.120000005 scale = 2.5 pos = ((1175.0, 100.0) + ((0.0, 1.0) * <offset>))
	domorph time = 0.14 scale = 0.4
	domorph time = 0.16 scale = 1.2
	domorph time = 0.18 scale = 0.55
	domorph time = 0.2 scale = 1.5
endscript

script goal_classic_mode_lost_combo_letters 
	gman_getgoalstring goal = <goal_id>
	formattext checksumname = sub_goal_info '%s_sub_goal_info' s = <goal_string>
	goal_classic_mode_kill_combo_letters
	goal_classic_mode_show_lost_COMBO_msg goal = <goal_id> timer_tool = timer goal_text = ($<sub_goal_info>.collect_combo.text)
endscript

script goal_classic_mode_kill_combo_letters 
	if objectexists \{id = combo_letter_c}
		runscriptonscreenelement \{id = combo_letter_c
			kill_panel_message}
	endif
	if objectexists \{id = combo_letter_o}
		runscriptonscreenelement \{id = combo_letter_o
			kill_panel_message}
	endif
	if objectexists \{id = combo_letter_m}
		runscriptonscreenelement \{id = combo_letter_m
			kill_panel_message}
	endif
	if objectexists \{id = combo_letter_b}
		runscriptonscreenelement \{id = combo_letter_b
			kill_panel_message}
	endif
	if objectexists \{id = combo_letter_o2}
		runscriptonscreenelement \{id = combo_letter_o2
			kill_panel_message}
	endif
endscript

script goal_classic_mode_show_got_goal_msg 
	gman_timerfunc goal = <goal> tool = <timer_tool> func = get_time
	if (<time> > 0)
		if NOT gman_flagfunc goal = <goal> tool = <flags_tool> func = all_set
			goal_panel_wait_for_my_turn
			goal_ui_display_message type = uberalert color = bluelt text = <goal_text>
			gman_getdata goal = <goal>
			gman_flagfunc goal = <goal> tool = control_flags func = get_num_set
			gman_flagfunc goal = <goal> tool = control_flags func = get_num_set_this_try
			if (<num_flags_set_this_try> = ($goal_classic_mode_sick_requirement))
				soundevent event = medal_sick_sfx
			elseif (<num_flags_set> = ($goal_classic_mode_pro_requirement))
				soundevent event = medal_pro_sfx
			elseif (<num_flags_set> = ($goal_classic_mode_am_requirement))
				soundevent event = medal_am_sfx
			endif
			if gman_flagfunc goal = <goal> tool = control_flags func = is_set params = {flag = secret_disc}
			else
				if NOT issoundeventplaying medal_am_sfx
					if NOT issoundeventplaying medal_pro_sfx
						if NOT issoundeventplaying medal_sick_sfx
							soundevent event = midgoal_rank_sfx_Classic
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script goal_classic_mode_kill_msgs 
	killspawnedscript \{name = goal_panel_wait_and_reset_queue}
	ui_kill_message_hack \{id = uberalert}
	killspawnedscript \{name = goal_fail_messages}
	goal_panel_reset_queue
endscript

script goal_classic_mode_show_lost_COMBO_msg 
	gman_timerfunc goal = <goal> tool = <timer_tool> func = get_time
	if (<time> > 0)
		spawnscriptlater goal_fail_messages params = {view_goals_text = <goal_text> goal_id = <goal>}
	endif
endscript

script goal_classic_mode_boundary_entry 
	goal_exit_area_end
endscript

script goal_classic_mode_boundary_exit 
	gman_getcurrentcheckpoint goal = <goal>
	if checksumequals a = <current_checkpoint> b = chkp1
		goal_exit_area_begin {
			goal = <goal>
			timer = boundary_tmr
			verbose = 1
			arrow_point_to_pos = (-43.8479, 0.18920001, -48.983704)
			restart_prefix = <goal>
		}
	endif
endscript

script m_classic_collect_outline 
	obj_setoutlineflag \{on}
	obj_setoutlinecolorindex \{index = 0}
endscript
