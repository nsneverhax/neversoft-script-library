info_text = [
	qs(0x327fe39a)
	qs(0x89eb6a6e)
	qs(0x3ea1cc61)
	qs(0xc56ef667)
	qs(0xd9d0f5b3)
	qs(0xf6fa560c)
	qs(0x4db9ca18)
	qs(0xfb4953fc)
	qs(0x814a1933)
	qs(0x3e5871b9)
	qs(0x2b5e9a84)
	qs(0x99c45bca)
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (890.0, 150.0)
0x9ace592a = qs(0x6043e467)

script 0xc037781a \{motd = qs(0x6043e467)}
	if GotParam \{motd}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd>
		if ScreenElementExists \{id = motd_ticker_text_block}
			motd_ticker_text_block :SetProps text = ($message_of_the_day)
			SpawnScriptNow \{scroll_motd_ticker
				params = {
					id = motd_ticker_text_block
				}}
		endif
	endif
endscript

script 0xbf0960b6 
	SetButtonEventMappings \{block_menu_input}
	Wait \{0.5
		Seconds}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script create_online_main_menu \{menu_title_xenon = qs(0xfbe1a4b2)
		menu_title_ps3 = qs(0x918b1e04)
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu}
	set_home_button_notallowed
	Change \{select_diff_to_char_render_stall = 1}
	Change \{rich_presence_context = presence_main_menu}
	spawnscript \{0xbf0960b6}
	SpawnScriptNow \{menu_music_on
		params = {
			setflag = 1
		}}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = main_menu_anchor
		Pos = (0.0, 0.0)}
	Change \{0x2a11eea8 = 0}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = main_menu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos) + (0.0, 68.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (47.5, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{focus 0xc5b068de}
		]
		exclusive_device = ($primary_controller)
	}
	CreateScreenElement \{Type = ContainerElement
		parent = main_menu_anchor
		id = online_main_menu_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = online_main_menu_container
		id = online_main_menu_text_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = main_menu_anchor
		id = online_info_pane_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = online_info_pane_container
		id = online_info_pane_text_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = xb_online_bg}
	displaySprite id = online_frame parent = online_main_menu_container tex = xb_online_frame_large Pos = ($online_main_menu_pos) dims = (660.0, 480.0) just = [center top] z = 2
	displaySprite id = xb_online_frame_crown parent = online_main_menu_container tex = xb_online_frame_crown Pos = (($online_main_menu_pos) + (0.0, -62.0)) dims = (256.0, 105.0) just = [center top] z = 3
	if isXenon
		CreateScreenElement {
			Type = TextElement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_a1
			Scale = 0.85
			rgba = ($online_dark_purple)
			Pos = (($online_main_menu_pos) + (0.0, 35.0))
			text = <menu_title_xenon>
			just = [center top]
			z_priority = 4.0
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_a1
			Scale = 0.85
			rgba = ($online_dark_purple)
			Pos = (($online_main_menu_pos) + (0.0, 35.0))
			text = <menu_title_ps3>
			just = [center top]
			z_priority = 4.0
		}
	endif
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps {
			id = <id>
			Scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xfa706a51)
		info_text_index = 0
		pad_choose_script = online_menu_select_automatch_player
	}
	if isXenon
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = qs(0x8fd1b039)
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = qs(0x6db89d96)
			info_text_index = 1
			pad_choose_script = online_menu_select_quickmatch_ranked
		}
	else
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = qs(0x709b942a)
			info_text_index = 0
			pad_choose_script = 0xfdb5fa79
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xd7442bec)
		info_text_index = 1
		pad_choose_script = 0xaa357a81
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0x938415b6)
		info_text_index = 2
		pad_choose_script = 0x5dd7fa89
	}
	if 0x1eb59f96
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = qs(0x28d033df)
			info_text_index = 4
			pad_choose_script = ui_flow_manager_respond_to_action
			choose_script_params = {action = select_leaderboards}
		}
	endif
	if isXenon
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = qs(0x60679f40)
			info_text_index = 6
			pad_choose_script = online_select_downloads
			pad_choose_script2 = SoundEvent
			choose_script_params2 = {event = ui_sfx_select}
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0x0d8a6066)
		info_text_index = 6
		pad_choose_script = online_menu_select_website
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xb7dbccb4)
		info_text_index = 7
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xff4f1006)
		info_text_index = 8
		pad_choose_script = launch_friends_list
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xb3d26fa1)
		info_text_index = 9
		pad_choose_script = 0xa128b07d
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0x53703fa2)
		info_text_index = 10
		pad_choose_script = 0x20835f4f
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0x92fadeaa)
		info_text_index = 8
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_matchmaking}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = qs(0xe7f553d2)
		info_text_index = 8
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_at}
	}
	displaySprite id = 0x206e0d11 parent = online_info_pane_text_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_info_pane_pos) + (0.0, 400.0)) dims = (360.0, 25.0) just = [center top] z = 5
	displaySprite id = 0x1663add5 parent = online_info_pane_text_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_info_pane_pos) + (0.0, 400.0)) dims = (360.0, 25.0) just = [center top] z = 5
	displaySprite id = 0x18955871 parent = online_info_pane_text_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (($online_info_pane_pos) + (0.0, 425.0)) dims = (360.0, 25.0) just = [center top] z = 5 flip_h
	displaySprite id = 0xdd8c05c2 parent = online_info_pane_text_container tex = window_fill_body_large rgba = [0 0 0 200] Pos = (($online_info_pane_pos) + (0.0, 425.0)) dims = (360.0, 25.0) just = [center top] z = 5 flip_h
	displaySprite id = 0x3e4b216a parent = online_info_pane_text_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_info_pane_pos) + (0.0, 450.0)) dims = (360.0, 25.0) just = [center top] z = 5 flip_h
	displaySprite id = 0x9842d759 parent = online_info_pane_text_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_info_pane_pos) + (0.0, 450.0)) dims = (360.0, 25.0) just = [center top] z = 5 flip_h
	getactiveprofilename
	CreateScreenElement {
		Type = TextElement
		parent = online_info_pane_text_container
		id = 0x209053c0
		font = text_a4
		text = <profile_name>
		Scale = 0.6
		rgba = ($online_light_blue)
		Pos = (($online_info_pane_pos) + (0.0, 425.0))
		just = [center top]
		z_priority = 6.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = online_info_pane_text_container
		id = help_info_text_block
		font = fontgrid_text_a8
		Scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = ($info_text [0])
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		Pos = (($online_info_pane_pos) + (-4.0, 20.0))
		dims = (320.0, 370.0)
	}
	CreateScreenElement {
		Type = TextElement
		parent = online_info_pane_text_container
		id = motd_info_pane_title
		font = fontgrid_text_a8
		text = qs(0x6043e467)
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Pos = (($online_info_pane_pos) + (0.0, 264.0))
		just = [center top]
		z_priority = 6.0
	}
	CreateScreenElement {
		Type = WindowElement
		parent = online_info_pane_text_container
		id = motd_ticker_window
		Pos = (($online_info_pane_pos) + (0.0, 312.0))
		dims = (248.0, 32.0)
		just = [center top]
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = motd_ticker_window
		id = motd_ticker_text_block
		just = [left top]
		internal_just = [left top]
		Pos = (0.0, 0.0)
		Scale = (0.75, 0.55)
		text = qs(0x00000000)
		font = fontgrid_text_a8
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	SpawnScriptNow \{get_motd_and_start_ticker}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = main_menu_anchor}
		DestroyScreenElement \{id = main_menu_anchor}
	endif
	KillSpawnedScript \{Name = scroll_motd_ticker}
