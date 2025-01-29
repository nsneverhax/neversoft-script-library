
script create_custom_create_menu \{menu_type = custom_match
		menu_id = custom_match_menu
		vmenu_id = custom_match_vmenu}
	match_type_vmenu_id = match_type_selection
	match_type_text_id = match_type_selection_text
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		pos = (640.0, 290.0)
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = online_background}
	createscreenelement \{type = containerelement
		parent = root_window
		id = custom_search_container
		pos = (0.0, 0.0)}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_ui_frame {
		parent = custom_search_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaysprite \{id = online_frame_crown
		parent = custom_search_container
		tex = online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	createscreenelement {
		type = textelement
		parent = custom_search_container
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_light_purple)
		text = "CUSTOM MATCH"
		pos = (640.0, 153.0)
		just = [center top]
		z_priority = 100.0
	}
	if NOT iswinport
		if isxenon
			createscreenelement {
				type = textelement
				id = match_type
				parent = <vmenu_id>
				font = fontgrid_title_gh3
				scale = 0.65000004
				rgba = ($online_light_blue)
				text = "MATCH TYPE:"
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus net_custom_ui_focus params = {this_id = match_type text_id = <match_type_text_id> vmenu = <vmenu_id>}}
					{unfocus net_custom_ui_unfocus params = {text_id = <match_type_text_id>}}
					{pad_choose net_custom_ui_change_focus params = {this_id = match_type text_id = <match_type_text_id> to = <match_type_vmenu_id> from = <vmenu_id>}}
					{pad_choose net_copy_intial_params params = {copy_from = searchmatchtypevalue copy_to = copyofglobal}}
				]
			}
			createscreenelement {
				type = vmenu
				id = <match_type_vmenu_id>
				parent = match_type
				pos = (550.0, 0.0)
				just = [left top]
				internal_just = [left top]
				event_handlers = [
					{pad_up animate_helper_arrows params = {direction = up}}
					{pad_down animate_helper_arrows params = {direction = down}}
					{pad_up net_custom_up_down params = {text = <match_type_text_id> global = copyofglobal type = type direction = up}}
					{pad_down net_custom_up_down params = {text = <match_type_text_id> global = copyofglobal type = type direction = down}}
					{pad_back net_commit_or_reset_params params = {text = <match_type_text_id> global = searchmatchtypevalue type = type}}
					{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <match_type_vmenu_id> menu = search}}
					{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = searchmatchtypevalue}}
					{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <match_type_vmenu_id> menu = search}}
				]
			}
			createscreenelement {
				type = textelement
				id = <match_type_text_id>
				parent = <match_type_vmenu_id>
				font = fontgrid_title_gh3
				scale = 1.0
				rgba = ($online_light_blue)
				text = ($filtertypes.type.values [($searchmatchtypevalue)])
				just = [left top]
				z_priority = 100.0
			}
			fit_text_into_menu_item id = <id> max_width = 375
		endif
	endif
	createscreenelement {
		type = textelement
		id = game_mode
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = "GAME MODE:"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = game_mode text_id = <game_mode_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <game_mode_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = searchgamemodevalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <game_mode_vmenu_id>
		parent = game_mode
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <game_mode_text_id> global = copyofglobal type = mode direction = up}}
			{pad_down net_custom_up_down params = {text = <game_mode_text_id> global = copyofglobal type = mode direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <game_mode_text_id> global = searchgamemodevalue type = mode}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = searchgamemodevalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> menu = search}}
		]
	}
	createscreenelement {
		type = textelement
		id = <game_mode_text_id>
		parent = <game_mode_vmenu_id>
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.mode.values [($searchgamemodevalue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = difficulty
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = "DIFFICULTY:"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = difficulty text_id = <difficulty_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = searchdifficultyvalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <difficulty_vmenu_id>
		parent = difficulty
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <difficulty_text_id> global = copyofglobal type = diff direction = up}}
			{pad_down net_custom_up_down params = {text = <difficulty_text_id> global = copyofglobal type = diff direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> global = searchdifficultyvalue type = diff}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = search diff_focus}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = searchdifficultyvalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = search diff_focus}}
		]
	}
	createscreenelement {
		type = textelement
		id = <difficulty_text_id>
		parent = <difficulty_vmenu_id>
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.diff.values [($searchdifficultyvalue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = number_of_songs
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = "NUMBER OF SONGS:"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <num_songs_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = searchnumsongsvalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <num_songs_vmenu_id>
		parent = number_of_songs
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <num_songs_text_id> global = copyofglobal type = num_songs direction = up}}
			{pad_down net_custom_up_down params = {text = <num_songs_text_id> global = copyofglobal type = num_songs direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <num_songs_text_id> global = searchnumsongsvalue type = num_songs}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = searchnumsongsvalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = search}}
		]
	}
	createscreenelement {
		type = textelement
		id = <num_songs_text_id>
		parent = <num_songs_vmenu_id>
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.num_songs.values [($searchnumsongsvalue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = "DONE"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose custom_create_select_done}
		]
	}
	<vmenu_id> :settags current_focus = first_time
	block_unblock_difficulty_actions \{menu = search}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_custom_create_menu 
	if screenelementexists \{id = custom_search_container}
		destroyscreenelement \{id = custom_search_container}
	endif
	if screenelementexists \{id = custom_match_menu}
		destroyscreenelement \{id = custom_match_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script custom_create_select_done 
	change match_type = ($filtertypes.type.checksum [($searchmatchtypevalue)])
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_done}
endscript

