
script xboxlive_menu_back_from_friends_list 
	KillSpawnedScript \{Name = async_update_friends_list}
	menu_stack_pop
endscript

script xboxlive_menu_friends_close 
	KillSpawnedScript \{Name = async_update_friends_list}
	KillSpawnedScript \{Name = xboxlive_menu_async_retrieve_message}
	if NetSessionFunc \{func = presence_started}
		NetSessionFunc \{Obj = presence
			func = stop_friends_list}
	endif
endscript

script xboxlive_menu_friends_refresh \{parent = root_window
		menu_id = friends_menu
		vmenu_id = friends_vmenu
		Pos = (25.0, 100.0)
		spacing = 2
		tags = {
			start_index = 0
			items_on_page = 10
		}
		item_props = {
			font = small
			Scale = 0.8
			highlight_rgba = [
				123
				4
				93
				128
			]
			unhighlight_rgba = [
				123
				128
				128
				128
			]
			bg_dims = (600.0, 25.0)
			container_dims = (640.0, 23.0)
			status_pos = (595.0, 3.0)
			pad_choose_script = xboxlive_menu_friends_item_choose
		}
		title_props = {
			text = net_friends_list
			Pos = (50.0, 50.0)
			rgba = [
				9
				120
				25
				128
			]
			Scale = 2
			font = fontgrid_text_a3
		}
		grid_index = 0
		player_set = friends}
	if NOT ScreenElementExists id = <menu_id>
		SetScreenElementLock id = <parent> OFF
		make_generic_menu {
			title = (<title_props>.text)
			menu_id = <menu_id>
			vmenu_id = <vmenu_id>
			parent = <parent>
			PauseMenu
		}
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = [
				{pad_up xboxlive_menu_friends_blink_arrow params = {direction = up}}
				{pad_down xboxlive_menu_friends_blink_arrow params = {direction = down}}
			]
			tags = {
				<tags>
				item_props = <item_props>
				player_set = <player_set>
				dialog_callback = <dialog_callback>
			}
		}
		legacydoscreenelementmorph \{id = friends_vmenu
			Pos = (150.0, 80.0)}
	else
		xboxlive_menu_friends_get_friends_info
		if NOT (<num_items_total> > <start_index>)
			grid_index = 0
			start_index = ((<num_items_total> / <items_on_page>) * <items_on_page>)
			current_menu :SetTags start_index = <start_index>
		endif
		if NOT GotParam \{dont_find_selected_player}
			xboxlive_menu_friends_netfunc_redirect \{action = getindex}
			if GotParam \{player_index}
				if (<player_index> > <num_items_total>)
					ScriptAssert \{qs(0x809e07bc)}
				endif
				Mod a = <player_index> b = <items_on_page>
				grid_index = <Mod>
				page = (<player_index> / <items_on_page>)
				current_menu :SetTags start_index = (<page> * <items_on_page>)
			endif
		endif
	endif
	LaunchEvent \{Type = unfocus
		target = current_menu}
	DestroyScreenElement \{id = current_menu
		preserve_parent}
	current_menu :SetTags \{allow_new_items}
	if GotParam \{add_arrows}
		xboxlive_menu_friends_arrow_add \{direction = up}
	else
		xboxlive_menu_friends_arrow_add
	endif
	GetSkaterId
	NetSessionFunc \{Obj = match
		func = get_gamertag}
	xboxlive_menu_friends_item_add {
		not_focusable = not_focusable
		player_name = <Name>
		real_id = <objnum>
		player_id = something_bogus_id
	}
	xboxlive_menu_friends_netfunc_redirect \{action = addall}
	if GotParam \{add_arrows}
		xboxlive_menu_friends_arrow_add \{direction = down}
	endif
	current_menu :RemoveTags \{[
			allow_new_items
		]}
	SetScreenElementLock \{id = current_menu
		On}
	menu_finish index = <grid_index>
endscript

script xboxlive_menu_friends_get_friends_info 
	xboxlive_menu_friends_netfunc_redirect \{action = getnum}
	friends_vmenu :GetSetOfTags \{[
			start_index
			items_on_page
		]}
	return <...>
endscript