endscript

script create_online_main_menu_helper_buttons 
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script get_motd_and_start_ticker 
	if ($retrieved_message_of_the_day = 0)
		NetSessionFunc \{Obj = motd
			func = get_demonware_motd
			params = {
				callback = motd_callback
			}}
	else
		motd_ticker_text_block :se_setprops text = ($message_of_the_day)
		SpawnScriptNow \{scroll_motd_ticker
			params = {
				id = motd_ticker_text_block
			}}
	endif
endscript

script motd_callback 
	if GotParam \{motd_text}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd_text>
		if ScreenElementExists \{id = motd_ticker_text_block}
			motd_ticker_text_block :se_setprops text = ($message_of_the_day)
			SpawnScriptNow \{scroll_motd_ticker
				params = {
					id = motd_ticker_text_block
				}}
		endif
	endif
endscript

script scroll_motd_ticker \{scroll_time = 20}
	<end_pos> = (-1000.0, 0.0)
	<this_ID> = <id>
	GetScreenElementChildren id = <this_ID>
	if GotParam \{children}
		begin
		begin
		Wait \{2
			Seconds}
		legacydoscreenelementmorph id = <this_ID> Pos = <end_pos> time = <scroll_time>
		Wait \{5
			Seconds}
		GetScreenElementProps id = <this_ID>
		SetScreenElementProps id = <this_ID> Pos = <Pos>
		Wait \{2.0
			Seconds}
		<this_ID> :legacydomorph alpha = 0 time = 0.2
		<this_ID> :se_setprops Pos = (0.0, 0.0)
		Wait \{0.5
			Seconds}
		<this_ID> :legacydomorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script return_from_online_main_menu 
	printf \{qs(0x6de09062)}
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script online_menu_select_quickmatch_player 
	Change \{match_type = Player}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_player}
