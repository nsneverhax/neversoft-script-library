
script ui_create_leaderboard 
	printf 'UI: ui_create_leaderboard'
	if infrontend
		pause_menu_fmv_play
	endif
	if infrontend
		back_state = UIstate_net_view_goals
		mempushcontext bottomupheap
		loadpak 'pak/goal_infos/goal_infos.pak' localized no_vram
		pushmemprofile 'Goals script'
		gman_addgoals game_mode = career
		popmemprofile
		unloadpak 'pak/goal_infos/goal_infos.pak' localized
		mempopcontext
		change goals_for_gamemode_loaded = 1
	else
		back_state = UIstate_view_status
	endif
	change current_leaderboard_type = global
	<leaderboards_focus> = {}
	if NOT checkforsignin
		leaderboards_focus = {not_focusable}
	endif
	make_cas_menu {
		title = "LEADERBOARDS"
		back_state = <back_state>
		pausemenu
		width = 500
	}
	if checksumequals a = $last_goal_leaderboard_id b = null
		not_focusable = not_focusable
	endif
	show_full_options = 1
	if NOT infrontend
		if innetgame
			show_full_options = 0
		endif
	endif
	if (<show_full_options> = 1)
		add_cas_menu_item {
			text = "LAST LEADERBOARD"
			pad_choose_script = leaderboard_view_last_board
			pad_choose_params = {leaderboard_id = ($last_goal_leaderboard_id) leaderboard_type = ($last_goal_leaderboard_type) scope = singleplayer}
			not_focusable = <not_focusable>
			<leaderboards_focus>
		}
		current_menu_anchor :settags last_board_item_id = <item_containter_id>
		add_cas_menu_item {
			text = "SINGLE PLAYER"
			pad_choose_script = create_singleplayer_leaderboard_menu
			pad_choose_params = {scope = singleplayer}
			<leaderboards_focus>
		}
	endif
	add_cas_menu_item {
		text = "MULTIPLAYER"
		pad_choose_script = leaderboard_scope_submenu
		pad_choose_params = {scope = multiplayer}
		<leaderboards_focus>
	}
	add_cas_menu_item {
		text = "STATS"
		pad_choose_script = leaderboard_scope_submenu
		pad_choose_params = {scope = stats}
		<leaderboards_focus>
	}
	add_cas_menu_item {
		text = "VIDEO EDITS"
		pad_choose_script = leaderboard_scope_submenu
		pad_choose_params = {scope = video_edits}
		<leaderboards_focus>
	}
	if NOT infrontend
		add_cas_menu_item {
			text = "Personal Records"
			choose_state = Uistate_achieve_awards
		}
	endif
	cas_menu_finish
endscript

script ui_destroy_leaderboard 
	printf \{'UI: ui_destroy_leaderboard'}
	generic_ui_destroy
	if infrontend
		gman_removeallgoals
		change \{goals_for_gamemode_loaded = 0}
	endif
endscript

script leaderboard_view_last_board 
	generic_ui_destroy
	printf \{'--- leaderboard_view_last_board'}
	goal_get_leaderboard_columns goal = <leaderboard_id> goal_type = <leaderboard_type>
	request_leaderboard <...> singleplayer columns = <leaderboard_columns>
endscript

script leaderboard_scope_submenu 
	printf '--- leaderboard_scope_submenu'
	if gotparam scope_num
		switch <scope_num>
			case 1
			title = "MULTIPLAYER"
			case 2
			title = "STATS"
			case 3
			title = "VIDEO EDITS"
		endswitch
	else
		switch <scope>
			case multiplayer
			scope_num = 1
			title = "MULTIPLAYER"
			case stats
			scope_num = 2
			title = "STATS"
			case video_edits
			scope_num = 3
			title = "VIDEO EDITS"
		endswitch
	endif
	get_leaderboard_array_by_scope scope = <scope_num>
	change current_leaderboard_scope = <scope_num>
	make_cas_menu {
		title = <title>
		back_state = uistate_leaderboard
		pausemenu
	}
	getarraysize <leaderboard_array>
	counter = 0
	begin
	if (<counter> > (<array_size> - 1))
		break
	endif
	add_cas_menu_item {
		text = (<leaderboard_array> [<counter>].title)
		pad_choose_script = create_leaderboard
		pad_choose_params = {leaderboard_id = (<leaderboard_array> [<counter>].leaderboard_id) index = <counter> columns = (<leaderboard_array> [<counter>].column_ids)}
	}
	counter = (<counter> + 1)
	repeat
	cas_menu_finish
