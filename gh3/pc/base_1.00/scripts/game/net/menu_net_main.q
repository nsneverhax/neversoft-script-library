info_text = [
	"Jump right into a Player Match and rock the house against the first rocker available."
	"Jump right into a Ranked Match and rock the house against the first rocker available."
	"Search for a specific type of online match."
	"Join a private match created by a friend."
	"Create and host your own online match."
	"Setup and make changes to your Quick Match Options."
	"Check out who the best of the best are and see where you rank."
	"Downloads Coming Soon!"
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe."
	"Manage your online account."
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (890.0, 150.0)

script create_online_main_menu \{menu_title_xenon = "Online Main Menu"
		menu_title_ps3 = "Online Main Menu"
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu}
	change \{winport_block_net_pause = 0}
	change \{online_main_menu_pos = (470.0, 110.0)}
	change \{online_info_pane_pos = (890.0, 150.0)}
	change \{gprivatematchid = 0}
	online_menu_init
	change \{rich_presence_context = presence_main_menu}
	spawnscriptnow \{menu_music_on}
	createscreenelement \{type = containerelement
		parent = root_window
		id = main_menu_anchor
		pos = (0.0, 0.0)}
	createscreenelement {
		type = vscrollingmenu
		parent = main_menu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (47.5, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	createscreenelement \{type = containerelement
		parent = main_menu_anchor
		id = online_main_menu_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		parent = online_main_menu_container
		id = online_main_menu_text_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		parent = main_menu_anchor
		id = online_info_pane_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = containerelement
		parent = online_info_pane_container
		id = online_info_pane_text_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = online_background}
	displaysprite id = online_frame parent = online_main_menu_container tex = online_frame_large pos = ($online_main_menu_pos) dims = (660.0, 480.0) just = [center top] z = 2
	displaysprite id = online_frame_crown parent = online_main_menu_container tex = online_frame_crown pos = (($online_main_menu_pos) + (0.0, -62.0)) dims = (256.0, 105.0) just = [center top] z = 3
	displaysprite id = motd_top parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaysprite id = motd_top_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaysprite id = motd_body parent = online_info_pane_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_body_fill parent = online_info_pane_container tex = window_fill_body_large rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_end parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_end_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaysprite id = info_divide parent = online_info_pane_text_container tex = store_frame_bottom_bg rgba = ($online_light_blue) pos = (($online_info_pane_pos) + (-5.0, 240.0)) dims = (320.0, 56.0) just = [center center] z = 6
	if isxenon
		createscreenelement {
			type = textelement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($online_dark_purple)
			pos = (($online_main_menu_pos) + (0.0, 35.0))
			text = <menu_title_xenon>
			just = [center top]
			z_priority = 4.0
		}
	else
		createscreenelement {
			type = textelement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($online_dark_purple)
			pos = (($online_main_menu_pos) + (0.0, 35.0))
			text = <menu_title_ps3>
			just = [center top]
			z_priority = 4.0
		}
	endif
	getscreenelementdims id = <id>
	if (<width> > 420)
		setscreenelementprops {
			id = <id>
			scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Quick Match"
		info_text_index = 0
		pad_choose_script = online_menu_select_quickmatch_player
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Browse Matches"
		info_text_index = 2
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_custom_match}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Join Private Match"
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_join_private}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Create Match"
		info_text_index = 4
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Quick Match Player Options"
		info_text_index = 5
		pad_choose_script = online_menu_select_options
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Leaderboards"
		info_text_index = 6
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	if isxenon
		net_add_item_to_main_menu {
			vmenu = <vmenu_id>
			text = "Downloadable Content"
			info_text_index = 7
			pad_choose_script = null_script
			pad_choose_script2 = soundevent
			choose_script_params2 = {event = ui_sfx_select}
		}
	endif
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Message Of The Day"
		info_text_index = 8
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = soundevent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "Account Management"
		info_text_index = 9
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_account_management}
		pad_choose_script2 = soundevent
		choose_script_params2 = {event = ui_sfx_select}
	}
	createscreenelement {
		type = textblockelement
		parent = online_info_pane_text_container
		id = help_info_text_block
		font = text_a4
		scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = ($info_text [0])
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		pos = (($online_info_pane_pos) + (-4.0, 20.0))
		dims = (320.0, 370.0)
	}
	createscreenelement {
		type = textelement
		parent = online_info_pane_text_container
		id = motd_info_pane_title
		font = text_a4
		text = "Message of the Day"
		scale = 0.65000004
		rgba = ($online_light_blue)
		pos = (($online_info_pane_pos) + (0.0, 264.0))
		just = [center top]
		z_priority = 6.0
	}
	createscreenelement {
		type = windowelement
		parent = online_info_pane_text_container
		id = motd_ticker_window
		pos = (($online_info_pane_pos) + (0.0, 312.0))
		dims = (248.0, 32.0)
		just = [center top]
	}
	createscreenelement {
		type = textblockelement
		parent = motd_ticker_window
		id = motd_ticker_text_block
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		scale = (0.75, 0.55)
		text = ""
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	spawnscriptnow \{get_motd_and_start_ticker}
	if NOT isxenon
		if NOT netsessionfunc \{obj = voice
				func = voice_allowed}
			createscreenelement {
				type = textblockelement
				parent = online_info_pane_container
				just = [center top]
				internal_just = [center top]
				pos = (640.0, 585.0)
				scale = (0.55, 0.55)
				text = "Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions."
				font = text_a4
				rgba = ($online_light_blue)
				z_priority = 6.0
				dims = (1500.0, 120.0)
			}
		endif
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if screenelementexists \{id = main_menu_anchor}
		destroyscreenelement \{id = main_menu_anchor}
	endif
	killspawnedscript \{name = scroll_motd_ticker}
endscript

script create_online_main_menu_helper_buttons 
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
endscript

script get_motd_and_start_ticker 
	if ($retrieved_message_of_the_day = 0)
		netsessionfunc \{obj = motd
			func = get_demonware_motd
			params = {
				callback = motd_callback
			}}
	else
		motd_ticker_text_block :setprops text = ($message_of_the_day)
		spawnscriptnow \{scroll_motd_ticker
			params = {
				id = motd_ticker_text_block
			}}
	endif
endscript

script motd_callback 
	if gotparam \{motd_text}
		change \{retrieved_message_of_the_day = 1}
		change message_of_the_day = <motd_text>
		if screenelementexists \{id = motd_ticker_text_block}
			motd_ticker_text_block :setprops text = ($message_of_the_day)
			spawnscriptnow \{scroll_motd_ticker
				params = {
					id = motd_ticker_text_block
				}}
		endif
	endif
endscript

script scroll_motd_ticker \{scroll_time = 20}
	<end_pos> = (-1000.0, 0.0)
	<this_id> = <id>
	getscreenelementchildren id = <this_id>
	if gotparam \{children}
		begin
		begin
		wait \{2
			seconds}
		doscreenelementmorph id = <this_id> pos = <end_pos> time = <scroll_time>
		wait \{5
			seconds}
		getscreenelementprops id = <this_id>
		setscreenelementprops id = <this_id> pos = <pos>
		wait \{2.0
			seconds}
		<this_id> :domorph alpha = 0 time = 0.2
		<this_id> :setprops pos = (0.0, 0.0)
		wait \{0.5
			seconds}
		<this_id> :domorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script return_from_online_main_menu 
	printf \{"--- deinitializing network layer"}
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script online_menu_select_quickmatch_player 
	change \{match_type = player}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_player}
