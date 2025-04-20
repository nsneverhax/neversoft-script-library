goal_hawk_man_total_pellets = 75
goal_hawk_man_pellets_for_am = 30
goal_hawk_man_view_goals_title = "Hawk-Man"
goal_hawk_man_view_goals_dialog = "Collect as many pellets as you can."
goal_hawk_man_view_goals_text_am = "Collect 30 pellets."
goal_hawk_man_view_goals_text_pro = "Collect all 75 pellets"
goal_hawk_man_view_goals_text_sick = "Collect all 75 pellets in one combo"

script goal_hawk_man_pre_activate 
	goal_kill_all_peds
	goal_arcade_lock_secret
	goal_arcade_set_arcade_skater goal_id = <goal_id>
	start_hawkman_classic_camera
endscript

script goal_hawk_man_enter 
	goal_create_counter {
		type = counter
		initial_count = 0
		separator = "of"
		total_number = ($goal_hawk_man_total_pellets)
		hud_counter_caption = "pellets collected"
	}
	gman_setdata goal = <goal_id> params = {sick_possible = true}
endscript

script goal_hawk_man_exit 
	goal_destroy_counter
endscript

script goal_hawk_man_post_deactivate 
	goal_restore_all_peds
	goal_arcade_unlock_secret
	goal_arcade_screen_effects_end
	end_hawkman_classic_camera
	goal_arcade_refresh_trigger sub_goal_id = <goal_id>
endscript

script goal_hawk_man_comboEnded 
	GMan_CollectFunc goal = <goal_id> tool = collect func = get_num_collected
	if ((<num_collected> > 0) && (<num_collected> < ($goal_hawk_man_total_pellets)))
		gman_setdata goal = <goal_id> params = {sick_possible = false}
	endif
endscript

script goal_hawk_man_gotObject 
	spawnscript \{goal_hawk_Vibrate_Pulse_01}
	goal_update_counter number_collected = <num_collected>
	if (<num_collected> = ($goal_hawk_man_pellets_for_am))
		ui_display_message \{type = alert_goal
			text = "ACHIEVED AM\\nYou can pause (\\mw) and End Run now for AM, or continue for PRO."
			color = orange
			time = 5}
	endif
endscript

script goal_hawk_man_evaluate 
	printf 'goal_hawk_man_evaluate'
	if NOT gotparam goal_id
		if gman_getactivatedgoalid
			<goal_id> = <activated_goal_id>
		else
			scriptassert "goal_hawk_man_evaluate called while no goal active"
		endif
	endif
	GMan_CollectFunc goal = <goal_id> tool = collect func = get_num_collected
	gman_getdata goal = <goal_id>
	if ((<num_collected> = ($goal_hawk_man_total_pellets)) && (<sick_possible> = true))
		gman_setgrade goal = <goal_id> grade = 3
		gman_passcheckpoint goal = <goal_id>
	elseif (<num_collected> = ($goal_hawk_man_total_pellets))
		gman_setgrade goal = <goal_id> grade = 2
		gman_passcheckpoint goal = <goal_id>
	elseif ((<num_collected> = ($goal_hawk_man_pellets_for_am)) || (<num_collected> > ($goal_hawk_man_pellets_for_am)))
		gman_setgrade goal = <goal_id> grade = 1
		gman_passcheckpoint goal = <goal_id>
	else
		gman_failcheckpoint goal = <goal_id> do_rollout = 0 show_retry_dialog = 1
	endif
endscript

script goal_hawk_Vibrate_Pulse_01 
	printf \{"Pulse"}
	skater :vibrate \{actuator = 0
		percent = 100}
	wait \{5
		frames}
	goal_hawk_Vibrate_Pulse_stop_01
endscript

script goal_hawk_Vibrate_Pulse_stop_01 
	printf \{"Vibrate STOP"}
	skater :vibrate \{actuator = 0
		percent = 0}
endscript
