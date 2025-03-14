goal_goalattack_genericParams = {
	goal_text = "You must complete all of the goals to win!"
	unlimited_time = 1
	no_restart
	net
	goal_type_checksum = net
	init = goal_goalattack_init
	activate = goal_goalattack_activate
	deactivate = goal_goalattack_deactivate
	expire = goal_goalattack_expire
	goal_description = "Goal Attack!"
}

script goal_goalattack_init 
endscript

script goal_goalattack_activate 
	if innetgame
		formattext \{textname = msg_text
			"\\c2Goal Attack \\n\\c0Complete all selected goals.\\n"}
		create_panel_block id = mp_goal_text parent = root_window text = <msg_text> style = panel_message_goal final_pos = <msg_pos>
		GetGoalsMode
		SetScoreAccumulation \{1}
	endif
	ResetScore
	ResetComboRecords
	gman_setcanstartgoal \{1}
endscript

script goal_goalattack_deactivate 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	if screenelementexists \{id = goal_retry_anchor}
		destroyscreenelement \{id = goal_retry_anchor}
	endif
endscript

script goalattack_done 
	dialog_box_exit
	do_backend_retry
endscript

script goal_goalattack_expire 
	if objectexists \{id = goal_message}
		destroyscreenelement \{id = goal_message}
	endif
	printf \{"goal_goalattack_expire"}
	GoalManager_LoseGoal name = <goal_id>
	if OnServer
		CalculateFinalScores
		SendGameOverToObservers
		spawnscriptlater \{wait_then_create_rankings
			params = {
				score_title_text = "GOALS"
			}}
	else
		create_rankings \{score_title_text = "GOALS"}
	endif
endscript

script AddGoal_GoalAttack 
	GoalManager_AddGoal name = goalattack {
		params = {$goal_goalattack_genericParams
			<...>
		}
	}
endscript

script StartGoal_GoalAttack 
	GoalManager_EditGoal name = goalattack params = <...>
	GoalManager_ActivateGoal \{name = goalattack}
endscript

script create_choose_goals_menu 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	goalmanager_hidepoints
	hide_net_player_names
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goals_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
	}
	assignalias id = goals_anchor alias = current_menu_anchor
	kill_start_key_binding
	build_theme_sub_title title = "CHOOSE GOALS"
	createscreenelement {
		type = containerelement
		parent = goals_anchor
		id = goals_menu
		dims = (640.0, 480.0)
		pos = (320.0, 640.0)
	}
	assignalias id = goals_menu alias = current_menu_anchor
	theme_background width = 6.3500004 pos = (320.0, 85.0) num_parts = 10.5
	<root_pos> = (80.0, 25.0)
	text_rgba = [128 123 20 255]
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_top_bar
		texture = black
		rgba = [0 0 0 85]
		scale = (130.0, 7.0)
		pos = (65.0, 87.0)
		just = [left top]
		z_priority = 2
	}
	GetStackedScreenElementPos y id = <id> offset = (6.0, -25.0)
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		font = text_a1
		text = "Goals"
		rgba = <text_rgba>
		scale = 1
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos x id = <id> offset = (115.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_up_arrow
		texture = up_arrow
		rgba = [128 128 128 85]
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos x id = <id> offset = (210.0, 0.0)
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		font = text_a1
		text = "On/Off"
		rgba = <text_rgba>
		pos = <pos>
		just = [left top]
		scale = 1
		z_priority = 3
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (60.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		scale = (2.0, 68.0)
		pos = <pos>
		just = [left top]
		rgba = [0 0 0 0]
	}
	GetStackedScreenElementPos x id = <id> offset = (355.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		scale = (2.0, 68.0)
		pos = <pos>
		just = [left top]
		rgba = [0 0 0 0]
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (0.0, 250.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		rgba = [0 0 0 0]
		scale = (124.0, 6.0)
		pos = <pos>
		just = [left top]
		z_priority = 2
	}
	GetStackedScreenElementPos y id = view_goals_menu_up_arrow offset = (0.0, 260.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_down_arrow
		texture = down_arrow
		rgba = [128 128 128 85]
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (20.0, 5.0)
	createscreenelement {
		type = vscrollingmenu
		parent = current_menu_anchor
		dims = (640.0, 245.0)
		pos = <pos>
		just = [left top]
		internal_just = [center top]
	}
	createscreenelement {
		type = vmenu
		parent = <id>
		id = goals_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [left top]
		dont_allow_wrap
		event_handlers = [
			{pad_up set_which_arrow params = {arrow = view_goals_menu_up_arrow}}
			{pad_down set_which_arrow params = {arrow = view_goals_menu_down_arrow}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back_sound}
		]
	}
	assignalias id = goals_vmenu alias = current_menu
	doscreenelementmorph id = current_menu_anchor pos = (320.0, 240.0) time = 0.2
	launchevent type = focus target = current_menu
	setscreenelementprops {id = current_menu
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = exit_choose_goals_menu}}
		]
	}
	current_menu :settags num_goals = 0
	current_menu :settags forceoff = 0
	select_all_no_goals_menu_set_event
	getpreferencechecksum pref_type = network goals
	GoalManager_AddGoalChoices classic_only
	create_helper_text $generic_helper_text