endscript

script online_menu_select_quickmatch_ranked 
	change \{match_type = ranked}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_ranked}
endscript

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 
	printf \{"---lobby_connection_lost performing net cleanup"}
	endgamenetscriptpump
	if NOT (ishost)
		quit_network_game
		setup_sessionfuncs
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = connection_lost}
	endif
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements \{id = online_info_pane_container
		time = 0.2
		hide}
	wait \{0.1
		seconds}
	hide_unhide_menu_elements \{id = online_main_menu_text_container
		time = 0.2
		hide}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2
		hide}
	translate_and_scale_online_menu
	wait \{0.3
		seconds}
	if screenelementexists \{id = gh_link_container}
		runscriptonscreenelement \{id = gh_link_container
			doscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	ghlink_vmenu :setprops \{enable_pad_handling}
	launchevent \{type = focus
		target = ghlink_vmenu}
endscript

script online_menu_unselect_website 
	if screenelementexists \{id = gh_link_container}
		runscriptonscreenelement \{id = gh_link_container
			doscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 0.0
				time = 0.2
			}}
	endif
	wait \{0.3
		seconds}
	if screenelementexists \{id = gh_link_container}
		destroyscreenelement \{id = gh_link_container}
	endif
	translate_and_scale_online_menu \{revert}
	hide_unhide_menu_elements \{id = online_main_menu_text_container
		time = 0.2}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2}
	wait \{0.1
		seconds}
	hide_unhide_menu_elements \{id = online_info_pane_container
		time = 0.2}
	wait \{0.3
		seconds}
	launchevent \{type = focus
		target = online_main_vmenu}
