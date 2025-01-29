in_wii_invites_menu = 0
wii_invites_menu_disable_requests = 0
wii_guide_current_menu = invites
wii_invites_paused = FALSE

script add_invites_menu_button_handler_delayed_spawned 
	setscriptcannotpause
	Wait \{1
		Second}
	add_invites_menu_button_handler
endscript

script add_invites_menu_button_handler_delayed 
	SpawnScriptNow \{add_invites_menu_button_handler_delayed_spawned}
endscript

script add_invites_menu_button_handler 
	SetScreenElementProps \{id = super_root_window
		event_handlers = [
			{
				pad_wii_2
				invites_menu_button_pressed
			}
		]
		replace_handlers}
endscript

script remove_invites_menu_button_handler 
	SetScreenElementProps \{id = super_root_window
		event_handlers = [
		]
		replace_handlers}
endscript

script invites_menu_button_pressed 
	printf \{'invites_menu_button_pressed'}
	remove_invites_menu_button_handler
	OnExitRun \{add_invites_menu_button_handler_delayed}
	if wiidscommunication :isactive
		displaynotification high_priority remove_dupes text = ($wii_notification_strings.press_2_when_not_online) Type = invites_list_offline
		return
	endif
	if NOT islobbyconnected \{Default}
		displaynotification high_priority remove_dupes text = ($wii_notification_strings.press_2_when_not_online) Type = invites_list_offline
		return
	endif
	if ui_event_exists_in_stack \{Name = 'Rock_Archive'}
		displaynotification high_priority remove_dupes text = ($wii_notification_strings.invites_menu_disabled_in_rock_archive)
		return
	endif
	if ($wii_entering_music_store = 1)
		displaynotification high_priority remove_dupes text = ($wii_notification_strings.invites_menu_disabled_in_music_store)
		return
	endif
	if ($wii_invites_menu_disable_requests > 0)
		printf \{channel = clayton
			'invites_menu_button_pressed - disabled, bailing'}
		return
	endif
	if ($transition_playing = true)
		return
	endif
	if ($in_wii_invites_menu = 0)
		if NOT is_ui_event_running
			create_wii_invites_menu
		endif
	endif
endscript

script create_wii_invites_menu 
	Change \{in_wii_invites_menu = 1}
	root_window :se_setprops \{block_non_focus_events}
	invites_menu_pause_game
	CreateScreenElement \{Type = descinterface
		desc = 'friendinvite_popup'
		parent = super_root_window
		popup_title_text = qs(0x00000000)
		invites_popup_container_alpha = 0.0
		invites_bg_blackout_alpha = 0.0
		id = wii_invites_menu
		z_priority = 1000000.0}
	wii_invites_menu :se_setprops \{event_handlers = [
			{
				pad_back
				destroy_wii_invites_menu
			}
			{
				pad_option
				invite_menu_switch_menu
			}
		]}
	if wii_invites_menu :desc_resolvealias \{Name = alias_buttons_scrollbox}
		AssignAlias id = <resolved_id> alias = invites_menu_buttons
	else
		ScriptAssert \{'failed to resolve alias_buttons_scrollbox'}
	endif
	if wii_invites_menu :desc_resolvealias \{Name = alias_item_highlight}
		AssignAlias id = <resolved_id> alias = invites_item_highlight
	else
		ScriptAssert \{'failed to resolve alias_item_highlight'}
	endif
	if wii_invites_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = invites_popup_scrollbar_wgt
		generic_scrollbar_wgt_initialize \{id = invites_popup_scrollbar_wgt}
	else
		ScriptAssert \{'failed to resolve alias_generic_scrollbar_wgt'}
	endif
	RunScriptOnScreenElement \{invites_menu_animate_in
		id = wii_invites_menu}
	Block \{Type = invite_menu_animation_finished}
	invites_menu_setup_button_helpers
	invite_menu_set_title_and_populate
	LaunchEvent \{Type = focus
		target = wii_invites_menu}
	LaunchEvent \{Type = focus
		target = invites_menu_buttons}