script xboxlive_menu_friends_page \{direction = down}
	DisassociateFromObject
	xboxlive_menu_friends_get_friends_info
	if (<direction> = up)
		grid_index = <items_on_page>
		if (<start_index> = 0)
			pages = (<num_items_total> / <items_on_page>)
			start_index = (<pages> * <items_on_page>)
		else
			start_index = (<start_index> - <items_on_page>)
		endif
	endif
	if (<direction> = down)
		grid_index = 0
		start_index = (<start_index> + <items_on_page>)
		if NOT (<start_index> < <num_items_total>)
			<start_index> = 0
		endif
	endif
	friends_vmenu :SetTags start_index = <start_index>
	xboxlive_menu_friends_refresh grid_index = <grid_index> dont_find_selected_player
	xboxlive_menu_friends_blink_arrow direction = <direction>
endscript

script xboxlive_menu_friends_has_more_than_one_page 
	xboxlive_menu_friends_get_friends_info
	if (<num_items_total> > <items_on_page>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script xboxlive_menu_friends_arrow_add 
	if NOT current_menu :GetSingleTag \{allow_new_items}
		return
	endif
	if GotParam \{direction}
		if (<direction> = up)
			id = up_arrow
			text = net_title_up
		endif
		if (<direction> = down)
			id = down_arrow
			text = net_title_down
		endif
		item_params = {
			event_handlers = [
				{
					focus
					xboxlive_menu_friends_page
					params = {
						direction = <direction>
					}
				}
				{
					unfocus
					nullscript
				}
			]
		}
	else
		id = padding
		text = qs(0x03ac90f0)
		item_params = {not_focusable}
	endif
	SetScreenElementLock \{id = current_menu
		OFF}
	current_menu :GetSingleTag \{item_props}
	CreateScreenElement {
		Type = TextElement
		parent = friends_vmenu
		local_id = <id>
		text = <text>
		font = (<item_props>.font)
		rgba = [128 128 128 128]
		Scale = 1
		just = [left top]
		z_priority = 2
		dimp = (<item_props>.bg_dims)
		<item_params>
		tags = {
			tag_grid_x = 1000
		}
	}
endscript

script xboxlive_menu_friends_separator_add \{text = qs(0xb1679ca8)}
	if NOT current_menu :GetSingleTag \{allow_new_items}
		return
	endif
	current_menu :GetSingleTag \{item_props}
	SetScreenElementLock \{id = current_menu
		OFF}
	CreateScreenElement \{Type = ContainerElement
		parent = current_menu
		just = [
			left
			top
		]
		dims = (640.0, 23.0)
		alpha = 0.6
		not_focusable}
	parent_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <parent_id>
		local_id = text
		Pos = (60.0, 3.0)
		text = <text>
		font = (<item_props>.font)
		rgba = (<item_props>.unhighlight_rgba)
		Scale = (<item_props>.Scale)
		just = [left top]
		z_priority = 2
		not_focusable
	}
endscript

script xboxlive_menu_recent_players_separator_add 
	xboxlive_menu_friends_separator_add \{text = qs(0xfc79b827)}
endscript

script xboxlive_menu_friends_item_add {
	}
	user_index = 0
	if NOT ScreenElementExists \{id = friends_vmenu}
		printf \{qs(0x446ba305)}
		return
	endif
	current_menu :GetSingleTag \{item_props}
	if NOT ScreenElementExists id = {current_menu child = <player_id>}
		if NOT current_menu :GetSingleTag \{allow_new_items}
			return
		endif
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			tag_grid_x = (<array_Size> -1)
			RemoveParameter \{children}
		else
			tag_grid_x = 0
		endif
		SetScreenElementLock \{id = current_menu
			OFF}
		add_generic_menu_text_item {
			local_id = <player_id>
			text = qs(0x03ac90f0)
		}
		<item_container_id> :se_setprops dims = (40.0, 35.0)
		if ScreenElementExists id = {<item_container_id> child = highlight}
			scale_element_to_size {
				id = {<item_container_id> child = highlight}
				target_width = 160
				target_height = 47
			}
			legacydoscreenelementmorph {
				id = {<item_container_id> child = highlight}
				Pos = (-100.0, 8.0)
			}
			legacydoscreenelementmorph {
				id = <item_container_id>
				Scale = (1.0, 0.76)
			}
		endif
		SetScreenElementProps {
			id = <item_container_id>
			tags = {tag_grid_x = <tag_grid_x>}
		}
		if GotParam \{not_focusable}
			SetScreenElementProps {
				id = <item_container_id>
				not_focusable
			}
		endif
		GetScreenElementProps {
			id = {<item_container_id> child = text}
		}
		text_scale = <Scale>
		CreateScreenElement {
			Type = TextElement
			local_id = cash
			text = qs(0x7b277b30)
			font = fontgrid_text_a3
			Scale = <text_scale>
			parent = <item_container_id>
			Pos = (100.0, 18.0)
			just = [right center]
		}
	else
		printf \{qs(0xb66f611c)}
	endif
	SetScreenElementProps {
		id = {current_menu child = <player_id>}
		event_handlers = [
			{focus xboxlive_menu_friends_item_focus params = {player_name = <player_name>}}
			{unfocus xboxlive_menu_friends_item_unfocus}
		]
	}
	SetScreenElementProps {
		id = {current_menu child = <player_id>}
		replace_handlers
		event_handlers = [
			{
				pad_choose
				(<item_props>.pad_choose_script)
				params = {
					player_id = <player_id>
					player_name = <player_name>
					voice = <voice>
					invite = <invite>
					title = <title>
				}
			}
		]
	}
	printf \{qs(0xfa6e882b)}
	printstruct <...>
	SetScreenElementProps {
		id = {current_menu child = {<player_id> child = text}}
		text = <player_name>
	}
	if NOT GotParam \{real_id}
		NetGetPlayerCash player_id = <player_num>
	else
		NetGetPlayerCash player_id = <real_id>
	endif
	printstruct <...>
	formatText TextName = player_cash_string qs(0xcb2f9062) d = <player_cash>
	SetScreenElementProps {
		id = {current_menu child = {<player_id> child = cash}}
		text = <player_cash_string>
		z_priority = 100
	}