endscript

script online_menu_select_quickmatch_ranked 
	Change \{match_type = Ranked}
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

script 0xfdb5fa79 
	get_custom_match_search_params
	0x324d7178 <...> 0x0cb4e4f6 = 1
	if (<join_result> = 1)
		Change \{match_type = Player}
		ui_flow_manager_respond_to_action \{action = 0x81029e0b}
	endif
endscript

script 0x58a4045a 
	destroy_generic_popup
	get_custom_match_search_params
	0x324d7178 <...> 0x0cb4e4f6 = 0
	if (<join_result> = 1)
		ui_flow_manager_respond_to_action \{action = 0x81029e0b}
	endif
endscript

script 0x20835f4f 
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = 0x29f0bbbd}
endscript

script lobby_connection_lost 
	printf \{qs(0xb0c233b5)}
	EndGameNetScriptPump
	if NOT (IsHost)
		quit_network_game
		setup_sessionfuncs
		destroy_net_popup
		generic_event_back \{state = uistate_online}
	endif
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements \{id = online_info_pane_container
		time = 0.2
		Hide}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{id = online_main_menu_text_container
		time = 0.2
		Hide}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2
		Hide}
	translate_and_scale_online_menu
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container
			legacydoscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	ghlink_vmenu :se_setprops \{enable_pad_handling}
	LaunchEvent \{Type = focus
		target = ghlink_vmenu}
	if isngc
		if NOT 0x1eb59f96
			create_generic_popup \{title = qs(0x79597197)
				ok_menu
				message = qs(0xb02310e3)
				ok_eventhandlers = [
					{
						focus
						popup_menu_focus
					}
					{
						unfocus
						popup_menu_unfocus
					}
					{
						pad_choose
						0x0258d4a0
					}
				]}
		endif
	endif
endscript

script 0x0258d4a0 
	destroy_generic_popup
	online_menu_unselect_website
endscript

script online_menu_unselect_website 
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container
			legacydoscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 0.0
				time = 0.2
			}}
	endif
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{id = gh_link_container}
		DestroyScreenElement \{id = gh_link_container}
	endif
	translate_and_scale_online_menu \{revert}
	hide_unhide_menu_elements \{id = online_main_menu_text_container
		time = 0.2}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{id = online_info_pane_container
		time = 0.2}
	Wait \{0.3
		Seconds}
	LaunchEvent \{Type = focus
		target = online_main_vmenu}
endscript

