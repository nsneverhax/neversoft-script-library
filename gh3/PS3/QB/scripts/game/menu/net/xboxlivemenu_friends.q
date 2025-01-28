
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

script xboxlive_menu_friends_refresh \{PARENT = root_window
		menu_id = friends_menu
		vmenu_id = friends_vmenu
		pad_back_script = xboxlive_menu_back_from_friends_list
		Pos = (25.0, 100.0)
		Spacing = 2
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
			Text = net_friends_list
			Pos = (50.0, 50.0)
			rgba = [
				9
				120
				25
				128
			]
			Scale = 2
			font = text_A1
		}
		grid_index = 0
		player_set = friends}
	if NOT ScreenElementExists Id = <menu_id>
		SetScreenElementLock Id = <PARENT> OFF
		make_cas_menu {
			Title = (<title_props>.Text)
			pad_back_script = <pad_back_script>
			pad_back_params = <pad_back_params>
			menu_id = <menu_id>
			vmenu_id = <vmenu_id>
			PARENT = <PARENT>
			PauseMenu
		}
		SetScreenElementProps {
			Id = <vmenu_id>
			event_handlers = [
				{pad_up xboxlive_menu_friends_blink_arrow Params = {direction = UP}}
				{pad_down xboxlive_menu_friends_blink_arrow Params = {direction = DOWN}}
			]
			tags = {
				<tags>
				item_props = <item_props>
				player_set = <player_set>
				dialog_callback = <dialog_callback>
			}
		}
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
					ScriptAssert \{"Found index that was too high"}
				endif
				Mod A = <player_index> B = <items_on_page>
				grid_index = <Mod>
				page = (<player_index> / <items_on_page>)
				current_menu :SetTags start_index = (<page> * <items_on_page>)
			endif
		endif
	endif
	LaunchEvent \{Type = unfocus
		Target = current_menu}
	DestroyScreenElement \{Id = current_menu
		preserve_parent}
	current_menu :SetTags \{allow_new_items}
	if GotParam \{add_arrows}
		xboxlive_menu_friends_arrow_add \{direction = UP}
	else
		xboxlive_menu_friends_arrow_add
	endif
	xboxlive_menu_friends_netfunc_redirect \{action = addall}
	if GotParam \{add_arrows}
		xboxlive_menu_friends_arrow_add \{direction = DOWN}
	endif
	current_menu :RemoveTags \{[
			allow_new_items
		]}
	SetScreenElementLock \{Id = current_menu
		ON}
	cas_menu_finish Index = <grid_index>
endscript

script xboxlive_menu_friends_get_friends_info 
	xboxlive_menu_friends_netfunc_redirect \{action = getnum}
	friends_vmenu :GetSetOfTags \{[
			start_index
			items_on_page
		]}
	return <...>
endscript

script xboxlive_menu_friends_page \{direction = DOWN}
	DisassociateFromObject
	xboxlive_menu_friends_get_friends_info
	if (<direction> = UP)
		grid_index = <items_on_page>
		if (<start_index> = 0)
			pages = (<num_items_total> / <items_on_page>)
			start_index = (<pages> * <items_on_page>)
		else
			start_index = (<start_index> - <items_on_page>)
		endif
	endif
	if (<direction> = DOWN)
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
		return \{TRUE}
	else
		return \{FALSE}
	endif
endscript

script xboxlive_menu_friends_arrow_add 
	if NOT current_menu :GetSingleTag \{allow_new_items}
		return
	endif
	if GotParam \{direction}
		if (<direction> = UP)
			Id = up_arrow
			Text = net_title_up
		endif
		if (<direction> = DOWN)
			Id = down_arrow
			Text = net_title_down
		endif
		item_params = {
			event_handlers = [
				{
					Focus
					xboxlive_menu_friends_page
					Params = {
						direction = <direction>
					}
				}
				{
					unfocus
					NullScript
				}
			]
		}
	else
		Id = padding
		Text = ""
		item_params = {NOT_FOCUSABLE}
	endif
	SetScreenElementLock \{Id = current_menu
		OFF}
	current_menu :GetSingleTag \{item_props}
	CreateScreenElement {
		Type = TextElement
		PARENT = friends_vmenu
		local_id = <Id>
		Text = <Text>
		font = (<item_props>.font)
		rgba = [128 128 128 128]
		Scale = 1
		just = [LEFT Top]
		z_priority = 2
		dimp = (<item_props>.bg_dims)
		<item_params>
		tags = {
			tag_grid_x = 1000
		}
	}