endscript

script create_link_text 
	createscreenelement \{type = containerelement
		parent = online_main_menu_container
		id = gh_link_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = vscrollingmenu
		parent = gh_link_container
		id = ghlink
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		pos = (320.0, 200.0)
		z_priority = 1}
	createscreenelement {
		type = vmenu
		parent = ghlink
		id = ghlink_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back soundevent params = {event = generic_menu_back_sfx}}
			{pad_back online_menu_unselect_website}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :setprops disable_pad_handling
	createscreenelement {
		type = textelement
		parent = gh_link_container
		id = gh_link_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		text = "www.guitarhero.com"
		just = [center top]
		pos = (640.0, 111.0)
		z_priority = 4.0
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "Ready to Be A Guitar Hero? \\nHere's how to link your stats to the web community:"
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		pos = (640.0, 160.0)
		dims = (950.0, 200.0)
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "- Go to www.guitarhero.com\\n- Create a New Account or Login\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		pos = (640.0, 240.0)
		dims = (1010.0, 600.0)
	}
	netsessionfunc \{func = get_agora_token}
	formattext textname = vip_code "%a" a = <token>
	createscreenelement {
		type = textelement
		parent = gh_link_container
		font = text_a3
		scale = 1.25
		rgba = ($online_light_blue)
		text = <vip_code>
		just = [center top]
		z_priority = 6.0
		pos = (640.0, 410.0)
		font_spacing = 5
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		pos = (648.0, 460.0)
		dims = (1010.0, 600.0)
	}
	if screenelementexists \{id = gh_link_container}
		runscriptonscreenelement \{id = gh_link_container
			doscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 0.0
			}}
	endif
	clean_up_user_control_helpers
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
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	launchevent \{type = unfocus
		target = online_main_vmenu}
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements \{id = online_main_menu_container
		time = 0.2
		hide}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2
		hide}
	wait \{0.1
		seconds}
	hide_unhide_menu_elements \{id = online_info_pane_text_container
		time = 0.2
		hide}
	translate_and_scale_info_pane
	wait \{0.3
		seconds}
	if screenelementexists \{id = motd_container}
		runscriptonscreenelement \{id = motd_container
			doscreenelementmorph
			params = {
				id = motd_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	launchevent \{type = focus
		target = motd_vmenu}
	motd_vmenu :setprops \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if screenelementexists \{id = motd_container}
		runscriptonscreenelement \{id = motd_container
			doscreenelementmorph
			params = {
				id = motd_container
				alpha = 0.0
				time = 0.2
			}}
	endif
	wait \{0.3
		seconds}
	destroy_menu \{menu_id = motd_scroller}
	if screenelementexists \{id = motd_container}
		destroyscreenelement \{id = motd_container}
	endif
	translate_and_scale_info_pane \{revert}
	hide_unhide_menu_elements \{id = online_info_pane_text_container
		time = 0.2}
	wait \{0.1
		seconds}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2}
	hide_unhide_menu_elements \{id = online_main_menu_container
		time = 0.2}
	wait \{0.3
		seconds}
	launchevent \{type = focus
		target = online_main_vmenu}
endscript

script create_motd_text 
	createscreenelement \{type = containerelement
		parent = online_info_pane_container
		id = motd_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = vscrollingmenu
		parent = motd_container
		id = motd_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		pos = (640.0, 0.0)
		z_priority = 1}
	createscreenelement {
		type = vmenu
		parent = motd_scroller
		id = motd_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back soundevent params = {event = generic_menu_back_sfx}}
			{pad_back online_menu_unselect_motd}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :setprops disable_pad_handling
	createscreenelement {
		type = textelement
		parent = motd_container
		id = gh_link_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_light_blue)
		text = "Message Of The Day"
		just = [center top]
		pos = (640.0, 160.0)
		z_priority = 10.0
	}
	createscreenelement \{type = windowelement
		parent = motd_container
		id = motd_info_scroll_window
		pos = (633.0, 220.0)
		dims = (500.0, 300.0)
		just = [
			center
			top
		]}
	createscreenelement {
		type = textblockelement
		parent = motd_info_scroll_window
		id = motd_info_text_block
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		scale = (0.75, 0.55)
		text = ($message_of_the_day)
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	spawnscriptnow \{scroll_motd_info
		params = {
			id = motd_info_text_block
		}}
	if screenelementexists \{id = motd_container}
		motd_container :setprops \{alpha = 0.0}
	endif
	clean_up_user_control_helpers
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
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	launchevent \{type = unfocus
		target = online_main_vmenu}
endscript

script scroll_motd_info \{scroll_time = 60}
	<end_pos> = (0.0, -1000.0)
	<this_id> = <id>
	getscreenelementchildren id = <this_id>
	if gotparam \{children}
		getarraysize (<children>)
		<line_nums> = <array_size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		wait \{5
			seconds}
		doscreenelementmorph id = <this_id> pos = <end_pos> time = <scroll_time>
		wait ((<line_nums> - 10) * 1.8) seconds
		getscreenelementprops id = <this_id>
		setscreenelementprops id = <this_id> pos = <pos>
		wait \{4.0
			seconds}
		<this_id> :domorph alpha = 0 time = 0.2
		<this_id> :setprops pos = (0.0, 0.0)
		wait \{0.5
			seconds}
		<this_id> :domorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	if NOT gotparam \{revert}
		runscriptonscreenelement id = online_frame doscreenelementmorph params = {id = online_frame pos = (($online_main_menu_pos) + (170.0, -35.0)) time = 0.2}
		runscriptonscreenelement id = online_frame_crown doscreenelementmorph params = {id = online_frame_crown pos = (($online_main_menu_pos) + (180.0, -88.0)) time = 0.2}
		runscriptonscreenelement \{id = online_frame
			scale_element_to_size
			params = {
				id = online_frame
				target_width = 760
				target_height = 500
				time = 0.2
			}}
	else
		runscriptonscreenelement id = online_frame doscreenelementmorph params = {id = online_frame pos = ($online_main_menu_pos) time = 0.2}
		runscriptonscreenelement id = online_frame_crown doscreenelementmorph params = {id = online_frame_crown pos = (($online_main_menu_pos) + (0.0, -62.0)) time = 0.2}
		online_frame :setprops \{scale = 1.0}
		runscriptonscreenelement \{id = online_frame
			scale_element_to_size
			params = {
				id = online_frame
				target_width = 660
				target_height = 480
				time = 0.2
			}}
	endif
endscript

script translate_and_scale_info_pane 
	if NOT gotparam \{revert}
		runscriptonscreenelement id = motd_top doscreenelementmorph params = {id = motd_top pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		runscriptonscreenelement id = motd_top_fill doscreenelementmorph params = {id = motd_top_fill pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		runscriptonscreenelement id = motd_body doscreenelementmorph params = {id = motd_body pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_body_fill doscreenelementmorph params = {id = motd_body_fill pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_end doscreenelementmorph params = {id = motd_end pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_end_fill doscreenelementmorph params = {id = motd_end_fill pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
		runscriptonscreenelement \{id = motd_top
			scale_element_to_size
			params = {
				id = motd_top
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_top_fill
			scale_element_to_size
			params = {
				id = motd_top_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_body
			scale_element_to_size
			params = {
				id = motd_body
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_body_fill
			scale_element_to_size
			params = {
				id = motd_body_fill
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_end
			scale_element_to_size
			params = {
				id = motd_end
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_end_fill
			scale_element_to_size
			params = {
				id = motd_end_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
	else
		runscriptonscreenelement id = motd_top doscreenelementmorph params = {id = motd_top pos = ($online_info_pane_pos) time = 0.2}
		runscriptonscreenelement id = motd_top_fill doscreenelementmorph params = {id = motd_top_fill pos = ($online_info_pane_pos) time = 0.2}
		runscriptonscreenelement id = motd_body doscreenelementmorph params = {id = motd_body pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_body_fill doscreenelementmorph params = {id = motd_body_fill pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_end doscreenelementmorph params = {id = motd_end pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_end_fill doscreenelementmorph params = {id = motd_end_fill pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		runscriptonscreenelement \{id = motd_top
			scale_element_to_size
			params = {
				id = motd_top
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_top_fill
			scale_element_to_size
			params = {
				id = motd_top_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_body
			scale_element_to_size
			params = {
				id = motd_body
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_body_fill
			scale_element_to_size
			params = {
				id = motd_body_fill
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_end
			scale_element_to_size
			params = {
				id = motd_end
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		runscriptonscreenelement \{id = motd_end_fill
			scale_element_to_size
			params = {
				id = motd_end_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
	endif
endscript

script hide_unhide_menu_elements \{time = 0.0}
	if screenelementexists id = <id>
		if gotparam \{hide}
			runscriptonscreenelement id = <id> doscreenelementmorph params = {alpha = 0.0 time = <time> id = <id>}
		else
			runscriptonscreenelement id = <id> doscreenelementmorph params = {alpha = 1.0 time = <time> id = <id>}
		endif
	endif
endscript

script create_net_play_song_menu 
endscript

script destroy_net_play_song_menu 
endscript

script online_select_downloads 
	netsessionfunc \{func = showmarketplaceui}
	wait_for_blade_complete
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroy_band
	downloads_unloadcontent
	ui_flow_manager_respond_to_action \{action = select_downloadable_content}
endscript

script net_add_item_to_main_menu \{line_spacing = 40}
	if gotparam \{info_text_index}
		eventparams = [
			{focus net_main_menu_focus}
			{focus setscreenelementprops params = {id = help_info_text_block text = ($info_text [<info_text_index>])}}
			{unfocus net_main_menu_unfocus}
		]
	else
		eventparams = [
			{focus net_main_menu_focus}
			{unfocus net_main_menu_unfocus}
		]
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu>
		dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = <eventparams>
	}
	menu_item_container = <id>
	if gotparam \{pad_choose_script}
		if gotparam \{choose_script_params}
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script> params = {<choose_script_params>}}]
		else
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if gotparam \{pad_choose_script2}
		if gotparam \{choose_script_params2}
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script2> params = {<choose_script_params2>}}]
		else
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script2>}]
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <menu_item_container>
		local_id = highlightbar
		texture = white
		dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		pos = (0.0, 7.5)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		pos = (-227.0, 3.0)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		pos = (240.0, 3.0)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	createscreenelement {
		type = textelement
		parent = <menu_item_container>
		local_id = text
		font = text_a4
		scale = 0.75
		rgba = ($online_light_blue)
		text = <text>
		just = [center top]
		z_priority = 4.0
	}
	getscreenelementdims id = <id>
	if (<width> > 420)
		setscreenelementprops {
			id = <id>
			scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	if (<text> = "Quick Match: Ranked Match")
		getglobaltags \{user_options}
		if (<online_game_mode> = 4)
			setscreenelementprops {
				id = <menu_item_container>
				not_focusable
			}
			setscreenelementprops {
				id = {<menu_item_container> child = text}
				rgba = ($online_grey)
			}
		endif
	endif
endscript

script net_main_menu_focus 
	obj_getid
	if screenelementexists id = {<objid> child = highlightbar}
		setscreenelementprops {
			id = {<objid> child = highlightbar}
			alpha = 1.0
		}
	endif
	if screenelementexists id = {<objid> child = left_bookend}
		setscreenelementprops {
			id = {<objid> child = left_bookend}
			alpha = 1.0
		}
	endif
	if screenelementexists id = {<objid> child = right_bookend}
		setscreenelementprops {
			id = {<objid> child = right_bookend}
			alpha = 1.0
		}
	endif
	if screenelementexists id = {<objid> child = text}
		setscreenelementprops {
			id = {<objid> child = text}
			rgba = ($online_dark_purple)
		}
	endif
endscript

script net_main_menu_unfocus 
	obj_getid
	if screenelementexists id = {<objid> child = highlightbar}
		setscreenelementprops {
			id = {<objid> child = highlightbar}
			alpha = 0.0
		}
	endif
	if screenelementexists id = {<objid> child = left_bookend}
		setscreenelementprops {
			id = {<objid> child = left_bookend}
			alpha = 0.0
		}
	endif
	if screenelementexists id = {<objid> child = right_bookend}
		setscreenelementprops {
			id = {<objid> child = right_bookend}
			alpha = 0.0
		}
	endif
	if screenelementexists id = {<objid> child = text}
		setscreenelementprops {
			id = {<objid> child = text}
			rgba = ($online_light_blue)
		}
	endif
endscript
