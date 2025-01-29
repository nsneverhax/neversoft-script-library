
script band_lobby_create_popup_menu \{list_type = Player}
	printf \{channel = band_lobby
		qs(0xc811e689)}
	RequireParams \{[
			menu
			container
		]
		all}
	if ScreenElementExists id = <container>
		if ScreenElementExists \{id = current_band_lobby_popup}
			LaunchEvent \{Type = unfocus
				target = band_lobby_popup_menu}
			DestroyScreenElement id = <container> preserve_parent
		endif
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		back_script = band_lobby_destroy_popup_menu
		back_params = {container = <container>}
		band_lobby_popup_get_exclusive_devices <...>
		<container> :se_setprops exclusive_device = <exclusive_devices>
		if GotParam \{controller}
			Player = -1
		else
			getplayerinfo <Player> controller
		endif
		switch <menu>
			case friendslist
			band_lobby_create_popup_menu_friendslist parent = <container> Player = <Player>
			case playerslist
			band_lobby_create_popup_menu_players_list parent = <container> Player = <Player> list_type = <list_type> is_popup = 1
			if checksumequals a = <list_type> b = matchmaking
				menu = matchmaking
				if NetSessionFunc \{Obj = party
						func = is_host}
					back_script = band_lobby_cancel_matchmaking
					back_params = {container = <container>}
				else
					back_script = empty_script
					back_params = {}
				endif
			elseif checksumequals a = <list_type> b = matchmaking_done
				menu = matchmaking_done
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
			band_lobby_create_popup_menu_leave_lobby parent = <container> Player = <Player> msg_checksum = <msg_checksum> <...>
			case error_msg
			band_lobby_create_popup_menu_generic_error parent = <container> Player = <Player> msg_checksum = ($g_band_lobby_error_msg)
			case generic_vote
			band_lobby_create_popup_generic_vote parent = <container> Player = <Player> voting_items_array = <voting_items_array>
			back_script = band_lobby_cancel_voting
			back_params = {container = <container>}
			case change_profile
			band_lobby_create_popup_change_profile parent = <container> Player = <Player> controller = <controller> msg_checksum = <msg_checksum> viewport_index = <viewport_index>
			menu = generic_popup
			case teams
			band_lobby_create_popup_teams parent = <container> Player = <Player>
			if ($g_lobby_net_state != local)
				ui_sfx \{menustate = bandlobby
					uitype = select}
				back_script = generic_event_choose
				back_params = {state = uistate_online_quit_warning data = {player_device = <controller>}}
			endif
			case delete_rocker
			band_lobby_create_popup_menu_delete_rocker parent = <container> Player = <Player> viewport_index = <viewport_index>
			default
			ScriptAssert \{qs(0xc49f902e)}
		endswitch
		if GotParam \{VMenu}
			AssignAlias id = <VMenu> alias = band_lobby_popup_menu
		else
			ScriptAssert \{qs(0x47c72c53)}
		endif
		band_lobby_update_button_helpers menu = <menu> Player = <Player> controller = <controller>
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :SetTags {
				menu = <menu>
				Player = <Player>
			}
		endif
		<container> :se_getparentid
		<parent_id> :se_setprops alpha = 1.0 time = 0.2
		<parent_id> :se_waitprops
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :se_setprops {
				event_handlers = [
					{pad_back <back_script> params = <back_params>}
				]
				replace_handlers
				tags = {
					menu = <menu>
					Player = <Player>
				}
			}
		endif
		if ScreenElementExists \{id = band_lobby_popup_menu}
			if GotParam \{index_to_focus}
				LaunchEvent Type = focus target = band_lobby_popup_menu data = {child_index = <index_to_focus>}
			else
				LaunchEvent \{Type = focus
					target = band_lobby_popup_menu}
			endif
		endif
	else
		printf \{qs(0x8e50f870)}
	endif
endscript

script bl_refresh_popup_button_helpers 
	RequireParams \{[
			menu
			Play
			controller
		]
		all}
	pritnf \{channel = band_lobby
		qs(0xc45a4bba)}
	begin
	if isscreenelementinfocus \{id = band_lobby_popup_menu}
		band_lobby_update_button_helpers menu = <menu> Player = <Player> controller = <controller>
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_destroy_popup_menu \{animate = 1}
	printf \{channel = band_lobby
		qs(0x36403b5f)}
	SoundEvent \{event = lobbyback_sfx}
	KillSpawnedScript \{Name = band_lobby_friendslist_callback_spawned}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent
				param = popup_cont}
			band_lobby_kick_leader_out_of_band_manage
			if ScreenElementExists \{id = band_lobby_popup_menu}
				LaunchEvent \{Type = unfocus
					target = band_lobby_popup_menu}
			endif
			if (<animate> = 1)
				<popup_cont> :se_getparentid
				<parent_id> :se_setprops alpha = 0.0 time = 0.2
				<parent_id> :se_waitprops
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
			menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xe9e62f3f)}
	if GotParam \{controller}
		Player = -1
	else
		getplayerinfo <Player> controller
	endif
	get_all = 0
	array = []
	if ((<menu> = generic_vote) || (<menu> = teams))
		if (<menu> = teams)
			if ($g_lobby_net_state = local)
				get_all = 1
			endif
		else
			get_all = 1
		endif
	endif
	if (<menu> = playerslist)
		if (<list_type> = matchmaking_done)
			get_all = 1
		endif
	endif
	if (<get_all> = 1)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			AddArrayElement array = <array> element = <controller>
			getnextplayer Player = <Player> local
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
			Player
			msg_checksum
		]
		all}
	printf \{channel = band_lobby
		qs(0xa94ca893)}
	getplayerinfo <Player> gamertag
	getplayerinfo <Player> controller
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		template = no_options
		body_text = ($band_lobby_strings.<msg_checksum>)
	}
	AssignAlias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	Change \{g_band_lobby_error_msg = NULL}
	Change \{g_leader_player_num = -1}
	return \{VMenu = dialog_box_container}
