
script band_lobby_create_popup_menu \{list_type = player}
	printf \{channel = Band_Lobby
		qs(0xc811e689)}
	RequireParams \{[
			Menu
			container
		]
		all}
	if ScreenElementExists id = <container>
		if ScreenElementExists \{id = current_band_lobby_popup}
			LaunchEvent \{type = unfocus
				target = band_lobby_popup_menu}
			DestroyScreenElement id = <container> preserve_parent
		endif
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		back_script = band_lobby_destroy_popup_menu
		back_params = {container = <container>}
		band_lobby_popup_get_exclusive_devices <...>
		<container> :SE_SetProps exclusive_device = <exclusive_devices>
		if GotParam \{controller}
			player = -1
		else
			GetPlayerInfo <player> controller
		endif
		switch <Menu>
			case friendslist
			band_lobby_create_popup_menu_friendslist parent = <container> player = <player>
			case playerslist
			band_lobby_create_popup_menu_players_list parent = <container> player = <player> list_type = <list_type> is_popup = 1
			if checksumequals a = <list_type> b = matchmaking
				Menu = matchmaking
				if NetSessionFunc \{Obj = party
						func = is_host}
					back_script = band_lobby_cancel_matchmaking
					back_params = {container = <container>}
				else
					back_script = empty_script
					back_params = {}
				endif
			elseif checksumequals a = <list_type> b = matchmaking_done
				Menu = matchmaking_done
				back_script = empty_script
				back_params = {}
			else
				back_script = band_lobby_destroy_popup_menu
				back_params = {container = <container>}
			endif
			case game_rules
			band_lobby_create_popup_menu_game_rules parent = <container> is_popup = 1 filter = all exclusive_devices = <exclusive_devices>
			back_script = band_lobby_return_from_game_rules
			case leave_lobby
			band_lobby_create_popup_menu_leave_lobby parent = <container> player = <player> msg_checksum = <msg_checksum> <...>
			case error_msg
			band_lobby_create_popup_menu_generic_error parent = <container> player = <player> msg_checksum = ($g_band_lobby_error_msg)
			case generic_vote
			band_lobby_create_popup_generic_vote parent = <container> player = <player> voting_items_array = <voting_items_array>
			back_script = band_lobby_cancel_voting
			back_params = {container = <container>}
			case change_profile
			band_lobby_create_popup_change_profile parent = <container> player = <player> controller = <controller> msg_checksum = <msg_checksum> viewport_index = <viewport_index>
			Menu = generic_popup
			case teams
			band_lobby_create_popup_teams parent = <container> player = <player>
			if ($g_lobby_net_state != local)
				back_script = generic_event_choose
				back_params = {state = UIstate_online_quit_warning data = {player_device = <controller>}}
			endif
			case delete_rocker
			band_lobby_create_popup_menu_delete_rocker parent = <container> player = <player> viewport_index = <viewport_index>
			default
			ScriptAssert \{qs(0xc49f902e)}
		endswitch
		if GotParam \{vmenu}
			AssignAlias id = <vmenu> alias = band_lobby_popup_menu
		else
			ScriptAssert \{qs(0x47c72c53)}
		endif
		band_lobby_update_button_helpers Menu = <Menu> player = <player> controller = <controller>
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :SetTags {
				Menu = <Menu>
				player = <player>
			}
		endif
		<container> :SE_GetParentID
		<parent_id> :SE_SetProps alpha = 1.0 time = 0.2
		<parent_id> :SE_WaitProps
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :SE_SetProps {
				event_handlers = [
					{pad_back <back_script> params = <back_params>}
				]
				replace_handlers
				tags = {
					Menu = <Menu>
					player = <player>
				}
			}
		endif
		if ScreenElementExists \{id = band_lobby_popup_menu}
			if GotParam \{index_to_focus}
				LaunchEvent type = focus target = band_lobby_popup_menu data = {child_index = <index_to_focus>}
			else
				LaunchEvent \{type = focus
					target = band_lobby_popup_menu}
			endif
		endif
	else
		printf \{qs(0x8e50f870)}
	endif
endscript

script bl_refresh_popup_button_helpers 
	RequireParams \{[
			Menu
			player
			controller
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xe50ef504)}
	begin
	if IsScreenElementInFocus \{id = band_lobby_popup_menu}
		band_lobby_update_button_helpers Menu = <Menu> player = <player> controller = <controller>
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_destroy_popup_menu \{animate = 1}
	printf \{channel = Band_Lobby
		qs(0x36403b5f)}
	SoundEvent \{event = lobbyback_sfx}
	killspawnedscript \{name = band_lobby_friendslist_callback_spawned}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :Desc_ResolveAlias \{name = alias_pu_cont_parent
				param = popup_cont}
			band_lobby_kick_leader_out_of_band_manage
			if ScreenElementExists \{id = band_lobby_popup_menu}
				LaunchEvent \{type = unfocus
					target = band_lobby_popup_menu}
			endif
			if (<animate> = 1)
				<popup_cont> :SE_GetParentID
				<parent_id> :SE_SetProps alpha = 0.0 time = 0.2
				<parent_id> :SE_WaitProps
			endif
			DestroyScreenElement id = <popup_cont> preserve_parent
			band_lobby_update_button_helpers
			if NOT GotParam \{no_focus}
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	endif
endscript

script band_lobby_popup_get_exclusive_devices 
	RequireParams \{[
			Menu
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xe9e62f3f)}
	if GotParam \{controller}
		player = -1
	else
		GetPlayerInfo <player> controller
	endif
	get_all = 0
	array = []
	if ((<Menu> = generic_vote) || (<Menu> = teams))
		if (<Menu> = teams)
			if ($g_lobby_net_state = local)
				get_all = 1
			endif
		else
			get_all = 1
		endif
	endif
	if (<Menu> = playerslist)
		if (<list_type> = matchmaking_done)
			get_all = 1
		endif
	endif
	if (<get_all> = 1)
		GetNumPlayersInGame \{local}
		if (<num_players> > 0)
			GetFirstPlayer \{local}
			begin
			GetPlayerInfo <player> controller
			AddArrayElement array = <array> element = <controller>
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
	else
		AddArrayElement array = <array> element = <controller>
	endif
	return exclusive_devices = <array>
endscript