endscript

script exit_choose_goals_menu 
	if objectexists id = goals_anchor
		destroyscreenelement id = goals_anchor
		wait 1 gameframe
	endif
	if objectexists id = box_icon
		destroyscreenelement id = box_icon
		wait 1 gameframe
	endif
	if objectexists id = box_icon_2
		destroyscreenelement id = box_icon_2
		wait 1 gameframe
	endif
	if objectexists id = grunge_anchor
		destroyscreenelement id = grunge_anchor
		wait 1 gameframe
	endif
	create_network_game_options_menu
endscript

script hide_net_player_names 
	if gotparam \{on}
		scale = 0.5
	else
		scale = 0
	endif
	index = 0
	begin
	if screenelementexists id = {net_score_menu child = <index>}
		doscreenelementmorph id = {net_score_menu child = <index>} scale = <scale> time = 0
	endif
	repeat 8
endscript

script choose_goals_menu_set_events 
	off_rgba = [128 128 128 240]
	on_rgba = [128 123 20 255]
	current_menu :getsingletag num_goals
	current_menu :settags num_goals = (<num_goals> + 1)
	createscreenelement {
		type = containerelement
		parent = current_menu
		just = [left top]
		internal_just = [left top]
		dims = (640.0, 20.0)
		event_handlers = [{focus choose_goals_menu_focus}
			{unfocus choose_goals_menu_unfocus}
			{pad_choose choose_goals_menu_choose params = {name = <goal_id>}}
		]
	}
	<row_container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		text = <text>
		scale = 0.8
		rgba = <off_rgba>
	}
	getscreenelementdims id = <id>
	if (<width> > 310)
		printf <width>
		doscreenelementmorph time = 0 id = <id> scale = (0.8 * 310.0 / <width>)
	endif
	highlight_angle = 0
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		texture = de_highlight_bar
		pos = (-25.0, 0.0)
		just = [left center]
		rgba = [0 0 0 0]
		z_priority = 3
		scale = (4.1, 0.7)
		rot_angle = (<highlight_angle> / 4)
	}
	if GoalManager_GoalIsSelected name = <goal_id>
		<check_rgba> = <on_rgba>
	else
		<check_rgba> = [0 0 0 0]
	endif
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		texture = checkbox
		pos = (420.0, 0.0)
		scale = 0.5
		rgba = <off_rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		texture = checkmark
		pos = (420.0, -2.0)
		scale = 0.75
		rgba = <check_rgba>
		z_priority = 10
	}
endscript

