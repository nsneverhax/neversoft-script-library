
script create_online_server_list 
	change xboxlive_num_results = 0
	0xf4eb5e26 = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back generic_menu_pad_back params = {callback = menu_flow_go_back}}
		{pad_square refresh_server_list}
	]
	new_menu scrollid = search_results_menu vmenuid = search_results_vmenu use_backdrop = (0) menu_pos = (250.0, 200.0) text_left event_handlers = <0xf4eb5e26>
	setscreenelementprops id = search_results_vmenu disable_pad_handling
	launchevent type = unfocus target = search_results_vmenu
	create_menu_backdrop texture = online_background
	netsessionfunc obj = match func = stop_server_list
	netsessionfunc obj = match func = free_server_list
	if (($ui_flow_manager_state [0]) = online_server_list_fs)
		createscreenelement {type = containerelement parent = root_window id = search_results_container pos = (0.0, 0.0)}
		if isxenon
			createscreenelement {
				type = textelement
				parent = search_results_container
				font = fontgrid_title_gh3
				scale = 0.75
				rgba = [210 210 210 250]
				text = "GAMERTAG"
				just = [left top]
				pos = (250.0, 150.0)
				z_priority = 1.0
				shadow shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		else
			createscreenelement {type = textelement
				parent = search_results_container
				font = fontgrid_title_gh3
				scale = 0.75
				rgba = [210 210 210 250]
				text = "NAME"
				just = [left top]
				pos = (250.0, 150.0)
				z_priority = 1.0
				shadow shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		endif
		createscreenelement {
			type = textelement
			parent = search_results_container
			font = fontgrid_title_gh3
			scale = 0.75
			rgba = [210 210 210 250]
			text = "SONGS"
			just = [left top]
			pos = (550.0, 150.0)
			z_priority = 1.0
			shadow shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
		createscreenelement {type = textelement parent = search_results_container font = fontgrid_title_gh3 scale = 0.75 rgba = [210 210 210 250] text = "MODE" just = [left top] pos = (750.0, 150.0) z_priority = 1.0 shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
		createscreenelement {type = textelement parent = search_results_container font = fontgrid_title_gh3 scale = 0.75 rgba = [210 210 210 250] text = "SIGNAL" just = [left top] pos = (925.0, 150.0) z_priority = 1.0 shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
		get_custom_match_search_params
		netsessionfunc obj = match func = set_search_params params = <...>
		netsessionfunc obj = match func = set_server_list_mode params = {optimatch}
		search_results_vmenu :settags search_type = custom_search
	else
		get_quick_match_search_params
		netsessionfunc obj = match func = set_search_params params = <...>
		netsessionfunc obj = match func = set_server_list_mode params = {quickmatch}
		search_results_vmenu :settags search_type = quickmatch_search
	endif
	netsessionfunc obj = match func = start_server_list
	set_focus_color rgba = [255 255 255 250]
	set_unfocus_color rgba = [128 128 128 250]
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "REFRESH" button = blue z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
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
	destroy_menu \{menu_id = search_results_menu}
	destroy_menu_backdrop
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
	if NOT screenelementexists id = server_list_searching_dialog_menu
		if screenelementexists id = server_list_create_match_dialog_menu
			destroy_server_list_create_match_dialog
		endif
		search_results_vmenu :gettags
		netsessionfunc obj = match func = stop_server_list
		netsessionfunc obj = match func = free_server_list
		clear_search_list
		if (<search_type> = custom_search)
			get_custom_match_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc obj = match func = set_server_list_mode params = {optimatch}
		else
			get_quick_match_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc obj = match func = set_server_list_mode params = {quickmatch}
		endif
		netsessionfunc obj = match func = start_server_list
		create_server_list_searching_dialog
	endif
endscript

script create_server_list_searching_dialog {
		menu_id = server_list_searching_dialog_menu
		vmenu_id = server_list_searching_dialog_vmenu
		pad_back_script = searching_dialog_select_cancel
		pos = (600.0, 518.0)
	}
	event_handlers = [
		{pad_back <pad_back_script>}
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (0) menu_pos = <pos> event_handlers = <event_handlers>
	create_pause_menu_frame z = 2
	createscreenelement {
		type = containerelement
		parent = root_window
		id = searching_dialog_container
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = textelement
		parent = searching_dialog_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [210 210 210 250]
		text = "SEARCHING"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 225.0)
	}
	createscreenelement {
		type = textelement
		parent = searching_dialog_container
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = "Finding sessions"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 350.0)
	}
	createscreenelement {
		type = textelement
		parent = searching_dialog_container
		id = dots_text
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = ""
		just = [left top]
		z_priority = 10.0
		pos = (760.0, 350.0)
	}
	displaysprite parent = searching_dialog_container tex = dialog_title_bg dims = (240.0, 200.0) z = 9 pos = (640.0, 450.0) just = [right top] flip_v
	displaysprite parent = searching_dialog_container tex = dialog_title_bg dims = (240.0, 200.0) z = 9 pos = (640.0, 450.0) just = [left top]
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [210 210 210 250]
		text = "STOP"
		just = [center top]
		z_priority = 10.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose searching_dialog_select_stop}
		]
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [128 128 128 250]
		text = "CANCEL"
		just = [center top]
		z_priority = 10.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose searching_dialog_select_cancel}
		]
	}
	set_focus_color rgba = [255 255 255 250]
	set_unfocus_color rgba = [128 128 128 250]
	if screenelementexists id = dots_text
		runscriptonscreenelement id = dots_text animate_dots params = {id = dots_text}
	endif
	launchevent type = focus target = server_list_searching_dialog_vmenu
