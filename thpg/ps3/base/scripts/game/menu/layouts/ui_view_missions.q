default_special_trick_price = 2500
goals_menu_colors = {
	colheading_bg = [
		35
		10
		0
		255
	]
	colheading_text = [
		115
		110
		86
		255
	]
}
sk9_your_team_goals = [
	m_impress_c1
	m_impress_c2
	m_impress_c3
	m_impress_h1
	m_impress_h2
	m_impress_h3
	m_impress_r1
	m_impress_r2
	m_impress_r3
	m_team_film
]

script ui_create_view_missions_from_leaderboard 
	printf \{"UI: ui_create_view_missions_from_leaderboard"}
	do_actual_pause
	hide_compass_anchor
	ui_create_view_missions
endscript

script ui_create_view_missions context = all
	printf "UI: ui_create_view_missions"
	if NOT gotparam back_state
		title = "MY GOALS"
		back_state = uistate_pausemenu
		addparams all
	endif
	make_cas_menu {
		title = <title>
		pausemenu
		PauseMap
		back_state = <back_state>
		highlight_add = (40.0, 0.0)
		width = 500
		text_width = 185
	}
	switch <context>
		case all
		make_cas_menu {
			title = <title>
			pausemenu
			PauseMap
			back_state = <back_state>
			width = 500
			text_width = 185
			highlight_add = (40.0, 0.0)
		}
		add_cas_menu_item {
			text = "Current Episodes"
			pad_choose_script = ui_create_view_missions
			pad_choose_params = {back_state = UIstate_view_missions title = "Current Episodes" context = current_episodes}
		}
		add_cas_menu_item {
			text = "Career"
			pad_choose_script = ui_create_view_missions
			pad_choose_params = {back_state = UIstate_view_missions title = "Career Episodes" context = career_episodes}
		}
		add_cas_menu_item {
			text = "Hardcore"
			pad_choose_script = ui_create_view_missions
			pad_choose_params = {back_state = UIstate_view_missions title = "Hardcore Episodes" context = hardcore_episodes}
		}
		add_cas_menu_item {
			text = "Rigger"
			pad_choose_script = ui_create_view_missions
			pad_choose_params = {back_state = UIstate_view_missions title = "Rigger Episodes" context = rigger_episodes}
		}
		if sk9_any_uber_goals_unlocked
			add_cas_menu_item {
				text = "final goals"
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					type = uber text = "final goals"
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		if sk9_any_team_goals_unlocked
			add_cas_menu_item {
				text = "your team"
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					your_team
					text = "your team"
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		add_cas_menu_item {
			text = "Street"
			pad_choose_script = ui_create_view_missions
			pad_choose_params = {back_state = UIstate_view_missions title = "Street Goals" context = street_goals}
		}
		add_cas_menu_item {
			text = "gaps"
			choose_state = UIstate_view_gaps
		}
		case current_episodes
		<parent_title> = "Current Episodes"
		getarraysize $goal_track_list
		<track_idx> = 0
		begin
		<track_id> = ($goal_track_list [<track_idx>])
		<track_info> = ($global_goal_track_info.<track_id>)
		if NOT GMan_GoalIsLocked goal = (<track_info>.goals [0])
			if NOT goal_is_track_won track = <track_id>
				add_cas_menu_item {
					text = (<track_info>.title)
					pad_choose_script = ui_create_view_missions_submenu
					pad_choose_params = {
						episode = <track_id> text = (<track_info>.title)
						back_params = {
							back_state = UIstate_view_missions title = <parent_title>
							context = <context>
						}
					}
				}
			endif
		endif
		<track_idx> = (<track_idx> + 1)
		repeat <array_size>
		if sk9_any_uber_goals_unlocked
			add_cas_menu_item {
				text = "final goals"
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					type = uber text = "final goals"
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		if sk9_any_team_goals_unlocked
			add_cas_menu_item {
				text = "your team"
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					your_team
					text = "your team"
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		case career_episodes
		<parent_title> = "Career Episodes"
		<goal_track_list> = [m_c1 m_c2 m_c3]
		getarraysize <goal_track_list>
		<track_idx> = 0
		begin
		<track_id> = (<goal_track_list> [<track_idx>])
		<track_info> = ($global_goal_track_info.<track_id>)
		if NOT GMan_GoalIsLocked goal = (<track_info>.goals [0])
			if goal_is_track_won track = <track_id>
				<item_rgba> = [70 70 70 240]
			else
				removeparameter item_rgba
			endif
			add_cas_menu_item {
				text = (<track_info>.title)
				rgba = <item_rgba>
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					episode = <track_id> text = (<track_info>.title)
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		<track_idx> = (<track_idx> + 1)
		repeat <array_size>
		case hardcore_episodes
		<parent_title> = "Hardcore Episodes"
		<goal_track_list> = [m_h1 m_h2 m_h3]
		getarraysize <goal_track_list>
		<track_idx> = 0
		begin
		<track_id> = (<goal_track_list> [<track_idx>])
		<track_info> = ($global_goal_track_info.<track_id>)
		if NOT GMan_GoalIsLocked goal = (<track_info>.goals [0])
			if goal_is_track_won track = <track_id>
				<item_rgba> = [70 70 70 240]
			else
				removeparameter item_rgba
			endif
			add_cas_menu_item {
				text = (<track_info>.title)
				rgba = <item_rgba>
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					episode = <track_id> text = (<track_info>.title)
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		<track_idx> = (<track_idx> + 1)
		repeat <array_size>
		case rigger_episodes
		<parent_title> = "Rigger Episodes"
		<goal_track_list> = [m_r1 m_r2 m_r3]
		getarraysize <goal_track_list>
		<track_idx> = 0
		begin
		<track_id> = (<goal_track_list> [<track_idx>])
		<track_info> = ($global_goal_track_info.<track_id>)
		if NOT GMan_GoalIsLocked goal = (<track_info>.goals [0])
			if goal_is_track_won track = <track_id>
				<item_rgba> = [70 70 70 240]
			else
				removeparameter item_rgba
			endif
			add_cas_menu_item {
				text = (<track_info>.title)
				rgba = <item_rgba>
				pad_choose_script = ui_create_view_missions_submenu
				pad_choose_params = {
					episode = <track_id> text = (<track_info>.title)
					back_params = {
						back_state = UIstate_view_missions title = <parent_title>
						context = <context>
					}
				}
			}
		endif
		<track_idx> = (<track_idx> + 1)
		repeat <array_size>
		case street_goals
		add_cas_menu_item {
			text = "Skill Challenges"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Skill Challenges"
				type = chalk
				back_params = {
					back_state = UIstate_view_missions title = "STREET GOALS"
					context = street_goals
				}
			}
		}
		add_cas_menu_item {
			text = "Race Challenges"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Race Challenges"
				type = race
				back_params = {
					back_state = UIstate_view_missions title = "STREET GOALS"
					context = street_goals
				}
			}
		}
		add_cas_menu_item {
			text = "Line Challenges"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Line Challenges"
				type = turf
				back_params = {
					back_state = UIstate_view_missions title = "STREET GOALS"
					context = street_goals
				}
			}
		}
		add_cas_menu_item {
			text = "Photo Challenges"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Photo Challenges"
				type = photo
				no_leaderboard
				back_params = {
					back_state = UIstate_view_missions title = "STREET GOALS"
					context = street_goals
				}
			}
		}
		add_cas_menu_item {
			text = "Film Challenges"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Film Challenges"
				type = film
				no_leaderboard
				back_params = {back_state = UIstate_view_missions title = "STREET GOALS" context = street_goals}
			}
		}
		add_cas_menu_item {
			text = "Arcade Machines"
			pad_choose_script = ui_create_view_missions_submenu
			pad_choose_params = {
				text = "Arcade Machines"
				type = arcade
				back_params = {back_state = UIstate_view_missions title = "STREET GOALS" context = street_goals}
			}
		}
	endswitch
	launchevent type = focus target = pause_map
	killMapIcons parent = pause_map
	GetSkaterPosition
	if (gotparam x)
		<posx> = (<x> + 512)
		<posz> = (<z> + 512)
		calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
		if skater :inair
			skater :getlastgroundheading
			heading = <last_heading>
		else
			skater :getheading
		endif
		addMapIcon {
			parent = pause_map
			icon_create_script = UI_map_player_create
			icon_create_params = {texture = player_cursor rgba = ($goal_ui_scheme.main) rot_angle = (<heading> - 180)}
			icon_focus_script = UI_map_player_focus
			icon_unfocus_script = UI_map_icon_unfocus
			pos = <pro_pos>
			local_id = skater
		}
		runscriptonscreenelement id = pause_map moveMapToIcon params = {parent = pause_map local_id = skater time = 0.0 zoom = 1.4}
	else
		runscriptonscreenelement id = pause_map morphMap params = {
			id = pause_map
			new_just = [0.0 0.0]
			new_scale = 0.75
			time = 0.5
		}
	endif
	show_current_goals map = pause_map
	cas_menu_finish helper_text = {
		helper_text_elements = [{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
			{text = "\\mj+\\bl ZOOM MAP"}
		]
	}
	ui_view_goals_destroy_info
endscript

script ui_create_view_missions_submenu back_params = {}
	printf "UI: ui_create_view_missions"
	ui_view_goals_dim up
	if gotparam lifestyle
		Gman_GetGoalsByLifestyle lifestyle = <lifestyle>
		<goals_array> = <goals_by_lifestyle>
		<goals_array_size> = <goals_by_lifestyle_size>
	elseif gotparam episode
		<episode_info> = ($global_goal_track_info.<episode>)
		if gotparam episode_info
			<goals_array> = (<episode_info>.goals)
			addarrayelement array = <goals_array> element = (<episode_info>.impress)
			<goals_array> = <array>
			getarraysize <goals_array>
			<goals_array_size> = <array_size>
		else
			softassert 'unknown goal episode %e' e = <episode>
			return
		endif
	elseif gotparam type
		gman_getgoalsbytype type = <type>
		<goals_array> = <goals_by_type>
		<goals_array_size> = <goals_by_type_size>
	elseif gotparam your_team
		<goals_array> = $sk9_your_team_goals
		getarraysize <goals_array>
		<goals_array_size> = <array_size>
	else
		softassert 'must pass either lifestyle or episode to ui_create_view_missions_submenu'
		return
	endif
	<count> = 0
	<i> = 0
	begin
	if show_goal_in_menu goal = (<goals_array> [<i>]) type = <type>
		<count> = (<count> + 1)
	endif
	<i> = (<i> + 1)
	repeat <goals_array_size>
	scroll = {}
	if (<count> > 8)
		scroll = {scrolling}
	endif
	make_cas_menu {
		title = <text>
		<scroll>
		pausemenu
		PauseMap
		width = 500
		pad_back_script = ui_create_view_missions
		pad_back_params = <back_params>
		highlight_add = (30.0, 0.0)
		text_width = 185
	}
	doscreenelementmorph id = main_menu pos = {(15.0, 0.0) relative}
	launchevent type = focus target = pause_map
	killMapIcons parent = pause_map
	if NOT IsInCrib
		GetSkaterPosition
		if (gotparam x)
			<posx> = (<x> + 512)
			<posz> = (<z> + 512)
			calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
			if skater :inair
				skater :getlastgroundheading
				heading = <last_heading>
			else
				skater :getheading
			endif
			addMapIcon {
				parent = pause_map
				icon_create_script = UI_map_player_create
				icon_create_params = {texture = player_cursor rgba = ($goal_ui_scheme.main) rot_angle = (<heading> - 180)}
				icon_focus_script = UI_map_player_focus
				icon_unfocus_script = UI_map_icon_unfocus
				pos = <pro_pos>
				local_id = skater
			}
		endif
	endif
	<i> = 0
	begin
	menu_goals_iter goal = (<goals_array> [<i>]) type = <type>
	<i> = (<i> + 1)
	repeat <goals_array_size>
	ui_view_goals_has_leaderboard goal = (<goals_array> [0])
	if (<has_leaderboard> = 1)
		if getglobalflag flag = $CAREER_TRAINING_DONE
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW INFO"}
				{text = "\\m8 VIEW LEADERBOARD"}
				{text = "\\m9 TOGGLE WAYPOINT"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		else
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW INFO"}
				{text = "\\m8 VIEW LEADERBOARD"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		endif
	else
		if getglobalflag flag = $CAREER_TRAINING_DONE
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW INFO"}
				{text = "\\m9 TOGGLE WAYPOINT"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		else
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW INFO"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		endif
	endif
	cas_menu_finish helper_text = {
		helper_text_elements = <helper_text_elements>
	}
endscript

script show_goal_in_menu 
	if NOT gman_goalexists goal = <goal>
		return false
	endif
	gman_getgoaltype goal = <goal>
	if gotparam type
		if NOT (<goal_type> = <type>)
			return false
		endif
	endif
	if GMan_GoalIsLocked goal = <goal>
		return false
	endif
	if gman_goalissingleplay goal = <goal>
		if gman_haswongoal goal = <goal>
			return false
		endif
	endif
	if NOT (<goal_type> = story)
		if gman_getconstant goal = <goal> name = start_zone
			if NOT careerfunc func = iszoneunlocked params = {zone = <start_zone>}
				return false
			endif
		endif
	endif
	return true
endscript

script menu_goals_iter 
	if show_goal_in_menu goal = <goal> type = <type>
		gman_getgrade goal = <goal>
		GMan_GetLifestyle goal = <goal>
		if NOT gman_getconstant goal = <goal> name = view_goals_title
			gman_getgoalstring goal = <goal>
			formattext textname = view_goals_title "%s" s = <goal_string>
		endif
		ui_view_missions_line {
			goal_text = <view_goals_title>
			grade = <grade>
			goal = <goal>
			lifestyle = <lifestyle>
			type = <type>
		}
	endif
endscript

script ui_destroy_view_missions 
	printf \{"UI: ui_destroy_view_missions"}
	generic_ui_destroy
	ui_view_goals_dim \{up}
endscript

script ui_view_missions_line 
	if NOT GMan_GoalIsLocked goal = <goal>
		if gman_haswongoal goal = <goal>
			color = {rgba = [64 64 64 255]}
		else
			color = {rgba = [128 128 128 255]}
		endif
		switch <grade>
			case 1
			<icon> = icon_small_am
			<icon_scale> = 0.5
			case 2
			<icon> = icon_small_pro
			<icon_scale> = 0.5
			case 3
			<icon> = icon_small_sick
			<icon_scale> = 0.5
			default
			<icon> = white
			<icon_scale> = 0.0
			<color> = {}
		endswitch
		switch <lifestyle>
			case career
			<rgba> = ($goal_career_ui_scheme.main)
			case hardcore
			<rgba> = ($goal_hardcore_ui_scheme.main)
			case rigger
			<rgba> = ($goal_rigger_ui_scheme.main)
			default
			<rgba> = [180 140 60 255]
		endswitch
		if gman_getconstant goal = <goal> name = not_graded
			<icon> = widget_checkbox_on
			if gman_haswongoal goal = <goal>
				<icon_scale> = 1.0
			else
				<icon_scale> = 0.0
			endif
			<rgba> = [0 0 0 0]
		endif
		if getglobalflag flag = $CAREER_TRAINING_DONE
			<waypoint_handlers> = {
				pad_square_script = ui_user_add_goal_waypoint
				pad_square_params = {goal = <goal>}
			}
		endif
		add_cas_menu_item {
			text = <goal_text>
			<color>
			additional_focus_script = ui_view_goals_focus
			additional_focus_params = {goal = <goal>}
			additional_unfocus_script = ui_view_goals_unfocus
			pad_choose_script = ui_view_goals_info
			pad_choose_params = {goal = <goal> type = <type>}
			<waypoint_handlers>
			children = [
				{
					type = spriteelement
					texture = <icon>
					pos = (120.0, 0.0)
					just = [center center]
					dims = ((70.0, 75.0) * <icon_scale>)
					rgba = <rgba>
					z_priority = 50
				}
				{
					type = spriteelement
					texture = <icon>
					pos = (120.0, 0.0)
					just = [center center]
					dims = ((25.0, 30.0) * <icon_scale>)
					rgba = [255 255 255 255]
					z_priority = 51
				}
			]
		}
		ui_view_goals_has_leaderboard goal = <goal>
		if ((<has_leaderboard> = 1) && (gotparam item_container_id))
			<item_container_id> :setprops {
				event_handlers = [
					{pad_space ui_view_goals_goto_leaderboard params = {goal = <goal> update = update}}
				]
			}
		endif
		if UI_User_Waypointed_Goal goal = <goal>
			UI_View_Goals_Set_Menu_Waypoint_Icon parent = <item_container_id>
		endif
		goal_get_activate_pos goal = <goal> assert = 0
		if gotparam activate_pos
			<posx> = ((<activate_pos> [0]) + 512)
			<posz> = ((<activate_pos> [2]) + 512)
			calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
			<rgba> = [234 238 156 255]
			if (<lifestyle> = career)
				<rgba> = [0 210 141 255]
			elseif (<lifestyle> = rigger)
				<rgba> = [143 103 184 255]
			elseif (<lifestyle> = hardcore)
				<rgba> = [231 117 47 255]
			endif
			if (screenelementexists id = pause_map)
				addMapIcon {
					parent = pause_map
					icon_create_script = UI_map_icon_create
					icon_create_params = {rgba = <rgba>}
					icon_focus_script = UI_map_icon_focus
					icon_unfocus_script = UI_map_icon_unfocus
					pos = <pro_pos>
					local_id = <goal>
				}
			endif
		endif
	endif
endscript

script ui_view_goals_goto_leaderboard 
	ui_destroy_view_missions
	kill_start_key_binding
	do_actual_unpause
	wait \{1
		gameframe}
	unpauseskaters
	pauseskaters
	goal_generic_view_leaderboard {
		menu_recreate_script = ui_create_view_missions_from_leaderboard
		update = <update>
		goal = <goal>
		back_to_pause
		from_view_goals
	}
	wait \{0.25
		seconds
		ignoreslomo}
	restore_start_key_binding
endscript

script ui_view_goals_dim 
	if gotparam down
		if screenelementexists id = view_goals_dim_bg
			destroyscreenelement id = view_goals_dim_bg
		endif
		createscreenelement {
			id = view_goals_dim_bg
			parent = main_menu_anchor
			type = spriteelement
			texture = white
			dims = (1280.0, 720.0)
			rgba = [0 0 0 255]
			alpha = 0.0
			pos = (0.0, 0.0)
			just = [left top]
			z_priority = 19
		}
		doscreenelementmorph id = <id> alpha = 0.5 time = 0.1
	else
		if screenelementexists id = view_goals_dim_bg
			destroyscreenelement id = view_goals_dim_bg
		endif
		if screenelementexists id = goal_view_goal_anchor
			destroyscreenelement id = goal_view_goal_anchor
		endif
	endif
endscript

script ui_view_goals_info 
	if screenelementexists id = goal_view_goal_anchor
		view_goals_update_helper goal = <goal>
		ui_view_goals_destroy_info
		return
	endif
	view_goals_update_helper goal = <goal> no_back_text exit_info
	if gman_goalexists goal = <goal>
		<skate9_arcade_hack> = 0
		if gotparam type
			if checksumequals a = <type> b = arcade
				<skate9_arcade_hack> = 1
			endif
		endif
		goal_generic_view_goal_pausemenu {
			goal = <goal>
			z_priority = 20
			grade_offset = (22.0, 0.0)
			skate9_arcade_hack = <skate9_arcade_hack>
		}
	endif
	ui_view_goals_dim down
endscript

script ui_view_goals_destroy_info 
	printf \{'ui_view_goals_destroy_info'}
	if screenelementexists \{id = goal_view_goal_anchor}
		destroyscreenelement \{id = goal_view_goal_anchor}
	endif
	if screenelementexists \{id = main_menu}
		setscreenelementprops \{id = main_menu
			event_handlers = [
				{
					pad_square
					null_script
				}
			]
			replace_handlers}
	endif
	ui_view_goals_dim \{up}
endscript

script ui_view_goals_focus 
	if screenelementexists id = {<id> child = column_2}
		doscreenelementmorph id = {<id> child = column_2} rgba = ($cas_color_scheme.text_focus_color)
	endif
	view_goals_update_helper goal = <goal>
	if (screenelementexists id = pause_map)
		runscriptonscreenelement id = pause_map moveMapToIcon params = {parent = pause_map local_id = <goal> time = 0.5 zoom = 1.5}
	endif
	ui_view_goals_dim \{up}
endscript

script ui_view_goals_unfocus 
	if screenelementexists id = {<id> child = column_2}
		doscreenelementmorph id = {<id> child = column_2} rgba = ($cas_color_scheme.text_color_2)
	endif
	ui_view_goals_dim \{up}
endscript

script ui_view_goals_has_leaderboard 
	goal_get_leaderboard_metrics goal = <goal>
	<has_leaderboard> = 0
	if isxenon
		if checkforsignin
			if gotparam \{leaderboard_metrics}
				getarraysize <leaderboard_metrics>
				if (<array_size> > 0)
					<has_leaderboard> = 1
				endif
			endif
		endif
	endif
	return has_leaderboard = <has_leaderboard>
endscript

script view_goals_update_helper 
	return
	if gotparam no_back_text
		<back_text> = ""
	else
		<back_text> = "\\m1 BACK"
	endif
	if gotparam goal
		if GMan_GoalIsLocked goal = <goal>
			create_helper_text {
				parent = current_menu_anchor
				helper_pos = (318.0, 426.0)
				helper_text_elements = [
					{text = <back_text>}
				]
			}
			return
		endif
		ui_view_goals_has_leaderboard goal = <goal>
		if gotparam exit_info
			<info_text> = "\\m0 EXIT INFO"
		else
			<info_text> = "\\m0 INFO"
		endif
		if (<has_leaderboard> = 1)
			<elements> = [{text = <back_text>}
				{text = <info_text>}
				{text = "\\m8 LEADERBOARD"}
				{text = <waypoint_helper_text>}
			]
		else
			<elements> = [{text = <back_text>}
				{text = <info_text>}
				{text = <waypoint_helper_text>}
			]
		endif
		create_helper_text {
			parent = current_menu_anchor
			helper_pos = (318.0, 426.0)
			helper_text_elements = <elements>
		}
	else
		if gotparam zone_locked
			create_helper_text {
				parent = current_menu_anchor
				helper_pos = (318.0, 426.0)
				helper_text_elements = [
					{text = <back_text>}
				]
			}
			return
		endif
		create_helper_text {
			parent = current_menu_anchor
			helper_pos = (318.0, 426.0)
			helper_text_elements = [{text = <back_text>}
				{text = "\\m0 ACCEPT"}
			]
		}
		ui_view_goals_dim up
	endif
endscript

script ui_menu_column_headings pos = (60.0, 90.0)
	if NOT gotparam columns
		printf "WARNING: No columns passed to ui_menu_column_headings"
		return
	endif
	createscreenelement {
		parent = main_menu_anchor
		type = containerelement
		pos = <pos>
		just = [left center]
		z_priority = -1
	}
	<container_id> = <id>
	<width> = (<width> / 4.0)
	if NOT gotparam no_bg
		createscreenelement {
			parent = <container_id>
			type = spriteelement
			texture = white
			scale = (<width> * (1.0, 0.0) + (0.0, 6.3))
			just = [left center]
			rgba = ($goals_menu_colors.colheading_bg)
			z_priority = -1
		}
	endif
	if NOT gotparam text_params
		<text_params> = {
			just = [left top]
			rgba = ($goals_menu_colors.colheading_text)
			scale = 0.42000002
		}
	endif
	getarraysize <columns>
	if (<array_size> > 0)
		<i> = 0
		begin
		createscreenelement {
			type = textelement
			parent = <container_id>
			font = text_a1
			text = (<columns> [<i>].text)
			pos = (<columns> [<i>].pos)
			<text_params>
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script UI_map_icon_create texture = map_icon glow_texture = icon_glow rgba = [255 255 255 255]
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = icon
		texture = <texture>
		rgba = <rgba>
		z_priority = -9
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = bg
		texture = <glow_texture>
		scale = 0.0
		just = [center center]
		pos = (0.0, 0.0)
		z_priority = -9.5
	}
endscript

script UI_map_player_create 
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = icon
		texture = <texture>
		rot_angle = <rot_angle>
		z_priority = -8
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = icon2
		texture = <texture>
		rgba = [0 0 0 255]
		scale = (1.4, 1.5)
		z_priority = -8.5
		rot_angle = <rot_angle>
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = bg
		texture = <texture>
		rot_angle = <rot_angle>
		rgba = <rgba>
		scale = 0.0
		z_priority = -8.9
	}
endscript

script UI_map_text_create 
	createscreenelement {
		type = textelement
		parent = <parent>
		font = text_a1
	}
endscript

script UI_map_player_focus 
	setspawninstancelimits max = 1 management = kill_oldest
	if NOT screenelementexists id = {<parent> child = bg}
		return
	endif
	setscreenelementprops {
		id = {<parent> child = icon}
		z_priority = -7
	}
	setscreenelementprops {
		id = {<parent> child = icon2}
		z_priority = -7.5
	}
	setscreenelementprops {
		id = {<parent> child = bg}
		z_priority = -7.9
	}
	<scale> = 1.7
	<scale_mod> = 0.08
	begin
	if (<scale> > 2.1)
		<scale_mod> = -0.05
	endif
	if (<scale> < 1.7)
		<scale_mod> = 0.05
	endif
	if NOT screenelementexists id = {<parent> child = bg}
		return
	endif
	doscreenelementmorph {
		id = {<parent> child = bg}
		scale = <scale>
		time = 0.1
	}
	<scale> = (<scale> + <scale_mod>)
	wait 0.1 seconds
	repeat
endscript

script UI_map_icon_focus 
	setspawninstancelimits max = 1 management = kill_oldest
	setscreenelementprops {
		id = {<parent> child = icon}
		z_priority = -7
	}
	setscreenelementprops {
		id = {<parent> child = bg}
		z_priority = -7.9
	}
	<scale> = 1.7
	<scale_mod> = 0.05
	begin
	if (<scale> > 1.5)
		<scale_mod> = -0.05
	endif
	if (<scale> < 1.2)
		<scale_mod> = 0.05
	endif
	if NOT screenelementexists id = {<parent> child = bg}
		return
	endif
	doscreenelementmorph {
		id = {<parent> child = bg}
		scale = <scale>
		time = 0.1
	}
	<scale> = (<scale> + <scale_mod>)
	wait 0.1 seconds ignoreslomo
	repeat
endscript

script UI_map_icon_unfocus 
	printf "unfocus"
	if NOT screenelementexists id = {<parent> child = bg}
		return
	endif
	setscreenelementprops {
		id = {<parent> child = bg}
		z_priority = -9.5
	}
	doscreenelementmorph {
		id = {<parent> child = bg}
		scale = 0.0
		time = 0.2
	}
	setscreenelementprops {
		id = {<parent> child = icon}
		z_priority = -9
	}
	if screenelementexists id = {<parent> child = icon2}
		setscreenelementprops {
			id = {<parent> child = icon2}
			z_priority = -8.5
		}
		setscreenelementprops {
			id = {<parent> child = icon}
			z_priority = -8
		}
		setscreenelementprops {
			id = {<parent> child = bg}
			z_priority = -8.9
		}
	endif
endscript

script show_current_goals 
	if NOT gotparam map
		return
	endif
	if levelis viewer
		return
	endif
	<i> = 0
	begin
	switch <i>
		case 0
		<lifestyle> = career
		case 1
		<lifestyle> = hardcore
		case 2
		<lifestyle> = rigger
	endswitch
	if (<lifestyle> = career)
		<rgba> = [0 210 141 255]
	elseif (<lifestyle> = rigger)
		<rgba> = [143 103 184 255]
	elseif (<lifestyle> = hardcore)
		<rgba> = [231 117 47 255]
	endif
	Gman_GetGoalsByLifestyle lifestyle = <lifestyle>
	<j> = 0
	begin
	<curr_goal> = (<goals_by_lifestyle> [<j>])
	if gman_goalexists goal = <curr_goal>
		if NOT GMan_GoalIsLocked goal = <curr_goal>
			GMan_GetGoalAttemptData goal = <curr_goal>
			if (<times_won> = 0)
				goal_get_activate_pos goal = <curr_goal> assert = 0
				if gotparam activate_pos
					<posx> = ((<activate_pos> [0]) + 512)
					<posz> = ((<activate_pos> [2]) + 512)
					calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
					if (screenelementexists id = pause_map)
						addMapIcon {
							parent = <map>
							icon_create_script = UI_map_icon_create
							icon_create_params = {rgba = <rgba>}
							icon_focus_script = UI_map_icon_focus
							icon_unfocus_script = UI_map_icon_unfocus
							pos = <pro_pos>
							local_id = <curr_goal>
						}
					endif
				endif
			endif
		endif
	endif
	<j> = (<j> + 1)
	repeat <goals_by_lifestyle_size>
	<i> = (<i> + 1)
	repeat 3
endscript

script sk9_any_uber_goals_unlocked 
	<goals_to_check> = [
		m_cu m_hu m_ru
	]
	begin
	if getnextarrayelement <goals_to_check> index = <index>
		if NOT GMan_GoalIsLocked goal = <element>
			return \{true}
		endif
	else
		break
	endif
	repeat
	return \{false}
endscript

script sk9_any_team_goals_unlocked 
	<goals_to_check> = $sk9_your_team_goals
	begin
	if getnextarrayelement <goals_to_check> index = <index>
		if NOT GMan_GoalIsLocked goal = <element>
			return \{true}
		endif
	else
		break
	endif
	repeat
	return \{false}
endscript

script ui_create_buy_specials 
	GetConfigurableTricksFromType special
	make_cas_menu {
		title = "buy specials"
		pausemenu
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_edit_tricks_menu_special from_view_tricks}
		width = 600
		highlight_add = (100.0, 0.0)
		scrolling
	}
	careerfunc func = GetCash
	formattext usecommas textname = my_cash_text "Cash: $%c" c = <cash>
	createscreenelement {
		parent = main_menu_anchor
		type = textelement
		pos = (1150.0, 550.0)
		font = text_a1
		text = <my_cash_text>
		scale = 0.9
		just = [right top]
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	getarraysize <configurabletricks>
	<i> = 0
	begin
	<trick> = (<configurabletricks> [<i>])
	if NOT careerfunc func = isspecialtrickpurchased params = {trick_id = <trick>}
		<price> = $default_special_trick_price
		formattext usecommas textname = special_text "%t ($%p)" t = ($<trick>.params.name) p = <price>
		add_cas_menu_item {
			text = <special_text>
			pad_choose_script = ui_buy_special_trick
			pad_choose_params = {trick = <trick> price = <price>}
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	ui_create_buy_specials_done
endscript

script ui_buy_special_trick 
	printf '-- ui_buy_special_trick'
	careerfunc func = GetCash
	if (<price> <= <cash>)
		formattext usecommas textname = descrip "Do you want to buy\\n%s\\nfor $%p?" s = ($<trick>.params.name) p = <price>
		create_dialog_box {
			title = "Buy Special Trick"
			text = <descrip>
			buttons = [
				{text = "buy" pad_choose_script = ui_buy_special_trick_yes pad_choose_params = {trick = <trick> price = <price>}}
				{text = "cancel" pad_choose_script = ui_buy_special_trick_no}
			]
		}
	else
		formattext usecommas textname = descrip "You don't have enough cash to buy %s." s = ($<trick>.params.name)
		soundevent event = Goal_UI_Negative_Text_Loud
		create_dialog_box {
			title = "Not Enough Cash"
			text = <descrip>
			buttons = [
				{text = "cancel" pad_choose_script = ui_buy_special_trick_no}
			]
		}
	endif
endscript

script ui_buy_special_trick_yes 
	if NOT careerfunc func = isspecialtrickpurchased params = {trick_id = <trick>}
		careerfunc func = setspecialtrickpurchased params = {trick_id = <trick> purchased = true}
		careerfunc func = AddCash params = {cash = (<price> * -1)}
	endif
	dialog_box_exit
	ui_create_buy_specials
endscript

script ui_buy_special_trick_no 
	dialog_box_exit
	ui_create_buy_specials_done
endscript

script ui_create_buy_specials_done 
	cas_menu_finish \{helper_text = {
			helper_text_elements = [
				{
					text = "\\m1 BACK"
				}
				{
					text = "\\m0 BUY TRICK"
				}
			]
		}}
endscript