script net_custom_ui_change_focus 
	launchevent type = unfocus target = <from>
	soundevent \{event = ui_sfx_select}
	wait \{1
		frame}
	if screenelementexists id = <this_id>
		<this_id> :setprops rgba = ($online_dark_purple)
		<text_id> :setprops rgba = ($online_dark_purple)
	endif
	if screenelementexists \{id = arrow_down}
		doscreenelementmorph \{id = arrow_down
			alpha = 1.0
			time = 0.1}
	endif
	if screenelementexists \{id = arrow_up}
		doscreenelementmorph \{id = arrow_up
			alpha = 1.0
			time = 0.1}
	endif
	if screenelementexists \{id = bookend1_over}
		bookend1_over :setprops \{alpha = 0.0
			preserve_flip}
	endif
	if screenelementexists \{id = highlight_over}
		highlight_over :getprops
		highlight_over :domorph pos = (<pos> + (480.0, 0.0)) time = 0.1
	endif
	if screenelementexists \{id = bookend2_over}
		bookend2_over :setprops \{alpha = 1.0}
	endif
	launchevent type = focus target = <to>
endscript

script net_custom_ui_change_unfocus 
	launchevent type = unfocus target = <from>
	if (<action> = choose)
		soundevent \{event = ui_sfx_select}
	else
		soundevent \{event = generic_menu_back_sfx}
	endif
	if screenelementexists \{id = arrow_down}
		doscreenelementmorph \{id = arrow_down
			alpha = 0.0
			time = 0.1}
	endif
	if screenelementexists \{id = arrow_up}
		doscreenelementmorph \{id = arrow_up
			alpha = 0.0
			time = 0.1}
	endif
	if screenelementexists \{id = bookend2_over}
		bookend2_over :setprops \{alpha = 0.0}
	endif
	if screenelementexists \{id = highlight_over}
		highlight_over :getprops
		highlight_over :domorph pos = (<pos> + (-480.0, 0.0)) time = 0.1
	endif
	if screenelementexists \{id = bookend1_over}
		bookend1_over :setprops \{alpha = 1.0
			preserve_flip}
	endif
	launchevent type = focus target = <to>
endscript

