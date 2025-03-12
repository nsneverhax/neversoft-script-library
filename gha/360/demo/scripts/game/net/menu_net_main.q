info_text = [
	"Jump right into a Player Match and rock the house against the first rocker available."
	"Jump right into a Ranked Match and rock the house against the first rocker available."
	"Search for a specific type of online match."
	"Create and host your own online match."
	"Setup and make changes to your Quick Match Options."
	"Check out who the best of the best are and see where you rank."
	"Check out the newest available downloads for Guitar Hero 3."
	"Be a Guitar Hero, and join the online community!"
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe."
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (922.0, 186.0)
mnm_frame_id = null

script create_online_main_menu \{menu_title_xenon = "Xbox LIVE"
		menu_title_ps3 = "ONLINE"
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu}
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
	createscreenelement \{type = containerelement
		parent = online_main_menu_container
		id = online_main_menu_frame_container
		pos = (0.0, 0.0)
		alpha = 0}
	change mnm_frame_id = <id>
	frame_dims = (840.0, 600.0)
	center_pos = (($online_main_menu_pos) + (170.0, 266.0))
	create_ui_frame {
		parent = online_main_menu_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
		suffix = 0
	}
	createscreenelement {
		type = spriteelement
		id = online_frame_crown
		parent = online_main_menu_frame_container
		texture = online_frame_crown
		pos = (($online_main_menu_pos) + (170.0, -76.0))
		dims = (256.0, 105.0)
		just = [center top]
		z_priority = 3
	}
	createscreenelement \{type = containerelement
		parent = online_info_pane_container
		id = online_info_pane_frame_container
		pos = (0.0, 0.0)}
	frame_dims = (320.0, 340.0)
	center_pos = (($online_info_pane_pos) + (-10.0, 150.0))
	create_ui_frame {
		parent = online_info_pane_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 5
		suffix = 1
	}
	if isxenon
		createscreenelement {
			type = textelement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			scale = 1.2
			rgba = ($online_light_purple)
			pos = (($online_main_menu_pos) + (0.0, 15.0))
			text = <menu_title_xenon>
			just = [center top]
			z_priority = 4.0
			shadow
			shadow_offs = (5.0, 5.0)
		}
	else
		createscreenelement {
			type = textelement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			scale = 1.2
			rgba = ($online_light_purple)
			pos = (($online_main_menu_pos) + (0.0, 15.0))
			text = <menu_title_ps3>
			just = [center top]
			z_priority = 4.0
			shadow
			shadow_offs = (5.0, 5.0)
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
	if isxenon
		net_add_item_to_main_menu {
			vmenu = <vmenu_id>
			text = "QUICK MATCH: PLAYER"
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
		net_add_item_to_main_menu {
			vmenu = <vmenu_id>
			text = "QUICK MATCH: RANKED"
			info_text_index = 1
			pad_choose_script = online_menu_select_quickmatch_ranked
		}
	else
		net_add_item_to_main_menu {
			vmenu = <vmenu_id>
			text = "QUICK MATCH"
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
	endif
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "CREATE MATCH"
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "LEADERBOARDS"
		info_text_index = 5
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "WWW.GUITARHERO.COM"
		info_text_index = 7
		pad_choose_script = online_menu_select_website
		pad_choose_script2 = soundevent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "MESSAGE OF THE DAY"
		info_text_index = 8
		pad_choose_script = online_menu_select_motd
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
		just = [center center]
		internal_just = [center center]
		z_priority = 6.0
		pos = (($online_info_pane_pos) + (-12.0, 140.0))
		dims = (320.0, 340.0)
	}
	createscreenelement \{type = windowelement
		parent = main_menu_anchor
		id = motd_ticker_window
		pos = (0.0, 590.0)
		dims = (1280.0, 40.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = spriteelement
		parent = motd_ticker_window
		texture = white
		pos = (0.0, 0.0)
		dims = (1280.0, 40.0)
		just = [left top]
		rgba = (($g_menu_colors).online_fill_rgba)
	}
	createscreenelement {
		type = textblockelement
		parent = motd_ticker_window
		id = motd_ticker_text_block
		just = [left top]
		internal_just = [left top]
		pos = (1280.0, 0.0)
		scale = (0.65000004, 0.55)
		text = ""
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		dims = (1280.0, 64.0)
		line_spacing = 1.0
		allow_expansion
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
				pos = (640.0, 530.0)
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
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
	endif
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
g_motd_start_pos_x = 0
g_motd_end_pos_x = 0

script scroll_motd_ticker \{scroll_time = 8}
	this_id = <id>
	formattext textname = msg_text "\\c1MESSAGE OF THE DAY:\\c0 %t" t = ($message_of_the_day)
	<this_id> :setprops text = <msg_text>
	getscreenelementchildren id = <this_id>
	getarraysize (<children>)
	<start_pos> = (1280.0, 0.0)
	<motd_font> = text_a4
	createscreenelement {
		type = textelement
		parent = motd_ticker_window
		scale = (0.65000004, 0.55)
		text = " "
		font = <motd_font>
	}
	getscreenelementdims id = <id>
	<space_width> = <width>
	end_pos = (0.0, 0.0)
	<i> = 0
	begin
	(<children> [<i>]) :text_getstring
	getuppercasestring <string>
	formattext checksumname = motd_ticker_text 'motd_ticker_text_%i' i = <i>
	if screenelementexists id = <motd_ticker_text>
		destroyscreenelement id = <motd_ticker_text>
	endif
	createscreenelement {
		type = textelement
		parent = motd_ticker_window
		id = <motd_ticker_text>
		just = [left top]
		internal_just = [left top]
		scale = (0.65000004, 0.55)
		text = <uppercasestring>
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		override_encoded_alpha
	}
	getscreenelementdims id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	<end_pos> = (<end_pos> - (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	change \{g_motd_start_pos_x = 1280}
	change g_motd_end_pos_x = (<end_pos>.(1.0, 0.0))
	<time_factor> = (1280 / <scroll_time>)
	<scroll_time> = ((1280 - $g_motd_end_pos_x) / <time_factor>)
	begin
	<start_pos> = ($g_motd_start_pos_x * (1.0, 0.0))
	<end_pos> = ($g_motd_end_pos_x * (1.0, 0.0))
	<i> = 0
	begin
	formattext checksumname = motd_ticker_text 'motd_ticker_text_%i' i = <i>
	spawnscriptnow scroll_motd_each_line params = {id = <motd_ticker_text> start_pos = <start_pos> end_pos = <end_pos> scroll_time = <scroll_time>}
	getscreenelementdims id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	start_pos = (<start_pos> + (<new_width> * (1.0, 0.0)))
	end_pos = (<end_pos> + (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	wait <scroll_time> seconds
	repeat
endscript

script scroll_motd_each_line 
	<id> :setprops pos = <start_pos>
	<id> :domorph pos = <end_pos> time = <scroll_time>
	return
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
		pos = (40.0, 42.0)
		scale = 0.95}
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
		scale = 1.05
		rgba = ($online_light_purple)
		text = "WWW.GUITARHERO.COM"
		just = [center top]
		pos = (630.0, 111.0)
		z_priority = 4.0
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "Ready to Be a Guitar Hero? \\nHere's how to link your stats to the web community:"
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		pos = (630.0, 160.0)
		dims = (950.0, 200.0)
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "- Go to www.guitarhero.com\\n- Create a New Account or Log in\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		pos = (660.0, 240.0)
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
		pos = (630.0, 410.0)
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
		pos = (638.0, 460.0)
		dims = (950.0, 600.0)
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
		text = "MESSAGE OF THE DAY"
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
		just = [center top]
		internal_just = [center top]
		pos = (245.0, 0.0)
		scale = (0.75, 0.55)
		text = ($message_of_the_day)
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	motd_info_text_block :obj_spawnscriptnow \{scroll_motd_info
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
	<frames> = 10
	<time> = 0.3
	if NOT gotparam \{revert}
		motd_ticker_window :domorph alpha = 0 time = <time>
		($mnm_frame_id) :domorph alpha = 1 time = <time>
	else
		($mnm_frame_id) :domorph alpha = 0 time = <time>
		motd_ticker_window :domorph alpha = 1 time = <time>
	endif
endscript

script translate_and_scale_info_pane 
	<frames> = 10
	if NOT gotparam \{revert}
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (320.0, 340.0)
			end_dims = (830.0, 448.0)
			start_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			end_pos = (($online_info_pane_pos) + (-280.0, 118.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($g_menu_colors).online_fill_rgba)
			frames = <frames>
			parent = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		wait (<frames> + 2) gameframes
		killspawnedscript \{name = do_ui_frame_morph}
	else
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (830.0, 448.0)
			end_dims = (320.0, 340.0)
			start_pos = (($online_info_pane_pos) + (-280.0, 118.0))
			end_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($g_menu_colors).online_fill_rgba)
			frames = <frames>
			parent = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		wait (<frames> + 2) gameframes
		killspawnedscript \{name = do_ui_frame_morph}
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

script net_add_item_to_main_menu 
	if isxenon
		line_spacing = 40
	else
		line_spacing = 50
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu>
		dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = [
			{focus net_main_menu_focus}
			{focus setscreenelementprops params = {id = help_info_text_block text = ($info_text [<info_text_index>])}}
			{unfocus net_main_menu_unfocus}
		]
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
		texture = hilite_bar_01
		dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		pos = (0.0, 15.0)
		just = [center center]
		z_priority = 3
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		pos = (-225.0, 15.0)
		just = [right center]
		z_priority = 3
		alpha = 0.0
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		pos = (225.0, 15.0)
		just = [left center]
		z_priority = 3
		alpha = 0.0
	}
	createscreenelement {
		type = textelement
		parent = <menu_item_container>
		local_id = text
		font = fontgrid_title_gh3
		scale = 0.75
		rgba = ($online_light_blue)
		text = <text>
		just = [center top]
		z_priority = 4.0
		shadow
		shadow_offs = (2.0, 2.0)
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
			preserve_flip
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
			shadow_rgba = ($online_light_blue)
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
			preserve_flip
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
			shadow_rgba = [0 0 0 255]
		}
	endif
endscript
