info_text = [
	"Jump right into a Player match and rock the house against the first rocker available"
	"Jump right into a Ranked match and rock the house against the first rocker available"
	"Search for a specific type of online match"
	"Create and host your own online match"
	"Setup and make changes to your Quick Match Options and Highway Layout"
	"Check out who the best of the best are and see where you rank"
	"Check out the newest available downloads for Guitar Hero 3"
	"Be A Guitar Hero, and join the online community!"
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe"
]
highlight_pos = [
	(460.0, 218.0)
	(460.0, 254.0)
	(460.0, 290.0)
	(460.0, 326.0)
	(460.0, 362.0)
	(460.0, 398.0)
	(460.0, 434.0)
	(460.0, 470.0)
	(460.0, 506.0)
]
online_main_menu_pos = (460.0, 110.0)
online_info_pane_pos = (850.0, 150.0)

script create_online_main_menu {
		menu_title = "Online Main Menu"
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu
	}
	online_menu_init
	spawnscriptnow menu_music_on
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		pos = (($online_main_menu_pos) + (0.0, 103.0))
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = online_main_menu_container
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = containerelement
		parent = online_main_menu_container
		id = online_main_menu_text_container
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = online_info_pane_container
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = containerelement
		parent = online_info_pane_container
		id = online_info_pane_text_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop texture = online_background
	displaysprite id = online_frame parent = online_main_menu_container tex = online_frame_large pos = ($online_main_menu_pos) dims = (580.0, 480.0) just = [center top] z = 2
	displaysprite id = online_frame_crown parent = online_main_menu_container tex = online_frame_crown pos = (($online_main_menu_pos) + (0.0, -53.0)) dims = (256.0, 105.0) just = [center top] z = 3
	displaysprite id = highlight parent = online_main_menu_text_container tex = white pos = ($highlight_pos [0]) dims = (395.0, 40.0) rgba = ($online_light_blue) just = [center top] z = 3
	displaysprite id = 0x7c530f0d parent = online_main_menu_text_container tex = character_hub_hilite_bookend pos = (($highlight_pos [0]) + (-200.0, 18.0)) dims = (50.0, 50.0) rgba = ($online_light_blue) just = [center center] z = 3
	displaysprite id = 0xe55a5eb7 parent = online_main_menu_text_container tex = character_hub_hilite_bookend pos = (($highlight_pos [0]) + (213.0, 18.0)) dims = (50.0, 50.0) rgba = ($online_light_blue) just = [center center] z = 3
	displaysprite id = motd_top parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaysprite id = motd_top_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaysprite id = motd_body parent = online_info_pane_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_body_fill parent = online_info_pane_container tex = window_fill_body_large rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_end parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaysprite id = motd_end_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaysprite id = info_divide parent = online_info_pane_text_container tex = char_select_frame_bg rgba = ($online_light_blue) pos = (($online_info_pane_pos) + (-5.0, 240.0)) dims = (320.0, 56.0) just = [center center] z = 6
	createscreenelement {
		type = textelement
		parent = online_main_menu_text_container
		id = online_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		pos = (($online_main_menu_pos) + (0.0, 35.0))
		text = <menu_title>
		just = [center top]
		z_priority = 4.0
	}
	menu_item_count = 0
	if isxenon
		createscreenelement {
			type = textelement
			parent = online_main_vmenu
			id = 0x1f54bdf5
			font = text_a4
			scale = 0.75
			rgba = ($online_light_blue)
			text = "Quick Match: Player Match"
			just = [left top]
			z_priority = 4.0
			event_handlers = [
				{focus 0x13df99da params = {this_id = 0x1f54bdf5 text_id = 0}}
				{unfocus retail_menu_unfocus}
				{pad_choose online_menu_select_quickmatch_player}
			]
		}
	else
		createscreenelement {
			type = textelement
			parent = online_main_vmenu
			id = 0x1f54bdf5
			font = text_a4
			scale = 0.75
			rgba = ($online_light_blue)
			text = "Quick Match"
			just = [left top]
			z_priority = 4.0
			event_handlers = [
				{focus 0x13df99da params = {this_id = 0x1f54bdf5 text_id = 0}}
				{unfocus retail_menu_unfocus}
				{pad_choose online_menu_select_quickmatch_player}
			]
		}
	endif
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	if isxenon
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			id = 0x19190a56
			font = text_a4
			scale = 0.75
			rgba = [180 230 250 250]
			text = "Quick Match: Ranked Match"
			just = [left top]
			z_priority = 4.0
			event_handlers = [
				{focus 0x13df99da params = {this_id = 0x19190a56 text_id = 1}}
				{unfocus retail_menu_unfocus}
				{pad_choose online_menu_select_quickmatch_ranked}
			]
		}
		<id> :settags menu_item = <menu_item_count>
		<menu_item_count> = (<menu_item_count> + 1)
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = custom_match
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "Custom Match"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = custom_match text_id = 2}}
			{unfocus retail_menu_unfocus}
			{pad_choose 0xaa357a81}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = create_match
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "Create Match"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = create_match text_id = 3}}
			{unfocus retail_menu_unfocus}
			{pad_choose 0x5dd7fa89}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = player_options
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "Player Options"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = player_options text_id = 4}}
			{unfocus retail_menu_unfocus}
			{pad_choose online_menu_select_options}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = leaderboards
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "Leaderboards"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = leaderboards text_id = 5}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_leaderboards}}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	if isxenon
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			id = 0x91814f8e
			font = text_a4
			scale = 0.75
			rgba = [180 230 250 250]
			text = "Downloadable Content"
			just = [left top]
			z_priority = 4.0
			event_handlers = [
				{focus 0x13df99da params = {this_id = 0x91814f8e text_id = 6}}
				{unfocus retail_menu_unfocus}
				{pad_choose online_select_downloads}
			]
		}
		<id> :settags menu_item = <menu_item_count>
		<menu_item_count> = (<menu_item_count> + 1)
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = 0x0d516bfb
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "www.guitarhero.com"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = 0x0d516bfb text_id = 7}}
			{unfocus retail_menu_unfocus}
			{pad_choose online_menu_select_website}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = motd
		font = text_a4
		scale = 0.75
		rgba = [180 230 250 250]
		text = "Message Of The Day"
		just = [left top]
		z_priority = 4.0
		event_handlers = [
			{focus 0x13df99da params = {this_id = motd text_id = 8}}
			{unfocus retail_menu_unfocus}
			{pad_choose online_menu_select_motd}
		]
	}
	<id> :settags menu_item = <menu_item_count>
	<menu_item_count> = (<menu_item_count> + 1)
	createscreenelement {
		type = textblockelement
		parent = online_info_pane_text_container
		id = help_info_text_block
		font = text_a5
		scale = (0.75, 0.55)
		rgba = ($online_light_blue)
		text = ($info_text [0])
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		pos = (($online_info_pane_pos) + (-4.0, 40.0))
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
		font = text_a5
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	spawnscriptnow get_motd_and_start_ticker
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = online_main_menu}
	destroy_menu_backdrop
	if screenelementexists \{id = online_main_menu_container}
		destroyscreenelement \{id = online_main_menu_container}
	endif
	if screenelementexists \{id = online_info_pane_container}
		destroyscreenelement \{id = online_info_pane_container}
	endif
	killspawnedscript \{name = scroll_motd_ticker}
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