script select_all_no_goals_menu_set_event 
	off_rgba = [128 128 128 240]
	on_rgba = [128 123 20 255]
	createscreenelement {
		type = containerelement
		parent = current_menu
		just = [left top]
		internal_just = [left top]
		dims = (640.0, 20.0)
		event_handlers = [{focus choose_goals_menu_focus}
			{unfocus choose_goals_menu_unfocus}
			{pad_choose force_select_goals_on_off}
		]
	}
	<row_container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		text = "Select all/no goals"
		scale = 0.8
		rgba = <off_rgba>
	}
	getscreenelementdims id = <id>
	if (<width> > 310)
		printf <width>
		doscreenelementmorph time = 0 id = <id> scale = (0.8 * 310.0 / <width>)
	endif
	highlight_angle = 0
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		texture = de_highlight_bar
		pos = (-25.0, 0.0)
		just = [left center]
		rgba = [0 0 0 0]
		z_priority = 3
		scale = (4.1, 0.7)
		rot_angle = (<highlight_angle> / 4)
	}
endscript

script view_selected_goals_menu_set_events 
	off_rgba = [128 128 128 240]
	on_rgba = [128 123 20 255]
	createscreenelement {
		type = containerelement
		parent = current_menu
		just = [left top]
		internal_just = [left top]
		dims = (640.0, 20.0)
		event_handlers = [{focus choose_goals_menu_focus}
			{unfocus choose_goals_menu_unfocus}
		]
	}
	<row_container_id> = <id>
	wait 200
	printstruct <...>
	createscreenelement {
		type = textelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		text = <text>
		scale = 0.8
		rgba = <off_rgba>
	}
	highlight_angle = 0
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		texture = de_highlight_bar
		pos = (-25.0, 0.0)
		just = [left center]
		rgba = [0 0 0 0]
		z_priority = 3
		scale = (4.1, 0.7)
		rot_angle = (<highlight_angle> / 4)
	}
	if GoalManager_HasWonGoal name = <goal_id>
		<check_rgba> = <on_rgba>
	else
		<check_rgba> = [0 0 0 0]
	endif
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		texture = checkbox
		pos = (420.0, 0.0)
		scale = 0.5
		rgba = <off_rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <row_container_id>
		just = [left center]
		font = text_a1
		texture = checkmark
		pos = (420.0, 0.0)
		scale = 0.75
		rgba = <check_rgba>
		z_priority = 10
	}
endscript

script choose_goals_menu_choose 
	gettags
	text_rgba = [128 123 20 255]
	if OnServer
		if NOT gotparam force
			GoalManager_ToggleGoalSelection <...>
		else
			if GoalManager_GoalIsSelected name = <name>
				if (<forceoff> = 1)
					GoalManager_ToggleGoalSelection <...>
				endif
			else
				if NOT (<forceoff> = 1)
					GoalManager_ToggleGoalSelection <...>
				endif
			endif
		endif
	else
		if NOT gotparam force
			GoalManager_ToggleGoalSelection <...>
		else
			if GoalManager_GoalIsSelected name = <name>
				if (<forceoff> = 1)
					GoalManager_ToggleGoalSelection <...>
					FCFSRequestToggleGoalSelection <...>
				endif
			else
				if NOT (<forceoff> = 1)
					GoalManager_ToggleGoalSelection <...>
					FCFSRequestToggleGoalSelection <...>
				endif
			endif
		endif
	endif
	wait 0.2 seconds
	if GoalManager_GoalIsSelected name = <name>
		doscreenelementmorph {
			id = {<id> child = 3}
			rgba = <text_rgba>
		}
	else
		doscreenelementmorph {
			id = {<id> child = 3}
			rgba = [0 0 0 0]
		}
	endif
endscript

