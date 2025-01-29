info_text = [
	'Jump right into a Player Match and rock the house against the first rocker available.'
	'Jump right into a Ranked Match and rock the house against the first rocker available.'
	'Search for a specific type of online match.'
	'Create and host your own online match.'
	'Setup and make changes to your Quick Match Options.'
	'Check out who the best of the best are and see where you rank.'
	'Check out the newest available downloads for Guitar Hero 3.'
	'Be A Guitar Hero, and join the online community!'
	'Select \'Message Of The Day\' to see the latest news in the Guitar Hero universe.'
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (890.0, 150.0)

script create_online_main_menu \{menu_title_xenon = 'Xbox LIVE Main Menu'
		menu_title_ps3 = 'Online Main Menu'
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu}
	online_menu_init
	Change \{rich_presence_context = presence_main_menu}
	SpawnScriptNow \{menu_music_on}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = main_menu_anchor
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = main_menu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos) + (0.0, 75.0))
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
	create_menu_backdrop \{texture = Online_Background}
	displaySprite id = online_frame parent = online_main_menu_container tex = Online_Frame_Large Pos = ($online_main_menu_pos) dims = (660.0, 480.0) just = [center top] z = 2
	displaySprite id = Online_Frame_Crown parent = online_main_menu_container tex = Online_Frame_Crown Pos = (($online_main_menu_pos) + (0.0, -62.0)) dims = (256.0, 105.0) just = [center top] z = 3
	displaySprite id = motd_top parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaySprite id = motd_top_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] Pos = ($online_info_pane_pos) dims = (320.0, 64.0) just = [center top] z = 5
	displaySprite id = motd_body parent = online_info_pane_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaySprite id = motd_body_fill parent = online_info_pane_container tex = window_fill_body_large rgba = [0 0 0 200] Pos = (($online_info_pane_pos) + (0.0, 64.0)) dims = (320.0, 256.0) just = [center top] z = 5 flip_h
	displaySprite id = motd_end parent = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaySprite id = motd_end_fill parent = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_info_pane_pos) + (0.0, 320.0)) dims = (320.0, 64.0) just = [center top] z = 5 flip_h
	displaySprite id = info_divide parent = online_info_pane_text_container tex = store_frame_bottom_bg rgba = ($online_light_blue) Pos = (($online_info_pane_pos) + (-5.0, 240.0)) dims = (320.0, 56.0) just = [center center] z = 6
	if isXenon
		CreateScreenElement {
			Type = TextElement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
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
			font = fontgrid_title_gh3
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
	if isXenon
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = 'Quick Match: Player Match'
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = 'Quick Match: Ranked Match'
			info_text_index = 1
			pad_choose_script = online_menu_select_quickmatch_ranked
		}
	else
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = 'Quick Match'
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'Custom Match'
		info_text_index = 2
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_custom_match}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'Create Match'
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'Quick Match Player Options'
		info_text_index = 4
		pad_choose_script = online_menu_select_options
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'Leaderboards'
		info_text_index = 5
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	if isXenon
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			text = 'Downloadable Content'
			info_text_index = 6
			pad_choose_script = online_select_downloads
			pad_choose_script2 = SoundEvent
			choose_script_params2 = {event = ui_sfx_select}
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'www.guitarhero.com'
		info_text_index = 7
		pad_choose_script = online_menu_select_website
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = 'Message Of The Day'
		info_text_index = 8
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = online_info_pane_text_container
		id = help_info_text_block
		font = text_a4
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
		font = text_a4
		text = 'Message of the Day'
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
		text = ''
		font = text_a4
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
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
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
		motd_ticker_text_block :SetProps text = ($message_of_the_day)
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
			motd_ticker_text_block :SetProps text = ($message_of_the_day)
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
		DoScreenElementMorph id = <this_ID> Pos = <end_pos> time = <scroll_time>
		Wait \{5
			Seconds}
		GetScreenElementProps id = <this_ID>
		SetScreenElementProps id = <this_ID> Pos = <Pos>
		Wait \{2.0
			Seconds}
		<this_ID> :DoMorph alpha = 0 time = 0.2
		<this_ID> :SetProps Pos = (0.0, 0.0)
		Wait \{0.5
			Seconds}
		<this_ID> :DoMorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script return_from_online_main_menu 

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

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 

	EndGameNetScriptPump
	if NOT (IsHost)
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
			DoScreenElementMorph
			params = {
				id = gh_link_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	ghlink_vmenu :SetProps \{enable_pad_handling}
	LaunchEvent \{Type = focus
		target = ghlink_vmenu}
endscript

script online_menu_unselect_website 
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container
			DoScreenElementMorph
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
	<id> :SetProps disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		parent = gh_link_container
		id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = 'www.guitarhero.com'
		just = [center top]
		Pos = (640.0, 111.0)
		z_priority = 4.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = 'Ready to Be A Guitar Hero? \\nHere\'s how to link your stats to the web community:'
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		Pos = (640.0, 160.0)
		dims = (950.0, 200.0)
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = '- Go to www.guitarhero.com\\n- Create a New Account or Login\\n- Click \'Link Account\'\\n- Enter the following VIP Passcode'
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (640.0, 240.0)
		dims = (1010.0, 600.0)
	}
	NetSessionFunc \{func = get_agora_token}
	formatText TextName = vip_code '%a' a = <Token>
	CreateScreenElement {
		Type = TextElement
		parent = gh_link_container
		font = text_a3
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
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = 'On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!'
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (648.0, 460.0)
		dims = (1010.0, 600.0)
	}
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container
			DoScreenElementMorph
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
	add_user_control_helper \{text = 'BACK'
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
			DoScreenElementMorph
			params = {
				id = motd_container
				alpha = 1.0
				time = 0.2
			}}
	endif
	LaunchEvent \{Type = focus
		target = motd_vmenu}
	motd_vmenu :SetProps \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if ScreenElementExists \{id = motd_container}
		RunScriptOnScreenElement \{id = motd_container
			DoScreenElementMorph
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
	<id> :SetProps disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		parent = motd_container
		id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_blue)
		text = 'Message Of The Day'
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
		font = text_a4
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
		motd_container :SetProps \{alpha = 0.0}
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
	add_user_control_helper \{text = 'BACK'
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
		DoScreenElementMorph id = <this_ID> Pos = <end_pos> time = <scroll_time>
		Wait ((<line_nums> - 10) * 1.8) Seconds
		GetScreenElementProps id = <this_ID>
		SetScreenElementProps id = <this_ID> Pos = <Pos>
		Wait \{4.0
			Seconds}
		<this_ID> :DoMorph alpha = 0 time = 0.2
		<this_ID> :SetProps Pos = (0.0, 0.0)
		Wait \{0.5
			Seconds}
		<this_ID> :DoMorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	if NOT GotParam \{revert}
		RunScriptOnScreenElement id = online_frame DoScreenElementMorph params = {id = online_frame Pos = (($online_main_menu_pos) + (170.0, -35.0)) time = 0.2}
		RunScriptOnScreenElement id = Online_Frame_Crown DoScreenElementMorph params = {id = Online_Frame_Crown Pos = (($online_main_menu_pos) + (180.0, -88.0)) time = 0.2}
		RunScriptOnScreenElement \{id = online_frame
			scale_element_to_size
			params = {
				id = online_frame
				target_width = 760
				target_height = 500
				time = 0.2
			}}
	else
		RunScriptOnScreenElement id = online_frame DoScreenElementMorph params = {id = online_frame Pos = ($online_main_menu_pos) time = 0.2}
		RunScriptOnScreenElement id = Online_Frame_Crown DoScreenElementMorph params = {id = Online_Frame_Crown Pos = (($online_main_menu_pos) + (0.0, -62.0)) time = 0.2}
		online_frame :SetProps \{Scale = 1.0}
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
		RunScriptOnScreenElement id = motd_top DoScreenElementMorph params = {id = motd_top Pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_top_fill DoScreenElementMorph params = {id = motd_top_fill Pos = (($online_info_pane_pos) + (-250.0, -32.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body DoScreenElementMorph params = {id = motd_body Pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body_fill DoScreenElementMorph params = {id = motd_body_fill Pos = (($online_info_pane_pos) + (-250.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end DoScreenElementMorph params = {id = motd_end Pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end_fill DoScreenElementMorph params = {id = motd_end_fill Pos = (($online_info_pane_pos) + (-250.0, 320.0)) time = 0.2}
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
		RunScriptOnScreenElement id = motd_top DoScreenElementMorph params = {id = motd_top Pos = ($online_info_pane_pos) time = 0.2}
		RunScriptOnScreenElement id = motd_top_fill DoScreenElementMorph params = {id = motd_top_fill Pos = ($online_info_pane_pos) time = 0.2}
		RunScriptOnScreenElement id = motd_body DoScreenElementMorph params = {id = motd_body Pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_body_fill DoScreenElementMorph params = {id = motd_body_fill Pos = (($online_info_pane_pos) + (0.0, 64.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end DoScreenElementMorph params = {id = motd_end Pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
		RunScriptOnScreenElement id = motd_end_fill DoScreenElementMorph params = {id = motd_end_fill Pos = (($online_info_pane_pos) + (0.0, 320.0)) time = 0.2}
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
			RunScriptOnScreenElement id = <id> DoScreenElementMorph params = {alpha = 0.0 time = <time> id = <id>}
		else
			RunScriptOnScreenElement id = <id> DoScreenElementMorph params = {alpha = 1.0 time = <time> id = <id>}
		endif
	endif
endscript

script create_net_play_song_menu 
endscript

script destroy_net_play_song_menu 
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
		line_spacing = 50
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
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script> params = {<choose_script_params>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if GotParam \{pad_choose_script2}
		if GotParam \{choose_script_params2}
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2> params = {<choose_script_params2>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2>}]
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
		font = text_a4
		Scale = 0.75
		rgba = ($online_light_blue)
		text = <text>
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
	if (<text> = 'Quick Match: Ranked Match')
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