script scroll_motd_ticker scroll_time = 20
	<end_pos> = (-1000.0, 0.0)
	<this_id> = <id>
	getscreenelementchildren id = <this_id>
	if gotparam children
		begin
		begin
		wait 2 seconds
		doscreenelementmorph id = <this_id> pos = <end_pos> time = <scroll_time>
		wait 5 seconds
		getscreenelementprops id = <this_id>
		setscreenelementprops id = <this_id> pos = <pos>
		wait 2.0 seconds
		<this_id> :domorph alpha = 0 time = 0.2
		<this_id> :setprops pos = (0.0, 0.0)
		wait 0.5 seconds
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
	enable_pause
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

script 0xaa357a81 
	ui_flow_manager_respond_to_action \{action = select_custom_match
		create_params = {
			menu_type = custom_match
		}}
endscript

script 0x5dd7fa89 
	ui_flow_manager_respond_to_action \{action = select_create_match
		create_params = {
			menu_type = create_match
		}}
endscript

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 
	printf \{"---lobby_connection_lost performing net cleanup"}
	quit_network_game
	setup_sessionfuncs
	ui_flow_manager_respond_to_action \{action = connection_lost}
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements id = online_info_pane_container time = 0.2 hide
	wait 0.1 seconds
	hide_unhide_menu_elements id = online_main_menu_text_container time = 0.2 hide
	hide_unhide_menu_elements id = online_main_vmenu time = 0.2 hide
	translate_and_scale_online_menu
	wait 0.3 seconds
	if screenelementexists id = gh_link_container
		getscreenelementchildren id = gh_link_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 1.0 time = 0.2}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	event_handlers = [
		{pad_up 0x1600ab6b}
		{pad_down 0xf2a6a9d5}
		{pad_back online_menu_unselect_website}
	]
	ghlink_vmenu :setprops event_handlers = <event_handlers>