endscript

script destroy_server_list_searching_dialog 
	destroy_pause_menu_frame
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

script create_server_list_create_match_dialog {
		menu_id = server_list_create_match_dialog_menu
		vmenu_id = server_list_create_match_dialog_vmenu
		pad_back_script = create_match_dialog_select_cancel
		pos = (560.0, 518.0)
	}
	event_handlers = [
		{pad_back <pad_back_script>}
		{pad_square refresh_server_list}
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (0) menu_pos = <pos> event_handlers = <event_handlers>
	create_pause_menu_frame z = 2
	createscreenelement {
		type = containerelement
		parent = root_window
		id = create_match_dialog_container
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = textelement
		parent = create_match_dialog_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [210 210 210 250]
		text = "SEARCHING"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 225.0)
	}
	createscreenelement {
		type = textelement
		parent = create_match_dialog_container
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = "No sessions are available."
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 300.0)
	}
	createscreenelement {
		type = textelement
		parent = create_match_dialog_container
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = "Would you like to"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 350.0)
	}
	createscreenelement {
		type = textelement
		parent = create_match_dialog_container
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = "Create a Match?"
		just = [center top]
		z_priority = 10.0
		pos = (640.0, 400.0)
	}
	displaysprite parent = create_match_dialog_container tex = dialog_title_bg dims = (240.0, 200.0) z = 9 pos = (640.0, 450.0) just = [right top] flip_v
	displaysprite parent = create_match_dialog_container tex = dialog_title_bg dims = (240.0, 200.0) z = 9 pos = (640.0, 450.0) just = [left top]
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [210 210 210 250]
		text = "CREATE MATCH"
		just = [center top]
		z_priority = 10.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose create_match_dialog_select_create}
		]
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [128 128 128 250]
		text = "CANCEL"
		just = [center top]
		z_priority = 10.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose create_match_dialog_select_cancel}
		]
	}
	set_focus_color rgba = [255 255 255 250]
	set_unfocus_color rgba = [128 128 128 250]
	create_match_dialog_focus
endscript

script destroy_server_list_create_match_dialog 
	create_match_dialog_unfocus
	destroy_pause_menu_frame
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
	wait \{1
		second}
	repeat
endscript
