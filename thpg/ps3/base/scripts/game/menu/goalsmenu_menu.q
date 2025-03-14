goal_type_sub_categories = [
	arcade
	chalk
	classic
	film
	hawkman
	high_score_run
	photo
	story
	turf
]

script create_goals_menu 
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	make_cas_menu {
		menu_id = goals_menu
		vmenu_id = goals_vmenu
		title = "GOALS"
		pausemenu
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_debug_options_menu}
		scrolling
	}
	getarraysize $goal_type_sub_categories
	if (<array_size> > 0)
		<type_idx> = 0
		begin
		<goal_type> = ($goal_type_sub_categories [<type_idx>])
		<goal_type_info> = ($goal_type_info.<goal_type>)
		<array> = []
		addarrayelement array = <array> element = <goal_type>
		<in_debug_menu> = true
		<in_debug_menu> = (<goal_type_info>.in_debug_menu)
		if checksumequals a = <in_debug_menu> b = true
			add_cas_menu_item {
				text = (<goal_type_info>.name)
				pad_choose_script = goals_menu_add_goals
				pad_choose_params = {goal_types = <array> title = (<goal_type_info>.name)}
			}
		endif
		<type_idx> = (<type_idx> + 1)
		repeat <array_size>
	endif
	<other_types> = []
	getarraysize $goal_types
	<type_idx> = 0
	begin
	<goal_type> = ($goal_types [<type_idx>])
	<goal_type_info> = ($goal_type_info.<goal_type>)
	<in_debug_menu> = true
	<in_debug_menu> = (<goal_type_info>.in_debug_menu)
	if checksumequals a = <in_debug_menu> b = true
		if NOT arraycontains array = ($goal_type_sub_categories) contains = <goal_type>
			addarrayelement array = <other_types> element = <goal_type>
			<other_types> = <array>
		endif
	endif
	<type_idx> = (<type_idx> + 1)
	repeat <array_size>
	getarraysize <other_types>
	if (<array_size> > 0)
		add_cas_menu_item {
			text = "others"
			pad_choose_script = goals_menu_add_goals
			pad_choose_params = {goal_types = <other_types> title = (<goal_type_info>.name)}
		}
	endif
	cas_menu_finish
endscript

script goals_menu_begin \{text = "goals"}
	make_cas_menu {
		menu_id = goals_menu
		vmenu_id = goals_vmenu
		title = <text>
		pausemenu
		width = 600
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_goals_menu}
	}
endscript

script goals_menu_end 
	cas_menu_finish \{helper_text = {
			helper_text_elements = [
				{
					text = "\\m1 BACK"
				}
				{
					text = "\\m0 ACCEPT"
				}
				{
					text = "\\be PAGE LEFT"
				}
				{
					text = "\\bf PAGE RIGHT"
				}
			]
		}}
endscript