endscript

script band_lobby_create_popup_generic_vote 
	RequireParams \{[
			parent
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0xe2ca7aa7)}
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'band_lobby_pu_generic_vote'
		z_priority = 20.0
	}
	AssignAlias id = <id> alias = current_band_lobby_popup
	getplayerinfo <Player> gamertag
	<id> :se_setprops pu_gamertag_text = ($<gamertag>)
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
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		AddArrayElement array = <array> element = <controller>
		getnextplayer Player = <Player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	GetArraySize <voting_items_array>
	if (<array_Size> > 0)
		array = []
		i = 0
		begin
		ResolveScreenElementID id = [
			{id = <menu_id>}
			{index = <i>}
			{local_id = vote_item}
		]
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :se_setprops text = (<voting_items_array> [<i>].text)
			if (<i> < 2)
				formatText TextName = button_helper_string qs(0xc19e6243) d = (<voting_items_array> [<i>].text)
				formatText checksumName = helper_text_global 'g_vote_items_text_helper_%d' d = <i>
				Change GlobalName = <helper_text_global> NewValue = <button_helper_string>
				if (<i> = 0)
					AddArrayElement array = <array> element = {pad_option cast_vote params = {option = <i>}}
				elseif (<i> = 1)
					AddArrayElement array = <array> element = {pad_option2 cast_vote params = {option = <i>}}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		event_handlers = <array>
	endif
	current_band_lobby_popup :Obj_SpawnScriptNow \{band_lobby_update_voting_timer}
	<menu_id> :Obj_SpawnScriptNow band_lobby_update_vote params = {voting_items_array = <voting_items_array>}
	<menu_id> :se_setprops event_handlers = <event_handlers>
	return VMenu = <menu_id> exclusive_devices = <controllers_allowed_to_vote>
endscript

script band_lobby_create_popup_menu_leave_lobby 
	printf \{channel = band_lobby
		qs(0x3c0a4772)}
	RequireParams \{[
			parent
			Player
			msg_checksum
		]
		all}
	getplayerinfo <Player> gamertag
	getplayerinfo <Player> controller
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
				Player = <Player>
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
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	return \{VMenu = dialog_box_container}
endscript

script band_lobby_create_popup_menu_delete_rocker 
	printf \{channel = band_lobby
		qs(0x28e09860)}
	RequireParams \{[
			parent
			Player
		]
		all}
	getplayerinfo <Player> gamertag
	getplayerinfo <Player> controller
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
				Player = <Player>
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
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	return \{VMenu = dialog_box_container}
endscript

script band_lobby_destroy_popup_and_run_quit_script 
	printf \{channel = band_lobby
		qs(0x3319bb35)}
	band_lobby_destroy_popup_menu container = <container>
	if checksumequals a = <choose_script> b = band_lobby_go_back
		band_lobby_whole_band_autosave Player = <Player> choose_script = <choose_script> submenu_index = <viewport_index>
	else
		<choose_script>
	endif
endscript

script band_lobby_create_popup_menu_friendslist 
	printf \{channel = band_lobby
		qs(0x85abf013)}
	RequireParams \{[
			parent
			Player
		]
		all}
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'band_lobby_pu_friend'
		z_priority = 20.0
		pu_friends_online_num_text = qs(0x00000000)
		pu_friends_gh_num_text = qs(0x00000000)
	}
	AssignAlias id = <id> alias = current_band_lobby_popup
	getplayerinfo <Player> gamertag
	<id> :se_setprops pu_gamertag_text = ($<gamertag>)
	if current_band_lobby_popup :desc_resolvealias \{Name = alias_pu_menu
			param = menu_id}
		<menu_id> :SetTags desc_id = current_band_lobby_popup
		if isps3
			if NetSessionFunc \{func = isoldenoughforonline}
				if NOT InNetGame
					if ($g_career_search = NULL)
						<menu_id> :se_setprops {
							event_handlers = [
								{pad_option2 band_lobby_friendslist_view_invites params = {Player = <Player>}}
							]
						}
					endif
				endif
			endif
		elseif isxenonorwindx
			NetSessionFunc \{Obj = plat_party
				func = get_num_party_players}
			if (<num_plat_party_players> = 0)
			else
				<menu_id> :se_setprops {
					event_handlers = [
						{pad_L1 band_lobby_friendslist_plat_party_invite}
					]
				}
			endif
		endif
		return VMenu = <menu_id>
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
			Player = <Player>
			callback = band_lobby_friendslist_really_view_invites
			callback_params = {}
		}
	endif
endscript

