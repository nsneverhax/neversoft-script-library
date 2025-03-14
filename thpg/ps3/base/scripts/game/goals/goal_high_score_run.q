
script goal_high_score_run_pre_activate 
	goal_kill_all_peds
	goal_arcade_lock_secret
	goal_arcade_set_arcade_skater goal_id = <goal_id>
	start_hawkman_classic_camera
endscript

script goal_high_score_run_enter 
	goal_arcade_clear_trigger
	goal_ui_kill_message type = uberalert
	panel_show_score_in_goal
	gman_getdata goal = <goal_id>
	gman_getconstants goal = <goal_id>
	gman_getgrade goal = <goal_id>
	switch <grade>
		case 3
		formattext textname = inst_text "Already got SICK, your score to beat: %a" a = <current_high_score>
		formattext textname = msg "Score To Beat: %a" a = <current_high_score>
		case 2
		formattext textname = inst_text "SICK score: %a" a = <sick_score>
		formattext textname = msg "Score To Beat: %a" a = <sick_score>
		case 1
		formattext textname = inst_text "PRO score: %a" a = <pro_score>
		formattext textname = msg "Score To Beat: %a" a = <pro_score>
		case 0
		formattext textname = inst_text "AM score: %a" a = <am_score>
		formattext textname = msg "Score To Beat: %a" a = <am_score>
	endswitch
	goal_ui_display_message type = uberalert color = bluelt text = <msg>
	goal_ui_display_message type = instruction text = <inst_text>
	gman_setdata goal = <goal_id> params = {announced_am = false announced_pro = false announced_sick = false}
endscript

script goal_high_score_run_combo_ended 
	if (<landed> = 1)
		gman_getdata goal = <goal_id>
		gman_getconstants goal = <goal_id>
		gman_getgrade goal = <goal_id>
		SkaterGetScoreInfo
		<accumulated_score> = (<TotalScore> + <lastscorelanded>)
		if ((<announced_sick> = false) && (<accumulated_score> > <sick_score>))
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = sick_success}
			soundevent event = General_Goal_Success_Sound_sfx
			gman_setdata goal = <goal_id> params = {announced_am = true announced_pro = true announced_sick = true}
		elseif ((<announced_pro> = false) && (<accumulated_score> > <pro_score>) && (<grade> < 2))
			formattext textname = inst_text "SICK score: %a" a = <sick_score>
			goal_ui_display_message type = instruction text = <inst_text>
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = pro_success}
			soundevent event = General_Goal_Success_Sound_sfx
			gman_setdata goal = <goal_id> params = {announced_am = true announced_pro = true}
		elseif ((<announced_am> = false) && (<accumulated_score> > <am_score>) && (<grade> < 1))
			formattext textname = inst_text "PRO score: %a" a = <pro_score>
			goal_ui_display_message type = instruction text = <inst_text>
			spawnscriptnow noqbid Chalk_AnnounceStateUI params = {chalk_announce = am_success}
			soundevent event = General_Goal_Success_Sound_sfx
			gman_setdata goal = <goal_id> params = {announced_am = true}
		endif
	endif
endscript

script goal_high_score_run_expire 
	if NOT gotparam \{goal_id}
		if gman_getactivatedgoalid
			<goal_id> = <activated_goal_id>
		else
			scriptassert \{"goal_high_score_run_expire called while no goal active"}
			return
		endif
	endif
	spawnscriptnow goal_high_score_run_expire_spawned params = {goal_id = <goal_id>}
endscript

script goal_high_score_run_expire_spawned 
	gman_getdata goal = <goal_id>
	gman_getconstants goal = <goal_id>
	SkaterGetScoreInfo
	if (<TotalScore> = <lastscorelanded>)
		<accumulated_score> = <TotalScore>
	else
		<accumulated_score> = (<TotalScore> + <lastscorelanded>)
	endif
	if (<accumulated_score> > <current_high_score>)
		<current_high_score> = <accumulated_score>
		gman_setdata goal = <goal_id> params = {current_high_score = <current_high_score>}
		formattext textname = score_text "Your New High Score: %a\\n" a = <current_high_score>
	else
		formattext textname = score_text "Didn't Beat Your High Score: %a\\n" a = <current_high_score>
	endif
	<passed> = true
	<color> = green
	if (<accumulated_score> > <sick_score>)
		formattext textname = grade_text "Beat SICK Score!"
		gman_setpendinggrade goal = <goal_id> grade = 3
	elseif (<accumulated_score> > <pro_score>)
		formattext textname = grade_text "Beat PRO Score!"
		gman_setpendinggrade goal = <goal_id> grade = 2
	elseif (<accumulated_score> > <am_score>)
		formattext textname = grade_text "Beat AM Score!"
		gman_setpendinggrade goal = <goal_id> grade = 1
	else
		formattext textname = grade_text "Didn't beat AM Score."
		gman_setpendinggrade goal = <goal_id> grade = 0
		<passed> = false
		<color> = red
	endif
	formattext textname = end_text "%a%b" a = <score_text> b = <grade_text>
	goal_ui_display_message type = uberalert color = <color> text = <end_text> time = 5000
	goal_rollout_skater deactivate_tools = 1 hide_ui = 0
	skater :disableplayerinput
	kill_start_key_binding
	wait 2 seconds
	skater :enableplayerinput
	restore_start_key_binding
	if checksumequals a = <passed> b = true
		gman_setgrade goal = <goal_id>
		gman_passcheckpoint goal = <goal_id> do_rollout = 0
	else
		gman_failcheckpoint goal = <goal_id> do_rollout = 0 show_retry_dialog = 1
	endif
endscript

script goal_high_score_run_exit 
	goal_ui_kill_message \{type = instruction}
	panel_hide_score_in_goal
endscript

script goal_high_score_run_post_deactivate 
	goal_restore_all_peds
	goal_arcade_unlock_secret
	goal_arcade_screen_effects_end
	end_hawkman_classic_camera
	goal_arcade_refresh_trigger sub_goal_id = <goal_id>
endscript