endscript

script xboxlive_menu_friends_get_invite_sprites 
	return \{sprites = [
			{
				val = 1
				texture = friend
			}
			{
				val = 2
				texture = friend
			}
			{
				val = 3
				texture = friend
			}
			{
				val = 4
				texture = friend
			}
			{
				val = 5
				texture = received
			}
			{
				val = 6
				texture = invitesent
			}
			{
				val = 7
				texture = friendreceived
			}
			{
				val = 8
				texture = friendsent
			}
		]}
endscript

script xboxlive_menu_friends_item_add_sprite \{rgba = [
			128
			128
			128
			128
		]}
	ResolveScreenElementID id = {current_menu child = {<player_id> child = <local_id>}}
	if ScreenElementExists id = <resolved_id>
		DestroyScreenElement id = <resolved_id>
	endif
	if GotParam \{param}
		SetScreenElementLock id = {current_menu child = <player_id>} OFF
		GetArraySize \{options}
		i = 0
		begin
		if ((<options> [<i>].val) = <param>)
			texture = (<options> [<i>].texture)
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if NOT GotParam \{texture}
			return
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = {current_menu child = <player_id>}
			local_id = <local_id>
			texture = <texture>
			rgba = <rgba>
			just = [left center]
			Scale = <Scale>
			Pos = <Pos>
		}
	endif
endscript

script xboxlive_menu_friends_item_focus 
	Obj_GetID
	current_menu :GetSingleTag \{item_props}
	if ScreenElementExists id = {<objID> child = cash}
		printf \{qs(0x4e72fc83)}
		SetScreenElementProps {
			id = {<objID> child = cash}
			rgba = ($goal_ui_scheme.main)
		}
	endif
	current_menu :SetTags selected_player_name = <player_name>
endscript

script xboxlive_menu_friends_item_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = cash}
		SetScreenElementProps {
			id = {<objID> child = cash}
			rgba = [128 128 128 240]
		}
	endif
endscript

script xboxlive_menu_friends_item_choose_back 
	DisassociateFromObject
	xboxlive_dialog_box_exit
	LaunchEvent \{Type = focus
		target = current_menu}
	SetScreenElementLock \{id = friends_menu
		OFF}
	create_helper_text \{$generic_helper_text
		helper_pos = (320.0, 426.0)}
endscript

script xboxlive_menu_friends_item_context_action 
	printf \{qs(0xb8dd39ec)}
endscript