script band_lobby_friendslist_really_view_invites 
	printf \{qs(0xbfb63486)}
	NetSessionFunc \{func = displayandacceptinvites
		params = {
			callback = nullscript
		}}
endscript

script band_lobby_popup_adjust_scroll_thumb 
	RequireParams \{[
			direction
		]
		all}
	printf \{channel = band_lobby
		qs(0x6191d9b1)}
	if ScreenElementExists \{id = current_band_lobby_popup}
		Obj_GetID
		<objID> :menu_getselectedindex
		countscreenelementchildren id = <objID>
		current_band_lobby_popup :se_getprops \{scrollbar_thumb_pos}
		if (<num_children> > 1)
			size_of_scrollbar = 300.0
			step = (<size_of_scrollbar> / (<num_children> - 1))
			if (<direction> = up)
				if (<selected_index> != 0)
					current_band_lobby_popup :se_setprops scrollbar_thumb_pos = (<scrollbar_thumb_pos> - ((0.0, 1.0) * <step>))
				else
					current_band_lobby_popup :se_setprops scrollbar_thumb_pos = (((1.0, 0.0) * (<scrollbar_thumb_pos>.(1.0, 0.0))) + (0.0, 524.0))
				endif
			elseif (<direction> = down)
				if (<selected_index> != (<num_children> - 1))
					current_band_lobby_popup :se_setprops scrollbar_thumb_pos = (<scrollbar_thumb_pos> + ((0.0, 1.0) * <step>))
				else
					current_band_lobby_popup :se_setprops scrollbar_thumb_pos = (((1.0, 0.0) * (<scrollbar_thumb_pos>.(1.0, 0.0))) + (0.0, 224.0))
				endif
			endif
		endif
	endif
endscript

script band_lobby_friendslist_callback 
	if isps3
		SpawnScriptNow band_lobby_friendslist_callback_spawned params = {<...>}
	else
		SpawnScriptNow band_lobby_friendslist_callback_spawned params = {<...> no_wait}
	endif
endscript