script band_lobby_create_popup_menu_generic_error 
	RequireParams \{[
			parent
			player
			msg_checksum
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xa94ca893)}
	GetPlayerInfo <player> GamerTag
	GetPlayerInfo <player> controller
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		template = no_options
		body_text = ($band_lobby_strings.<msg_checksum>)
	}
	AssignAlias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :SE_SetProps dlog_gamertag_text = ($<GamerTag>)
	Change \{g_band_lobby_error_msg = null}
	Change \{g_leader_player_num = -1}
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_create_popup_generic_vote 
	RequireParams \{[
			parent
			voting_items_array
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xe2ca7aa7)}
	CreateScreenElement {
		parent = <parent>
		type = DescInterface
		desc = 'band_lobby_pu_generic_vote'
		z_priority = 20.0
	}
	AssignAlias id = <id> alias = current_band_lobby_popup
	GetPlayerInfo <player> GamerTag
	<id> :SE_SetProps pu_gamertag_text = ($<GamerTag>)
	Change \{g_vote_counts = [
			0
			0
		]}
	Change \{g_controllers_that_voted = [
		]}
	ResolveScreenElementID id = [
		{id = <id>}
		{local_id = band_lobby_pu_generic_vote_cont}
		{local_id = pu_menu}
	]
	menu_id = <resolved_id>
	array = []
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> controller
		AddArrayElement array = <array> element = <controller>
		GetNextPlayer player = <player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	GetArraySize <voting_items_array>
	if (<array_size> > 0)
		array = []
		i = 0
		begin
		ResolveScreenElementID id = [
			{id = <menu_id>}
			{index = <i>}
			{local_id = vote_item}
		]
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :SE_SetProps text = (<voting_items_array> [<i>].text)
			if (<i> < 2)
				FormatText TextName = button_helper_string qs(0xc19e6243) d = (<voting_items_array> [<i>].text)
				FormatText checksumname = helper_text_global 'g_vote_items_text_helper_%d' d = <i>
				Change globalname = <helper_text_global> newValue = <button_helper_string>
				if (<i> = 0)
					AddArrayElement array = <array> element = {pad_option cast_vote params = {option = <i>}}
				elseif (<i> = 1)
					AddArrayElement array = <array> element = {pad_option2 cast_vote params = {option = <i>}}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		event_handlers = <array>
	endif
	current_band_lobby_popup :Obj_SpawnScriptNow \{band_lobby_update_voting_timer}
	<menu_id> :Obj_SpawnScriptNow band_lobby_update_vote params = {voting_items_array = <voting_items_array>}
	<menu_id> :SE_SetProps event_handlers = <event_handlers>
	return vmenu = <menu_id> exclusive_devices = <controllers_allowed_to_vote>
endscript

script band_lobby_create_popup_menu_leave_lobby 
	printf \{channel = Band_Lobby
		qs(0x3c0a4772)}
	RequireParams \{[
			parent
			player
			msg_checksum
		]
		all}
	GetPlayerInfo <player> GamerTag
	GetPlayerInfo <player> controller
	switch <msg_checksum>
		case leave_msg_party
		stay_text = ($band_lobby_strings.button_party_stay)
		leave_text = ($band_lobby_strings.button_party_leave)
		case leave_msg_matchmade
		stay_text = ($band_lobby_strings.button_match_stay)
		leave_text = ($band_lobby_strings.button_match_leave)
		case leave_msg_net
		case leave_msg_local
		case leave_msg_local_playlist
		default
		stay_text = ($band_lobby_strings.button_lobby_stay)
		leave_text = ($band_lobby_strings.button_lobby_leave)
	endswitch
	array = [
		{
			text = <stay_text>
			func = band_lobby_destroy_popup_menu
			func_params = {
				container = <parent>
			}
		}
		{
			text = <leave_text>
			func = band_lobby_destroy_popup_and_run_quit_script
			func_params = {
				container = <parent>
				player = <player>
				choose_script = <choose_script>
				viewport_index = <submenu_index>
			}
		}
	]
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		body_text = ($band_lobby_strings.<msg_checksum>)
		options = <array>
	}
	add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
	AssignAlias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :SE_SetProps dlog_gamertag_text = ($<GamerTag>)
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_create_popup_menu_delete_rocker 
	printf \{channel = Band_Lobby
		qs(0x28e09860)}
	RequireParams \{[
			parent
			player
		]
		all}
	GetPlayerInfo <player> GamerTag
	GetPlayerInfo <player> controller
	array = [
		{
			text = ($band_lobby_strings.button_back)
			func = band_lobby_destroy_popup_menu
			func_params = {
				container = <parent>
			}
		}
		{
			text = ($band_lobby_strings.button_delete_character)
			func = band_lobby_delete_saved_rocker_confirm
			func_params = {
				container = <parent>
				player = <player>
				viewport_index = <viewport_index>
			}
		}
	]
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		body_text = ($band_lobby_strings.rocker_delete_body)
		options = <array>
	}
	AssignAlias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :SE_SetProps dlog_gamertag_text = ($<GamerTag>)
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_destroy_popup_and_run_quit_script 
	printf \{channel = Band_Lobby
		qs(0x3319bb35)}
	band_lobby_destroy_popup_menu container = <container>
	if checksumequals a = <choose_script> b = band_lobby_go_back
		band_lobby_whole_band_autosave player = <player> choose_script = <choose_script> viewport_index = <viewport_index>
	else
		<choose_script>
	endif
endscript

script band_lobby_create_popup_menu_friendslist 
	printf \{channel = Band_Lobby
		qs(0x85abf013)}
	RequireParams \{[
			parent
			player
		]
		all}
	CreateScreenElement {
		parent = <parent>
		type = DescInterface
		desc = 'band_lobby_pu_friend'
		z_priority = 20.0
		pu_friends_online_num_text = qs(0x00000000)
		pu_friends_gh_num_text = qs(0x00000000)
	}
	AssignAlias id = <id> alias = current_band_lobby_popup
	GetPlayerInfo <player> GamerTag
	<id> :SE_SetProps pu_gamertag_text = ($<GamerTag>)
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_diamondBling3
			param = diamondBling3_id}
		<diamondBling3_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 50 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_diamondBling4
			param = diamondbling4_id}
		<diamondbling4_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 2 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_instrument_spinner
			param = spinner_id}
		<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_top_emit1}
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 5 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_right_emit1}
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_bottom_emit1}
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_left_emit1}
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if current_band_lobby_popup :Desc_ResolveAlias \{name = alias_pu_menu
			param = menu_id}
		<menu_id> :SetTags desc_id = current_band_lobby_popup
		if IsPS3
			if NetSessionFunc \{func = IsOldEnoughForOnline}
				if NOT InNetGame
					if ($g_career_search = null)
						<menu_id> :SE_SetProps {
							event_handlers = [
								{pad_option2 band_lobby_friendslist_view_invites params = {player = <player>}}
							]
						}
					endif
				endif
			endif
		elseif IsXenonOrWinDX
			NetSessionFunc \{Obj = plat_party
				func = get_num_party_players}
			if (<num_plat_party_players> = 0)
			else
				<menu_id> :SE_SetProps {
					event_handlers = [
						{pad_L1 band_lobby_friendslist_plat_party_invite}
					]
				}
			endif
		endif
		return vmenu = <menu_id>
	endif
endscript

script band_lobby_friendslist_plat_party_invite 
	printf \{qs(0x353257fe)}
	NetSessionFunc {
		Obj = plat_party
		func = invite_party_players
		params = {
			controller_index = <device_num>
		}
	}
endscript