endscript

script invite_menu_set_title_and_populate 
	switch ($wii_guide_current_menu)
		case invites
		wii_invites_menu :se_setprops \{popup_title_text = qs(0x306229d7)}
		invites_menu_populate_invites
		case rivals
		wii_invites_menu :se_setprops \{popup_title_text = qs(0x67fc2a9a)}
		invites_menu_populate_rivals
	endswitch
endscript

script invite_menu_switch_menu \{new_menu = NULL}
	if (<new_menu> = $wii_guide_current_menu)
		return
	elseif (<new_menu> = NULL)
		switch ($wii_guide_current_menu)
			case invites
			<new_menu> = rivals
			case rivals
			<new_menu> = invites
		endswitch
	endif
	Change wii_guide_current_menu = <new_menu>
	DestroyScreenElement \{id = invites_menu_buttons
		preserve_parent}
	invites_menu_setup_button_helpers
	invite_menu_set_title_and_populate
endscript

script invites_menu_populate_rivals 
	NetSessionFunc \{Obj = friends
		func = get_rival_requests}
	GetArraySize <rivals>
	if (<array_Size> > 0)
		generic_scrollbar_wgt_set_resolution id = invites_popup_scrollbar_wgt num_elements = <array_Size>
		i = 0
		begin
		invites_menu_add_rival_to_popup {
			gamertag_text = (<rivals> [<i>].Name)
			net_id = (<rivals> [<i>].id)
			index = <i>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script invites_menu_add_rival_to_popup \{gamertag_text = 0x69696969
		net_id = !a1768515945
		index = !i1768515945}
	if is_net_id_zero net_id = <net_id>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	printf \{'--- invites_menu_add_invite_to_popup ---'}
	if ScreenElementExists \{id = invites_menu_buttons}
		CreateScreenElement {
			parent = invites_menu_buttons
			Type = descinterface
			desc = 'friendinvite_button'
			autosizedims = true
			gamer_tag_text = <gamertag_text>
			friend_icon_alpha = 0
			rival_icon_alpha = 1
		}
		<id> :se_setprops {
			event_handlers = [
				{focus invite_menu_button_change_focus params = {index = <index>}}
				{pad_choose invites_menu_accept_rival_request params = {net_id = <net_id> element_id = <id> Name = <gamertag_text>}}
				{pad_option2 invites_menu_reject_rival_request params = {net_id = <net_id> element_id = <id>}}
			]
		}
	endif
endscript

script invites_menu_accept_rival_request \{net_id = !a1768515945
		element_id = !q1768515945
		Name = qs(0x5217670b)}
	if is_net_id_zero net_id = <net_id>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	if (<element_id> = NULL)
		ScriptAssert \{'invalid screen element id'}
		return
	endif
	NetSessionFunc Obj = friends func = accept_rival_request params = {Name = <Name> net_id = <net_id>}
	if ScreenElementExists id = <element_id>
		DestroyScreenElement id = <element_id>
	endif
	formatText TextName = confirm_text qs(0x6ecbac27) a = <Name> b = ($wii_notification_strings.accept_rival_request)
	display_exclusive_notification text = <confirm_text>
endscript

script invites_menu_reject_rival_request \{net_id = !a1768515945
		element_id = !q1768515945}
	if is_net_id_zero net_id = <net_id>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	if (<element_id> = NULL)
		ScriptAssert \{'invalid screen element id'}
		return
	endif
	NetSessionFunc Obj = friends func = reject_rival_request params = {net_id = <net_id>}
	if ScreenElementExists id = <element_id>
		DestroyScreenElement id = <element_id>
	endif
endscript

script destroy_wii_invites_menu 
	if ScreenElementExists \{id = wii_invites_menu}
		LaunchEvent \{Type = unfocus
			target = wii_invites_menu}
		if ScreenElementExists \{id = user_control_container}
			user_control_container :se_setprops \{alpha = 1}
		endif
		DestroyScreenElement \{id = invite_menu_button_helper_container}
		RunScriptOnScreenElement \{invites_menu_animate_out
			id = wii_invites_menu}
		Block \{Type = invite_menu_animation_finished}
		root_window :se_setprops \{unblock_non_focus_events}
		invites_menu_unpause_game
		DestroyScreenElement \{id = wii_invites_menu}
		NetSessionFunc \{Obj = friends
			func = fill_rival_requests}
	endif
	Change \{in_wii_invites_menu = 0}
endscript

script invites_menu_populate_invites 
	NetSessionFunc \{Obj = friends
		func = get_invites}
	GetArraySize <invites>
	if (<array_Size> > 0)
		i = 0
		begin
		invites_menu_add_invite_to_popup {
			gamertag_text = (<invites> [<i>].Name)
			net_id = (<invites> [<i>].id)
			is_rival = (<invites> [<i>].is_rival)
			index = <i>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script invites_menu_add_invite_to_popup \{gamertag_text = 0x69696969
		net_id = !a1768515945
		is_rival = !i1768515945
		index = -1}
	printf \{'--- invites_menu_add_invite_to_popup ---'}
	if ScreenElementExists \{id = invites_menu_buttons}
		if (<index> = -1)
			if GetScreenElementChildren
				fastgetarraysize array = <children>
				<index> = (<array_Size> - 1)
			else
				<index> = 0
			endif
		endif
		formatText checksumName = invite_id 'invite_button_%a%b' a = (<net_id> [0]) b = (<net_id> [1])
		if (<is_rival> = 1)
			friend_alpha = 0
			rival_alpha = 1
		else
			friend_alpha = 1
			rival_alpha = 0
		endif
		if NOT ScreenElementExists id = <invite_id>
			CreateScreenElement {
				id = <invite_id>
				parent = invites_menu_buttons
				Type = descinterface
				desc = 'friendinvite_button'
				autosizedims = true
				gamer_tag_text = <gamertag_text>
				friend_icon_alpha = <friend_alpha>
				rival_icon_alpha = <rival_alpha>
				event_handlers = [
					{focus invite_menu_button_change_focus params = {index = <index>}}
					{pad_choose invites_menu_accept_invite params = {net_id = <net_id>}}
					{pad_option2 invites_menu_remove_invite_from_popup params = {net_id = <net_id>}}
				]
			}
		endif
		if GetScreenElementChildren \{id = invites_menu_buttons}
			fastgetarraysize array = <children>
			generic_scrollbar_wgt_set_resolution id = invites_popup_scrollbar_wgt num_elements = <array_Size>
		endif
	endif
endscript

script invites_menu_remove_invite_from_popup \{net_id = !a1768515945}
	if is_net_id_zero net_id = <net_id>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	formatText checksumName = invite_id 'invite_button_%a%b' a = (<net_id> [0]) b = (<net_id> [1])
	if ScreenElementExists id = <invite_id>
		DestroyScreenElement id = <invite_id>
		NetSessionFunc Obj = friends func = remove_invite params = {net_id = <net_id>}
	endif
endscript

script invites_menu_animate_in 
	setscriptcannotpause
	se_setprops \{invites_bg_blackout_alpha = 0.75
		time = 0.125
		can_pause = FALSE}
	se_waitprops
	se_setprops \{invites_popup_container_alpha = 1.0
		time = 0.125
		can_pause = FALSE}
	se_waitprops
	broadcastevent \{Type = invite_menu_animation_finished}
endscript

script invites_menu_animate_out 
	setscriptcannotpause
	se_setprops \{invites_popup_container_alpha = 0.0
		time = 0.125
		can_pause = FALSE}
	se_waitprops
	se_setprops \{invites_bg_blackout_alpha = 0.0
		time = 0.125
		can_pause = FALSE}
	se_waitprops
	broadcastevent \{Type = invite_menu_animation_finished}
endscript

script invite_menu_button_change_focus \{index = !i1768515945}
	Obj_GetID
	invites_item_highlight :se_setprops {
		parent = <objID>
		Pos = (0.0, 0.0)
		alpha = 0.4
		pos_anchor = [center center]
		just = [center center]
	}
	generic_scrollbar_wgt_update_thumb_pos id = invites_popup_scrollbar_wgt index = <index>
endscript

script invites_menu_accept_invite \{net_id = !a1768515945}
	if is_net_id_zero net_id = <net_id>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	if ($demonware_stun_failed != 1)
		NetSessionFunc Obj = friends func = accept_invite params = {net_id = <net_id>}
		invites_menu_remove_invite_from_popup net_id = <net_id>
		destroy_wii_invites_menu
	else
	endif
endscript

script invites_menu_pause_game 
	if ($is_network_game)
		enableallinput \{OFF}
	else
		if invites_should_pause_game
			if ($playing_song = 1)
				gh_pause_game
			else
				PauseGame
			endif
			Change \{wii_invites_paused = true}
		endif
	endif
endscript

script invites_menu_unpause_game 
	if ($is_network_game)
		enableallinput
	else
		if ($wii_invites_paused = true)
			LoadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
				Heap = BottomUpHeap
				async = 1}
			UnloadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
				Heap = BottomUpHeap
				async = 1}
			if ($playing_song_for_real = 1)
				ui_event_wait \{event = menu_change
					data = {
						state = uistate_song_unpause
					}}
			elseif ($playing_song = 1)
				gh_unpause_game
			else
				UnPauseGame
			endif
			Change \{wii_invites_paused = FALSE}
		endif
	endif