endscript

script xboxlive_menu_friends_separator_add \{Text = "------------------------------------------------------------------"}
	if NOT current_menu :GetSingleTag \{allow_new_items}
		return
	endif
	current_menu :GetSingleTag \{item_props}
	SetScreenElementLock \{Id = current_menu
		OFF}
	CreateScreenElement \{Type = ContainerElement
		PARENT = current_menu
		just = [
			LEFT
			Top
		]
		Dims = (640.0, 23.0)
		Alpha = 0.6
		NOT_FOCUSABLE}
	parent_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		local_id = Text
		Pos = (60.0, 3.0)
		Text = <Text>
		font = (<item_props>.font)
		rgba = (<item_props>.unhighlight_rgba)
		Scale = (<item_props>.Scale)
		just = [LEFT Top]
		z_priority = 2
		NOT_FOCUSABLE
	}
endscript

script xboxlive_menu_recent_players_separator_add 
	xboxlive_menu_friends_separator_add \{Text = "Recent Players"}
endscript

script xboxlive_menu_friends_item_add {
	}
	user_index = 0
	if NOT ScreenElementExists \{Id = friends_vmenu}
		Printf \{"Warning! tried to add a player when friends menu not up"}
		return
	endif
	current_menu :GetSingleTag \{item_props}
	if NOT ScreenElementExists Id = {current_menu child = <player_id>}
		if NOT current_menu :GetSingleTag \{allow_new_items}
			return
		endif
		if GetScreenElementChildren \{Id = current_menu}
			GetArraySize <children>
			tag_grid_x = (<array_Size> -1)
			RemoveParameter \{children}
		else
			tag_grid_x = 0
		endif
		SetScreenElementLock \{Id = current_menu
			OFF}
		add_cas_menu_item {
			local_id = <player_id>
			Text = ""
		}
		SetScreenElementProps {
			Id = <item_container_id>
			tags = {tag_grid_x = <tag_grid_x>}
		}
		GetScreenElementProps {
			Id = {<item_container_id> child = Text}
		}
		text_scale = <Scale>
		CreateScreenElement {
			Type = TextElement
			local_id = Cash
			Text = "test"
			font = text_A1
			Scale = <text_scale>
			PARENT = <item_container_id>
			Pos = (20.0, 0.0)
			just = [LEFT Center]
		}
	else
		Printf \{"Screen element already exists"}
	endif
	SetScreenElementProps {
		Id = {current_menu child = <player_id>}
		event_handlers = [
			{Focus xboxlive_menu_friends_item_focus Params = {player_name = <player_name>}}
			{unfocus xboxlive_menu_friends_item_unfocus}
		]
	}
	SetScreenElementProps {
		Id = {current_menu child = <player_id>}
		Replace_Handlers
		event_handlers = [
			{
				pad_choose
				(<item_props>.pad_choose_script)
				Params = {
					player_id = <player_id>
					player_name = <player_name>
					voice = <voice>
					invite = <invite>
					Title = <Title>
				}
			}
		]
	}
	SetScreenElementProps {
		Id = {current_menu child = {<player_id> child = Text}}
		Text = <player_name>
	}
	NetGetPlayerCash player_id = <player_num>
	PrintStruct <...>
	FormatText TextName = player_cash_string "$%d" D = <player_cash>
	SetScreenElementProps {
		Id = {current_menu child = {<player_id> child = Cash}}
		Text = <player_cash_string>
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
	ResolveScreenElementID Id = {current_menu child = {<player_id> child = <local_id>}}
	if ScreenElementExists Id = <resolved_id>
		DestroyScreenElement Id = <resolved_id>
	endif
	if GotParam \{Param}
		SetScreenElementLock Id = {current_menu child = <player_id>} OFF
		GetArraySize \{options}
		I = 0
		begin
		if ((<options> [<I>].val) = <Param>)
			texture = (<options> [<I>].texture)
			break
		endif
		I = (<I> + 1)
		repeat <array_Size>
		if NOT GotParam \{texture}
			return
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {current_menu child = <player_id>}
			local_id = <local_id>
			texture = <texture>
			rgba = <rgba>
			just = [LEFT Center]
			Scale = <Scale>
			Pos = <Pos>
		}
	endif