endscript

script create_singleplayer_leaderboard_menu 
	printf \{'--- create_singleplayer_leaderboard_menu'}
	make_cas_menu \{title = "SINGLE PLAYER"
		back_state = uistate_leaderboard
		pausemenu}
	leaderboard_add_goal_types
	cas_menu_finish
endscript

script leaderboard_add_goal_types 
	printf '--- leaderboard_add_goal_types'
	counter = 0
	begin
	if (getnextarrayelement $goal_types)
		if gotparam element
			getarraysize (($goal_type_info.<element>).leaderboard)
			if (<array_size> > 0)
				add_cas_menu_item {
					text = ($goal_type_info.<element>.name)
					pad_choose_script = create_singleplayer_goal_list
					pad_choose_params = {($goal_type_info.<element>) type = <element> board_index = <counter>}
				}
			endif
			counter = (<counter> + 1)
		else
			break
		endif
	else
		break
	endif
	repeat
endscript

script create_singleplayer_goal_list 
	printf '--- create_singleplayer_goal_list'
	generic_ui_destroy
	if NOT gotparam type
		printf 'No type given, returning'
	endif
	if gotparam board_index
		change current_leaderboard_goal_type_index = <board_index>
	endif
	gman_getgoalsbytype type = <type>
	if gotparam goals_by_type
		if (<goals_by_type_size> > 9)
			scrollable = scrolling
		endif
	endif
	make_cas_menu {
		title = "SINGLE PLAYER"
		pad_back_script = create_singleplayer_leaderboard_menu
		<scrollable>
		pausemenu
		width = 600
		highlight_add = (100.0, 0.0)
	}
	if NOT gotparam goals_by_type
		create_singleplayer_leaderboard_menu
		return
	endif
	change current_leaderboard_goal_type = <type>
	change current_leaderboard_goals_array = <goals_by_type>
	counter = 0
	begin
	if (getnextarrayelement <goals_by_type>)
		removeparameter title
		if gotparam element
			printf '    create_singleplayer_goal_list: goal = %a' a = <element>
			if gman_goalexists goal = <element>
				if NOT goal_get_title goal = <element>
					<view_goals_title> = "???"
				endif
				add_cas_menu_item {
					text = <view_goals_title>
					pad_choose_script = create_singleplayer_leaderboard
					pad_choose_params = {goal = <element> index = <counter> singleplayer type = <type>}
				}
			else
				printf '    !goal does not exist!'
			endif
			counter = (<counter> + 1)
		else
			break
		endif
	else
		break
	endif
	repeat
	cas_menu_finish
endscript

script create_singleplayer_leaderboard 
	printf \{'--- create_singleplayer_leaderboard'}
	generic_ui_destroy
	change current_leaderboard_index = <index>
	change \{current_leaderboard_scope = 0}
	goal_get_leaderboard_columns goal = <goal> goal_type = <type>
	request_leaderboard leaderboard_id = <goal> columns = <leaderboard_columns>
endscript

script create_leaderboard 
	printf \{'--- create_leaderboard'}
	generic_ui_destroy
	change current_leaderboard_index = <index>
	request_leaderboard leaderboard_id = <leaderboard_id> columns = <columns>
endscript

script set_current_leaderboard 
	printf \{'--- set_current_leaderboard'}
	gman_getgoaltype goal = <goal>
	begin
	if (getnextarrayelement $goal_types)
		if checksumequals a = <element> b = <goal_type>
			getarraysize ($goal_type_info.<element>.leaderboard)
			if (<array_size> > 0)
				change last_goal_leaderboard_id = <goal>
				change last_goal_leaderboard_type = <goal_type>
			else
				break
			endif
		endif
	else
		break
	endif
	repeat
endscript