script xboxlive_menu_friends_item_choose_invite_prompt 
	allow_message = 0
	if NetSessionFunc \{Obj = voice
			func = voice_allowed}
		if NetSessionFunc \{Obj = voice
				func = voice_enabled}
			if NetSessionFunc \{Obj = voice
					func = HasLocalHeadset}
				<allow_message> = 1
			endif
		endif
	endif
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	if (<allow_message> = 1)
		xboxlive_dialog_box {title = net_friends_attach_voice
			text = net_title_attach_voice
			exclusive_device = <user_index>
			buttons = [
				{text = net_answer_yes pad_choose_script = xboxlive_menu_record_voice_menu_create pad_choose_params = {accept_script = xboxlive_menu_friends_item_choose_invite accept_params = {<...> voice_msg} cancel_script = xboxlive_menu_friends_item_choose_back}}
				{text = net_answer_no pad_choose_script = xboxlive_menu_friends_item_choose_invite pad_choose_params = <...>}
				{text = net_answer_cancel pad_choose_script = xboxlive_menu_friends_item_choose_back}
			]
		}
	else
		xboxlive_menu_friends_item_choose_invite <...>
	endif
endscript

script xboxlive_menu_friends_item_choose_invite 
	NetSessionFunc Obj = presence func = invite_friend params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_reject_invitation 
	NetSessionFunc Obj = presence func = reject_invitation params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_follow 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	if NetSessionFunc Obj = presence func = follow_friend params = <...>
		if GotParam \{same_title}
			xboxlive_menu_friends_item_choose_back
			xboxlive_menu_back_from_friends_list
			if InNetGame
				launch_quit_game_dialog
			else
				if GameModeEquals \{is_career}
					career_mode_quit_dialog
				else
					if GameModeEquals \{is_cat}
						launch_quit_cat_dialog
					else
						menu_confirm_quit
					endif
				endif
			endif
		else
			LaunchEvent \{Type = unfocus
				target = current_menu}
			current_menu :GetSingleTag \{dialog_callback}
			if GotParam \{was_invited}
				title_text = net_friends_accepted_invitation
			else
				title_text = net_friends_join_friend
			endif
			main_text = (net_friends_eject_disc + <title> + qs(0x730fb7a3) + z_mainmenu_str_310)
			<dialog_callback> {
				title = <title_text>
				text = <main_text>
				text_dims = (400.0, 0.0)
				pad_back_script = xboxlive_menu_friends_item_choose_back
				exclusive_device = <user_index>
				buttons = [
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <...>
					}
				]
			}
		endif
	else
	endif
endscript

script xboxlive_menu_friends_item_choose_remove_confirm 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	xboxlive_menu_friends_item_choose_back
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	title_text = (net_title_remove)
	formatText TextName = dialog_text (net_question_are_you_sure_remove) s = <player_name>
	<dialog_callback> {
		title = <title_text>
		text = <dialog_text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		exclusive_device = <user_index>
		buttons = [
			{
				text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_choose_remove
				pad_choose_params = <...>
			}
			{
				text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <...>
			}
		]
	}
endscript

script xboxlive_menu_friends_item_choose_remove 
	NetSessionFunc Obj = presence func = remove_friend params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_accept_friend_request 
	NetSessionFunc Obj = presence func = accept_friendship params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_reject_friend_request 
	NetSessionFunc Obj = presence func = reject_friendship params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_back_from_attachment 
	xboxlive_dialog_box_exit
	xboxlive_menu_friends_item_choose <...>
endscript

script xboxlive_menu_async_retrieve_message 
	Wait \{1
		Frame}
	begin
	NetSessionFunc \{Obj = presence
		func = pump_download}
	if NetSessionFunc \{Obj = presence
			func = download_complete}
		break
	endif
	Wait \{1
		Frame}
	repeat
	if NetSessionFunc \{Obj = presence
			func = download_succeeded}
		xboxlive_dialog_box_exit
		xboxlive_menu_friends_present_voicemail_options <...>
	else
		NetSessionFunc \{Obj = auth
			func = get_user_device_index}
		xboxlive_dialog_box_exit
		create_dialog_box {title = $net_status_msg
			text = $net_error_failed_msg_retrieval
			exclusive_device = <user_index>
			buttons = [{text = net_answer_ok pad_choose_script = xboxlive_menu_friends_item_back_from_attachment pad_choose_params = <...>}]
		}
	endif
endscript

script xboxlive_menu_friends_send_feedback 
	NetSessionFunc Obj = presence func = send_feedback params = {feedback = <feedback> <...> friend}
	xboxlive_menu_friends_present_voicemail_options <...>
endscript