endscript

script online_menu_unselect_website 
	if screenelementexists id = gh_link_container
		getscreenelementchildren id = gh_link_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 0.0 time = 0.2}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	wait 0.3 seconds
	destroy_menu menu_id = ghlink
	if screenelementexists id = gh_link_container
		destroyscreenelement id = gh_link_container
	endif
	translate_and_scale_online_menu revert
	hide_unhide_menu_elements id = online_main_menu_text_container time = 0.2
	hide_unhide_menu_elements id = online_main_vmenu time = 0.2
	wait 0.1 seconds
	hide_unhide_menu_elements id = online_info_pane_container time = 0.2
	wait 0.3 seconds
	launchevent type = focus target = online_main_vmenu
endscript

script create_link_text 
	event_handlers = [
		{pad_up 0x1600ab6b}
		{pad_down 0xf2a6a9d5}
	]
	new_menu scrollid = ghlink vmenuid = ghlink_vmenu use_backdrop = (0) menu_pos = (320.0, 200.0) event_handlers = <event_handlers> default_colors = 0
	createscreenelement {
		type = containerelement
		parent = root_window
		id = gh_link_container
		pos = (0.0, 0.0)
	}
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
		font = text_a5
		scale = (0.75, 0.55)
		rgba = ($online_light_blue)
		text = "Ready to Be A Guitar Hero? \\nHere's how to link your stats to the \\nGuitarHero.com web community:"
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		pos = (640.0, 170.0)
		dims = (950.0, 200.0)
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a5
		scale = (0.75, 0.55)
		rgba = ($online_light_blue)
		text = "- Go to www.guitarhero.com\\n- Create a New Account (or login if you have already registered)\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		pos = (640.0, 260.0)
		dims = (1010.0, 600.0)
	}
	netsessionfunc func = get_agora_token
	formattext textname = vip_code "%a" a = <token>
	createscreenelement {
		type = textelement
		parent = gh_link_container
		font = text_a4
		scale = 1.25
		rgba = ($online_light_blue)
		text = <vip_code>
		just = [center top]
		z_priority = 6.0
		pos = (640.0, 370.0)
	}
	createscreenelement {
		type = textblockelement
		parent = gh_link_container
		font = text_a5
		scale = (0.75, 0.55)
		rgba = ($online_light_blue)
		text = "Your web account will now be linked to your in-game stats! On the web you can personalize your profile, browse the game's leaderboards, jam with an online band, collect groupies, and participate in tournaments!\\nBe A Guitar Hero, and join the online community!"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		pos = (648.0, 445.0)
		dims = (1010.0, 600.0)
	}
	if screenelementexists id = gh_link_container
		getscreenelementchildren id = gh_link_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 0.0}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	launchevent type = unfocus target = online_main_vmenu
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements id = online_main_menu_container time = 0.2 hide
	hide_unhide_menu_elements id = online_main_vmenu time = 0.2 hide
	wait 0.1 seconds
	hide_unhide_menu_elements id = online_info_pane_text_container time = 0.2 hide
	translate_and_scale_info_pane
	wait 0.3 seconds
	if screenelementexists id = motd_container
		getscreenelementchildren id = motd_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 1.0 time = 0.2}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	event_handlers = [
		{pad_up 0x1600ab6b}
		{pad_down 0xf2a6a9d5}
		{pad_back online_menu_unselect_motd}
	]
	motd_vmenu :setprops event_handlers = <event_handlers>
