high_scores_from_state = null

script ui_create_mainscores 
	printf \{"UI: ui_create_mainscores"}
	high_scores_menu_create from_state = <from_state>
endscript

script ui_destroy_mainscores 
	printf \{"UI: ui_destroy_mainscores"}
	generic_ui_destroy
endscript

script ui_destroy_mainscores_to_gameplay 
	ui_destroy_mainscores
	do_actual_unpause
	restore_start_key_binding
	killspawnedscript \{name = ui_mainscores_keep_skater_paused}
	unpauseskaters
	MakeSkaterGoto \{SkaterInit}
	ui_change_state \{state = uistate_gameplay}
	broadcastevent \{type = high_scores_menu_exited}
endscript

script high_scores_menu_create 
	if gotparam from_state
		change high_scores_from_state = <from_state>
	else
		<from_state> = $high_scores_from_state
	endif
	if gamemodeequals is_classic
		if ($classic_mode_in_end_run_sequence = 1)
			GetInitialsString
			<new_initials> = <string>
		endif
	endif
	if infrontend
		<back_state> = UIstate_mainoptions
	else
		if checksumequals a = <from_state> b = uistate_gameplay
			<pad_back_script> = ui_destroy_mainscores_to_gameplay
		else
			<back_state> = <from_state>
		endif
	endif
	make_cas_menu {
		title = "HIGH SCORES"
		back_state = <back_state>
		pad_back_script = <pad_back_script>
		pad_back_params = <pad_back_params>
		title_pos = (70.0, 88.0)
		title_bg_pos = (55.0, 57.0)
		title_bg_scale = (1.2, 1.0)
		desired_width = 260
		menu_bg_scale = (1.0, 1.0)
		menu_bg_pos = (-100.0, 0.0)
		bg_pos = (-50.0, -50.0)
		highlight_dims = (500.0, 32.0)
		bar_dims = (500.0, 32.0)
		mask_scale = (1.9, 2.2)
		mask_rot_angle = 7
		mask_pos = (115.0, 75.0)
		pausemenu
		width = 900
		highlight_add = (110.0, 0.0)
		scrolling
	}
	high_scores_add_five_best_scores new_initials = <new_initials>
	high_scores_add_five_best_combos new_initials = <new_initials>
	add_cas_menu_item {
		text = "DONE"
		choose_state = <back_state>
		pad_choose_script = <pad_back_script>
		pad_choose_params = <pad_back_params>
	}
	<show_leaderboard_option> = 0
	<helper_text_elements> = [
		{text = "\\m1 BACK"}
	]
	if NOT infrontend
		if isxenon
			if checkforsignin
				<show_leaderboard_option> = 1
				<helper_text_elements> = [
					{text = "\\m8 LEADERBOARD"}
					{text = "\\m1 BACK"}
				]
			endif
		endif
	endif
	cas_menu_finish helper_text = {helper_text_elements = <helper_text_elements>}
	if (<show_leaderboard_option> = 1)
		setscreenelementprops id = main_menu event_handlers = [{pad_space high_scores_show_leaderboard}]
	endif
endscript

script high_scores_show_leaderboard 
	generic_ui_destroy
	if checksumequals \{a = $high_scores_from_state
			b = uistate_gameplay}
		broadcastevent \{type = high_scores_menu_exited}
		killspawnedscript \{name = ui_mainscores_keep_skater_paused}
		spawnscriptnow \{ui_mainscores_keep_skater_paused}
		wait \{2
			gameframes}
	endif
	change \{current_leaderboard_scope = 2}
	request_leaderboard \{leaderboard_id = m_hsfreeskate
		back_to_highscores
		listtype = me
		columns = [
			2
			-1
			-1
		]}
endscript

script ui_mainscores_keep_skater_paused 
	begin
	unpauseskaters
	pauseskaters
	wait \{1
		gameframe}
	repeat
endscript

script high_scores_add_five_best_scores 
	GetLevelRecords level = z_cretepark
	add_cas_menu_item {
		text = "5 BEST HIGH SCORES"
		cas_heading
	}
	<i> = 0
	begin
	<high_struct> = (<highscores>.recordtable [<i>])
	formattext textname = score_text "%d Pts." d = (<high_struct>.value)
	high_scores_convert_to_time_string <high_struct>
	high_scores_add_five_best_item {
		rank = (<i> + 1)
		initials = (<high_struct>.initials)
		score_text = <score_text>
		time = <time_string>
		date = <date_string>
	}
	<i> = (<i> + 1)
	repeat 5
endscript