script choose_goals_menu_focus 
	gettags
	text_rgba = [128 123 20 255]
	runscriptonscreenelement id = {<id> child = 0} text_twitch_effect2
	getscreenelementdims id = {<id> child = 0}
	if (<width> > 305)
		printf <width>
		doscreenelementmorph time = 0 id = {<id> child = 0} scale = (0.8 * 310.0 / <width>) rgba = <text_rgba>
	else
		doscreenelementmorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
			scale = (0.8 * ((<width> + 5.0) / <width>))
		}
	endif
	bar_rgba = [25 25 25 255]
	setscreenelementprops {
		id = {<id> child = 1}
		rgba = <bar_rgba>
	}
	if gotparam first_item
		setscreenelementprops {
			id = view_goals_menu_up_arrow
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = view_goals_menu_up_arrow
			rgba = [128 128 128 85]
		}
	endif
	if gotparam last_item
		setscreenelementprops {
			id = view_goals_menu_down_arrow
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = view_goals_menu_down_arrow
			rgba = [128 128 128 85]
		}
	endif
	goals_vmenu :gettags
	if gotparam arrow_id
		menu_vert_blink_arrow {id = <arrow_id>}
	endif
endscript

script choose_goals_menu_unfocus 
	gettags
	text_rgba = [128 128 128 240]
	killspawnedscript name = text_twitch_effect2
	doscreenelementmorph {
		id = {<id> child = 0}
		rgba = <text_rgba>
		scale = 0.8
	}
	getscreenelementdims id = {<id> child = 0}
	if (<width> > 310)
		printf <width>
		doscreenelementmorph time = 0 id = {<id> child = 0} scale = (0.8 * 310.0 / <width>)
	endif
	setscreenelementprops {
		id = {<id> child = 1}
		rgba = [0 0 0 0]
	}
endscript

script wait_and_create_view_selected_goals_menu 
	wait \{120
		frames}
	create_view_selected_goals_menu <...>
endscript

script create_view_selected_goals_menu 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	edit_tricks_menu_exit just_remove
	if NOT gotparam from_pause
		unpause_game_and_destroy_pause_menu
	endif
	hide_current_goal
	destroy_onscreen_keyboard
	dialog_box_exit
	goalmanager_hidepoints
	pause_balance_meter
	pause_run_timer
	kill_start_key_binding
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goals_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
	}
	assignalias id = goals_anchor alias = current_menu_anchor
	kill_start_key_binding
	if gotparam goal_summary
		build_theme_sub_title title = "GOAL LIST"
	else
		build_theme_sub_title title = "VIEW GOALS"
	endif
	createscreenelement {
		type = containerelement
		parent = goals_anchor
		id = goals_menu
		dims = (640.0, 480.0)
		pos = (320.0, 640.0)
	}
	theme_background width = 6.3500004 pos = (320.0, 85.0) num_parts = 10.5
	<root_pos> = (80.0, 25.0)
	text_rgba = [128 123 20 255]
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_top_bar
		texture = black
		rgba = [0 0 0 85]
		scale = (130.0, 7.0)
		pos = (65.0, 87.0)
		just = [left top]
		z_priority = 2
	}
	GetStackedScreenElementPos y id = <id> offset = (6.0, -25.0)
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		font = text_a1
		text = "Goals"
		rgba = <text_rgba>
		scale = 1
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos x id = <id> offset = (115.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_up_arrow
		texture = up_arrow
		rgba = [128 128 128 85]
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos x id = <id> offset = (190.0, 0.0)
	createscreenelement {
		type = textelement
		parent = current_menu_anchor
		font = text_a1
		text = "Completed"
		rgba = <text_rgba>
		pos = <pos>
		just = [left top]
		scale = 1
		z_priority = 3
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (60.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		scale = (2.0, 68.0)
		pos = <pos>
		just = [left top]
		rgba = [0 0 0 0]
	}
	GetStackedScreenElementPos x id = <id> offset = (355.0, 0.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		scale = (2.0, 68.0)
		pos = <pos>
		just = [left top]
		rgba = [0 0 0 0]
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (0.0, 250.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		texture = black
		rgba = [0 0 0 0]
		scale = (124.0, 6.0)
		pos = <pos>
		just = [left top]
		z_priority = 2
	}
	GetStackedScreenElementPos y id = view_goals_menu_up_arrow offset = (0.0, 260.0)
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = view_goals_menu_down_arrow
		texture = down_arrow
		rgba = [128 128 128 85]
		pos = <pos>
		just = [left top]
		z_priority = 3
	}
	GetStackedScreenElementPos y id = view_goals_menu_top_bar offset = (20.0, 5.0)
	createscreenelement {
		type = vscrollingmenu
		parent = current_menu_anchor
		dims = (640.0, 245.0)
		pos = <pos>
		just = [left top]
		internal_just = [center top]
	}
	createscreenelement {
		type = vmenu
		parent = <id>
		id = goals_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [left top]
		dont_allow_wrap
		event_handlers = [
			{pad_up set_which_arrow params = {arrow = view_goals_menu_up_arrow}}
			{pad_down set_which_arrow params = {arrow = view_goals_menu_down_arrow}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back_sound}
		]
	}
	assignalias id = goals_vmenu alias = current_menu
	doscreenelementmorph id = current_menu_anchor pos = (320.0, 240.0) time = 0.2
	launchevent type = focus target = current_menu
	if gotparam goal_summary
		setscreenelementprops {id = current_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = close_goals_menu}}
			]
		}
	else
		setscreenelementprops {id = current_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = exit_view_goals_menu}}
			]
		}
	endif
	GoalManager_AddGoalChoices selected_only
	create_helper_text helper_text_elements = [{text = "\\m1 Back"}]