endscript

script online_menu_unselect_motd 
	if screenelementexists id = motd_container
		getscreenelementchildren id = motd_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 0.0 time = 0.2}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	wait 0.3 seconds
	destroy_menu menu_id = motd_scroller
	killspawnedscript name = scroll_motd_info
	if screenelementexists id = motd_container
		destroyscreenelement id = motd_container
	endif
	translate_and_scale_info_pane revert
	hide_unhide_menu_elements id = online_info_pane_text_container time = 0.2
	wait 0.1 seconds
	hide_unhide_menu_elements id = online_main_vmenu time = 0.2
	hide_unhide_menu_elements id = online_main_menu_container time = 0.2
	wait 0.3 seconds
	launchevent type = focus target = online_main_vmenu
endscript

script create_motd_text 
	event_handlers = [
		{pad_up 0x1600ab6b}
		{pad_down 0xf2a6a9d5}
	]
	new_menu scrollid = motd_scroller vmenuid = motd_vmenu use_backdrop = (0) menu_pos = (640.0, 0.0) event_handlers = <event_handlers> default_colors = 0
	createscreenelement {
		type = containerelement
		parent = root_window
		id = motd_container
		pos = (0.0, 0.0)
	}
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
	createscreenelement {
		type = windowelement
		parent = motd_container
		id = motd_info_scroll_window
		pos = (633.0, 220.0)
		dims = (500.0, 300.0)
		just = [center top]
	}
	createscreenelement {
		type = textblockelement
		parent = motd_info_scroll_window
		id = motd_info_text_block
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		scale = (0.75, 0.55)
		text = ($message_of_the_day)
		font = text_a5
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	spawnscriptnow scroll_motd_info params = {id = motd_info_text_block}
	if screenelementexists id = motd_container
		getscreenelementchildren id = motd_container
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 0.0}
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
	launchevent type = unfocus target = online_main_vmenu
endscript

script scroll_motd_info scroll_time = 60
	<end_pos> = (0.0, -1000.0)
	<this_id> = <id>
	getscreenelementchildren id = <this_id>
	if gotparam children
		getarraysize (<children>)
		<line_nums> = <array_size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		wait 5 seconds
		doscreenelementmorph id = <this_id> pos = <end_pos> time = <scroll_time>
		wait ((<line_nums> - 10) * 1.8) seconds
		getscreenelementprops id = <this_id>
		setscreenelementprops id = <this_id> pos = <pos>
		wait 4.0 seconds
		<this_id> :domorph alpha = 0 time = 0.2
		<this_id> :setprops pos = (0.0, 0.0)
		wait 0.5 seconds
		<this_id> :domorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script 0x1600ab6b 
	printf \{"---  mod_scroll_up"}
endscript

script 0xf2a6a9d5 
	printf \{"--- mod_scroll_down"}
endscript

script translate_and_scale_online_menu 
	if NOT gotparam revert
		runscriptonscreenelement id = online_frame doscreenelementmorph params = {id = online_frame pos = (($online_main_menu_pos) + (180.0, -35.0)) time = 0.2}
		runscriptonscreenelement id = online_frame_crown doscreenelementmorph params = {id = online_frame_crown pos = (($online_main_menu_pos) + (180.0, -88.0)) time = 0.2}
		runscriptonscreenelement id = online_frame scale_element_to_size params = {id = online_frame target_width = 680 target_height = 500 time = 0.2}
	else
		runscriptonscreenelement id = online_frame doscreenelementmorph params = {id = online_frame pos = ($online_main_menu_pos) time = 0.2}
		runscriptonscreenelement id = online_frame_crown doscreenelementmorph params = {id = online_frame_crown pos = (($online_main_menu_pos) + (0.0, -53.0)) time = 0.2}
		runscriptonscreenelement id = online_frame scale_element_to_size params = {id = online_frame target_width = 680 target_height = 500 time = 0.2}
	endif
endscript