script net_custom_ui_focus 
	<vmenu> :gettags
	if NOT (<current_focus> = <this_id>)
		destroy_prev_selection_highlight
		if screenelementexists id = <this_id>
			if (<this_id> = submit_selection)
				displaysprite id = highlight_over parent = <this_id> tex = hilite_bar_01 pos = (-25.0, -10.0) dims = (480.0, 63.0) rgba = ($online_light_blue) just = [left top] z = 4
				displaysprite id = bookend1_over parent = <this_id> tex = character_hub_hilite_bookend pos = (-86.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_blue) just = [left center] z = 4 flip_v
				displaysprite id = bookend2_over parent = <this_id> tex = character_hub_hilite_bookend pos = (454.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_blue) just = [left center] z = 4
			else
				displaysprite id = highlight_under parent = <this_id> tex = hilite_bar_01 pos = (-25.0, -10.0) dims = (960.0, 63.0) rgba = ($online_light_purple) just = [left top] z = 3
				displaysprite id = bookend1_under parent = <this_id> tex = character_hub_hilite_bookend pos = (-86.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_purple) just = [left center] z = 3 flip_v
				displaysprite id = bookend2_under parent = <this_id> tex = character_hub_hilite_bookend pos = (932.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_purple) just = [left center] z = 3
				displaysprite id = highlight_over parent = <this_id> tex = hilite_bar_01 pos = (-25.0, -10.0) dims = (480.0, 63.0) rgba = ($online_light_blue) just = [left top] z = 4
				displaysprite id = bookend1_over parent = <this_id> tex = character_hub_hilite_bookend pos = (-86.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_blue) just = [left center] z = 4 flip_v
				displaysprite id = bookend2_over parent = <this_id> tex = character_hub_hilite_bookend pos = (932.0, 20.0) dims = (60.0, 62.0) rgba = ($online_light_blue) just = [left center] z = 4
				displaysprite id = arrow_down parent = <this_id> tex = online_arrow pos = (490.0, 40.0) dims = (44.0, 32.0) rgba = ($online_dark_purple) just = [center center] z = 5
				displaysprite id = arrow_up parent = <this_id> tex = online_arrow pos = (490.0, 0.0) dims = (44.0, 32.0) rgba = ($online_dark_purple) just = [center center] z = 5 flip_h
				bookend2_over :setprops \{alpha = 0.0}
				arrow_down :setprops \{alpha = 0.0}
				arrow_up :setprops \{alpha = 0.0
					preserve_flip}
			endif
		endif
		<vmenu> :settags current_focus = <this_id>
	endif
	retail_menu_focus
	if screenelementexists id = <text_id>
		<text_id> :setprops rgba = ($online_dark_purple)
	endif
endscript

script net_custom_ui_unfocus 
	retail_menu_unfocus
	if screenelementexists id = <text_id>
		<text_id> :setprops rgba = ($online_light_blue)
	endif
endscript

script destroy_prev_selection_highlight 
	if screenelementexists \{id = highlight_under}
		destroyscreenelement \{id = highlight_under}
	endif
	if screenelementexists \{id = bookend1_under}
		destroyscreenelement \{id = bookend1_under}
	endif
	if screenelementexists \{id = bookend2_under}
		destroyscreenelement \{id = bookend2_under}
	endif
	if screenelementexists \{id = highlight_over}
		destroyscreenelement \{id = highlight_over}
	endif
	if screenelementexists \{id = bookend1_over}
		destroyscreenelement \{id = bookend1_over}
	endif
	if screenelementexists \{id = bookend2_over}
		destroyscreenelement \{id = bookend2_over}
	endif
	if screenelementexists \{id = arrow_up}
		destroyscreenelement \{id = arrow_up}
	endif
	if screenelementexists \{id = arrow_down}
		destroyscreenelement \{id = arrow_down}
	endif
endscript

script animate_helper_arrows 
	if (<direction> = up)
		generic_menu_up_or_down_sound \{up}
		if screenelementexists \{id = arrow_up}
			arrow_up :domorph \{scale = (1.8, 1.5)
				time = 0.1}
			arrow_up :domorph \{scale = (1.375, 1.0)
				time = 0.1}
		endif
	else
		generic_menu_up_or_down_sound \{down}
		if screenelementexists \{id = arrow_down}
			arrow_down :domorph \{scale = (1.8, 1.5)
				time = 0.1}
			arrow_down :domorph \{scale = (1.375, 1.0)
				time = 0.1}
		endif
	endif
endscript