script create_link_text 
	CreateScreenElement \{Type = ContainerElement
		parent = online_main_menu_container
		id = gh_link_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = gh_link_container
		id = ghlink
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		Pos = (320.0, 200.0)
		z_priority = 1}
	CreateScreenElement {
		Type = VMenu
		parent = ghlink
		id = ghlink_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent params = {event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_website}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :se_setprops disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		parent = gh_link_container
		id = gh_link_title
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0x0d8a6066)
		just = [center top]
		Pos = (640.0, 111.0)
		z_priority = 4.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = gh_link_container
		font = fontgrid_text_a8
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = qs(0xe6d25a85)
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		Pos = (640.0, 160.0)
		dims = (950.0, 200.0)
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = gh_link_container
		font = fontgrid_text_a8
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = qs(0x96e1c5ce)
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (640.0, 240.0)
		dims = (1010.0, 600.0)
	}
	NetSessionFunc \{func = get_agora_token}
	formatText TextName = vip_code qs(0x0bc409e2) a = <Token>
	CreateScreenElement {
		Type = TextElement
		parent = gh_link_container
		font = fontgrid_text_a3
		Scale = 1.25
		rgba = ($online_light_blue)
		text = <vip_code>
		just = [center top]
		z_priority = 6.0
		Pos = (640.0, 410.0)
		font_spacing = 5
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = gh_link_container
		font = fontgrid_text_a8
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = qs(0xd23ba7b8)
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (648.0, 460.0)
		dims = (1010.0, 600.0)
	}
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container
			legacydoscreenelementmorph
			params = {
				id = gh_link_container
				alpha = 0.0
			}}
	endif
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
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
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = unfocus
		target = online_main_vmenu}
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements \{id = online_main_menu_container
		time = 0.2
		Hide}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2
		Hide}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{id = online_info_pane_text_container
		time = 0.2
		Hide}
	translate_and_scale_info_pane
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{id = motd_container}
		RunScriptOnScreenElement \{id = motd_container
			legacydoscreenelementmorph
			params = {
				id = motd_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	LaunchEvent \{Type = focus
		target = motd_vmenu}
	motd_vmenu :se_setprops \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if ScreenElementExists \{id = motd_container}
		RunScriptOnScreenElement \{id = motd_container
			legacydoscreenelementmorph
			params = {
				id = motd_container
				alpha = 0.0
				time = 0.2
			}}
	endif
	Wait \{0.3
		Seconds}
	destroy_menu \{menu_id = motd_scroller}
	if ScreenElementExists \{id = motd_container}
		DestroyScreenElement \{id = motd_container}
	endif
	translate_and_scale_info_pane \{revert}
	hide_unhide_menu_elements \{id = online_info_pane_text_container
		time = 0.2}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{id = online_main_vmenu
		time = 0.2}
	hide_unhide_menu_elements \{id = online_main_menu_container
		time = 0.2}
	Wait \{0.3
		Seconds}
	LaunchEvent \{Type = focus
		target = online_main_vmenu}
endscript

script create_motd_text 
	CreateScreenElement \{Type = ContainerElement
		parent = online_info_pane_container
		id = motd_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		parent = motd_container
		id = motd_scroller
		just = [
			center
			top
		]
		dims = (400.0, 480.0)
		Pos = (640.0, 0.0)
		z_priority = 1}
	CreateScreenElement {
		Type = VMenu
		parent = motd_scroller
		id = motd_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent params = {event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_motd}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :se_setprops disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		parent = motd_container
		id = gh_link_title
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($online_light_blue)
		text = qs(0xb7dbccb4)
		just = [center top]
		Pos = (640.0, 160.0)
		z_priority = 10.0
	}
	CreateScreenElement \{Type = WindowElement
		parent = motd_container
		id = motd_info_scroll_window
		Pos = (633.0, 220.0)
		dims = (500.0, 300.0)
		just = [
			center
			top
		]}
	CreateScreenElement {
		Type = TextBlockElement
		parent = motd_info_scroll_window
		id = motd_info_text_block
		just = [left top]
		internal_just = [left top]
		Pos = (0.0, 0.0)
		Scale = (0.75, 0.55)
		text = ($message_of_the_day)
		font = fontgrid_text_a8
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	SpawnScriptNow \{scroll_motd_info
		params = {
			id = motd_info_text_block
		}}
	if ScreenElementExists \{id = motd_container}
		motd_container :se_setprops \{alpha = 0.0}
	endif
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
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
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = unfocus
		target = online_main_vmenu}
endscript

script scroll_motd_info \{scroll_time = 60}
	<end_pos> = (0.0, -1000.0)
	<this_ID> = <id>
	GetScreenElementChildren id = <this_ID>
	if GotParam \{children}
		GetArraySize (<children>)
		<line_nums> = <array_Size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		Wait \{5
			Seconds}
		legacydoscreenelementmorph id = <this_ID> Pos = <end_pos> time = <scroll_time>
		Wait ((<line_nums> - 10) * 1.8) Seconds
		GetScreenElementProps id = <this_ID>
		SetScreenElementProps id = <this_ID> Pos = <Pos>
		Wait \{4.0
			Seconds}
		<this_ID> :legacydomorph alpha = 0 time = 0.2
		<this_ID> :se_setprops Pos = (0.0, 0.0)
		Wait \{0.5
			Seconds}
		<this_ID> :legacydomorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	if NOT GotParam \{revert}
		RunScriptOnScreenElement id = online_frame legacydoscreenelementmorph params = {id = online_frame Pos = (($online_main_menu_pos) + (170.0, -35.0)) time = 0.2}
		RunScriptOnScreenElement id = xb_online_frame_crown legacydoscreenelementmorph params = {id = xb_online_frame_crown Pos = (($online_main_menu_pos) + (180.0, -88.0)) time = 0.2}
		RunScriptOnScreenElement \{id = online_frame
			scale_element_to_size
			params = {
				id = online_frame
				target_width = 760
				target_height = 500
				time = 0.2
			}}
	else
		RunScriptOnScreenElement id = online_frame legacydoscreenelementmorph params = {id = online_frame Pos = ($online_main_menu_pos) time = 0.2}
		RunScriptOnScreenElement id = xb_online_frame_crown legacydoscreenelementmorph params = {id = xb_online_frame_crown Pos = (($online_main_menu_pos) + (0.0, -62.0)) time = 0.2}
		online_frame :se_setprops \{Scale = 1.0}
		RunScriptOnScreenElement \{id = online_frame
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
	if NOT GotParam \{revert}
		RunScriptOnScreenElement id = motd_top legacydoscreenelementmorph params = {id = motd_top Pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_top_fill legacydoscreenelementmorph params = {id = motd_top_fill Pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body legacydoscreenelementmorph params = {id = motd_body Pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body_fill legacydoscreenelementmorph params = {id = motd_body_fill Pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end legacydoscreenelementmorph params = {id = motd_end Pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end_fill legacydoscreenelementmorph params = {id = motd_end_fill Pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement \{id = motd_top
			scale_element_to_size
			params = {
				id = motd_top
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_top_fill
			scale_element_to_size
			params = {
				id = motd_top_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_body
			scale_element_to_size
			params = {
				id = motd_body
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_body_fill
			scale_element_to_size
			params = {
				id = motd_body_fill
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_end
			scale_element_to_size
			params = {
				id = motd_end
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_end_fill
			scale_element_to_size
			params = {
				id = motd_end_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
	else
		RunScriptOnScreenElement id = motd_top legacydoscreenelementmorph params = {id = motd_top Pos = ($online_info_pane_pos) time = 0.2}
		RunScriptOnScreenElement id = motd_top_fill legacydoscreenelementmorph params = {id = motd_top_fill Pos = ($online_info_pane_pos) time = 0.2}
		RunScriptOnScreenElement id = motd_body legacydoscreenelementmorph params = {id = motd_body Pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body_fill legacydoscreenelementmorph params = {id = motd_body_fill Pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end legacydoscreenelementmorph params = {id = motd_end Pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end_fill legacydoscreenelementmorph params = {id = motd_end_fill Pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement \{id = motd_top
			scale_element_to_size
			params = {
				id = motd_top
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_top_fill
			scale_element_to_size
			params = {
				id = motd_top_fill
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_body
			scale_element_to_size
			params = {
				id = motd_body
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_body_fill
			scale_element_to_size
			params = {
				id = motd_body_fill
				target_width = 800
				target_height = 256
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_end
			scale_element_to_size
			params = {
				id = motd_end
				target_width = 800
				target_height = 96
				time = 0.2
			}}
		RunScriptOnScreenElement \{id = motd_end_fill
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
	if ScreenElementExists id = <id>
		if GotParam \{Hide}
			RunScriptOnScreenElement id = <id> legacydoscreenelementmorph params = {alpha = 0.0 time = <time> id = <id>}
		else
			RunScriptOnScreenElement id = <id> legacydoscreenelementmorph params = {alpha = 1.0 time = <time> id = <id>}
		endif
	endif
endscript
select_diff_to_char_render_stall = 0
0x90ccc64a = 0
0xfc677337 = 1
0xee7aa386 = 1
0x5061d9ed = 1

script create_net_play_song_menu 
	show_highway
	Change \{select_diff_to_char_render_stall = 1}
	Change \{0x90ccc64a = 1}
	Change \{0xfc677337 = 1}
	Change \{0xee7aa386 = 1}
	Change \{0x5061d9ed = 1}
endscript

script destroy_net_play_song_menu 
	hide_highway
	if ScreenElementExists \{id = notify_controller_static_text_container}
		sysnotify_handle_unpause_controller
	endif
endscript

script online_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	destroy_band
	Downloads_UnloadContent
	ui_flow_manager_respond_to_action \{action = select_downloadable_content}
endscript

script net_add_item_to_main_menu 
	if isXenon
		line_spacing = 40
	else
		line_spacing = 40
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <VMenu>
		dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = [
			{focus net_main_menu_focus}
			{focus SetScreenElementProps params = {id = help_info_text_block text = ($info_text [<info_text_index>])}}
			{unfocus net_main_menu_unfocus}
		]
	}
	menu_item_container = <id>
	if GotParam \{pad_choose_script}
		if GotParam \{choose_script_params}
			<menu_item_container> :se_setprops event_handlers = [{pad_choose <pad_choose_script> params = {<choose_script_params>}}]
		else
			<menu_item_container> :se_setprops event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if GotParam \{pad_choose_script2}
		if GotParam \{choose_script_params2}
			<menu_item_container> :se_setprops event_handlers = [{pad_choose <pad_choose_script2> params = {<choose_script_params2>}}]
		else
			<menu_item_container> :se_setprops event_handlers = [{pad_choose <pad_choose_script2>}]
		endif
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_item_container>
		local_id = highlightbar
		texture = white
		dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (0.0, 7.5)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		Pos = (-227.0, 3.0)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		Pos = (240.0, 3.0)
		just = [center top]
		z_priority = 3
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextElement
		parent = <menu_item_container>
		local_id = text
		font = fontgrid_text_a8
		Scale = 0.75
		rgba = ($online_light_blue)
		text = <text>
		Pos = (0.0, 10.0)
		just = [center top]
		z_priority = 4.0
	}
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps {
			id = <id>
			Scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	if (<text> = qs(0x6db89d96))
		GetGlobalTags \{user_options}
		if (<online_game_mode> = 4)
			SetScreenElementProps {
				id = <menu_item_container>
				not_focusable
			}
			SetScreenElementProps {
				id = {<menu_item_container> child = text}
				rgba = ($online_grey)
			}
		endif
	endif
endscript

script net_main_menu_focus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = highlightbar}
		SetScreenElementProps {
			id = {<objID> child = highlightbar}
			alpha = 1.0
		}
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		SetScreenElementProps {
			id = {<objID> child = left_bookend}
			alpha = 1.0
		}
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		SetScreenElementProps {
			id = {<objID> child = right_bookend}
			alpha = 1.0
		}
	endif
	if ScreenElementExists id = {<objID> child = text}
		SetScreenElementProps {
			id = {<objID> child = text}
			rgba = ($online_dark_purple)
		}
	endif
endscript

script net_main_menu_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = highlightbar}
		SetScreenElementProps {
			id = {<objID> child = highlightbar}
			alpha = 0.0
		}
	endif
	if ScreenElementExists id = {<objID> child = left_bookend}
		SetScreenElementProps {
			id = {<objID> child = left_bookend}
			alpha = 0.0
		}
	endif
	if ScreenElementExists id = {<objID> child = right_bookend}
		SetScreenElementProps {
			id = {<objID> child = right_bookend}
			alpha = 0.0
		}
	endif
	if ScreenElementExists id = {<objID> child = text}
		SetScreenElementProps {
			id = {<objID> child = text}
			rgba = ($online_light_blue)
		}
	endif
endscript

script 0xa128b07d 
	create_generic_popup \{title = qs(0x326e2d2f)
		message = qs(0xf4a4830a)
		default_blackout
		yes_no_menu
		focus_no
		back_script = destroy_generic_popup
		add_user_control_helpers
		yes_eventhandlers = [
			{
				pad_choose
				0x39c39fae
			}
		]
		no_eventhandlers = [
			{
				pad_choose
				destroy_generic_popup
			}
		]}
endscript

script 0x39c39fae 
	destroy_generic_popup
	shut_down_net_play
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = 0x29f0bbbd
		}}
	NetSessionFunc \{func = OnlineSignIn}
endscript

script 0xc5b068de 
	create_online_main_menu_helper_buttons
endscript