endscript

script xboxlive_menu_friends_item_focus 
	Obj_GetID
	current_menu :GetSingleTag \{item_props}
	if ScreenElementExists Id = {<ObjID> child = Cash}
		Printf \{"--- focus a;lskdfjal;skdjf;alsdkfj;alsdkjf;alskdfja;lsdkjfasdf"}
		SetScreenElementProps {
			Id = {<ObjID> child = Cash}
			rgba = ($goal_ui_scheme.MAIN)
		}
	endif
	current_menu :SetTags selected_player_name = <player_name>
endscript

script xboxlive_menu_friends_item_unfocus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = Cash}
		SetScreenElementProps {
			Id = {<ObjID> child = Cash}
			rgba = [128 128 128 240]
		}
	endif
endscript

script xboxlive_menu_friends_item_choose_back 
	DisassociateFromObject
	xboxlive_dialog_box_exit
	LaunchEvent \{Type = Focus
		Target = current_menu}
	SetScreenElementLock \{Id = friends_menu
		OFF}
	create_helper_text \{$generic_helper_text
		helper_pos = (320.0, 426.0)}
endscript

script xboxlive_menu_friends_item_context_action 
	Printf \{"xboxlive_menu_friends_item_context_action"}
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
		xboxlive_dialog_box {Title = net_friends_attach_voice
			Text = net_title_attach_voice
			exclusive_device = <user_index>
			buttons = [
				{Text = net_answer_yes pad_choose_script = xboxlive_menu_record_voice_menu_create pad_choose_params = {accept_script = xboxlive_menu_friends_item_choose_invite accept_params = {<...> voice_msg} cancel_script = xboxlive_menu_friends_item_choose_back}}
				{Text = net_answer_no pad_choose_script = xboxlive_menu_friends_item_choose_invite pad_choose_params = <...>}
				{Text = net_answer_cancel pad_choose_script = xboxlive_menu_friends_item_choose_back}
			]
		}
	else
		xboxlive_menu_friends_item_choose_invite <...>
	endif
endscript