script translate_and_scale_info_pane 
	if NOT gotparam revert
		runscriptonscreenelement id = motd_top doscreenelementmorph params = {id = motd_top pos = (($online_info_pane_pos) + (-210.0, -32.0)) time = 0.2}
		runscriptonscreenelement id = motd_top_fill doscreenelementmorph params = {id = motd_top_fill pos = (($online_info_pane_pos) + (-210.0, -32.0)) time = 0.2}
		runscriptonscreenelement id = motd_body doscreenelementmorph params = {id = motd_body pos = (($online_info_pane_pos) + (-210.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_body_fill doscreenelementmorph params = {id = motd_body_fill pos = (($online_info_pane_pos) + (-210.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_end doscreenelementmorph params = {id = motd_end pos = (($online_info_pane_pos) + (-210.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_end_fill doscreenelementmorph params = {id = motd_end_fill pos = (($online_info_pane_pos) + (-210.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_top scale_element_to_size params = {id = motd_top target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_top_fill scale_element_to_size params = {id = motd_top_fill target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_body scale_element_to_size params = {id = motd_body target_width = 800 target_height = 256 time = 0.2}
		runscriptonscreenelement id = motd_body_fill scale_element_to_size params = {id = motd_body_fill target_width = 800 target_height = 256 time = 0.2}
		runscriptonscreenelement id = motd_end scale_element_to_size params = {id = motd_end target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_end_fill scale_element_to_size params = {id = motd_end_fill target_width = 800 target_height = 96 time = 0.2}
	else
		runscriptonscreenelement id = motd_top doscreenelementmorph params = {id = motd_top pos = ($online_info_pane_pos) time = 0.2}
		runscriptonscreenelement id = motd_top_fill doscreenelementmorph params = {id = motd_top_fill pos = ($online_info_pane_pos) time = 0.2}
		runscriptonscreenelement id = motd_body doscreenelementmorph params = {id = motd_body pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_body_fill doscreenelementmorph params = {id = motd_body_fill pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		runscriptonscreenelement id = motd_end doscreenelementmorph params = {id = motd_end pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_end_fill doscreenelementmorph params = {id = motd_end_fill pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		runscriptonscreenelement id = motd_top scale_element_to_size params = {id = motd_top target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_top_fill scale_element_to_size params = {id = motd_top_fill target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_body scale_element_to_size params = {id = motd_body target_width = 800 target_height = 256 time = 0.2}
		runscriptonscreenelement id = motd_body_fill scale_element_to_size params = {id = motd_body_fill target_width = 800 target_height = 256 time = 0.2}
		runscriptonscreenelement id = motd_end scale_element_to_size params = {id = motd_end target_width = 800 target_height = 96 time = 0.2}
		runscriptonscreenelement id = motd_end_fill scale_element_to_size params = {id = motd_end_fill target_width = 800 target_height = 96 time = 0.2}
	endif
endscript

script hide_unhide_menu_elements {time = 0.0}
	if screenelementexists id = <id>
		getscreenelementchildren id = <id>
		if gotparam children
			getarraysize children
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				if gotparam hide
					runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 0.0 time = <time>}
				else
					runscriptonscreenelement id = (<children> [<i>]) doscreenelementmorph params = {id = (<children> [<i>]) alpha = 1.0 time = <time>}
				endif
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
endscript

script create_net_play_song_menu 
	ui_print_gamertags \{pos1 = (320.0, 50.0)
		pos2 = (960.0, 50.0)
		dims = (350.0, 25.0)
		just1 = [
			center
			top
		]
		just2 = [
			center
			top
		]
		offscreen = 1}
endscript

script destroy_net_play_song_menu 
	destroy_gamertags
endscript

script 0x13df99da 
	retail_menu_focus
	if screenelementexists id = <this_id>
		<this_id> :gettags
		highlight :setprops pos = ($highlight_pos [<menu_item>])
		0x7c530f0d :setprops pos = (($highlight_pos [<menu_item>]) + (-200.0, 18.0))
		0xe55a5eb7 :setprops pos = (($highlight_pos [<menu_item>]) + (213.0, 18.0))
	endif
	if screenelementexists \{id = help_info_text_block}
		help_info_text_block :setprops text = ($info_text [<text_id>])
	endif
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