script band_lobby_friendslist_callback_spawned 
	printf \{channel = band_lobby
		qs(0x786596cd)}
	RequireParams \{[
			params
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<params>.submenu_index)
	if isps3
		getplayerinfo ($<submenu_data>.Player) controller out = this_controller
		if NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <this_controller>}
			return
		endif
	endif
	if NOT GotParam \{no_wait}
		Wait \{0.5
			Second}
	endif
	getplayerinfo ($<submenu_data>.Player) controller
	if ((GotParam friendlist) && (ScreenElementExists id = band_lobby_popup_menu))
		band_lobby_popup_menu :GetSingleTag \{menu}
		if (<menu> = friendslist)
			GetArraySize <friendlist>
			<rock_record_uids> = []
			if (<array_Size> > 0)
				if ScreenElementExists \{id = current_band_lobby_popup}
					formatText TextName = num_online qs(0x48c6d14c) d = <total_number_friends>
					formatText TextName = num_gh qs(0x48c6d14c) d = <number_friends_playing_title>
					current_band_lobby_popup :se_setprops {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				i = 0
				begin
				if NOT CheckForSignIn controller_index = <controller> dont_set_primary
					cant_invite = 1
				elseif (0 != <friendlist> [<i>].localplayer)
					cant_invite = 1
				elseif (0 != <friendlist> [<i>].alreadyingame)
					cant_invite = 1
				elseif NOT ($g_career_search = NULL)
					cant_invite = 1
				elseif isps3
					if NOT NetSessionFunc \{Obj = party
							func = is_party_session_available}
						cant_invite = 1
					else
						cant_invite = 0
					endif
				else
					cant_invite = 0
				endif
				band_lobby_add_player_ui_to_popup {
					player_index = (-1)
					parent_id = band_lobby_popup_menu
					player_type_text = qs(0x00000000)
					gamertag_text = (<friendlist> [<i>].Name)
					net_id_first = (<friendlist> [<i>].id [0])
					net_id_second = (<friendlist> [<i>].id [1])
					friendstate = (<friendlist> [<i>].friendstate)
					sentfriendrequest = (<friendlist> [<i>].sentfriendrequest)
					sentinvite = (<friendlist> [<i>].sentinvite)
					cant_invite = <cant_invite>
					controlling_player = ($<submenu_data>.Player)
					desc_id = 'band_lobby_pu_friend_item'
					rich_presence = (<friendlist> [<i>].richpresence)
				}
				array = []
				AddArrayElement array = <array> element = (<friendlist> [<i>].id [0])
				AddArrayElement array = <array> element = (<friendlist> [<i>].id [1])
				AddArrayElement array = <rock_record_uids> element = <array>
				<rock_record_uids> = <array>
				RemoveParameter \{array}
				<i> = (<i> + 1)
				repeat <array_Size>
				if CheckForSignIn controller_index = <controller> dont_set_primary network_platform_only
					readleaderboardbyuidlist callback = band_lobby_rock_record_callback leaderboard_id = lb_rock_record user_id_list = <rock_record_uids>
				endif
				band_lobby_popup_menu :se_setprops \{event_handlers = [
						{
							pad_up
							band_lobby_popup_adjust_scroll_thumb
							params = {
								direction = up
							}
						}
						{
							pad_down
							band_lobby_popup_adjust_scroll_thumb
							params = {
								direction = down
							}
						}
					]}
			else
				if ScreenElementExists \{id = current_band_lobby_popup}
					formatText \{TextName = num_online
						qs(0x6160dbf3)}
					formatText \{TextName = num_gh
						qs(0x6160dbf3)}
					current_band_lobby_popup :se_setprops {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				clean_up_user_control_helpers
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			endif
			band_lobby_popup_menu :GetSingleTag \{desc_id}
			if ScreenElementExists id = <desc_id>
				<desc_id> :se_setprops pu_spinner_cont_alpha = 0.0
			endif
		endif
	endif
endscript

script band_lobby_rock_record_callback 
	if ScreenElementExists \{id = band_lobby_popup_menu}
		<rows_size> = 0
		if GotParam \{rows}
			GetArraySize <rows>
			<rows_size> = <array_Size>
		endif
		if (<status> != failed && <rows_size> > 0)
			GetScreenElementChildren \{id = band_lobby_popup_menu}
			GetArraySize <children>
			<j> = 0
			begin
			if (<children> [<j>]) :GetSingleTag net_id
				<i> = 0
				begin
				<lb_net_id> = (<rows> [<i>].player_id)
				if (<net_id> [0] = <lb_net_id> [0] && <net_id> [1] = <lb_net_id> [1])
					if (<children> [<j>]) :GetSingleTag is_friends_list
						(<children> [<j>]) :se_setprops {
							event_handlers = [
								{pad_option display_rock_record params = {net_id = <lb_net_id> unfocus_id = band_lobby_popup_menu band_lobby_no_anim_in}}
							]
						}
					else
						(<children> [<j>]) :GetSingleTag controlling_player
						(<children> [<j>]) :GetSingleTag select_actions
						(<children> [<j>]) :GetSingleTag player_index
						(<children> [<j>]) :se_setprops {
							event_handlers = [
								{
									pad_choose
									band_lobby_popup_create_submenu
									params = {
										select_actions = <select_actions>
										net_id = <lb_net_id>
										Player = <player_index>
										controlling_player = <controlling_player>
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
					(<children> [<j>]) :se_setprops right_icon_cont_alpha = 1 time = 0.5
					(<children> [<j>]) :SetTags {has_rock_record = 1}
				endif
				<i> = (<i> + 1)
				repeat <rows_size>
			endif
			<j> = (<j> + 1)
			repeat <array_Size>
			band_lobby_popup_menu :SetTags \{rock_record_tags_have_been_set}
			LaunchEvent \{Type = unfocus
				target = band_lobby_popup_menu}
			LaunchEvent \{Type = focus
				target = band_lobby_popup_menu}
		endif
	endif
endscript

script band_lobby_popup_begin_polling_for_rock_record 
	Obj_GetID
	se_getparentid
	<parent_id> :Obj_KillSpawnedScript Name = band_lobby_popup_poll_for_rock_record
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
	Wait \{1
		gameframe}
	repeat
	<id> :GetSingleTag has_rock_record
	if (<has_rock_record> = 1)
		if NOT user_control_helper_exists \{button = blue}
			getplayerinfo <controlling_player> controller
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_rock_record) button = blue z = 100000
		endif
	elseif user_control_helper_exists \{button = blue}
		user_control_destroy_helper \{button = blue}
	endif
endscript

script band_lobby_go_back_to_local_play 
	band_lobby_change_network Player = <Player> network = local focus = 0
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
	Change \{g_lobby_invite_flag = 0}
	band_lobby_attempt_to_join device_num = <device_num> viewport_index = <viewport_index>
endscript

script band_lobby_cancel_out_of_popup 
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_create_popup_change_profile 
	RequireParams \{[
			parent
			Player
		]
		all}
	printf \{channel = band_lobby
		qs(0xf9fa8175)}
	array = [
	]
	if NOT checksumequals a = <msg_checksum> b = not_connted_to_live
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = ($band_lobby_strings.<msg_checksum>)
		if NOT isps3
			AddArrayElement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = showsigninui4pane params = {online_only}}}
		elseif NetSessionFunc func = ismultiplayerallowed params = {controller_index = <controller>}
			if NetSessionFunc \{func = has_network_platform_account}
				AddArrayElement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = showsigninui4pane params = {online_only}}}
			endif
		endif
		if isps3
			if NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <controller>}
				heading_text = ($band_lobby_strings.popup_title_warning)
				body_text = ($band_lobby_strings.age_restricted)
			endif
		endif
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			AddArrayElement array = <array> element = {text = ($band_lobby_strings.end_session) func = band_lobby_go_back_to_local_play func_params = {Player = <Player> target = <menu_id> viewport_index = <viewport_index>}}
		endif
	else
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = ($band_lobby_strings.<msg_checksum>)
	endif
	AddArrayElement array = <array> element = {text = ($band_lobby_strings.cancel) func = band_lobby_cancel_out_of_popup func_params = {Player = <Player> target = <menu_id>}}
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
	if (<Player> != -1)
		getplayerinfo <Player> gamertag
		dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	endif
	return VMenu = <menu_id>
endscript

script band_lobby_update_popup_player_ui 
	RequireParams \{[
			update
		]
		all}
	printf \{channel = band_lobby
		qs(0x2ddc9b02)}
	if (<update> = add)
		band_lobby_add_player_ui_to_popup <...>
	elseif (<update> = remove)
		band_lobby_remove_player_ui_from_popup <...>
	endif