script xboxlive_menu_friends_send_feedback_confirm 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	formatText TextName = dialog_text (net_title_confirm_compaint) s = <player_name>
	xboxlive_dialog_box {title = (net_friends_send_complaint)
		text = <dialog_text>
		exclusive_device = <user_index>
		buttons = [
			{text = net_answer_yes pad_choose_script = xboxlive_menu_friends_send_feedback pad_choose_params = <...>}
			{text = net_answer_no pad_choose_script = xboxlive_menu_friends_present_voicemail_options pad_choose_params = <...>}
		]
	}
endscript

script xboxlive_menu_friends_feedback 
	player_structure = <...>
	xboxlive_dialog_box {
		title = net_title_feedback
		text = (net_title_select_feedback + <player_name> + qs(0x3e76c330))
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_players_item_choose
		pad_back_params = <player_structure>
		buttons = [
			{
				text = net_title_complaints
				not_focusable = not_focusable
			}
			{
				text = net_title_offensive_msg
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_msg_inappropriate
					<player_structure>
				}
			}
			{
				text = net_title_cursing
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_lewdness
					<player_structure>
				}
			}
			{
				text = net_title_screaming
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_screaming
					<player_structure>
				}
			}
			{
				text = net_title_threats
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					feedback = neg_harassment
					<player_structure>
				}
			}
		]
	}
endscript

script xboxlive_menu_friends_present_voicemail_options 
	xboxlive_menu_record_voice_menu_create {
		accept_script = xboxlive_menu_friends_feedback
		accept_params = <...>
		cancel_script = xboxlive_menu_friends_item_back_from_attachment
		cancel_params = <...>
		mode = playback
	}
endscript

script xboxlive_menu_friends_item_choose_play_attachment 
	NetSessionFunc Obj = presence func = download_voice_attachment params = <...>
	xboxlive_dialog_box_exit
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	xboxlive_dialog_box {title = $net_status_msg
		text = $net_status_please_wait
		exclusive_device = <user_index>}
	SpawnScriptLater xboxlive_menu_async_retrieve_message params = <...>
endscript

script xboxlive_menu_friends_item_block_friend_request_confirm 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	xboxlive_menu_friends_item_choose_back
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	title_text = (net_friends_block_requests)
	formatText TextName = dialog_text (net_question_are_you_sure_block) s = <player_name>
	<dialog_callback> {
		title = <title_text>
		text = <dialog_text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		exclusive_device = <user_index>
		buttons = [
			{
				text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_block_friend_request
				pad_choose_params = <...>
			}
			{
				text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <...>
			}
		]
	}
endscript