script xboxlive_menu_friends_item_choose_invite 
	NetSessionFunc Obj = presence func = invite_friend Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_reject_invitation 
	NetSessionFunc Obj = presence func = reject_invitation Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_follow 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	if NetSessionFunc Obj = presence func = follow_friend Params = <...>
		if GotParam \{same_title}
			xboxlive_menu_friends_item_choose_back
			xboxlive_menu_back_from_friends_list
			if InNetGame
				launch_quit_game_dialog
			else
				if InFrontEnd
					menu_stack_clear
					xboxlive_menu_create
				else
					if GameModeEquals \{is_career}
						career_mode_quit_dialog
					else
						if GameModeEquals \{is_cat}
							Change \{main_menu_return_to_createamodes = 0}
							launch_quit_cat_dialog
						else
							menu_confirm_quit
						endif
					endif
				endif
			endif
		else
			LaunchEvent \{Type = unfocus
				Target = current_menu}
			current_menu :GetSingleTag \{dialog_callback}
			if GotParam \{was_invited}
				Title_text = net_friends_accepted_invitation
			else
				Title_text = net_friends_join_friend
			endif
			main_text = (net_friends_eject_disc + <Title> + "\\n\\n" + z_mainmenu_str_310)
			<dialog_callback> {
				Title = <Title_text>
				Text = <main_text>
				text_dims = (400.0, 0.0)
				pad_back_script = xboxlive_menu_friends_item_choose_back
				exclusive_device = <user_index>
				no_bg
				buttons = [
					{
						Text = net_answer_cancel
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
		Target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	Title_text = (net_title_remove)
	FormatText TextName = dialog_text (net_question_are_you_sure_remove) S = <player_name>
	<dialog_callback> {
		Title = <Title_text>
		Text = <dialog_text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		exclusive_device = <user_index>
		no_bg
		buttons = [
			{
				Text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_choose_remove
				pad_choose_params = <...>
			}
			{
				Text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <...>
			}
		]
	}
endscript

script xboxlive_menu_friends_item_choose_remove 
	NetSessionFunc Obj = presence func = remove_friend Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_accept_friend_request 
	NetSessionFunc Obj = presence func = accept_friendship Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_reject_friend_request 
	NetSessionFunc Obj = presence func = reject_friendship Params = <...>
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
			func = DOWNLOAD_COMPLETE}
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
		create_dialog_box {Title = $net_status_msg
			Text = $net_error_failed_msg_retrieval
			exclusive_device = <user_index>
			buttons = [{Text = net_answer_ok pad_choose_script = xboxlive_menu_friends_item_back_from_attachment pad_choose_params = <...>}]
		}
	endif
endscript

script xboxlive_menu_friends_send_feedback 
	NetSessionFunc Obj = presence func = send_feedback Params = {FEEDBACK = <FEEDBACK> <...> friend}
	xboxlive_menu_friends_present_voicemail_options <...>
endscript

script xboxlive_menu_friends_send_feedback_confirm 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	FormatText TextName = dialog_text (net_title_confirm_compaint) S = <player_name>
	xboxlive_dialog_box {Title = (net_friends_send_complaint)
		Text = <dialog_text>
		exclusive_device = <user_index>
		buttons = [
			{Text = net_answer_yes pad_choose_script = xboxlive_menu_friends_send_feedback pad_choose_params = <...>}
			{Text = net_answer_no pad_choose_script = xboxlive_menu_friends_present_voicemail_options pad_choose_params = <...>}
		]
	}
endscript

script xboxlive_menu_friends_feedback 
	player_structure = <...>
	xboxlive_dialog_box {
		Title = net_title_feedback
		Text = (net_title_select_feedback + <player_name> + "'")
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_players_item_choose
		pad_back_params = <player_structure>
		no_bg
		buttons = [
			{
				Text = net_title_complaints
				NOT_FOCUSABLE = NOT_FOCUSABLE
			}
			{
				Text = net_title_offensive_msg
				pad_choose_script = xboxlive_menu_players_send_feedback_confirm
				pad_choose_params = {
					FEEDBACK = neg_msg_inappropriate
					<player_structure>
				}
			}
			{
				Text = net_title_cursing
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					FEEDBACK = neg_lewdness
					<player_structure>
				}
			}
			{
				Text = net_title_screaming
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					FEEDBACK = neg_screaming
					<player_structure>
				}
			}
			{
				Text = net_title_threats
				pad_choose_script = xboxlive_menu_friends_send_feedback_confirm
				pad_choose_params = {
					FEEDBACK = neg_harassment
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
	NetSessionFunc Obj = presence func = download_voice_attachment Params = <...>
	xboxlive_dialog_box_exit
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	xboxlive_dialog_box {Title = $net_status_msg
		Text = $net_status_please_wait
		exclusive_device = <user_index>}
	SpawnScriptLater xboxlive_menu_async_retrieve_message Params = <...>
endscript

script xboxlive_menu_friends_item_block_friend_request_confirm 
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	xboxlive_menu_friends_item_choose_back
	LaunchEvent \{Type = unfocus
		Target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	Title_text = (net_friends_block_requests)
	FormatText TextName = dialog_text (net_question_are_you_sure_block) S = <player_name>
	<dialog_callback> {
		Title = <Title_text>
		Text = <dialog_text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		exclusive_device = <user_index>
		no_bg
		buttons = [
			{
				Text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_block_friend_request
				pad_choose_params = <...>
			}
			{
				Text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <...>
			}
		]
	}
endscript

script xboxlive_menu_friends_item_block_friend_request 
	NetSessionFunc Obj = presence func = block_friendship Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose_cancel_invitation 
	NetSessionFunc Obj = presence func = cancel_invitation Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_cancel_friend_request 
	NetSessionFunc Obj = presence func = cancel_friend_request Params = <...>
	xboxlive_menu_friends_item_choose_back
endscript

script xboxlive_menu_friends_item_choose 
	player_structure = <...>
	Title = net_title_friends_menu
	switch <invite>
		case 1
		Text = <player_name>
		if InNetGame
			buttons = [
				{
					Text = net_friends_invite
					pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 2
		Text = <player_name>
		if InNetGame
			buttons = [
				{
					Text = net_friends_invite
					pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 3
		Text = <player_name>
		joinable = 0
		if InNetGame
			if NetSessionFunc \{Obj = presence
					func = is_joinable}
				<joinable> = 1
			endif
		endif
		if (<joinable> = 1)
			if NetSessionFunc Obj = presence func = in_my_game Params = <player_structure>
				buttons = [
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						Text = net_friends_invite
						pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
						pad_choose_params = <player_structure>
					}
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		else
			buttons = [
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_cancel
					pad_choose_script = xboxlive_menu_friends_item_choose_back
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 4
		Text = <player_name>
		joinable = 0
		if InNetGame
			if NetSessionFunc \{Obj = presence
					func = is_joinable}
				<joinable> = 1
			endif
		endif
		if (<joinable> = 1)
			if NetSessionFunc Obj = presence func = in_my_game Params = <player_structure>
				buttons = [
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						Text = net_friends_invite
						pad_choose_script = xboxlive_menu_friends_item_choose_invite_prompt
						pad_choose_params = <player_structure>
					}
					{
						Text = net_friends_join
						pad_choose_script = xboxlive_menu_friends_item_choose_follow
						pad_choose_params = <player_structure>
					}
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		else
			if NetSessionFunc Obj = presence func = in_my_game Params = <player_structure>
				buttons = [
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			else
				buttons = [
					{
						Text = net_friends_join
						pad_choose_script = xboxlive_menu_friends_item_choose_follow
						pad_choose_params = <player_structure>
					}
					{
						Text = net_friends_remove
						pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
						pad_choose_params = <player_structure>
					}
					{
						Text = net_answer_cancel
						pad_choose_script = xboxlive_menu_friends_item_choose_back
						pad_choose_params = <player_structure>
					}
				]
			endif
		endif
		case 5
		Text = (<player_name>)
		allow_message = 0
		if NetSessionFunc Obj = presence func = has_voice_attachment Params = <player_structure>
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
					Text = net_friends_accept_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_follow
					pad_choose_params = {<player_structure> was_invited}
				}
				{
					Text = net_friends_decline_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_listen_to_message
					pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = {<player_structure> Remove}
				}
			]
		else
			buttons = [
				{
					Text = net_friends_accept_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_follow
					pad_choose_params = {<player_structure> was_invited}
				}
				{
					Text = net_friends_decline_invitation
					pad_choose_script = xboxlive_menu_friends_item_choose_reject_invitation
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_remove
					pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
					pad_choose_params = {<player_structure> Remove}
				}
			]
		endif
		case 6
		Text = <player_name>
		buttons = [
			{
				Text = net_friends_cancel_invitation
				pad_choose_script = xboxlive_menu_friends_item_choose_cancel_invitation
				pad_choose_params = <player_structure>
			}
			{
				Text = net_friends_remove
				pad_choose_script = xboxlive_menu_friends_item_choose_remove_confirm
				pad_choose_params = <player_structure>
			}
			{
				Text = net_answer_cancel
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <player_structure>
			}
		]
		case 7
		Text = (net_title_accept_friend_request + <player_name>)
		allow_message = 0
		if NetSessionFunc Obj = presence func = has_voice_attachment Params = <player_structure>
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
					Text = net_answer_yes
					pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_no
					pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_listen_to_message
					pad_choose_script = xboxlive_menu_friends_item_choose_play_attachment
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_block
					pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
					pad_choose_params = <player_structure>
				}
			]
		else
			buttons = [
				{
					Text = net_answer_yes
					pad_choose_script = xboxlive_menu_friends_item_accept_friend_request
					pad_choose_params = <player_structure>
				}
				{
					Text = net_answer_no
					pad_choose_script = xboxlive_menu_friends_item_reject_friend_request
					pad_choose_params = <player_structure>
				}
				{
					Text = net_friends_block
					pad_choose_script = xboxlive_menu_friends_item_block_friend_request_confirm
					pad_choose_params = <player_structure>
				}
			]
		endif
		case 8
		Text = (net_title_cancel_friend_request + <player_name>)
		buttons = [
			{
				Text = net_answer_yes
				pad_choose_script = xboxlive_menu_friends_item_cancel_friend_request
				pad_choose_params = <player_structure>
			}
			{
				Text = net_answer_no
				pad_choose_script = xboxlive_menu_friends_item_choose_back
				pad_choose_params = <player_structure>
			}
		]
		default
		Printf "don't know what to do for this invite: %d" D = <invite>
		return
	endswitch
	LaunchEvent \{Type = unfocus
		Target = current_menu}
	current_menu :GetSingleTag \{dialog_callback}
	NetSessionFunc \{Obj = auth
		func = get_user_device_index}
	<dialog_callback> {
		Title = <Title>
		Text = <Text>
		text_dims = (400.0, 0.0)
		pad_back_script = xboxlive_menu_friends_item_choose_back
		no_bg
		buttons = <buttons>
	}
endscript

script xboxlive_menu_friends_blink_arrow 
	if (<direction> = UP)
		ResolveScreenElementID \{Id = {
				current_menu
				child = up_arrow
			}}
	endif
	if (<direction> = DOWN)
		ResolveScreenElementID \{Id = {
				current_menu
				child = down_arrow
			}}
	endif
	if ScreenElementExists Id = <resolved_id>
		DoScreenElementMorph Id = <resolved_id> Alpha = 0
		DoScreenElementMorph Id = <resolved_id> Alpha = 1 Time = 0.3
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
			NetSessionFunc Obj = presence func = fill_friends_list Params = {Start = <start_index> num = <items_on_page>}
			case getindex
			current_menu :GetSingleTag \{selected_player_name}
			if GotParam \{selected_player_name}
				NetSessionFunc Obj = presence func = get_player_index Params = {player_name = <selected_player_name>}
				player_index = <Index>
			endif
			default
			Printf "Bad action: player set: %p, action: %a" P = <player_set> A = <action>
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
				NetSessionFunc Obj = presence func = get_player_index Params = {player_name = <selected_player_name> players}
				player_index = <Index>
			endif
			default
			Printf "Bad action: player set: %p, action: %a" P = <player_set> A = <action>
		endswitch
		default
		ScriptAssert \{"eh"}
	endswitch
	return <...>
endscript

script show_gamer_card 
	NetSessionFunc func = ShowGamerCard Params = {player_xuid = <player_xuid>}
endscript

script submit_player_review 
	NetSessionFunc func = submitPlayerReview Params = {player_xuid = <player_xuid>}
endscript