script band_lobby_friendslist_view_invites 
	printf \{qs(0x07cfc22b)}
	if CheckForSignIn controller_index = <device_num>
		band_lobby_friendslist_really_view_invites
	else
		band_lobby_seamless_net_change {
			network = net_private
			player = <player>
			callback = band_lobby_friendslist_really_view_invites
			callback_params = {}
		}
	endif
endscript

script band_lobby_friendslist_really_view_invites 
	printf \{qs(0xbfb63486)}
	NetSessionFunc \{func = DisplayAndAcceptInvites
		params = {
			callback = nullscript
		}}
endscript

script band_lobby_popup_adjust_scroll_thumb 
	RequireParams \{[
			direction
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x6191d9b1)}
	if ScreenElementExists \{id = current_band_lobby_popup}
		Obj_GetID
		<objID> :Menu_GetSelectedIndex
		CountScreenElementChildren id = <objID>
		current_band_lobby_popup :SE_GetProps \{scrollbar_thumb_pos}
		if (<num_children> > 1)
			size_of_scrollbar = 300.0
			step = (<size_of_scrollbar> / (<num_children> - 1))
			if (<direction> = up)
				if (<selected_index> != 0)
					current_band_lobby_popup :SE_SetProps scrollbar_thumb_pos = (<scrollbar_thumb_pos> - ((0.0, 1.0) * <step>))
				else
					current_band_lobby_popup :SE_SetProps scrollbar_thumb_pos = (((1.0, 0.0) * (<scrollbar_thumb_pos>.(1.0, 0.0))) + (0.0, 524.0))
				endif
			elseif (<direction> = down)
				if (<selected_index> != (<num_children> - 1))
					current_band_lobby_popup :SE_SetProps scrollbar_thumb_pos = (<scrollbar_thumb_pos> + ((0.0, 1.0) * <step>))
				else
					current_band_lobby_popup :SE_SetProps scrollbar_thumb_pos = (((1.0, 0.0) * (<scrollbar_thumb_pos>.(1.0, 0.0))) + (0.0, 224.0))
				endif
			endif
		endif
	endif
endscript

script band_lobby_friendslist_callback 
	if IsPS3
		spawnscriptnow band_lobby_friendslist_callback_spawned params = {<...>}
	else
		spawnscriptnow band_lobby_friendslist_callback_spawned params = {<...> no_wait}
	endif
endscript

