
script spawn_reject 
	getfriendname index = <index>
	formatText TextName = reject_text ($wii_reject_dialog) a = <nickname> b = ($reject_phrases_full [<phrase>])
	create_generic_popup {
		title = $wii_rejected
		ok_menu
		message = <reject_text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose ok_after_reject}
		]
		previous_menu = vmenu_character_select_p1
		Priority = 5
	}
endscript
should_spawn_disconnect = 0

script safe_spawn_disconnect 
	Change \{should_spawn_disconnect = 1}
endscript

script check_player_disconnect 
	begin
	if ($should_spawn_disconnect = 1)
		Change \{should_spawn_disconnect = 0}
		spawn_disconnect
		return
	endif
	if ($0x98ff17eb = 0)
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script spawn_disconnect 
	if ScreenElementExists \{id = warning_message_container}
		leaving_lobby_dialog_unfocus
		destroy_leaving_lobby_dialog
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_wifi_friend_disconnect
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
				ok_after_reject
			}
		]
		previous_menu = vmenu_character_select_p1}
endscript

script ok_after_reject 
	destroy_generic_popup
	network_player_lobby_message \{Type = character_select
		action = deselect}
	if NOT ($ui_flow_manager_state [0] = online_character_select_fs)
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
		Wait \{1
			gameframe}
	endif
	cs_go_back \{params = {
			Player = 1
		}}
	quit_network_game
endscript

script spawn_friend_left 
	if ScreenElementExists \{id = warning_message_container}
		leaving_lobby_dialog_unfocus
		destroy_leaving_lobby_dialog
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_wifi_friend_leave
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
				ok_after_friend_left
			}
		]
		previous_menu = vmenu_character_select_p1}
endscript

script ok_after_friend_left 
	destroy_generic_popup
	network_player_lobby_message \{Type = character_select
		action = deselect}
	if NOT ($ui_flow_manager_state [0] = online_character_select_fs)
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
		Wait \{1
			gameframe}
	endif
	quit_network_game
endscript
invite_pos = (0.0, 0.0)

script spawn_invite 
	getfriendname index = <index>
	formatText checksumName = invite_id '%n%i' n = <nickname> i = <index> AddToStringLookup = true
	if ScreenElementExists id = <invite_id>
		DestroyScreenElement id = <invite_id>
		Wait \{1
			gameframe}
	endif
	if ScreenElementExists \{id = invite_container}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = invite_container
		parent = root_window
		Pos = (150.0, 150.0)
		just = [
			left
			top
		]}
	base_pos = $invite_pos
	top_pos = (($invite_pos) + (19.0, 0.0))
	displaySprite parent = invite_container tex = 0xd4bfbb6c Pos = <base_pos> dims = (128.0, 128.0) z = 201
	Wait \{20
		gameframes}
	displaySprite parent = invite_container tex = 0x59c4e6e9 Pos = <top_pos> dims = (128.0, 128.0) z = 202
	Wait \{15
		gameframes}
	text_box_pos = $invite_pos
	<text_box_pos> = (<text_box_pos> + (80.0, 48.0))
	CreateScreenElement {
		Type = SpriteElement
		id = invite_name_box
		parent = invite_container
		rgba = [0 0 0 255]
		Pos = <text_box_pos>
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (1.0, 35.0)
		just = [left top]
		z_priority = 199
	}
	text_pos = (<text_box_pos> + (30.0, 2.0))
	CreateScreenElement {
		Type = TextElement
		id = invite_text
		parent = invite_container
		rgba = [255 255 255 255]
		alpha = 0
		Pos = <text_pos>
		font = text_a1
		Scale = 0.8
		text = <nickname>
		just = [left top]
		z_priority = 200
	}
	GetScreenElementDims \{id = invite_text}

	box_width = ((<width>) * (1.0, 0.0) + (40.0, 1.0))
	invite_name_box :DoMorph Scale = <box_width> scale_relative time = 0.5 anim = fast_out
	SetScreenElementProps \{id = invite_text
		alpha = 1}
	Wait \{60
		gameframes}
	DestroyScreenElement \{id = invite_text}
	invite_name_box :DoMorph \{Scale = (1.0, 1.0)
		scale_relative
		time = 0.5
		anim = fast_in}
	if ScreenElementExists \{id = invite_container}
		DestroyScreenElement \{id = invite_container}
	endif
endscript

script check_invite 
	checkforinvite index = <index>
endscript

script accept_invite 
	destroy_generic_popup
	getfriendinfo index = ($friendlist_selection_index)

	0xfdb5fa79 friend_index = (<resolvedindex>)
endscript