endscript

script invites_should_pause_game 
	if GameIsPaused
		return \{FALSE}
	endif
	gamemode_gettype
	if (<Type> = freeplay)
		return \{FALSE}
	endif
	return \{true}
endscript

script push_disable_wii_invites_menu 
	Change wii_invites_menu_disable_requests = ($wii_invites_menu_disable_requests + 1)
endscript

script pop_disable_wii_invites_menu 
	Change wii_invites_menu_disable_requests = ($wii_invites_menu_disable_requests - 1)
	if ($wii_invites_menu_disable_requests < 0)
		ScriptAssert \{'pop called without push, or push/pop calls happened out of order'}
	endif
endscript

script invites_menu_setup_button_helpers 
	if ScreenElementExists \{id = invite_menu_button_helper_container}
		DestroyScreenElement \{id = invite_menu_button_helper_container}
	endif
	CreateScreenElement \{id = invite_menu_button_helper_container
		parent = root_window
		Type = menuelement
		dims = (1420.0, 40.0)
		Scale = (0.7, 0.7)
		Pos = (0.0, -48.0)
		pos_anchor = [
			center
			bottom
		]
		just = [
			center
			bottom
		]
		internal_just = [
			center
			center
		]
		isvertical = FALSE
		position_children = true
		fit_major = `fit	content	if	larger`
		fit_minor = `keep	dims`
		spacing_between = 10
		z_priority = 1000000.0
		event_handlers = [
			{
				controller_acquired
				user_control_helper_update_button_prompts
			}
		]}
	if ScreenElementExists \{id = user_control_container}
		user_control_container :se_setprops \{alpha = 0}
	endif
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		override_parent = invite_menu_button_helper_container
		generate_helper_pill_id = FALSE
		helper_pill_id = invites_menu_green_helper_pill}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		override_parent = invite_menu_button_helper_container
		generate_helper_pill_id = FALSE
		helper_pill_id = invites_menu_red_helper_pill}
	add_user_control_helper \{text = qs(0x9c471b9e)
		button = yellow
		override_parent = invite_menu_button_helper_container
		generate_helper_pill_id = FALSE
		helper_pill_id = invites_menu_yellow_helper_pill}
	switch ($wii_guide_current_menu)
		case invites
		button_text = qs(0x67fc2a9a)
		case rivals
		button_text = qs(0x306229d7)
	endswitch
	add_user_control_helper {
		text = <button_text>
		button = blue
		override_parent = invite_menu_button_helper_container
		generate_helper_pill_id = FALSE
		helper_pill_id = invites_menu_blue_helper_pill
	}
endscript