script band_lobby_friendslist_callback_spawned 
	printf \{channel = Band_Lobby
		qs(0x786596cd)}
	RequireParams \{[
			params
		]
		all}
	FormatText checksumname = submenu_data 'band_lobby_submenu_data_%d' d = (<params>.submenu_index)
	if IsPS3
		GetPlayerInfo ($<submenu_data>.player) controller out = this_controller
		if NOT NetSessionFunc func = IsMultiplayerAllowed params = {controller_index = <this_controller>}
			return
		endif
	endif
	if NOT GotParam \{no_wait}
		wait \{0.5
			second}
	endif
	GetPlayerInfo ($<submenu_data>.player) controller
	if ((GotParam friendlist) && (ScreenElementExists id = band_lobby_popup_menu))
		band_lobby_popup_menu :GetSingleTag \{Menu}
		if (<Menu> = friendslist)
			GetArraySize <friendlist>
			<rock_record_uids> = []
			if (<array_size> > 0)
				if ScreenElementExists \{id = current_band_lobby_popup}
					FormatText TextName = num_online qs(0x48c6d14c) d = <total_number_friends>
					FormatText TextName = num_gh qs(0x48c6d14c) d = <number_friends_playing_title>
					current_band_lobby_popup :SE_SetProps {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				i = 0
				begin
				if NOT CheckForSignIn controller_index = <controller> dont_set_primary
					CANT_INVITE = 1
				elseif (0 != <friendlist> [<i>].LocalPlayer)
					CANT_INVITE = 1
				elseif (0 != <friendlist> [<i>].AlreadyInGame)
					CANT_INVITE = 1
				elseif NOT ($g_career_search = null)
					CANT_INVITE = 1
				elseif IsPS3
					if NOT NetSessionFunc \{Obj = party
							func = is_party_session_available}
						CANT_INVITE = 1
					else
						CANT_INVITE = 0
					endif
				else
					CANT_INVITE = 0
				endif
				band_lobby_add_player_ui_to_popup {
					player_index = (-1)
					parent_id = band_lobby_popup_menu
					player_type_text = qs(0x00000000)
					GamerTag_text = (<friendlist> [<i>].name)
					net_id_first = (<friendlist> [<i>].id [0])
					net_id_second = (<friendlist> [<i>].id [1])
					friendstate = (<friendlist> [<i>].friendstate)
					sentfriendrequest = (<friendlist> [<i>].sentfriendrequest)
					sentinvite = (<friendlist> [<i>].sentinvite)
					CANT_INVITE = <CANT_INVITE>
					controlling_player = ($<submenu_data>.player)
					desc_id = 'band_lobby_player_info'
					rich_presence = (<friendlist> [<i>].richpresence)
				}
				array = []
				AddArrayElement array = <array> element = (<friendlist> [<i>].id [0])
				AddArrayElement array = <array> element = (<friendlist> [<i>].id [1])
				AddArrayElement array = <rock_record_uids> element = <array>
				<rock_record_uids> = <array>
				RemoveParameter \{array}
				<i> = (<i> + 1)
				repeat <array_size>
				if CheckForSignIn controller_index = <controller> dont_set_primary network_platform_only
					ReadLeaderboardByUIDList callback = band_lobby_rock_record_callback leaderboard_id = lb_rock_record user_id_list = <rock_record_uids>
				endif
				band_lobby_popup_menu :SE_SetProps {
					event_handlers = [
						{pad_up band_lobby_popup_adjust_scroll_thumb params = {direction = up}}
						{pad_up GH5_Band_Screen_UI_Sound params = {player_num = ($<submenu_data>.player) up = 1}}
						{pad_down band_lobby_popup_adjust_scroll_thumb params = {direction = down}}
						{pad_down GH5_Band_Screen_UI_Sound params = {player_num = ($<submenu_data>.player) down = 1}}
					]
				}
			else
				if ScreenElementExists \{id = current_band_lobby_popup}
					FormatText \{TextName = num_online
						qs(0x6160dbf3)}
					FormatText \{TextName = num_gh
						qs(0x6160dbf3)}
					current_band_lobby_popup :SE_SetProps {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				clean_up_user_control_helpers
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			endif
			band_lobby_popup_menu :GetSingleTag \{desc_id}
			if ScreenElementExists id = <desc_id>
				<desc_id> :SE_SetProps pu_spinner_cont_alpha = 0.0
			endif
		endif
	endif
endscript

script band_lobby_rock_record_callback 
	if ScreenElementExists \{id = band_lobby_popup_menu}
		<rows_size> = 0
		if GotParam \{rows}
			GetArraySize <rows>
			<rows_size> = <array_size>
		endif
		if band_lobby_popup_menu :GetSingleTag \{Menu}
			<valid_menu> = 0
			if (<Menu> = friendslist || <Menu> = playerslist || <Menu> = matchmaking_done)
				<valid_menu> = 1
			endif
			if (<status> != failed && <rows_size> > 0 && <valid_menu> = 1)
				if GetScreenElementChildren \{id = band_lobby_popup_menu}
					GetArraySize <children>
					<j> = 0
					begin
					if (<children> [<j>]) :GetSingleTag net_id
						<i> = 0
						begin
						<lb_net_id> = (<rows> [<i>].player_id)
						if (<net_id> [0] = <lb_net_id> [0] && <net_id> [1] = <lb_net_id> [1])
							if (<children> [<j>]) :GetSingleTag is_friends_list
								(<children> [<j>]) :SE_SetProps {
									event_handlers = [
										{pad_option display_rock_record params = {net_id = <lb_net_id> unfocus_id = band_lobby_popup_menu band_lobby_no_anim_in from_lobby}}
									]
								}
							else
								(<children> [<j>]) :GetSingleTag controlling_player
								(<children> [<j>]) :GetSingleTag select_actions
								(<children> [<j>]) :GetSingleTag player_index
								(<children> [<j>]) :SE_SetProps {
									event_handlers = [
										{
											pad_choose
											band_lobby_popup_create_submenu
											params = {
												select_actions = <select_actions>
												net_id = <lb_net_id>
												player = <player_index>
												controlling_player = <controlling_player>
												add_rock_record = 1
											}
										}
										{
											focus
											band_lobby_popup_change_focus
											params = {
												focus_type = focus
												select_actions = <select_actions>
												selectable = 1
												controlling_player = <controlling_player>
											}
										}
									]
									replace_handlers
								}
							endif
							(<children> [<j>]) :SE_SetProps right_icon_cont_alpha = 1 time = 0.5
							(<children> [<j>]) :SetTags {has_rock_record = 1}
						endif
						<i> = (<i> + 1)
						repeat <rows_size>
					endif
					<j> = (<j> + 1)
					repeat <array_size>
					band_lobby_popup_menu :SetTags \{rock_record_tags_have_been_set}
					LaunchEvent \{type = unfocus
						target = band_lobby_popup_menu}
					LaunchEvent \{type = focus
						target = band_lobby_popup_menu}
				endif
			endif
		endif
	endif
endscript

script band_lobby_popup_begin_polling_for_rock_record 
	Obj_GetID
	SE_GetParentID
	<parent_id> :Obj_KillSpawnedScript name = band_lobby_popup_poll_for_rock_record
	<parent_id> :Obj_SpawnScriptNow band_lobby_popup_poll_for_rock_record params = {id = <objID> controlling_player = <controlling_player>}
endscript

script band_lobby_popup_poll_for_rock_record 
	begin
	if NOT ScreenElementExists id = <id>
		return
	endif
	if GetSingleTag \{rock_record_tags_have_been_set}
		break
	endif
	wait \{1
		gameframe}
	repeat
	<id> :GetSingleTag has_rock_record
	if (<has_rock_record> = 1)
		if NOT user_control_helper_exists \{button = blue}
			GetPlayerInfo <controlling_player> controller
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_rock_record) button = blue z = 100000
		endif
	elseif user_control_helper_exists \{button = blue}
		user_control_destroy_helper \{button = blue}
	endif
endscript

script band_lobby_go_back_to_local_play 
	band_lobby_change_network player = <player> network = local focus = 0
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :SE_GetParentID
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
	Change \{g_lobby_invite_flag = 0}
	band_lobby_attempt_to_join device_num = <device_num> viewport_index = <viewport_index>
endscript

script band_lobby_cancel_out_of_popup 
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :SE_GetParentID
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_create_popup_change_profile 
	RequireParams \{[
			parent
			player
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xf9fa8175)}
	array = [
	]
	if NOT checksumequals a = <msg_checksum> b = not_connted_to_live
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = ($band_lobby_strings.<msg_checksum>)
		if NOT IsPS3
			AddArrayElement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = ShowSignInUI4Pane params = {online_only}}}
		elseif NetSessionFunc func = IsMultiplayerAllowed params = {controller_index = <controller>}
			if NetSessionFunc \{func = has_network_platform_account}
				AddArrayElement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = ShowSignInUI4Pane params = {online_only}}}
			endif
		endif
		if IsPS3
			if NOT NetSessionFunc func = IsMultiplayerAllowed params = {controller_index = <controller>}
				heading_text = ($band_lobby_strings.popup_title_warning)
				body_text = ($band_lobby_strings.age_restricted)
			endif
		endif
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			AddArrayElement array = <array> element = {text = ($band_lobby_strings.end_session) func = band_lobby_go_back_to_local_play func_params = {player = <player> target = <menu_id> viewport_index = <viewport_index>}}
		endif
	else
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = ($band_lobby_strings.<msg_checksum>)
	endif
	AddArrayElement array = <array> element = {text = ($band_lobby_strings.cancel) func = band_lobby_cancel_out_of_popup func_params = {player = <player> target = <menu_id>}}
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		heading_text = <heading_text>
		body_text = <body_text>
		back_button_script = null_script
		options = <array>
	}
	AssignAlias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	if (<player> != -1)
		GetPlayerInfo <player> GamerTag
		dialog_box_desc_id :SE_SetProps dlog_gamertag_text = ($<GamerTag>)
	endif
	return vmenu = <menu_id>
endscript

script band_lobby_update_popup_player_ui 
	RequireParams \{[
			update
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x2ddc9b02)}
	if (<update> = add)
		band_lobby_add_player_ui_to_popup <...>
	elseif (<update> = remove)
		band_lobby_remove_player_ui_from_popup <...>
	endif
endscript