script high_scores_add_five_best_item 
	formattext textname = rank_text "%d" d = <rank>
	add_cas_menu_item {
		additional_focus_script = high_scores_item_focus
		additional_unfocus_script = high_scores_item_unfocus
		text = <rank_text>
		children = [
			{type = textelement
				font = text_a1
				text = <initials>
				scale = 0.5
				pos = (-10.0, 0.0)
				rgba = ($cas_color_scheme.text_color_2)
				local_id = column_2
			}
			{type = textelement
				font = text_a1
				text = <score_text>
				scale = 0.5
				pos = (150.0, 0.0)
				rgba = ($cas_color_scheme.text_color_2)
				local_id = column_3
			}
			{type = textelement
				font = text_a1
				text = <time>
				scale = 0.35000002
				pos = (260.0, 0.0)
				rgba = ($cas_color_scheme.text_color_2)
				local_id = column_4
			}
			{type = textelement
				font = text_a1
				text = <date>
				scale = 0.35000002
				pos = (310.0, 0.0)
				rgba = ($cas_color_scheme.text_color_2)
				local_id = column_5
			}
		]
	}
endscript

script high_scores_add_five_best_combos 
	GetLevelRecords level = z_cretepark
	add_cas_menu_item {
		text = "5 BEST COMBOS"
		cas_heading
	}
	<i> = 0
	begin
	<high_struct> = (<bestcombos>.recordtable [<i>])
	formattext textname = score_text "%d Pts." d = (<high_struct>.value)
	high_scores_convert_to_time_string <high_struct>
	high_scores_add_five_best_item {
		rank = (<i> + 1)
		initials = (<high_struct>.initials)
		score_text = <score_text>
		time = <time_string>
		date = <date_string>
	}
	<i> = (<i> + 1)
	repeat 5
endscript

script high_scores_convert_to_time_string 
	FormatTime hour = <record_hour> minute = <record_minute>
	formattext textname = date_string "%m/%d/%y" m = (<record_month> + 1) d = <record_dayofmonth> y = <record_year>
	return {time_string = <formatted_time>
		date_string = <date_string>}
endscript

script high_scores_item_focus 
	if screenelementexists id = {<id> child = column_2}
		doscreenelementmorph id = {<id> child = column_2} rgba = ($cas_color_scheme.text_focus_color)
	endif
	if screenelementexists id = {<id> child = column_3}
		doscreenelementmorph id = {<id> child = column_3} rgba = ($cas_color_scheme.text_focus_color)
	endif
	if screenelementexists id = {<id> child = column_4}
		doscreenelementmorph id = {<id> child = column_4} rgba = ($cas_color_scheme.text_focus_color)
	endif
	if screenelementexists id = {<id> child = column_5}
		doscreenelementmorph id = {<id> child = column_5} rgba = ($cas_color_scheme.text_focus_color)
	endif
endscript

script high_scores_item_unfocus 
	if screenelementexists id = {<id> child = column_2}
		doscreenelementmorph id = {<id> child = column_2} rgba = ($cas_color_scheme.text_color_2)
	endif
	if screenelementexists id = {<id> child = column_3}
		doscreenelementmorph id = {<id> child = column_3} rgba = ($cas_color_scheme.text_color_2)
	endif
	if screenelementexists id = {<id> child = column_4}
		doscreenelementmorph id = {<id> child = column_4} rgba = ($cas_color_scheme.text_color_2)
	endif
	if screenelementexists id = {<id> child = column_5}
		doscreenelementmorph id = {<id> child = column_5} rgba = ($cas_color_scheme.text_color_2)
	endif
endscript

script high_scores_menu_enter_initials 
	setscreenelementlock id = root_window off
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	kill_start_key_binding
	goalmanager_hidepoints
	GetInitialsString
	if NOT gotparam allow_back
		no_back = no_back
	endif
	if gotparam from_hsfreeskate
		<keyboard_done_script> = high_scores_menu_entered_initials_fromgameplay
	else
		<keyboard_done_script> = high_scores_menu_entered_initials
	endif
	create_onscreen_keyboard {
		text = <string>
		no_back = <no_back>
		keyboard_done_script = <keyboard_done_script>
		<...>
		keyboard_title = "ENTER INITIALS"
		min_length = 1
		max_length = 3
		heap = <heap>
	}
	if gotparam focus
		launchevent type = focus target = keyboard_vmenu
	endif
endscript

script high_scores_menu_entered_initials_fromgameplay 
	high_scores_menu_entered_initials <...> from_gameplay
endscript

script high_scores_menu_entered_initials 
	keyboard_current_string :text_getstring
	SetInitialsString string = <string>
	UpdateInitials
	destroy_onscreen_keyboard
	if gotparam \{from_gameplay}
		ui_change_state \{state = UIstate_mainscores_fromgameplay}
	else
		if gamemodeequals \{is_classic
				is_coop}
			create_single_or_coop_menu
		else
			high_scores_menu_create new_initials = <string> restart_node = <restart_node>
		endif
	endif
endscript