script goals_menu_add_goals start = 0 page = 0
	goals_menu_begin text = <title>
	<total_goals> = 0
	<goals_list> = []
	getarraysize <goal_types>
	<type_idx> = 0
	begin
	gman_getgoalsbytype type = (<goal_types> [<type_idx>])
	<goals_list> = (<goals_list> + <goals_by_type>)
	<total_goals> = (<total_goals> + <goals_by_type_size>)
	<type_idx> = (<type_idx> + 1)
	repeat <array_size>
	if (<total_goals> > 0)
		<index> = <start>
		begin
		if (<index> > (<total_goals> - 1))
			break
		endif
		<goal_id> = (<goals_list> [<index>])
		gman_getgoalstring goal = <goal_id>
		GenerateUTF16FromASCII string = <goal_string>
		add_cas_menu_item {
			text = <utf16string>
			pad_choose_script = goals_menu_select_goal
			pad_choose_params = {
				goal_id = <goal_id>
			}
		}
		<index> = (<index> + 1)
		repeat 9
	endif
	if screenelementexists id = goal_pages
		destroyscreenelement id = goal_pages
	endif
	createscreenelement {
		type = containerelement
		parent = goals_menu
		id = goal_pages
	}
	formattext textname = page_text "Page %p" p = (<page> + 1)
	createscreenelement {
		type = textelement
		parent = goal_pages
		font = text_a1
		text = <page_text>
		pos = (700.0, 600.0)
		z_priority = 1000
	}
	<curr_page> = <page>
	if NOT ((<start> - 9) > -1)
		<page> = ((<total_goals> / 9) + 1)
		<left> = ((<page> * 9) - 9)
	else
		<left> = (<start> - 9)
	endif
	setscreenelementprops {
		id = goal_pages
		event_handlers = [
			{pad_l1 goals_menu_add_goals params = {start = <left> page = (<page> - 1) goal_types = <goal_types> title = <title>}}
		]
	}
	<page> = <curr_page>
	if NOT ((<start> + 9) < <total_goals>)
		<page> = -1
		<right> = 0
	else
		<right> = (<start> + 9)
	endif
	setscreenelementprops {
		id = goal_pages
		event_handlers = [
			{pad_r1 goals_menu_add_goals params = {start = <right> page = (<page> + 1) goal_types = <goal_types> title = <title>}}
		]
	}
	launchevent type = focus target = goal_pages
	goals_menu_end
endscript

script goals_menu_select_goal do_pulse = 1
	if (<do_pulse> = 1)
		pulse_item
	endif
	printf "-- goals_menu_select_goal: %g" g = <goal_id>
	game_progression_give_skill skill = ntt
	game_progression_give_skill skill = boost
	game_progression_give_skill skill = rigger_menu
	game_progression_give_skill skill = rig_pieces_kicker
	game_progression_give_skill skill = camera
	setglobalflag flag = $CAREER_TRAINING_DONE
	GMan_UnpauseGoalStateScripts
	begin
	if GMan_HasUpdatingGoalStateScripts
		printf '-- goals_menu_select_goal: has updating goal state scripts'
		begin
		if GoalPakManager_GoalAction action = is_processing
			printf '-- goals_menu_select_goal: GPM is processing'
		else
			break
		endif
		wait 2 gameframes
		repeat
	else
		break
	endif
	wait 2 gameframes
	repeat
	gman_deactivateallgoals
	gman_blockuntilallgoalsdeactivated
	gman_uninitializeallgoals
	begin
	wait 2 gameframes
	if gman_allgoalsuninitialized
		break
	endif
	printf '-- goals_menu_select_goal: waiting for goals to uninit'
	repeat
	if gman_goalissingleplay goal = <goal_id>
		GMan_UnBeatGoal goal = <goal_id>
	endif
	goal_trigger_dialog_kill
	gman_setdata goal = <goal_id> params = {force_init = 1}
	if GMan_GoalIsLocked goal = <goal_id>
		GMan_UnlockGoal goal = <goal_id>
	else
		gman_initializegoal goal = <goal_id>
	endif
	begin
	wait 2 gameframes
	if gman_goalisinitialized goal = <goal_id>
		break
	endif
	repeat
	gman_setdata goal = <goal_id> params = {force_init = 0}
	if goal_is_in_a_track goal = <goal_id>
		goal_track_debug_force_progression goal = <goal_id>
	endif
	if NOT cd
		<to_or_from_crib> = 0
		if gman_getconstant goal = <goal_id> name = start_zone
			if checksumequals a = <start_zone> b = z_crib
				<to_or_from_crib> = 1
			endif
		endif
		getcurrentlevel
		if checksumequals a = <level> b = load_z_crib
			<to_or_from_crib> = 1
		endif
		if (<to_or_from_crib> = 0)
			goal_teleport_to_start goal = <goal_id>
		endif
	endif
	if gameispaused
		setbuttoneventmappings unblock_menu_input
		restore_start_key_binding
		launchevent type = pad_start target = root_window data = {device_num = 0}
	endif
endscript