script band_lobby_add_player_ui_to_popup {
		player_type_text = qs(0x36abd2d6)
		GamerTag_text = qs(0xb81382c3)
		net_id_first = 0
		net_id_second = 0
		part_props = {}
		rich_presence = qs(0x00000000)
		Bg_rgba = [128 128 128 255]
		controlling_player = ($g_leader_player_num)
		chat_alpha = 0.0
		leader_alpha = 0.0
		diff_alpha = 0.0
		diff_texture = icon_difficulty_beginner
		diff_text_text = qs(0x00000000)
		kick_flag = 0
		select_actions = None
		list_type = None
		desc_id = 'band_lobby_player_info2'
	}
	RequireParams \{[
			player_index
			parent_id
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x5378c8f3)}
	if (<player_index> = -1)
		if GotParam \{friendstate}
			if IsXenonOrWinDX
				band_lobby_get_part_icon_parts part = <friendstate>
			else
				band_lobby_get_part_icon_parts \{part = None}
			endif
			if (1 = <CANT_INVITE>)
				rich_presence = ($band_lobby_strings.CANT_INVITE)
			else
				if (<sentfriendrequest> = true)
					rich_presence = ($band_lobby_strings.pending_friend_request)
				endif
			endif
		else
			band_lobby_get_part_icon_parts \{part = remote}
		endif
	else
		GetPlayerInfo <player_index> part
		GetPlayerInfo <player_index> net_id_first
		GetPlayerInfo <player_index> net_id_second
		GetPlayerInfo <player_index> GamerTag
		GetPlayerInfo <player_index> Band
		GetPlayerInfo <player_index> difficulty
		<double_kick_drum> = 0
		if (<difficulty> = expert)
			if (<part> = Drum)
				GetPlayerInfo <player_index> double_kick_drum
				if (<double_kick_drum> = 1)
					difficulty = expert_plus
				endif
			endif
		endif
		printf qs(0x49740e90) d = <difficulty> e = <part> f = <double_kick_drum> g = <player_index>
		get_fullname_for_player player = <player_index>
		GamerTag_text = <fullname>
		if ($g_net_leader_player_num = <player_index>)
			if ($g_lobby_net_state = net_public)
				if ((<list_type> = matchmaking) || (<list_type> = matchmaking_done))
					leader_alpha = 0.0
				else
					leader_alpha = 1.0
				endif
			else
				leader_alpha = 1.0
			endif
		else
			leader_alpha = 0.0
		endif
		band_lobby_get_difficulty_icon_and_string difficulty = <difficulty>
		diff_alpha = 1.0
		diff_text = <text>
		diff_texture = <texture>
		band_lobby_get_part_icon_parts part = <part>
		if PlayerInfoEquals <player_index> is_local_client = 1
			GetPlayerInfo <player_index> controller
			band_lobby_get_is_guest device_num = <controller>
			if (<is_guest> = 1)
				net_id_first = 0
				net_id_second = 0
			endif
			FormatText TextName = player_type_text qs(0xd7732250) d = <controller>
		else
			player_type_text = qs(0x36abd2d6)
		endif
	endif
	array = []
	AddArrayElement array = <array> element = <net_id_first>
	AddArrayElement array = <array> element = <net_id_second>
	net_id = <array>
	dims = (747.0, 62.5)
	autoSizeDims = false
	if (<desc_id> = 'band_lobby_player_info2')
		autoSizeDims = true
	endif
	CreateScreenElement {
		parent = <parent_id>
		type = DescInterface
		desc = <desc_id>
		autoSizeDims = <autoSizeDims>
		dims = <dims>
		z_priority = 20.1
		tags = {
			player_index = <player_index>
			net_id = <net_id>
			has_rock_record = 0
			select_actions = <select_actions>
			controlling_player = <controlling_player>
		}
	}
	array = [
		{unfocus band_lobby_popup_change_focus params = {focus_type = unfocus}}
		{focus band_lobby_popup_change_focus params = {focus_type = focus controlling_player = <controlling_player>}}
	]
	if (<list_type> != matchmaking)
		AddArrayElement array = <array> element = {focus band_lobby_popup_begin_polling_for_rock_record params = {controlling_player = <controlling_player>}}
	endif
	if NOT GotParam \{CANT_INVITE}
		if (<select_actions> != None)
			array = [
				{unfocus band_lobby_popup_change_focus params = {focus_type = unfocus}}
			]
			GetPlayerInfo <controlling_player> controller out = controller_index
			if CheckForSignIn controller_index = <controller_index> dont_set_primary network_platform_only
				if (<list_type> != matchmaking)
					request_rock_record callback = band_lobby_rock_record_callback net_id = <net_id>
				endif
			endif
			if band_lobby_popup_submenu_has_selectable_item select_actions = <select_actions> net_id = <net_id> player = <player_index> controlling_player = <controlling_player>
				AddArrayElement {
					array = <array>
					element = {
						pad_choose
						band_lobby_popup_create_submenu
						params = {
							select_actions = <select_actions>
							net_id = <net_id>
							player = <player_index>
							controlling_player = <controlling_player>
						}
					}
				}
				AddArrayElement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 1 controlling_player = <controlling_player>}}
			else
				AddArrayElement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 0 controlling_player = <controlling_player>}}
			endif
			<id> :SetTags {num_selectable_items = <num_items>}
		endif
	else
		<id> :SetTags is_friends_list = 1
		if (<CANT_INVITE> = 0)
			AddArrayElement array = <array> element = {pad_choose band_lobby_send_invite params = {instrument = guitar net_id = <net_id> name = <GamerTag_text> controlling_player = <controlling_player>}}
		endif
		if IsXenonOrWinDX
			AddArrayElement array = <array> element = {pad_option2 band_lobby_request_player_card params = {net_id_first = <net_id_first> net_id_second = <net_id_second>}}
		endif
	endif
	<id> :SE_SetProps {
		GamerTag_text = <GamerTag_text>
		gamertag_bg_rgba = <Bg_rgba>
		Metadata_text = <rich_presence>
		icon_chat_alpha = <chat_alpha>
		icon_leader_alpha = <leader_alpha>
		difficulty_text_alpha = <diff_alpha>
		difficulty_text_text = <diff_text>
		DIFFICULTY_alpha = <diff_alpha>
		difficulty_texture = <diff_texture>
		event_handlers = <array>
		<part_props>
	}
	if (<player_index> > -1)
		<id> :Obj_SpawnScriptNow band_lobby_player_ui_update_loop params = {part = <part> difficulty = <difficulty> player_index = <player_index>}
	endif
endscript

script band_lobby_remove_player_ui_from_popup 
	RequireParams \{[
			player_index
			parent_id
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xbbff7a42)}
	target_index = <player_index>
	if GetScreenElementChildren id = <parent_id>
		GetArraySize <children>
		i = 0
		begin
		(<children> [<i>]) :GetSingleTag player_index
		if (<target_index> = <player_index>)
			DestroyScreenElement id = (<children> [<i>])
			return
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_lobby_popup_change_focus 
	RequireParams \{[
			focus_type
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xe3891cb2)}
	Obj_GetID
	if checksumequals a = <focus_type> b = focus
		<objID> :SE_SetProps {
			highlight_cont_alpha = 1
			focus_highlight_cont_alpha = 1
			unfocused_cont_alpha = 0.0
			GamerTag_rgba = ($UIColorRef_Palette.black.rgba)
			Metadata_rgba = ($UIColorRef_Palette.black.rgba)
		}
		if GotParam \{selectable}
			if (<selectable> = 1)
				if NOT user_control_helper_exists \{button = green}
					GetPlayerInfo <controlling_player> controller
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
					GetScreenElementChildren \{id = user_control_container}
					GetArraySize <children>
					if (<array_size> > 1)
						user_control_container :Menu_SetItemIndex index = (<array_size> - 1) newIndex = 1
					endif
				endif
			else
				if ScreenElementExists \{id = green_helper_pill_id}
					DestroyScreenElement \{id = green_helper_pill_id}
				endif
			endif
		endif
		if <objID> :Desc_ResolveAlias name = alias_light_bar param = light_bar_id
			<light_bar_id> :Obj_SpawnScript ui_blink_more
		else
			ScriptAssert \{'UI_art'}
		endif
	else
		<objID> :SE_SetProps {
			highlight_cont_alpha = 0.0
			focus_highlight_cont_alpha = 0.0
			unfocused_cont_alpha = 0.5
			GamerTag_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
			Metadata_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
		}
	endif