endscript

script band_lobby_add_player_ui_to_popup {
		player_type_text = qs(0x36abd2d6)
		gamertag_text = qs(0xb81382c3)
		net_id_first = 0
		net_id_second = 0
		part_props = {}
		rich_presence = qs(0x00000000)
		bg_rgba = [128 128 128 255]
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
	printf \{channel = band_lobby
		qs(0x5378c8f3)}
	if (<player_index> = -1)
		if GotParam \{friendstate}
			if isxenonorwindx
				band_lobby_get_part_icon_parts part = <friendstate>
			else
				band_lobby_get_part_icon_parts \{part = None}
			endif
			if (1 = <cant_invite>)
				rich_presence = ($band_lobby_strings.cant_invite)
			else
				if (<sentfriendrequest> = true)
					rich_presence = ($band_lobby_strings.pending_friend_request)
				endif
			endif
		else
			band_lobby_get_part_icon_parts \{part = remote}
		endif
	else
		getplayerinfo <player_index> part
		getplayerinfo <player_index> net_id_first
		getplayerinfo <player_index> net_id_second
		getplayerinfo <player_index> gamertag
		getplayerinfo <player_index> Band
		getplayerinfo <player_index> difficulty
		<double_kick_drum> = 0
		if (<difficulty> = expert)
			if (<part> = drum)
				getplayerinfo <player_index> double_kick_drum
				if (<double_kick_drum> = 1)
					difficulty = expert_plus
				endif
			endif
		endif
		printf qs(0x49740e90) d = <difficulty> e = <part> f = <double_kick_drum> g = <player_index>
		get_fullname_for_player Player = <player_index>
		gamertag_text = <fullname>
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
		if playerinfoequals <player_index> is_local_client = 1
			getplayerinfo <player_index> controller
			band_lobby_get_is_guest device_num = <controller>
			if (<is_guest> = 1)
				net_id_first = 0
				net_id_second = 0
			endif
			formatText TextName = player_type_text qs(0xd7732250) d = <controller>
		else
			player_type_text = qs(0x36abd2d6)
		endif
	endif
	array = []
	AddArrayElement array = <array> element = <net_id_first>
	AddArrayElement array = <array> element = <net_id_second>
	net_id = <array>
	CreateScreenElement {
		parent = <parent_id>
		Type = descinterface
		desc = <desc_id>
		autosizedims = true
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
	if NOT GotParam \{cant_invite}
		if (<select_actions> != None)
			array = [
				{unfocus band_lobby_popup_change_focus params = {focus_type = unfocus}}
			]
			getplayerinfo <controlling_player> controller out = controller_index
			if CheckForSignIn controller_index = <controller_index> dont_set_primary network_platform_only
				if (<list_type> != matchmaking)
					request_rock_record callback = band_lobby_rock_record_callback net_id = <net_id>
				endif
			endif
			if band_lobby_popup_submenu_has_selectable_item select_actions = <select_actions> net_id = <net_id> Player = <player_index> controlling_player = <controlling_player>
				AddArrayElement {
					array = <array>
					element = {
						pad_choose
						band_lobby_popup_create_submenu
						params = {
							select_actions = <select_actions>
							net_id = <net_id>
							Player = <player_index>
							controlling_player = <controlling_player>
						}
					}
				}
				AddArrayElement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 1 controlling_player = <controlling_player>}}
			else
				AddArrayElement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 0 controlling_player = <controlling_player>}}
			endif
		endif
	else
		<id> :SetTags is_friends_list = 1
		if (<cant_invite> = 0)
			AddArrayElement array = <array> element = {pad_choose band_lobby_send_invite params = {instrument = guitar net_id = <net_id> Name = <gamertag_text> controlling_player = <controlling_player>}}
		endif
		if isxenonorwindx
			AddArrayElement array = <array> element = {pad_option2 band_lobby_request_player_card params = {net_id_first = <net_id_first> net_id_second = <net_id_second>}}
		endif
	endif
	<id> :se_setprops {
		gamertag_text = <gamertag_text>
		gamertag_bg_rgba = <bg_rgba>
		metadata_text = <rich_presence>
		icon_chat_alpha = <chat_alpha>
		icon_leader_alpha = <leader_alpha>
		difficulty_text_alpha = <diff_alpha>
		difficulty_text_text = <diff_text>
		difficulty_alpha = <diff_alpha>
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
	printf \{channel = band_lobby
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
		repeat <array_Size>
	endif
endscript

script band_lobby_popup_change_focus 
	RequireParams \{[
			focus_type
		]
		all}
	printf \{channel = band_lobby
		qs(0xe3891cb2)}
	Obj_GetID
	if checksumequals a = <focus_type> b = focus
		<objID> :se_setprops {
			highlight_cont_alpha = 1
			focus_highlight_cont_alpha = 1
			unfocused_cont_alpha = 0.0
			gamertag_rgba = ($uicolorref_palette.black.rgba)
			metadata_rgba = ($uicolorref_palette.black.rgba)
		}
		if GotParam \{selectable}
			if (<selectable> = 1)
				if NOT user_control_helper_exists \{button = green}
					getplayerinfo <controlling_player> controller
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
					GetScreenElementChildren \{id = user_control_container}
					GetArraySize <children>
					if (<array_Size> > 1)
						user_control_container :menu_setitemindex index = (<array_Size> - 1) newindex = 1
					endif
				endif
			else
				if ScreenElementExists \{id = green_helper_pill_id}
					DestroyScreenElement \{id = green_helper_pill_id}
				endif
			endif
		endif
	else
		<objID> :se_setprops {
			highlight_cont_alpha = 0.0
			focus_highlight_cont_alpha = 0.0
			unfocused_cont_alpha = 0.5
			gamertag_rgba = ($uicolorref_palette.ntscwhite.rgba)
			metadata_rgba = ($uicolorref_palette.ntscwhite.rgba)
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
		<objID> :se_setprops rgba = ($uicolorref_palette.p6_dk.rgba)
	elseif checksumequals a = <focus_type> b = unfocus
		<objID> :se_setprops rgba = [125 125 125 255]
	endif
endscript

script band_lobby_update_vote 
	RequireParams \{[
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0x43aad51e)}
	Obj_GetID
	band_lobby_update_vote_loop objID = <objID>
	resolve_voting_outcome
	if ($global_should_use_net_debugging = 1)
		Result = {element = ($g_force_vote) text = qs(0x91affe2e)}
	else
		Result = (<voting_items_array> [<winner_index>])
	endif
	if ininternetmode
		if IsHost
			SendStructure {
				callback = band_lobby_conclude_voting
				data_to_send = {
					Result = <Result>
				}
			}
			band_lobby_conclude_voting objID = <objID> Result = <Result>
		endif
	else
		band_lobby_conclude_voting objID = <objID> Result = <Result>
	endif
endscript

script band_lobby_conclude_voting 
	RequireParams \{[
			Result
		]
		all}
	printf \{channel = band_lobby
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
				<objID> = <resolved_id>
			else
				return
			endif
		else
			return
		endif
	endif
	if ScreenElementExists id = <objID>
		band_lobby_display_winner objID = <objID> Result = <Result>
		if NOT checksumequals a = ($g_voting_callback_script) b = NULL
			($g_voting_callback_script) <...>
		else
			printf \{qs(0x2bd0a7cc)}
		endif
		Wait \{3
			Seconds}
		generic_event_choose \{state = 0x0604ee76}
	endif
endscript

script band_lobby_display_winner 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = band_lobby
		qs(0x43470d78)}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 0}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 0.0
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 1}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 0.0
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID id = [
		{id = <objID>}
		{index = 2}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 1.0
	endif
	ResolveScreenElementID id = [
		{id = <resolved_id>}
		{local_id = vote_item}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :se_setprops text = (<Result>.text)
	endif
endscript

script band_lobby_update_vote_loop 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = band_lobby
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
	getnumplayersingame
	if (<num_players> > 0)
		begin
		if ScreenElementExists id = <item_0_id>
			formatText TextName = vote_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			<item_0_id> :se_setprops text = <vote_count>
		endif
		if ScreenElementExists id = <item_1_id>
			formatText TextName = vote_count qs(0x48c6d14c) d = ($g_vote_counts [1])
			<item_1_id> :se_setprops text = <vote_count>
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
		Wait \{0.25
			Seconds}
		repeat 40
		KillSpawnedScript \{Name = band_lobby_update_voting_timer}
	endif
endscript

script band_lobby_update_voting_timer 
	printf \{channel = band_lobby
		qs(0x0b104388)}
	Obj_GetID
	OnExitRun band_lobby_reset_voting_timer params = {objID = <objID>}
	i = 10
	begin
	formatText TextName = countdown qs(0x48c6d14c) d = <i>
	<objID> :se_setprops pu_helper_msg_text = <countdown>
	i = (<i> - 1)
	Wait \{1
		Second}
	repeat 10
endscript

script band_lobby_reset_voting_timer 
	RequireParams \{[
			objID
		]
		all}
	printf \{channel = band_lobby
		qs(0x41142ac4)}
	<objID> :se_setprops pu_helper_msg_text = qs(0x6160dbf3)
endscript

script band_lobby_cancel_voting 
	RequireParams \{[
			container
		]
		all}
	printf \{channel = band_lobby
		qs(0x5c72db40)}
	if playerinfoequals ($g_leader_player_num) controller = <device_num>
		if ininternetmode
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
	printf \{channel = band_lobby
		qs(0xe7c1377a)}
	get_local_in_game_player_num_from_controller controller_index = <device_num>
	if (<player_num> > -1)
		if playerinfoequals <player_num> part = guitar
			setplayerinfo <player_num> part = bass
			return
		elseif playerinfoequals <player_num> part = bass
			setplayerinfo <player_num> part = guitar
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
	printf \{channel = band_lobby
		qs(0x2b6cad8e)}
	current_difficulty = <difficulty>
	Obj_GetID
	begin
	if NOT playerinfoequals <player_index> part = <part>
		getplayerinfo <player_index> part
		band_lobby_get_part_icon_parts part = <part>
		<objID> :se_setprops <part_props>
	endif
	getplayerinfo <player_index> difficulty out = difficulty
	if (<difficulty> = expert)
		if playerinfoequals <player_index> part = drum
			getplayerinfo <player_index> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	if (<difficulty> != <current_difficulty>)
		current_difficulty = <difficulty>
		band_lobby_get_difficulty_icon_and_string difficulty = <difficulty>
		<objID> :se_setprops difficulty_text_text = <text> difficulty_texture = <texture>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_get_difficulty_icon_and_string 
	RequireParams \{[
			difficulty
		]
		all}
	printf \{channel = band_lobby
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
	printf \{channel = band_lobby
		qs(0x54ea34dc)}
	switch <part>
		case guitar
		return part_props = {
			part_icon_top_texture = mixer_icon_guitar
			part_icon_top_rgba = ($uicolorref_palette.ntscwhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case bass
		return part_props = {
			part_icon_top_texture = mixer_icon_bass
			part_icon_top_rgba = ($uicolorref_palette.ntscwhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case drum
		return part_props = {
			part_icon_top_texture = mixer_icon_drums
			part_icon_top_rgba = ($uicolorref_palette.ntscwhite.rgba)
			part_icon_bottom_alpha = 0
		}
		case vocals
		return part_props = {
			part_icon_top_texture = mixer_icon_vox
			part_icon_top_rgba = ($uicolorref_palette.ntscwhite.rgba)
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
	printf \{channel = band_lobby
		qs(0x55953908)}
	band_lobby_signin func = <func> params = <params> controller = <device_num>
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_popup_menu 
	Change \{g_suppress_anim_in = 1}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_desc_id :Obj_KillSpawnedScript \{Name = band_lobby_update_mics}
	ui_event_wait \{event = menu_change
		data = {
			is_popup
			state = uistate_mic_binding
		}}
endscript

script band_lobby_popup_change_popup_focus 
	RequireParams \{[
			focus_type
		]
		all}
	printf \{channel = band_lobby
		qs(0xfb1bab52)}
	if ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent Type = <focus_type> target = current_band_lobby_popup
	endif
endscript

script band_lobby_popup_create_submenu 
	RequireParams \{[
			controlling_player
			Player
			select_actions
		]
		all}
	printf \{channel = band_lobby
		qs(0x2cd64fe0)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if NOT band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent
				param = popup_cont}
			ScriptAssert \{'could not get band lobby popup container!'}
		endif
	else
		popup_cont = current_band_lobby_popup
	endif
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{Type = unfocus
			target = band_lobby_popup_menu}
	endif
	if ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent \{Type = unfocus
			target = current_band_lobby_popup}
	endif
	if ScreenElementExists \{id = band_lobby_manage_player}
		DestroyScreenElement \{id = band_lobby_manage_player}
	endif
	CreateScreenElement {
		Type = descinterface
		local_id = submenu
		id = band_lobby_manage_player
		desc = 'band_lobby_pu_player_manage'
		parent = <popup_cont>
		z_priority = 1500
	}
	desc_id = <id>
	if <id> :desc_resolvealias Name = alias_game_rules_vmenu param = menu_id
		<menu_id> :se_setprops event_handlers = [{pad_back band_lobby_popup_destroy_submenu params = {submenu_id = <popup_cont>}}]
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
		unfocusable_color = [60 60 60 255]
		<id> :desc_resolvealias Name = alias_band_lobby_item_boot param = item_id
		if InNetGame
			kick = 0
		endif
		if (<kick> = 1)
			<item_id> :se_setprops {
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
				item_text_rgba = [128 128 128 255]
			}
		else
			<item_id> :se_setprops {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :desc_resolvealias Name = alias_band_lobby_item_leadership param = item_id
		add_grant_option = 0
		if ((<leader> = 1) && ($g_net_leader_player_num != <Player>))
			if playerinfoequals <Player> is_local_client = 1
				getplayerinfo <Player> controller
				band_lobby_get_is_guest device_num = <controller>
				if ($g_career_search = NULL)
					if (<is_guest> = 0)
						add_grant_option = 1
					endif
				endif
			endif
		endif
		if (<add_grant_option> = 1)
			<item_id> :se_setprops {
				event_handlers = [
					{focus band_lobby_popup_submenu_item_focus}
					{unfocus band_lobby_popup_submenu_item_unfocus}
					{pad_choose band_lobby_popup_submenu_select params = {action = leader net_id = <net_id> Player = <Player>}}
				]
				highlight_btn_alpha = 0
				item_text_rgba = [255 255 255 255]
			}
		else
			<item_id> :se_setprops {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :desc_resolvealias Name = alias_band_lobby_item_gamercard param = item_id
		if isxenonorwindx
			<is_focusable> = 0
			getplayerinfo <controlling_player> controller
			if CheckForSignIn local controller_index = <controller>
				if NetSessionFunc func = canviewprofile params = {controller_index = <controller>}
					if (((<net_id> [0]) != 0) && ((<net_id> [1]) != 0))
						<item_id> :se_setprops {
							event_handlers = [
								{focus band_lobby_popup_submenu_item_focus}
								{unfocus band_lobby_popup_submenu_item_unfocus}
								{pad_choose band_lobby_popup_submenu_select params = {action = player_card net_id = <net_id>}}
							]
							highlight_btn_alpha = 0
							item_text_rgba = [255 255 255 255]
						}
						<is_focusable> = 1
					endif
				endif
			endif
			if (<is_focusable> = 0)
				<item_id> :se_setprops {
					not_focusable
					item_text_rgba = <unfocusable_color>
					highlight_btn_alpha = 0
				}
			endif
		else
			DestroyScreenElement id = <item_id>
		endif
		Obj_GetID
		<id> :desc_resolvealias Name = alias_band_lobby_item_rock_record param = item_id
		if <objID> :GetSingleTag has_rock_record
			if (<has_rock_record> = 1)
				<item_id> :se_setprops {
					event_handlers = [
						{focus band_lobby_popup_submenu_item_focus}
						{unfocus band_lobby_popup_submenu_item_unfocus}
						{pad_choose band_lobby_popup_submenu_select params = {action = rock_record net_id = <net_id>}}
					]
					highlight_btn_alpha = 0
					item_text_rgba = [255 255 255 255]
				}
			else
				<item_id> :se_setprops {
					not_focusable
					item_text_rgba = <unfocusable_color>
					highlight_btn_alpha = 0
				}
			endif
		endif
		getplayerinfo <Player> gamertag
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
		LaunchEvent Type = focus target = <menu_id>
	endif
endscript

script band_lobby_popup_submenu_item_focus 
	Obj_GetID
	<objID> :se_setprops {
		item_text_rgba = black
		highlight_btn_alpha = 0.8
	}
endscript

script band_lobby_popup_submenu_item_unfocus 
	Obj_GetID
	<objID> :se_setprops {
		item_text_rgba = [255 255 255 255]
		highlight_btn_alpha = 0
	}
endscript

script band_lobby_popup_destroy_submenu 
	RequireParams \{[
			submenu_id
		]
		all}
	printf \{channel = band_lobby
		qs(0x22e9c419)}
	if ScreenElementExists id = {<submenu_id> child = submenu}
		DestroyScreenElement id = {<submenu_id> child = submenu}
	endif
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{Type = focus
			target = band_lobby_popup_menu}
	elseif ScreenElementExists \{id = current_band_lobby_popup}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script band_lobby_popup_submenu_focus 
	printf \{channel = band_lobby
		qs(0x9a15d357)}
	se_getprops
	adjust_pos = (-183.0, -60.0)
	<desc_id> :se_setprops songlist_manage_playlist_selection_bar_pos = (<Pos> + <adjust_pos>)
endscript

script band_lobby_popup_submenu_select 
	RequireParams \{[
			action
		]
		all}
	printf \{channel = band_lobby
		qs(0xdc79b3fb)}
	se_getparentid
	switch <action>
		case kick
		RequireParams \{[
				controlling_player
			]
			all}
		band_lobby_kick_remote_player_popup user_id = <net_id> controlling_player = <controlling_player>
		case leader
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :Obj_SpawnScriptLater band_lobby_popup_submenu_grant_leadership params = {Player = <Player> user_id = <net_id>}
		endif
		case player_card
		band_lobby_request_player_card device_num = <device_num> net_id_first = (<net_id> [0]) net_id_second = (<net_id> [1])
		case rock_record
		if ScreenElementExists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :Obj_SpawnScriptLater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = band_lobby_popup_menu}
		elseif ScreenElementExists \{id = current_band_lobby_popup}
			current_band_lobby_popup :Obj_SpawnScriptLater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = current_menu}
		endif
	endswitch
	LaunchEvent Type = pad_back target = <parent_id>
endscript

script band_lobby_popup_submenu_grant_leadership 
	printf \{channel = band_lobby
		qs(0xc2989b06)}
	Wait \{2
		frames}
	band_lobby_grant_leadership Player = <Player> user_id = <net_id>
endscript

script band_lobby_popup_submenu_rock_record 
	printf \{channel = band_lobby
		qs(0x8d674b0a)}
	<pad_event_device> = <device_num>
	Wait \{2
		frames}
	ui_event_get_top
	if (<base_name> = 'band_lobby')
		display_rock_record {
			device_num = <pad_event_device>
			net_id = <net_id>
			unfocus_id = <unfocus_id>
			band_lobby_no_anim_in
		}
	else
		display_rock_record {
			device_num = <pad_event_device>
			net_id = <net_id>
			unfocus_id = <unfocus_id>
		}
	endif
endscript

script band_lobby_popup_submenu_has_selectable_item 
	printf \{channel = band_lobby
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
	if ((<leader> = 1) && ($g_net_leader_player_num != <Player>))
		if playerinfoequals <Player> is_local_client = 1
			getplayerinfo <Player> controller
			band_lobby_get_is_guest device_num = <controller>
			if ($g_career_search = NULL)
				if (<is_guest> = 0)
					num_items = (<num_items> + 1)
				endif
			endif
		endif
	endif
	if isxenonorwindx
		getplayerinfo <controlling_player> controller
		if CheckForSignIn local controller_index = <controller>
			if NetSessionFunc func = canviewprofile params = {controller_index = <controller>}
				if (((<net_id> [0]) != 0) && ((<net_id> [1]) != 0))
					num_items = (<num_items> + 1)
				endif
			endif
		endif
	endif
	if (<num_items> > 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_does_popup_exist 
	printf \{channel = band_lobby
		qs(0x0b94f8aa)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent
				param = popup_cont}
			if GetScreenElementChildren id = <popup_cont>
				return \{true}
			else
				return \{FALSE}
			endif
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript
