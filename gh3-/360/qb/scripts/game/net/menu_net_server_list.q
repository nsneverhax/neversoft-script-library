
script create_online_server_list 
	change \{xboxlive_num_results = 0}
	createscreenelement \{type = vscrollingmenu
		parent = root_window
		id = search_results_menu
		just = [
			left
			top
		]
		dims = (625.0, 300.0)
		pos = (328.0, 272.0)
		z_priority = 1}
	createscreenelement \{type = vmenu
		parent = search_results_menu
		id = search_results_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		dims = (625.0, 300.0)
		event_handlers = [
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = menu_flow_go_back
				}
			}
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_square
				refresh_server_list
			}
		]}
	create_menu_backdrop \{texture = online_background}
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
	change \{user_control_pill_gap = 100}
	change \{pill_helper_max_width = 90}
	setscreenelementprops \{id = search_results_vmenu
		disable_pad_handling}
	launchevent \{type = unfocus
		target = search_results_vmenu}
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	createscreenelement \{type = containerelement
		parent = root_window
		id = search_results_container
		pos = (0.0, 0.0)}
	displaysprite \{id = online_frame
		parent = search_results_container
		tex = online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	<id> :settags hide_on_search = 0
	displaysprite \{id = online_frame_crown
		parent = search_results_container
		tex = online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	<id> :settags hide_on_search = 0
	if (($ui_flow_manager_state [0]) = online_server_list_fs)
		<title_text> = "CUSTOM MATCH"
	else
		<title_text> = "QUICKMATCH"
	endif
	createscreenelement {
		type = textelement
		parent = search_results_container
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		text = <title_text>
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	<id> :settags hide_on_search = 0
	if (($ui_flow_manager_state [0]) = online_server_list_fs)
		displaysprite id = arrow_up parent = search_results_container tex = online_arrow pos = (640.0, 250.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
		<id> :settags hide_on_search = 1
		displaysprite id = arrow_down parent = search_results_container tex = online_arrow pos = (640.0, 590.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
		<id> :settags hide_on_search = 1
		displaysprite parent = search_results_container tex = white rgba = ($online_light_grey) pos = (325.0, 270.0) just = [left top] z = 2.1 dims = (625.0, 30.0)
		<id> :settags hide_on_search = 1
		displaysprite parent = search_results_container tex = white rgba = ($online_light_grey) pos = (325.0, 330.0) just = [left top] z = 2.1 dims = (625.0, 30.0)
		<id> :settags hide_on_search = 1
		displaysprite parent = search_results_container tex = white rgba = ($online_light_grey) pos = (325.0, 390.0) just = [left top] z = 2.1 dims = (625.0, 30.0)
		<id> :settags hide_on_search = 1
		displaysprite parent = search_results_container tex = white rgba = ($online_light_grey) pos = (325.0, 450.0) just = [left top] z = 2.1 dims = (625.0, 30.0)
		<id> :settags hide_on_search = 1
		displaysprite parent = search_results_container tex = white rgba = ($online_light_grey) pos = (325.0, 510.0) just = [left top] z = 2.1 dims = (625.0, 30.0)
		<id> :settags hide_on_search = 1
		if isxenon
			createscreenelement {
				type = textelement
				parent = search_results_container
				font = fontgrid_title_gh3
				scale = (0.7, 0.75)
				rgba = ($online_light_blue)
				text = "HOST"
				just = [left top]
				pos = (320.0, 210.0)
				z_priority = 2.1
			}
		else
			createscreenelement {
				type = textelement
				parent = search_results_container
				font = fontgrid_title_gh3
				scale = (0.7, 0.75)
				rgba = ($online_light_blue)
				text = "NAME"
				just = [left top]
				pos = (320.0, 210.0)
				z_priority = 2.1
			}
		endif
		fit_text_into_menu_item id = <id> max_width = 225
		<id> :settags hide_on_search = 1
		createscreenelement {
			type = textelement
			parent = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			text = "MODE"
			just = [left top]
			pos = (550.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item id = <id> max_width = 190
		<id> :settags hide_on_search = 1
		createscreenelement {
			type = textelement
			parent = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			text = "SONGS"
			just = [left top]
			pos = (750.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item id = <id> max_width = 100
		<id> :settags hide_on_search = 1
		createscreenelement {
			type = textelement
			parent = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			text = "SIGNAL"
			just = [left top]
			pos = (860.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item id = <id> max_width = 100
		<id> :settags hide_on_search = 1
		if screenelementexists \{id = search_results_container}
			getscreenelementchildren \{id = search_results_container}
			if gotparam \{children}
				getarraysize \{children}
				i = 0
				begin
				if screenelementexists id = (<children> [<i>])
					(<children> [<i>]) :gettags
					if (<hide_on_search> = 1)
						(<children> [<i>]) :setprops preserve_flip alpha = 0.0
					endif
					<i> = (<i> + 1)
				endif
				repeat <array_size>
			endif
		endif
		get_custom_match_search_params
		netsessionfunc obj = match func = set_search_params params = <...>
		netsessionfunc \{obj = match
			func = set_server_list_mode
			params = {
				optimatch
			}}
		search_results_vmenu :settags \{search_type = custom_search}
	else
		get_quick_match_search_params
		netsessionfunc obj = match func = set_search_params params = <...>
		netsessionfunc \{obj = match
			func = set_server_list_mode
			params = {
				quickmatch
			}}
		search_results_vmenu :settags \{search_type = quickmatch_search}
	endif
	netsessionfunc \{obj = match
		func = start_server_list}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "REFRESH"
		button = blue
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if isxenon
		if ($match_type = player)
			add_user_control_helper \{text = "GAMER CARD"
				button = start
				z = 100}
		endif
	endif
	create_server_list_searching_dialog
endscript

script destroy_online_server_list 
	if screenelementexists \{id = searching_dialog_container}
		destroyscreenelement \{id = searching_dialog_container}
	endif
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if screenelementexists \{id = search_results_container}
		destroyscreenelement \{id = search_results_container}
	endif
	clean_up_user_control_helpers
	if screenelementexists \{id = search_results_menu}
		destroyscreenelement \{id = search_results_menu}
	endif
	destroy_menu_backdrop
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if screenelementexists \{id = searching_dialog_container}
		destroyscreenelement \{id = searching_dialog_container}
	endif
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	if screenelementexists \{id = create_match_dialog_container}
		destroyscreenelement \{id = create_match_dialog_container}
	endif
endscript

script net_chosen_join_server 
	joinserver <...>
	ui_flow_manager_respond_to_action \{action = select_server}
endscript

script net_choose_server 
	netsessionfunc obj = match func = choose_server params = {id = <id>}
	ui_flow_manager_respond_to_action \{action = select_server}
endscript

script clear_search_list 
	if screenelementexists \{id = search_results_vmenu}
		getscreenelementchildren \{id = search_results_vmenu}
		if gotparam \{children}
			getarraysize \{children}
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				destroyscreenelement id = (<children> [<i>])
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
endscript

script refresh_server_list 
	launchevent \{type = unfocus
		target = search_results_vmenu}
	if screenelementexists \{id = server_list_create_match_dialog_vmenu}
		launchevent \{type = unfocus
			target = server_list_create_match_dialog_vmenu}
	endif
	if screenelementexists \{id = search_results_container}
		getscreenelementchildren \{id = search_results_container}
		if gotparam \{children}
			getarraysize \{children}
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				(<children> [<i>]) :gettags
				if (<hide_on_search> = 1)
					(<children> [<i>]) :setprops preserve_flip alpha = 0.0
				endif
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	if NOT screenelementexists \{id = server_list_searching_dialog_menu}
		if screenelementexists \{id = server_list_create_match_dialog_menu}
			destroy_server_list_create_match_dialog
		endif
		search_results_vmenu :gettags
		netsessionfunc \{obj = match
			func = stop_server_list}
		netsessionfunc \{obj = match
			func = free_server_list}
		clear_search_list
		if (<search_type> = custom_search)
			get_custom_match_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					optimatch
				}}
		else
			get_quick_match_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					quickmatch
				}}
		endif
		netsessionfunc \{obj = match
			func = start_server_list}
		create_server_list_searching_dialog
	endif
endscript

script create_server_list_searching_dialog \{menu_id = server_list_searching_dialog_menu
		vmenu_id = server_list_searching_dialog_vmenu
		pad_back_script = searching_dialog_select_cancel}
	createscreenelement {
		type = vscrollingmenu
		parent = search_results_container
		id = <menu_id>
		just = [left top]
		dims = (625.0, 300.0)
		pos = (328.0, 450.0)
		z_priority = 2.1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (625.0, 300.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement \{type = containerelement
		parent = search_results_container
		id = searching_dialog_container
		pos = (0.0, 0.0)}
	displaysprite id = search_arrow_up parent = searching_dialog_container tex = online_arrow pos = (640.0, 424.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
	displaysprite id = search_ arrow_down parent = searching_dialog_container tex = online_arrow pos = (640.0, 545.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
	createscreenelement {
		type = textelement
		parent = searching_dialog_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		text = "Finding sessions"
		just = [center top]
		z_priority = 2.1
		pos = (640.0, 300.0)
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = dots_text
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = ""
		just = [left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_stop text = "STOP"
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_cancel text = "CANCEL"
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = (online_light_blue)
	if screenelementexists \{id = dots_text}
		runscriptonscreenelement \{id = dots_text
			animate_dots
			params = {
				id = dots_text
			}}
	endif
	launchevent \{type = focus
		target = server_list_searching_dialog_vmenu}
endscript

script destroy_server_list_searching_dialog 
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if screenelementexists \{id = searching_dialog_container}
		destroyscreenelement \{id = searching_dialog_container}
	endif
endscript

script searching_dialog_select_stop 
	xboxlive_menu_optimatch_results_stop
endscript

script searching_dialog_select_cancel 
	destroy_server_list_searching_dialog
	netsessionfunc \{obj = match
		func = stop_server_list}
	netsessionfunc \{obj = match
		func = free_server_list}
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript

script create_server_list_create_match_dialog \{menu_id = server_list_create_match_dialog_menu
		vmenu_id = server_list_create_match_dialog_vmenu
		pad_back_script = create_match_dialog_select_cancel}
	createscreenelement {
		type = vscrollingmenu
		parent = search_results_container
		id = <menu_id>
		just = [left top]
		dims = (625.0, 300.0)
		pos = (328.0, 450.0)
		z_priority = 2.1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (625.0, 300.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_square refresh_server_list}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement \{type = containerelement
		parent = search_results_container
		id = create_match_dialog_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = textblockelement
		parent = create_match_dialog_container
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.65000004)
		rgba = ($online_light_blue)
		text = "No sessions are available.\\nWould you like to\\ncreate a match?"
		just = [center top]
		internal_just = [center top]
		z_priority = 2.1
		pos = (640.0, 275.0)
		dims = (600.0, 370.0)
	}
	displaysprite id = search_arrow_up parent = create_match_dialog_container tex = online_arrow pos = (640.0, 424.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
	displaysprite id = search_ arrow_down parent = create_match_dialog_container tex = online_arrow pos = (640.0, 545.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_create text = "CREATE MATCH"
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_cancel text = "CANCEL"
	create_match_dialog_focus
endscript

script destroy_server_list_create_match_dialog 
	create_match_dialog_unfocus
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	if screenelementexists \{id = create_match_dialog_container}
		destroyscreenelement \{id = create_match_dialog_container}
	endif
endscript

script create_match_dialog_select_create 
	destroy_server_list_create_match_dialog
	ui_flow_manager_respond_to_action \{action = response_create_selected
		create_params = {
			menu_type = create_match
		}}
endscript

script create_match_dialog_select_cancel 
	destroy_server_list_create_match_dialog
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript

script create_match_dialog_focus 
	launchevent \{type = unfocus
		target = search_results_vmenu}
	launchevent \{type = focus
		target = server_list_create_match_dialog_vmenu}
endscript

script create_match_dialog_unfocus 
	launchevent \{type = unfocus
		target = server_list_create_match_dialog_vmenu}
	launchevent \{type = focus
		target = search_results_vmenu}
endscript
dots_array = [
	" "
	"."
	". ."
	". . ."
]

script animate_dots 
	num_dots = 0
	begin
	formattext textname = new_text "%a" a = ($dots_array [<num_dots>])
	<id> :setprops text = <new_text>
	if (<num_dots> = 3)
		<num_dots> = 0
	else
		<num_dots> = (<num_dots> + 1)
	endif
	wait \{0.5
		second}
	repeat
endscript