endscript

script band_lobby_simple_change_focus 
	RequireParams \{[
			focus_type
		]
		all}
	Obj_GetID
	if checksumequals a = <focus_type> b = focus
		<objID> :SE_SetProps rgba = ($UIColorRef_Palette.p6_dk.rgba)
	elseif checksumequals a = <focus_type> b = unfocus
		<objID> :SE_SetProps rgba = [125 125 125 255]
	endif
endscript

script band_lobby_update_vote 
	RequireParams \{[
			voting_items_array
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x43aad51e)}
	Obj_GetID
	band_lobby_update_vote_loop objID = <objID>
	resolve_voting_outcome
	if ($GLOBAL_SHOULD_USE_NET_DEBUGGING = 1)
		result = {element = ($g_force_vote) text = qs(0x91affe2e)}
	else
		result = (<voting_items_array> [<winner_index>])
	endif
	if InInternetMode
		if IsHost
			SendStructure {
				callback = band_lobby_conclude_voting
				data_to_send = {
					result = <result>
				}
			}
			band_lobby_conclude_voting objID = <objID> result = <result>
		endif
	else
		band_lobby_conclude_voting objID = <objID> result = <result>
	endif
endscript

script band_lobby_conclude_voting 
	RequireParams \{[
			result
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xefcb0ec2)}
	if NOT GotParam \{objID}
		if ScreenElementExists \{id = current_band_lobby_popup}
			ResolveScreenElementID \{id = [
					{
						id = current_band_lobby_popup
					}
					{
						local_id = band_lobby_pu_generic_vote_cont
					}
					{
						local_id = pu_menu
					}
				]}
			if ScreenElementExists id = <resolved_id>
				objID = <resolved_id>
			else
				return
			endif
		else
			return
		endif
	endif
	if ScreenElementExists id = <objID>
		band_lobby_display_winner objID = <objID> result = <result>
		if NOT checksumequals a = ($g_voting_callback_script) b = null
			($g_voting_callback_script) <...>
		else
			printf \{qs(0x2bd0a7cc)}
		endif
		wait \{3
			seconds}
		generic_event_choose \{state = uistate_songlist}
	endif
endscript

script band_lobby_display_winner 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x43470d78)}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 0}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps alpha = 0.0
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 1}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps alpha = 0.0
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 2}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps alpha = 1.0
	endif
	ResolveScreenElementID id = [
		{id = <resolved_id>}
		{local_id = vote_item}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps text = (<result>.text)
	endif
endscript

script band_lobby_update_vote_loop 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x2c68b0df)}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 0}
		{local_id = vote_count}
	]
	item_0_id = <resolved_id>
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 1}
		{local_id = vote_count}
	]
	item_1_id = <resolved_id>
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 2}
	]
	item_2_id = <resolved_id>
	RemoveParameter \{resolved_id}
	GetNumPlayersInGame
	if (<num_players> > 0)
		begin
		if ScreenElementExists id = <item_0_id>
			FormatText TextName = vote_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			<item_0_id> :SE_SetProps text = <vote_count>
		endif
		if ScreenElementExists id = <item_1_id>
			FormatText TextName = vote_count qs(0x48c6d14c) d = ($g_vote_counts [1])
			<item_1_id> :SE_SetProps text = <vote_count>
		endif
		if (<num_players> = (($g_vote_counts [0]) + ($g_vote_counts [1])))
			break
		endif
		if (
				(($g_vote_counts [0]) > (<num_players> / 2.0)) ||
				(($g_vote_counts [1]) > (<num_players> / 2.0))
			)
			break
		endif
		wait \{0.25
			seconds}
		repeat 40
		killspawnedscript \{name = band_lobby_update_voting_timer}
	endif
endscript

script band_lobby_update_voting_timer 
	printf \{channel = Band_Lobby
		qs(0x0b104388)}
	Obj_GetID
	OnExitRun band_lobby_reset_voting_timer params = {objID = <objID>}
	i = 10
	begin
	FormatText TextName = countdown qs(0x48c6d14c) d = <i>
	<objID> :SE_SetProps pu_helper_msg_text = <countdown>
	i = (<i> - 1)
	wait \{1
		second}
	repeat 10
endscript

script band_lobby_reset_voting_timer 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x41142ac4)}
	<objID> :SE_SetProps pu_helper_msg_text = qs(0x6160dbf3)
endscript

script band_lobby_cancel_voting 
	RequireParams \{[
			container
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x5c72db40)}
	if PlayerInfoEquals ($g_leader_player_num) controller = <device_num>
		if InInternetMode
		else
			band_lobby_destroy_popup_menu container = <container>
		endif
	endif
endscript

script band_lobby_toggle_guitar_bass 
	RequireParams \{[
			device_num
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xe7c1377a)}
	get_local_in_game_player_num_from_controller controller_index = <device_num>
	if (<player_num> > -1)
		if PlayerInfoEquals <player_num> part = guitar
			SetPlayerInfo <player_num> part = bass
			return
		elseif PlayerInfoEquals <player_num> part = bass
			SetPlayerInfo <player_num> part = guitar
			return
		endif
	endif
endscript

script band_lobby_player_ui_update_loop 
	RequireParams \{[
			part
			difficulty
			player_index
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x2b6cad8e)}
	current_difficulty = <difficulty>
	Obj_GetID
	begin
	if NOT PlayerInfoEquals <player_index> part = <part>
		GetPlayerInfo <player_index> part
		band_lobby_get_part_icon_parts part = <part>
		<objID> :SE_SetProps <part_props>
	endif
	GetPlayerInfo <player_index> difficulty out = difficulty
	if (<difficulty> = expert)
		if PlayerInfoEquals <player_index> part = Drum
			GetPlayerInfo <player_index> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	if (<difficulty> != <current_difficulty>)
		current_difficulty = <difficulty>
		band_lobby_get_difficulty_icon_and_string difficulty = <difficulty>
		<objID> :SE_SetProps difficulty_text_text = <text> difficulty_texture = <texture>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_get_difficulty_icon_and_string 
	RequireParams \{[
			difficulty
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x90fb605e)}
	text = qs(0x00000000)
	if checksumequals a = <difficulty> b = expert_plus
		text = qs(0x41873008)
	else
		text = ($difficulty_list_props.<difficulty>.text)
	endif
	switch <difficulty>
		case beginner
		texture = icon_difficulty_beginner
		case easy
		texture = icon_difficulty_easy
		case medium
		texture = icon_difficulty_medium
		case hard
		texture = icon_difficulty_hard
		case expert
		texture = icon_difficulty_expert
		case expert_plus
		texture = icon_difficulty_expert_plus
		default
		printstruct <...>
		ScriptAssert \{qs(0xde65f643)}
	endswitch
	return text = <text> texture = <texture>