endscript

script exit_view_goals_menu 
	if objectexists id = goals_anchor
		destroyscreenelement id = goals_anchor
		wait 1 gameframe
	endif
	if objectexists id = box_icon
		destroyscreenelement id = box_icon
		wait 1 gameframe
	endif
	if objectexists id = box_icon_2
		destroyscreenelement id = box_icon_2
		wait 1 gameframe
	endif
	if objectexists id = grunge_anchor
		destroyscreenelement id = grunge_anchor
		wait 1 gameframe
	endif
	pause_game_and_create_pause_menu
endscript

script close_goals_menu 
	if objectexists id = goals_anchor
		destroyscreenelement id = goals_anchor
		wait 1 gameframe
	endif
	if objectexists id = box_icon
		destroyscreenelement id = box_icon
		wait 1 gameframe
	endif
	if objectexists id = box_icon_2
		destroyscreenelement id = box_icon_2
		wait 1 gameframe
	endif
	if objectexists id = grunge_anchor
		destroyscreenelement id = grunge_anchor
		wait 1 gameframe
	endif
	goalmanager_showpoints
	unpause_balance_meter
	unpause_run_timer
	restore_start_key_binding
	if objectexists id = view_goals_menu
		unpause_game_and_destroy_pause_menu
	endif
endscript

script goal_attack_completed_goal 
	formattext textname = msg_text "Goal Completed! %i to go!" i = <NumGoalsLeft>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script goal_attack_completed_goal_other_same_team 
	formattext textname = msg_text "%n Completed %t! %i to go!" n = <playername> t = <GoalText> i = <NumGoalsLeft>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script goal_attack_started_goal_other_same_team 
	formattext textname = msg_text "%n Started %t!" n = <playername> t = <GoalText>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script force_select_goals_on_off 
	current_menu :getsingletag forceoff
	if (<forceoff> = 1)
		current_menu :settags forceoff = 0
	else
		current_menu :settags forceoff = 1
	endif
	current_menu :getsingletag num_goals
	if (<num_goals> > 0)
		counter = 1
		begin
		launchevent type = pad_choose target = {current_menu child = <counter>} data = {force forceoff = <forceoff>}
		counter = (<counter> + 1)
		repeat <num_goals>
	endif
endscript