script xboxlive_menu_friends_item_block_friend_request 
	NetSessionFunc Obj = presence func = block_friendship params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_cancel_invitation 
	NetSessionFunc Obj = presence func = cancel_invitation params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_cancel_friend_request 
	NetSessionFunc Obj = presence func = cancel_friend_request params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose 
	player_structure = <...>
	title = net_title_friends_menu
	switch <invite>
		case 1
		text = <player_name>
		if InNetGame
			buttons = [
				{
					text = net_friends_invite
					pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 2
		text = <player_name>
		if InNetGame
			buttons = [
				{
					text = net_friends_invite
					pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 3
		text = <player_name>
		joinable = 0
		if InNetGame
			if NetSessionFunc \{Obj = presence
					func = is_joinable}
				<joinable> = 1
			endif
		endif
		if (<joinable> = 1)
			if NetSessionFunc Obj = presence func = in_my_game params = <player_structure>
				buttons = [
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						text = net_friends_invite
						pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
						pad_choose_params = <player_structure>
					}
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		else
			buttons = [
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 4
		text = <player_name>
		joinable = 0
		if InNetGame
			if NetSessionFunc \{Obj = presence
					func = is_joinable}
				<joinable> = 1
			endif
		endif
		if (<joinable> = 1)
			if NetSessionFunc Obj = presence func = in_my_game params = <player_structure>
				buttons = [
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						text = net_friends_invite
						pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
						pad_choose_params = <player_structure>
					}
					{
						text = net_friends_join
						pad_choose_script = xboxlive_menu_friends_item_choose_follow
						pad_choose_params = <player_structure>
					}
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		else
			if NetSessionFunc Obj = presence func = in_my_game params = <player_structure>
				buttons = [
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						text = net_friends_join
						pad_choose_script = xboxlive_menu_friends_item_choose_follow
						pad_choose_params = <player_structure>
					}
					{
						text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		endif
		case 5
		text = (<player_name>)
		allow_message = 0
		if NetSessionFunc Obj = presence func = has_voice_attachment params = <player_structure>
			if NetSessionFunc \{Obj = voice
					func = voice_allowed}
				if NetSessionFunc \{Obj = voice
						func = voice_enabled}
					<allow_message> = 1
				endif
			endif
		endif
		if (<allow_message> = 1)
			buttons = [
				{
					text = net_friends_accept_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_follow
					pad_choose_params = {<player_structure> was_invited}
				}
				{
					text = net_friends_decline_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_listen_to_message
					pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = {<player_structure> remove}
				}
			]
		else
			buttons = [
				{
					text = net_friends_accept_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_follow
					pad_choose_params = {<player_structure> was_invited}
				}
				{
					text = net_friends_decline_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = {<player_structure> remove}
				}
			]
		endif
		case 6
		text = <player_name>
		buttons = [
			{
				text = net_friends_cancel_invitation
				pad_choose_script = xboxlive_menu_friends_item_choose_cancel_invitation
				pad_choose_params = <player_structure>
			}
			{
				text = net_friends_remove
				pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
				pad_choose_params = <player_structure>
			}
			{
				text = net_answer_cancel
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <player_structure>
			}
		]
		case 7
		text = (net_title_accept_friend_request + <player_name>)
		allow_message = 0
		if NetSessionFunc Obj = presence func = has_voice_attachment params = <player_structure>
			if NetSessionFunc \{Obj = voice
					func = voice_allowed}
				if NetSessionFunc \{Obj = voice
						func = voice_enabled}
					<allow_message> = 1
				endif
			endif
		endif
		if (<allow_message> = 1)
			buttons = [
				{
					text = net_answer_yes
					pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_no
					pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_listen_to_message
					pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_block
					pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					text = net_answer_yes
					pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
					pad_choose_params = <player_structure>
				}
				{
					text = net_answer_no
					pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
					pad_choose_params = <player_structure>
				}
				{
					text = net_friends_block
					pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 8
		text = (net_title_cancel_friend_request + <player_name>)
		buttons = [
			{
				text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_cancel_friend_request
				pad_choose_params = <player_structure>
			}
			{
				text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <player_structure>
			}
		]
		default
		printf qs(0x7c7eb0dd) d = <invite>
		return
	endswitch
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	<dialog_callback> {
		title = <title>
		text = <text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		buttons = <buttons>
	}
endscript

script xboxlive_menu_friends_blink_arrow 
	if (<direction> = up)
		ResolveScreenElementID \{id = {
				current_menu
				child = up_arrow
			}}
	endif
	if (<direction> = down)
		ResolveScreenElementID \{id = {
				current_menu
				child = down_arrow
			}}
	endif
	if ScreenElementExists id = <resolved_id>
		legacydoscreenelementmorph id = <resolved_id> alpha = 0
		legacydoscreenelementmorph id = <resolved_id> alpha = 1 time = 0.3
	endif
endscript

script xboxlive_menu_friends_netfunc_redirect 
	current_menu :GetSingleTag \{player_set}
	switch <player_set>
		case friends
		switch <action>
			case getnum
			NetSessionFunc \{Obj = presence
				func = get_num_friends}
			num_items_total = <num_friends>
			case addall
			xboxlive_menu_friends_get_friends_info
			NetSessionFunc Obj = presence func = fill_friends_list params = {start = <start_index> num = <items_on_page>}
			case getindex
			current_menu :GetSingleTag \{selected_player_name}
			if GotParam \{selected_player_name}
				NetSessionFunc Obj = presence func = get_player_index params = {player_name = <selected_player_name>}
				player_index = <index>
			endif
			default
			printf qs(0x52f2bea2) p = <player_set> a = <action>
		endswitch
		case players
		switch <action>
			case getnum
			num_items_total = 8
			case addall
			xboxlive_menu_friends_get_friends_info
			NetSessionFunc \{func = retrieve_current_players_list}
			case getindex
			current_menu :GetSingleTag \{selected_player_name}
			if GotParam \{selected_player_name}
				NetSessionFunc Obj = presence func = get_player_index params = {player_name = <selected_player_name> players}
				player_index = <index>
			endif
			default
			printf qs(0x52f2bea2) p = <player_set> a = <action>
		endswitch
		default
		ScriptAssert \{qs(0x4112ea96)}
	endswitch
	return <...>
endscript

script show_gamer_card 
	NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid>}
endscript

script submit_player_review 
	NetSessionFunc func = submitPlayerReview params = {player_xuid = <player_xuid>}
endscript