endscript

script band_lobby_get_part_icon_parts 
	RequireParams \{[
			part
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x54ea34dc)}
	switch <part>
		case guitar
		return part_props = {
			part_icon_top_texture = mixer_icon_guitar
			part_icon_top_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case bass
		return part_props = {
			part_icon_top_texture = mixer_icon_bass
			part_icon_top_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case Drum
		return part_props = {
			part_icon_top_texture = mixer_icon_drums
			part_icon_top_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case vocals
		return part_props = {
			part_icon_top_texture = mixer_icon_vox
			part_icon_top_rgba = ($UIColorRef_Palette.NTSCWhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case online
		return \{part_props = {
				part_icon_top_texture = friendslist_online
				part_icon_bottom_alpha = 0
			}}
		case offline
		return \{part_props = {
				part_icon_top_texture = friendslist_offline
				part_icon_bottom_alpha = 0
			}}
		case away
		return \{part_props = {
				part_icon_top_texture = friendslist_away
				part_icon_bottom_alpha = 0
			}}
		case busy
		return \{part_props = {
				part_icon_top_texture = friendslist_busy
				part_icon_bottom_alpha = 0
			}}
		case None
		return \{part_props = {
				part_icon_top_alpha = 0
				part_icon_bottom_alpha = 0
			}}
		case remote
		return \{part_props = {
				part_icon_top_texture = icon_remote
				part_icon_bottom_alpha = 0
			}}
		default
		return \{part_props = {
				part_icon_top_alpha = 0
				part_icon_bottom_alpha = 0
			}}
	endswitch
endscript

script band_lobby_call_signin_ui_from_popup 
	RequireParams \{[
			func
			params
			device_num
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x55953908)}
	band_lobby_signin func = <func> params = <params> controller = <device_num>
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :SE_GetParentID
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_popup_menu 
	Change \{g_suppress_anim_in = 1}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_desc_id :Obj_KillSpawnedScript \{name = band_lobby_update_mics}
	ui_event_wait \{event = menu_change
		data = {
			is_popup
			state = UIstate_mic_binding
		}}
endscript

script band_lobby_popup_change_popup_focus 
	RequireParams \{[
			focus_type
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xfb1bab52)}
	if ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent type = <focus_type> target = current_band_lobby_popup
	endif
endscript

script band_lobby_popup_create_submenu 
	RequireParams \{[
			controlling_player
			player
			select_actions
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x2cd64fe0)}
	GH5_Band_Screen_UI_Sound player_num = <player> choose = 1
	Obj_GetID
	<objID> :GetTags
	if GotParam \{add_rock_record}
		num_selectable_items = (<num_selectable_items> + 1)
	endif
	if ScreenElementExists \{id = band_lobby_desc_id}
		if NOT band_lobby_desc_id :Desc_ResolveAlias \{name = alias_pu_cont_parent
				param = popup_cont}
			ScriptAssert \{'could not get band lobby popup container!'}
		endif
	else
		popup_cont = current_band_lobby_popup
	endif
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{type = unfocus
			target = band_lobby_popup_menu}
	endif
	if ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent \{type = unfocus
			target = current_band_lobby_popup}
	endif
	if ScreenElementExists \{id = band_lobby_manage_player}
		DestroyScreenElement \{id = band_lobby_manage_player}
	endif
	CreateScreenElement {
		type = DescInterface
		local_id = submenu
		id = band_lobby_manage_player
		desc = 'band_lobby_pu_player_manage'
		parent = <popup_cont>
		z_priority = 1500
	}
	desc_id = <id>
	if <id> :Desc_ResolveAlias name = alias_game_rules_vmenu param = menu_id
		<menu_id> :SE_SetProps event_handlers = [{pad_back band_lobby_popup_destroy_submenu params = {submenu_id = <popup_cont>}}]
		if (1 != <num_selectable_items>)
			<menu_id> :SE_SetProps {
				event_handlers = [
					{pad_up GH5_Band_Screen_UI_Sound params = {player_num = <player> up = 1}}
					{pad_down GH5_Band_Screen_UI_Sound params = {player_num = <player> down = 1}}
				]
			}
		endif
		if band_lobby_manage_player :Desc_ResolveAlias \{name = alias_headline_magic}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.3 Color = [61 218 250 200]}
			endif
		else
			ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
		endif
		switch <select_actions>
			case kick
			kick = 1
			leader = 0
			case grant_leadership
			kick = 0
			leader = 1
			case leadership_and_kick
			kick = 1
			leader = 1
			default
			kick = 0
			leader = 0
		endswitch
		num_items = 0
		unfocusable_color = [128 128 128 255]
		<id> :Desc_ResolveAlias name = alias_band_lobby_item_boot param = item_id
		if InNetGame
			kick = 0
		endif
		if (<kick> = 1)
			<item_id> :SE_SetProps {
				event_handlers = [
					{focus band_lobby_popup_submenu_item_focus}
					{unfocus band_lobby_popup_submenu_item_unfocus}
					{pad_choose
						band_lobby_popup_submenu_select
						params = {
							action = kick
							net_id = <net_id>
							controlling_player = <controlling_player>
						}
					}
				]
				highlight_btn_alpha = 0
				item_text_rgba = ($UIColorRef_Palette.GH51_red_lt.rgba)
			}
		else
			<item_id> :SE_SetProps {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :Desc_ResolveAlias name = alias_band_lobby_item_leadership param = item_id
		add_grant_option = 0
		if ((<leader> = 1) && ($g_net_leader_player_num != <player>))
			if PlayerInfoEquals <player> is_local_client = 1
				GetPlayerInfo <player> controller
				band_lobby_get_is_guest device_num = <controller>
				if ($g_career_search = null)
					if (<is_guest> = 0)
						add_grant_option = 1
					endif
				endif
			endif
		endif
		if (<add_grant_option> = 1)
			<item_id> :SE_SetProps {
				event_handlers = [
					{focus band_lobby_popup_submenu_item_focus}
					{unfocus band_lobby_popup_submenu_item_unfocus}
					{pad_choose band_lobby_popup_submenu_select params = {action = leader net_id = <net_id> player = <player>}}
				]
				highlight_btn_alpha = 0
				item_text_rgba = ($UIColorRef_Palette.GH51_red_lt.rgba)
			}
		else
			<item_id> :SE_SetProps {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :Desc_ResolveAlias name = alias_band_lobby_item_gamercard param = item_id
		if IsXenonOrWinDX
			<is_focusable> = 0
			GetPlayerInfo <controlling_player> controller
			if CheckForSignIn local controller_index = <controller>
				if NetSessionFunc func = CanViewProfile params = {controller_index = <controller>}
					if (((<net_id> [0]) != 0) && ((<net_id> [1]) != 0))
						<item_id> :SE_SetProps {
							event_handlers = [
								{focus band_lobby_popup_submenu_item_focus}
								{unfocus band_lobby_popup_submenu_item_unfocus}
								{pad_choose band_lobby_popup_submenu_select params = {action = player_card net_id = <net_id> player = <player>}}
							]
							highlight_btn_alpha = 0
							item_text_rgba = ($UIColorRef_Palette.GH51_red_lt.rgba)
						}
						<is_focusable> = 1
					endif
				endif
			endif
			if (<is_focusable> = 0)
				<item_id> :SE_SetProps {
					not_focusable
					item_text_rgba = <unfocusable_color>
					highlight_btn_alpha = 0
				}
			endif
		else
			DestroyScreenElement id = <item_id>
		endif
		Obj_GetID
		<id> :Desc_ResolveAlias name = alias_band_lobby_item_rock_record param = item_id
		if <objID> :GetSingleTag has_rock_record
			if (<has_rock_record> = 1)
				<item_id> :SE_SetProps {
					event_handlers = [
						{focus band_lobby_popup_submenu_item_focus}
						{unfocus band_lobby_popup_submenu_item_unfocus}
						{pad_choose band_lobby_popup_submenu_select params = {action = rock_record net_id = <net_id> player = <player>}}
					]
					highlight_btn_alpha = 0
					item_text_rgba = ($UIColorRef_Palette.GH51_red_lt.rgba)
				}
			else
				<item_id> :SE_SetProps {
					not_focusable
					item_text_rgba = <unfocusable_color>
					highlight_btn_alpha = 0
				}
			endif
		endif
		GetPlayerInfo <player> GamerTag
		switch <num_items>
			case 1
			spacing = 0
			case 2
			spacing = 75
			case 3
			spacing = 36
			case 4
			spacing = 18
			default
			spacing = 0
		endswitch
		LaunchEvent type = focus target = <menu_id>
	endif
endscript

script band_lobby_popup_submenu_item_focus 
	Obj_GetID
	<objID> :SE_SetProps {
		item_text_rgba = [5 50 65 255]
		item_text_font = fontgrid_title_a1
		highlight_btn_alpha = 1
	}
	ExtendCRCWithString checksum = <objID> string = '_particle'
	<objID> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (600.0, 0.0) z = 2000}
endscript

script band_lobby_popup_submenu_item_unfocus 
	Obj_GetID
	<objID> :SE_SetProps {
		item_text_rgba = ($UIColorRef_Palette.GH51_red_lt.rgba)
		item_text_font = fontgrid_text_A1
		highlight_btn_alpha = 0
	}
	ExtendCRCWithString checksum = <objID> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
endscript

script band_lobby_popup_destroy_submenu 
	RequireParams \{[
			submenu_id
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x22e9c419)}
	GH5_Band_Screen_UI_Sound player_num = <player> back = 1
	if ScreenElementExists id = {<submenu_id> child = submenu}
		DestroyScreenElement id = {<submenu_id> child = submenu}
	endif
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{type = focus
			target = band_lobby_popup_menu}
	elseif ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script band_lobby_popup_submenu_focus 
	printf \{channel = Band_Lobby
		qs(0x9a15d357)}
	SE_GetProps
	adjust_pos = (-183.0, -60.0)
	<desc_id> :SE_SetProps songlist_manage_playlist_selection_bar_pos = (<Pos> + <adjust_pos>)
endscript

script band_lobby_popup_submenu_select 
	RequireParams \{[
			action
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xdc79b3fb)}
	SE_GetParentID
	if GotParam \{controlling_player}
		player = <controlling_player>
	endif
	GH5_Band_Screen_UI_Sound player_num = <player> choose = 1
	switch <action>
		case kick
		RequireParams \{[
				controlling_player
			]
			all}
		band_lobby_kick_remote_player_popup user_id = <net_id> controlling_player = <controlling_player>
		case leader
		if savegame_async_is_busy
			return
		endif
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :Obj_SpawnScriptLater band_lobby_popup_submenu_grant_leadership params = {player = <player> user_id = <net_id>}
		endif
		case player_card
		band_lobby_request_player_card device_num = <device_num> net_id_first = (<net_id> [0]) net_id_second = (<net_id> [1])
		case rock_record
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :Obj_SpawnScriptLater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = band_lobby_popup_menu player = <player>}
		elseif ScreenElementExists \{id = current_band_lobby_popup}
			current_band_lobby_popup :Obj_SpawnScriptLater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = current_menu player = <player>}
		endif
	endswitch
	LaunchEvent type = pad_back target = <parent_id>
endscript

script band_lobby_popup_submenu_grant_leadership 
	printf \{channel = Band_Lobby
		qs(0xc2989b06)}
	wait \{2
		frames}
	band_lobby_grant_leadership player = <player> user_id = <net_id>
endscript

script band_lobby_popup_submenu_rock_record 
	printf \{channel = Band_Lobby
		qs(0x8d674b0a)}
	<pad_event_device> = <device_num>
	wait \{2
		frames}
	ui_event_get_top
	if (<base_name> = 'band_lobby')
		display_rock_record {
			device_num = <pad_event_device>
			net_id = <net_id>
			unfocus_id = <unfocus_id>
			band_lobby_no_anim_in
			from_lobby = 1
		}
	else
		display_rock_record {
			device_num = <pad_event_device>
			net_id = <net_id>
			unfocus_id = <unfocus_id>
			from_lobby = 1
		}
	endif
endscript

script band_lobby_popup_submenu_has_selectable_item 
	printf \{channel = Band_Lobby
		qs(0x3cc675da)}
	switch <select_actions>
		case kick
		kick = 1
		leader = 0
		case grant_leadership
		kick = 0
		leader = 1
		case leadership_and_kick
		kick = 1
		leader = 1
		default
		kick = 0
		leader = 0
	endswitch
	num_items = 0
	if (<kick> = 1)
		num_items = (<num_items> + 1)
	endif
	if ((<leader> = 1) && ($g_net_leader_player_num != <player>))
		if PlayerInfoEquals <player> is_local_client = 1
			GetPlayerInfo <player> controller
			band_lobby_get_is_guest device_num = <controller>
			if ($g_career_search = null)
				if (<is_guest> = 0)
					num_items = (<num_items> + 1)
				endif
			endif
		endif
	endif
	if IsXenonOrWinDX
		GetPlayerInfo <controlling_player> controller
		if CheckForSignIn local controller_index = <controller>
			if NetSessionFunc func = CanViewProfile params = {controller_index = <controller>}
				if (((<net_id> [0]) != 0) && ((<net_id> [1]) != 0))
					num_items = (<num_items> + 1)
				endif
			endif
		endif
	endif
	if (<num_items> > 0)
		return true num_items = <num_items>
	else
		return false num_items = <num_items>
	endif
endscript

script band_lobby_does_popup_exist 
	printf \{channel = Band_Lobby
		qs(0x0b94f8aa)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :Desc_ResolveAlias \{name = alias_pu_cont_parent
				param = popup_cont}
			if GetScreenElementChildren id = <popup_cont>
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript
