
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
	CreateScreenElement {
		Type = VScrollingMenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		Pos = (640.0, 290.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back generic_event_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = custom_search_container
		Pos = (0.0, 0.0)}
	displaySprite \{id = online_frame
		parent = custom_search_container
		tex = xb_online_frame_large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = xb_online_frame_crown
		parent = custom_search_container
		tex = xb_online_frame_crown
		Pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	CreateScreenElement {
		Type = TextElement
		parent = custom_search_container
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0xc9ed7a31)
		Pos = (640.0, 135.0)
		just = [center top]
		z_priority = 100.0
	}
	CreateScreenElement {
		Type = TextElement
		id = match_type
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0xb2571c5f)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = match_type text_id = <match_type_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <match_type_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = match_type text_id = <match_type_text_id> to = <match_type_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = SearchMatchTypeValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <match_type_vmenu_id>
		parent = match_type
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <match_type_text_id> Global = CopyOfGlobal Type = Ranked direction = up}}
			{pad_down net_custom_up_down params = {text = <match_type_text_id> Global = CopyOfGlobal Type = Ranked direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <match_type_text_id> Global = SearchMatchTypeValue Type = Ranked}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <match_type_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = SearchMatchTypeValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <match_type_vmenu_id> menu = search}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <match_type_text_id>
		parent = <match_type_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.Ranked.values [($SearchMatchTypeValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		id = game_mode
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x0d0530ec)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = game_mode text_id = <game_mode_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <game_mode_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = SearchGameModeValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <game_mode_vmenu_id>
		parent = game_mode
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = up}}
			{pad_down net_custom_up_down params = {text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <game_mode_text_id> Global = SearchGameModeValue Type = mode}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = SearchGameModeValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> menu = search}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <game_mode_text_id>
		parent = <game_mode_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.mode.values [($SearchGameModeValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		id = difficulty
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x48cdc36e)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = difficulty text_id = <difficulty_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = SearchDifficultyValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <difficulty_vmenu_id>
		parent = difficulty
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = up}}
			{pad_down net_custom_up_down params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> Global = SearchDifficultyValue Type = diff}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = search diff_focus}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = SearchDifficultyValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = search diff_focus}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <difficulty_text_id>
		parent = <difficulty_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.diff.values [($SearchDifficultyValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		id = number_of_songs
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0xb9bb9f92)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = number_of_songs text_id = <num_songs_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <num_songs_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = SearchNumSongsValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <num_songs_vmenu_id>
		parent = number_of_songs
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = up}}
			{pad_down net_custom_up_down params = {text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <num_songs_text_id> Global = SearchNumSongsValue Type = num_songs}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = SearchNumSongsValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = search}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <num_songs_text_id>
		parent = <num_songs_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.num_songs.values [($SearchNumSongsValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x3fc1c076)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose custom_create_select_done}
		]
	}
	<vmenu_id> :SetTags current_focus = first_time
	block_unblock_difficulty_actions \{menu = search}
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_custom_create_menu 
	if ScreenElementExists \{id = custom_search_container}
		DestroyScreenElement \{id = custom_search_container}
	endif
	if ScreenElementExists \{id = custom_match_menu}
		DestroyScreenElement \{id = custom_match_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script custom_create_select_done 
	Change \{match_type = Player}
	set_network_preferences
	get_custom_match_search_params
	0x324d7178 <...> 0x0cb4e4f6 = 0
	if (<join_result> = 1)
		generic_event_choose state = uistate_net_serverlist data = {<...>}
	endif
endscript

script net_custom_ui_change_focus 
	LaunchEvent Type = unfocus target = <from>
	SoundEvent \{event = ui_sfx_select}
	Wait \{1
		Frame}
	if ScreenElementExists id = <this_ID>
		<this_ID> :se_setprops rgba = ($online_dark_purple)
		<text_id> :se_setprops rgba = ($online_dark_purple)
	endif
	if ScreenElementExists \{id = arrow_down}
		legacydoscreenelementmorph \{id = arrow_down
			alpha = 1.0
			time = 0.1}
	endif
	if ScreenElementExists \{id = arrow_up}
		legacydoscreenelementmorph \{id = arrow_up
			alpha = 1.0
			time = 0.1}
	endif
	if ScreenElementExists \{id = bookend1_over}
		bookend1_over :se_setprops \{alpha = 0.0}
	endif
	if ScreenElementExists \{id = highlight_over}
		highlight_over :se_getprops
		highlight_over :legacydomorph Pos = (<Pos> + (528.0, 0.0)) time = 0.1
	endif
	if ScreenElementExists \{id = bookend2_over}
		bookend2_over :se_setprops \{alpha = 1.0}
	endif
	LaunchEvent Type = focus target = <to>
endscript

script net_custom_ui_change_unfocus 
	LaunchEvent Type = unfocus target = <from>
	if (<action> = choose)
		SoundEvent \{event = ui_sfx_select}
	else
		SoundEvent \{event = Generic_Menu_Back_SFX}
	endif
	if ScreenElementExists \{id = arrow_down}
		legacydoscreenelementmorph \{id = arrow_down
			alpha = 0.0
			time = 0.1}
	endif
	if ScreenElementExists \{id = arrow_up}
		legacydoscreenelementmorph \{id = arrow_up
			alpha = 0.0
			time = 0.1}
	endif
	if ScreenElementExists \{id = bookend2_over}
		bookend2_over :se_setprops \{alpha = 0.0}
	endif
	if ScreenElementExists \{id = highlight_over}
		highlight_over :se_getprops
		highlight_over :legacydomorph Pos = (<Pos> + (-528.0, 0.0)) time = 0.1
	endif
	if ScreenElementExists \{id = bookend1_over}
		bookend1_over :se_setprops \{alpha = 1.0}
	endif
	block_unblock_difficulty_actions <...>
	LaunchEvent Type = focus target = <to>
endscript

script net_custom_ui_focus 
	<VMenu> :GetTags
	if NOT (<current_focus> = <this_ID>)
		destroy_prev_selection_highlight
		if ScreenElementExists id = <this_ID>
			if (<this_ID> = submit_selection)
				displaySprite id = highlight_over parent = <this_ID> tex = white Pos = (-75.0, 10.0) dims = (495.0, 43.0) rgba = ($online_light_blue) just = [left top] z = 4
				displaySprite id = bookend1_over parent = <this_ID> tex = character_hub_hilite_bookend Pos = (-110.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_blue) just = [left center] z = 4
				displaySprite id = bookend2_over parent = <this_ID> tex = character_hub_hilite_bookend Pos = (420.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_blue) just = [left center] z = 4
			else
				displaySprite id = highlight_under parent = <this_ID> tex = white Pos = (-75.0, 10.0) dims = (1056.0, 43.0) rgba = ($online_light_purple) just = [left top] z = 3
				displaySprite id = bookend1_under parent = <this_ID> tex = character_hub_hilite_bookend Pos = (-117.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_purple) just = [left center] z = 3
				displaySprite id = bookend2_under parent = <this_ID> tex = character_hub_hilite_bookend Pos = (973.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_purple) just = [left center] z = 3
				displaySprite id = highlight_over parent = <this_ID> tex = white Pos = (-75.0, 10.0) dims = (528.0, 43.0) rgba = ($online_light_blue) just = [left top] z = 4
				displaySprite id = bookend1_over parent = <this_ID> tex = character_hub_hilite_bookend Pos = (-117.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_blue) just = [left center] z = 4
				displaySprite id = bookend2_over parent = <this_ID> tex = character_hub_hilite_bookend Pos = (973.0, 30.0) dims = (60.0, 50.0) rgba = ($online_light_blue) just = [left center] z = 4
				displaySprite id = arrow_down parent = <this_ID> tex = Online_Arrow Pos = (490.0, 50.0) dims = (32.0, 24.0) rgba = ($online_dark_purple) just = [center center] z = 5
				displaySprite id = arrow_up parent = <this_ID> tex = Online_Arrow Pos = (490.0, 15.0) dims = (32.0, 24.0) rgba = ($online_dark_purple) just = [center center] z = 5 flip_h
				bookend2_over :se_setprops \{alpha = 0.0}
				arrow_down :se_setprops \{alpha = 0.0}
				arrow_up :se_setprops \{alpha = 0.0
					preserve_flip}
			endif
		endif
		<VMenu> :SetTags current_focus = <this_ID>
	endif
	retail_menu_focus
	if ScreenElementExists id = <text_id>
		<text_id> :se_setprops rgba = ($online_dark_purple)
	endif
endscript

script net_custom_ui_unfocus 
	retail_menu_unfocus
	if ScreenElementExists id = <text_id>
		<text_id> :se_setprops rgba = ($online_light_blue)
	endif
endscript

script destroy_prev_selection_highlight 
	if ScreenElementExists \{id = highlight_under}
		DestroyScreenElement \{id = highlight_under}
	endif
	if ScreenElementExists \{id = bookend1_under}
		DestroyScreenElement \{id = bookend1_under}
	endif
	if ScreenElementExists \{id = bookend2_under}
		DestroyScreenElement \{id = bookend2_under}
	endif
	if ScreenElementExists \{id = highlight_over}
		DestroyScreenElement \{id = highlight_over}
	endif
	if ScreenElementExists \{id = bookend1_over}
		DestroyScreenElement \{id = bookend1_over}
	endif
	if ScreenElementExists \{id = bookend2_over}
		DestroyScreenElement \{id = bookend2_over}
	endif
	if ScreenElementExists \{id = arrow_up}
		DestroyScreenElement \{id = arrow_up}
	endif
	if ScreenElementExists \{id = arrow_down}
		DestroyScreenElement \{id = arrow_down}
	endif
endscript

script animate_helper_arrows 
	if (<direction> = up)
		generic_menu_up_or_down_sound \{up}
		if ScreenElementExists \{id = arrow_up}
			arrow_up :legacydomorph \{Scale = (1.8, 1.5)
				time = 0.1}
			arrow_up :legacydomorph \{Scale = (1.0, 1.0)
				time = 0.1}
		endif
	else
		generic_menu_up_or_down_sound \{down}
		if ScreenElementExists \{id = arrow_down}
			arrow_down :legacydomorph \{Scale = (1.8, 1.5)
				time = 0.1}
			arrow_down :legacydomorph \{Scale = (1.0, 1.0)
				time = 0.1}
		endif
	endif
endscript
