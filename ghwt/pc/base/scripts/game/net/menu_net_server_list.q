
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
				generic_event_back
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
	create_menu_backdrop \{texture = xb_online_bg}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
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
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	<id> :settags hide_on_search = 0
	displaysprite \{id = xb_online_frame_crown
		parent = search_results_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	<id> :settags hide_on_search = 0
	createscreenelement {
		type = textelement
		parent = search_results_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0x0956be4d)
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	<id> :settags hide_on_search = 0
	displaysprite id = arrow_up parent = search_results_container tex = xb_online_arrow pos = (640.0, 250.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
	<id> :settags hide_on_search = 1
	displaysprite id = arrow_down parent = search_results_container tex = xb_online_arrow pos = (640.0, 590.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
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
			font = fontgrid_title_a1
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			text = qs(0x99c4796b)
			just = [left top]
			pos = (320.0, 210.0)
			z_priority = 2.1
		}
	else
		createscreenelement {
			type = textelement
			parent = search_results_container
			font = fontgrid_title_a1
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			text = qs(0x86be1220)
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
		font = fontgrid_title_a1
		scale = (0.7, 0.75)
		rgba = ($online_light_blue)
		text = qs(0x4f333b39)
		just = [left top]
		pos = (550.0, 210.0)
		z_priority = 2.1
	}
	fit_text_into_menu_item id = <id> max_width = 190
	<id> :settags hide_on_search = 1
	createscreenelement {
		type = textelement
		parent = search_results_container
		font = fontgrid_title_a1
		scale = (0.7, 0.75)
		rgba = ($online_light_blue)
		text = qs(0x1cec7f8c)
		just = [left top]
		pos = (750.0, 210.0)
		z_priority = 2.1
	}
	fit_text_into_menu_item id = <id> max_width = 100
	<id> :settags hide_on_search = 1
	createscreenelement {
		type = textelement
		parent = search_results_container
		font = fontgrid_title_a1
		scale = (0.7, 0.75)
		rgba = ($online_light_blue)
		text = qs(0xc40e02bf)
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
					(<children> [<i>]) :se_setprops preserve_flip alpha = 0.0
				endif
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	get_custom_match_search_params
	net_dummy_get_needed_search_params
	netsessionfunc obj = match func = set_search_params params = <...>
	netsessionfunc \{obj = match
		func = set_server_list_mode
		params = {
			optimatch
		}}
	search_results_vmenu :settags \{search_type = custom_search}
	netsessionfunc {
		obj = match
		func = start_server_list
		params = {
			callback = xboxlive_menu_optimatch_results_item_add
			callback_complete = xboxlive_menu_optimatch_results_stop
			controller = <device_num>
		}
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0x7acb342a)
		button = blue
		z = 100}
	if NOT iswinport
		if isxenon
			if ($match_type = player)
				add_user_control_helper \{text = qs(0x9a7d1fe5)
					button = start
					z = 100}
			endif
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
endscript

script net_choose_server 
	netsessionfunc obj = match func = choose_server params = {id = <id>}
	generic_event_choose \{state = uistate_net_joining}
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
					(<children> [<i>]) :se_setprops preserve_flip alpha = 0.0
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
			net_dummy_get_needed_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					optimatch
				}}
		else
			get_quick_match_search_params
			net_dummy_get_needed_search_params
			netsessionfunc obj = match func = set_search_params params = <...>
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					quickmatch
				}}
		endif
		netsessionfunc \{obj = match
			func = start_server_list
			params = {
				callback = xboxlive_menu_optimatch_results_item_add
				callback_complete = xboxlive_menu_optimatch_results_stop
			}}
		create_server_list_searching_dialog
	endif
endscript

script create_server_list_searching_dialog \{menu_id = server_list_searching_dialog_menu
		vmenu_id = server_list_searching_dialog_vmenu}
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
			{pad_back generic_event_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement \{type = containerelement
		parent = search_results_container
		id = searching_dialog_container
		pos = (0.0, 0.0)}
	displaysprite id = search_arrow_up parent = searching_dialog_container tex = xb_online_arrow pos = (640.0, 424.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
	displaysprite id = search_ arrow_down parent = searching_dialog_container tex = xb_online_arrow pos = (640.0, 545.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
	createscreenelement {
		type = textelement
		parent = searching_dialog_container
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = qs(0xdd486fc1)
		just = [center top]
		z_priority = 2.1
		pos = (640.0, 300.0)
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = dots_text
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x03ac90f0)
		just = [left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_stop text = qs(0xafa78b6d)
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_cancel text = qs(0xf7723015)
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
	generic_event_back
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
		font = fontgrid_title_a1
		scale = (0.65000004, 0.65000004)
		rgba = ($online_light_blue)
		text = qs(0x348937fc)
		just = [center top]
		internal_just = [center top]
		z_priority = 2.1
		pos = (640.0, 275.0)
		dims = (600.0, 370.0)
	}
	displaysprite id = search_arrow_up parent = create_match_dialog_container tex = xb_online_arrow pos = (640.0, 424.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1 flip_h
	displaysprite id = search_ arrow_down parent = create_match_dialog_container tex = xb_online_arrow pos = (640.0, 545.0) dims = (44.0, 32.0) rgba = ($online_light_blue) just = [center center] z = 2.1
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_create text = qs(0x4d968017)
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_cancel text = qs(0xf7723015)
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
	ui_event \{event = menu_replace
		data = {
			state = uistate_net_setlist
		}}
endscript

script create_match_dialog_select_cancel 
	destroy_server_list_create_match_dialog
	generic_event_back
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
	qs(0x713755f7)
	qs(0xefb47879)
	qs(0x57fce4b9)
	qs(0x28a2b598)
]

script animate_dots 
	num_dots = 0
	begin
	formattext textname = new_text qs(0x0bc409e2) a = ($dots_array [<num_dots>])
	<id> :se_setprops text = <new_text>
	if (<num_dots> = 3)
		<num_dots> = 0
	else
		<num_dots> = (<num_dots> + 1)
	endif
	wait \{0.5
		second}
	repeat
endscript
