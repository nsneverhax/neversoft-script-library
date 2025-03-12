
script band_lobby_create_popup_menu \{list_type = player}
	printf \{channel = band_lobby
		qs(0xc811e689)}
	requireparams \{[
			menu
			container
		]
		all}
	if screenelementexists id = <container>
		if screenelementexists \{id = current_band_lobby_popup}
			launchevent \{type = unfocus
				target = band_lobby_popup_menu}
			destroyscreenelement id = <container> preserve_parent
		endif
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		back_script = band_lobby_destroy_popup_menu
		back_params = {container = <container>}
		band_lobby_popup_get_exclusive_devices <...>
		<container> :se_setprops exclusive_device = <exclusive_devices>
		if gotparam \{controller}
			player = -1
		else
			getplayerinfo <player> controller
		endif
		switch <menu>
			case friendslist
			band_lobby_create_popup_menu_friendslist parent = <container> player = <player>
			case playerslist
			band_lobby_create_popup_menu_players_list parent = <container> player = <player> list_type = <list_type> is_popup = 1
			if checksumequals a = <list_type> b = matchmaking
				menu = matchmaking
				if netsessionfunc \{obj = party
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
			band_lobby_create_popup_menu_leave_lobby parent = <container> player = <player> msg_checksum = <msg_checksum> <...>
			case error_msg
			band_lobby_create_popup_menu_generic_error parent = <container> player = <player> msg_checksum = ($g_band_lobby_error_msg)
			case generic_vote
			band_lobby_create_popup_generic_vote parent = <container> player = <player> voting_items_array = <voting_items_array>
			back_script = band_lobby_cancel_voting
			back_params = {container = <container>}
			case change_profile
			band_lobby_create_popup_change_profile parent = <container> player = <player> controller = <controller> msg_checksum = <msg_checksum> viewport_index = <viewport_index>
			menu = generic_popup
			case teams
			band_lobby_create_popup_teams parent = <container> player = <player>
			if ($g_lobby_net_state != local)
				back_script = generic_event_choose
				back_params = {state = uistate_online_quit_warning data = {player_device = <controller>}}
			endif
			case delete_rocker
			band_lobby_create_popup_menu_delete_rocker parent = <container> player = <player> viewport_index = <viewport_index>
			default
			scriptassert \{qs(0xc49f902e)}
		endswitch
		if gotparam \{vmenu}
			assignalias id = <vmenu> alias = band_lobby_popup_menu
		else
			scriptassert \{qs(0x47c72c53)}
		endif
		band_lobby_update_button_helpers menu = <menu> player = <player> controller = <controller>
		if screenelementexists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :settags {
				menu = <menu>
				player = <player>
			}
		endif
		<container> :se_getparentid
		<parent_id> :se_setprops alpha = 1.0 time = 0.2
		<parent_id> :se_waitprops
		if screenelementexists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :se_setprops {
				event_handlers = [
					{pad_back <back_script> params = <back_params>}
				]
				replace_handlers
				tags = {
					menu = <menu>
					player = <player>
				}
			}
		endif
		if screenelementexists \{id = band_lobby_popup_menu}
			if gotparam \{index_to_focus}
				launchevent type = focus target = band_lobby_popup_menu data = {child_index = <index_to_focus>}
			else
				launchevent \{type = focus
					target = band_lobby_popup_menu}
			endif
		endif
	else
		printf \{qs(0x8e50f870)}
	endif
endscript

script bl_refresh_popup_button_helpers 
	requireparams \{[
			menu
			player
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0xe50ef504)}
	begin
	if isscreenelementinfocus \{id = band_lobby_popup_menu}
		band_lobby_update_button_helpers menu = <menu> player = <player> controller = <controller>
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_destroy_popup_menu \{animate = 1}
	printf \{channel = band_lobby
		qs(0x36403b5f)}
	soundevent \{event = lobbyback_sfx}
	killspawnedscript \{name = band_lobby_friendslist_callback_spawned}
	if screenelementexists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent
				param = popup_cont}
			band_lobby_kick_leader_out_of_band_manage
			if screenelementexists \{id = band_lobby_popup_menu}
				launchevent \{type = unfocus
					target = band_lobby_popup_menu}
			endif
			if (<animate> = 1)
				<popup_cont> :se_getparentid
				<parent_id> :se_setprops alpha = 0.0 time = 0.2
				<parent_id> :se_waitprops
			endif
			destroyscreenelement id = <popup_cont> preserve_parent
			band_lobby_update_button_helpers
			if NOT gotparam \{no_focus}
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	endif
endscript

script band_lobby_popup_get_exclusive_devices 
	requireparams \{[
			menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xe9e62f3f)}
	if gotparam \{controller}
		player = -1
	else
		getplayerinfo <player> controller
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
			getplayerinfo <player> controller
			addarrayelement array = <array> element = <controller>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	else
		addarrayelement array = <array> element = <controller>
	endif
	return exclusive_devices = <array>
endscript

script band_lobby_create_popup_menu_generic_error 
	requireparams \{[
			parent
			player
			msg_checksum
		]
		all}
	printf \{channel = band_lobby
		qs(0xa94ca893)}
	getplayerinfo <player> gamertag
	getplayerinfo <player> controller
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		template = no_options
		body_text = ($band_lobby_strings.<msg_checksum>)
	}
	assignalias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	change \{g_band_lobby_error_msg = null}
	change \{g_leader_player_num = -1}
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_create_popup_generic_vote 
	requireparams \{[
			parent
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0xe2ca7aa7)}
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'band_lobby_pu_generic_vote'
		z_priority = 20.0
	}
	assignalias id = <id> alias = current_band_lobby_popup
	getplayerinfo <player> gamertag
	<id> :se_setprops pu_gamertag_text = ($<gamertag>)
	change \{g_vote_counts = [
			0
			0
		]}
	change \{g_controllers_that_voted = [
		]}
	resolvescreenelementid id = [
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
		getplayerinfo <player> controller
		addarrayelement array = <array> element = <controller>
		getnextplayer player = <player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	getarraysize <voting_items_array>
	if (<array_size> > 0)
		array = []
		i = 0
		begin
		resolvescreenelementid id = [
			{id = <menu_id>}
			{index = <i>}
			{local_id = vote_item}
		]
		if screenelementexists id = <resolved_id>
			<resolved_id> :se_setprops text = (<voting_items_array> [<i>].text)
			if (<i> < 2)
				formattext textname = button_helper_string qs(0xc19e6243) d = (<voting_items_array> [<i>].text)
				formattext checksumname = helper_text_global 'g_vote_items_text_helper_%d' d = <i>
				change globalname = <helper_text_global> newvalue = <button_helper_string>
				if (<i> = 0)
					addarrayelement array = <array> element = {pad_option cast_vote params = {option = <i>}}
				elseif (<i> = 1)
					addarrayelement array = <array> element = {pad_option2 cast_vote params = {option = <i>}}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		event_handlers = <array>
	endif
	current_band_lobby_popup :obj_spawnscriptnow \{band_lobby_update_voting_timer}
	<menu_id> :obj_spawnscriptnow band_lobby_update_vote params = {voting_items_array = <voting_items_array>}
	<menu_id> :se_setprops event_handlers = <event_handlers>
	return vmenu = <menu_id> exclusive_devices = <controllers_allowed_to_vote>
endscript

script band_lobby_create_popup_menu_leave_lobby 
	printf \{channel = band_lobby
		qs(0x3c0a4772)}
	requireparams \{[
			parent
			player
			msg_checksum
		]
		all}
	getplayerinfo <player> gamertag
	getplayerinfo <player> controller
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
	assignalias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_create_popup_menu_delete_rocker 
	printf \{channel = band_lobby
		qs(0x28e09860)}
	requireparams \{[
			parent
			player
		]
		all}
	getplayerinfo <player> gamertag
	getplayerinfo <player> controller
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
	assignalias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	return \{vmenu = dialog_box_container}
endscript

script band_lobby_destroy_popup_and_run_quit_script 
	printf \{channel = band_lobby
		qs(0x3319bb35)}
	band_lobby_destroy_popup_menu container = <container>
	if checksumequals a = <choose_script> b = band_lobby_go_back
		band_lobby_whole_band_autosave player = <player> choose_script = <choose_script> viewport_index = <viewport_index>
	else
		<choose_script>
	endif
endscript

script band_lobby_create_popup_menu_friendslist 
	printf \{channel = band_lobby
		qs(0x85abf013)}
	requireparams \{[
			parent
			player
		]
		all}
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'band_lobby_pu_friend'
		z_priority = 20.0
		pu_friends_online_num_text = qs(0x00000000)
		pu_friends_gh_num_text = qs(0x00000000)
	}
	assignalias id = <id> alias = current_band_lobby_popup
	getplayerinfo <player> gamertag
	<id> :se_setprops pu_gamertag_text = ($<gamertag>)
	if current_band_lobby_popup :desc_resolvealias \{name = alias_diamondbling3
			param = diamondbling3_id}
		<diamondbling3_id> :obj_spawnscript 0x01315b7f params = {minwidth = 50 maxwidth = 200 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = alias_diamondbling4
			param = diamondbling4_id}
		<diamondbling4_id> :obj_spawnscript 0x01315b7f params = {minwidth = 2 maxwidth = 300 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = alias_instrument_spinner
			param = spinner_id}
		<spinner_id> :obj_spawnscriptnow savegame_ui_icon_anim
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = 0x10aeb4b2}
		if screenelementexists \{id = current_band_lobby_popup}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 5 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = 0xa02563d1}
		if screenelementexists \{id = current_band_lobby_popup}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = 0x5f448112}
		if screenelementexists \{id = current_band_lobby_popup}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = 0x219b1158}
		if screenelementexists \{id = current_band_lobby_popup}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if current_band_lobby_popup :desc_resolvealias \{name = alias_pu_menu
			param = menu_id}
		<menu_id> :settags desc_id = current_band_lobby_popup
		if isps3
			if netsessionfunc \{func = isoldenoughforonline}
				if NOT innetgame
					if ($g_career_search = null)
						<menu_id> :se_setprops {
							event_handlers = [
								{pad_option2 band_lobby_friendslist_view_invites params = {player = <player>}}
							]
						}
					endif
				endif
			endif
		elseif isxenonorwindx
			netsessionfunc \{obj = plat_party
				func = get_num_party_players}
			if (<num_plat_party_players> = 0)
			else
				<menu_id> :se_setprops {
					event_handlers = [
						{pad_l1 band_lobby_friendslist_plat_party_invite}
					]
				}
			endif
		endif
		return vmenu = <menu_id>
	endif
endscript

script band_lobby_friendslist_plat_party_invite 
	printf \{qs(0x353257fe)}
	netsessionfunc {
		obj = plat_party
		func = invite_party_players
		params = {
			controller_index = <device_num>
		}
	}
endscript

script band_lobby_friendslist_view_invites 
	printf \{qs(0x07cfc22b)}
	if checkforsignin controller_index = <device_num>
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
	netsessionfunc \{func = displayandacceptinvites
		params = {
			callback = nullscript
		}}
endscript

script band_lobby_popup_adjust_scroll_thumb 
	requireparams \{[
			direction
		]
		all}
	printf \{channel = band_lobby
		qs(0x6191d9b1)}
	if screenelementexists \{id = current_band_lobby_popup}
		obj_getid
		<objid> :menu_getselectedindex
		countscreenelementchildren id = <objid>
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
		spawnscriptnow band_lobby_friendslist_callback_spawned params = {<...>}
	else
		spawnscriptnow band_lobby_friendslist_callback_spawned params = {<...> no_wait}
	endif
endscript

script band_lobby_friendslist_callback_spawned 
	printf \{channel = band_lobby
		qs(0x786596cd)}
	requireparams \{[
			params
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = (<params>.submenu_index)
	if isps3
		getplayerinfo ($<submenu_data>.player) controller out = this_controller
		if NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <this_controller>}
			return
		endif
	endif
	if NOT gotparam \{no_wait}
		wait \{0.5
			second}
	endif
	getplayerinfo ($<submenu_data>.player) controller
	if ((gotparam friendlist) && (screenelementexists id = band_lobby_popup_menu))
		band_lobby_popup_menu :getsingletag \{menu}
		if (<menu> = friendslist)
			getarraysize <friendlist>
			<rock_record_uids> = []
			if (<array_size> > 0)
				if screenelementexists \{id = current_band_lobby_popup}
					formattext textname = num_online qs(0x48c6d14c) d = <total_number_friends>
					formattext textname = num_gh qs(0x48c6d14c) d = <number_friends_playing_title>
					current_band_lobby_popup :se_setprops {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				i = 0
				begin
				if NOT checkforsignin controller_index = <controller> dont_set_primary
					cant_invite = 1
				elseif (0 != <friendlist> [<i>].localplayer)
					cant_invite = 1
				elseif (0 != <friendlist> [<i>].alreadyingame)
					cant_invite = 1
				elseif NOT ($g_career_search = null)
					cant_invite = 1
				elseif isps3
					if NOT netsessionfunc \{obj = party
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
					gamertag_text = (<friendlist> [<i>].name)
					net_id_first = (<friendlist> [<i>].id [0])
					net_id_second = (<friendlist> [<i>].id [1])
					friendstate = (<friendlist> [<i>].friendstate)
					sentfriendrequest = (<friendlist> [<i>].sentfriendrequest)
					sentinvite = (<friendlist> [<i>].sentinvite)
					cant_invite = <cant_invite>
					controlling_player = ($<submenu_data>.player)
					desc_id = 'band_lobby_player_info'
					rich_presence = (<friendlist> [<i>].richpresence)
				}
				array = []
				addarrayelement array = <array> element = (<friendlist> [<i>].id [0])
				addarrayelement array = <array> element = (<friendlist> [<i>].id [1])
				addarrayelement array = <rock_record_uids> element = <array>
				<rock_record_uids> = <array>
				removeparameter \{array}
				<i> = (<i> + 1)
				repeat <array_size>
				if checkforsignin controller_index = <controller> dont_set_primary network_platform_only
					readleaderboardbyuidlist callback = band_lobby_rock_record_callback leaderboard_id = lb_rock_record user_id_list = <rock_record_uids>
				endif
				band_lobby_popup_menu :se_setprops {
					event_handlers = [
						{pad_up band_lobby_popup_adjust_scroll_thumb params = {direction = up}}
						{pad_up gh5_band_screen_ui_sound params = {player_num = ($<submenu_data>.player) up = 1}}
						{pad_down band_lobby_popup_adjust_scroll_thumb params = {direction = down}}
						{pad_down gh5_band_screen_ui_sound params = {player_num = ($<submenu_data>.player) down = 1}}
					]
				}
			else
				if screenelementexists \{id = current_band_lobby_popup}
					formattext \{textname = num_online
						qs(0x6160dbf3)}
					formattext \{textname = num_gh
						qs(0x6160dbf3)}
					current_band_lobby_popup :se_setprops {
						pu_friends_online_num_text = <num_online>
						pu_friends_gh_num_text = <num_gh>
					}
				endif
				clean_up_user_control_helpers
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			endif
			band_lobby_popup_menu :getsingletag \{desc_id}
			if screenelementexists id = <desc_id>
				<desc_id> :se_setprops pu_spinner_cont_alpha = 0.0
			endif
		endif
	endif
endscript

script band_lobby_rock_record_callback 
	if screenelementexists \{id = band_lobby_popup_menu}
		<rows_size> = 0
		if gotparam \{rows}
			getarraysize <rows>
			<rows_size> = <array_size>
		endif
		if band_lobby_popup_menu :getsingletag \{menu}
			<0x4037bbaa> = 0
			if (<menu> = friendslist || <menu> = playerslist || <menu> = matchmaking_done)
				<0x4037bbaa> = 1
			endif
			if (<status> != failed && <rows_size> > 0 && <0x4037bbaa> = 1)
				if getscreenelementchildren \{id = band_lobby_popup_menu}
					getarraysize <children>
					<j> = 0
					begin
					if (<children> [<j>]) :getsingletag net_id
						<i> = 0
						begin
						<lb_net_id> = (<rows> [<i>].player_id)
						if (<net_id> [0] = <lb_net_id> [0] && <net_id> [1] = <lb_net_id> [1])
							if (<children> [<j>]) :getsingletag is_friends_list
								(<children> [<j>]) :se_setprops {
									event_handlers = [
										{pad_option display_rock_record params = {net_id = <lb_net_id> unfocus_id = band_lobby_popup_menu band_lobby_no_anim_in from_lobby}}
									]
								}
							else
								(<children> [<j>]) :getsingletag controlling_player
								(<children> [<j>]) :getsingletag select_actions
								(<children> [<j>]) :getsingletag player_index
								(<children> [<j>]) :se_setprops {
									event_handlers = [
										{
											pad_choose
											band_lobby_popup_create_submenu
											params = {
												select_actions = <select_actions>
												net_id = <lb_net_id>
												player = <player_index>
												controlling_player = <controlling_player>
												0x579b05bb = 1
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
							(<children> [<j>]) :settags {has_rock_record = 1}
						endif
						<i> = (<i> + 1)
						repeat <rows_size>
					endif
					<j> = (<j> + 1)
					repeat <array_size>
					band_lobby_popup_menu :settags \{rock_record_tags_have_been_set}
					launchevent \{type = unfocus
						target = band_lobby_popup_menu}
					launchevent \{type = focus
						target = band_lobby_popup_menu}
				endif
			endif
		endif
	endif
endscript

script band_lobby_popup_begin_polling_for_rock_record 
	obj_getid
	se_getparentid
	<parent_id> :obj_killspawnedscript name = band_lobby_popup_poll_for_rock_record
	<parent_id> :obj_spawnscriptnow band_lobby_popup_poll_for_rock_record params = {id = <objid> controlling_player = <controlling_player>}
endscript

script band_lobby_popup_poll_for_rock_record 
	begin
	if NOT screenelementexists id = <id>
		return
	endif
	if getsingletag \{rock_record_tags_have_been_set}
		break
	endif
	wait \{1
		gameframe}
	repeat
	<id> :getsingletag has_rock_record
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
	band_lobby_change_network player = <player> network = local focus = 0
	if screenelementexists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
	change \{g_lobby_invite_flag = 0}
	band_lobby_attempt_to_join device_num = <device_num> viewport_index = <viewport_index>
endscript

script band_lobby_cancel_out_of_popup 
	if screenelementexists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_create_popup_change_profile 
	requireparams \{[
			parent
			player
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
			addarrayelement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = showsigninui4pane params = {online_only}}}
		elseif netsessionfunc func = ismultiplayerallowed params = {controller_index = <controller>}
			if netsessionfunc \{func = has_network_platform_account}
				addarrayelement array = <array> element = {text = ($band_lobby_strings.signin) func = band_lobby_call_signin_ui_from_popup func_params = {func = showsigninui4pane params = {online_only}}}
			endif
		endif
		if isps3
			if NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <controller>}
				heading_text = ($band_lobby_strings.popup_title_warning)
				body_text = ($band_lobby_strings.age_restricted)
			endif
		endif
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			addarrayelement array = <array> element = {text = ($band_lobby_strings.end_session) func = band_lobby_go_back_to_local_play func_params = {player = <player> target = <menu_id> viewport_index = <viewport_index>}}
		endif
	else
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = ($band_lobby_strings.<msg_checksum>)
	endif
	addarrayelement array = <array> element = {text = ($band_lobby_strings.cancel) func = band_lobby_cancel_out_of_popup func_params = {player = <player> target = <menu_id>}}
	create_dialog_box {
		parent = <parent>
		player_device = <controller>
		heading_text = <heading_text>
		body_text = <body_text>
		back_button_script = null_script
		options = <array>
	}
	assignalias \{id = dialog_box_container
		alias = current_band_lobby_popup}
	if (<player> != -1)
		getplayerinfo <player> gamertag
		dialog_box_desc_id :se_setprops dlog_gamertag_text = ($<gamertag>)
	endif
	return vmenu = <menu_id>
endscript

script band_lobby_update_popup_player_ui 
	requireparams \{[
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
		select_actions = none
		list_type = none
		desc_id = 'band_lobby_player_info2'
	}
	requireparams \{[
			player_index
			parent_id
		]
		all}
	printf \{channel = band_lobby
		qs(0x5378c8f3)}
	if (<player_index> = -1)
		if gotparam \{friendstate}
			if isxenonorwindx
				band_lobby_get_part_icon_parts part = <friendstate>
			else
				band_lobby_get_part_icon_parts \{part = none}
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
		getplayerinfo <player_index> band
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
		get_fullname_for_player player = <player_index>
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
			formattext textname = player_type_text qs(0xd7732250) d = <controller>
		else
			player_type_text = qs(0x36abd2d6)
		endif
	endif
	array = []
	addarrayelement array = <array> element = <net_id_first>
	addarrayelement array = <array> element = <net_id_second>
	net_id = <array>
	dims = (747.0, 62.5)
	autosizedims = false
	if (<desc_id> = 'band_lobby_player_info2')
		autosizedims = true
	endif
	createscreenelement {
		parent = <parent_id>
		type = descinterface
		desc = <desc_id>
		autosizedims = <autosizedims>
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
		addarrayelement array = <array> element = {focus band_lobby_popup_begin_polling_for_rock_record params = {controlling_player = <controlling_player>}}
	endif
	if NOT gotparam \{cant_invite}
		if (<select_actions> != none)
			array = [
				{unfocus band_lobby_popup_change_focus params = {focus_type = unfocus}}
			]
			getplayerinfo <controlling_player> controller out = controller_index
			if checkforsignin controller_index = <controller_index> dont_set_primary network_platform_only
				if (<list_type> != matchmaking)
					request_rock_record callback = band_lobby_rock_record_callback net_id = <net_id>
				endif
			endif
			if band_lobby_popup_submenu_has_selectable_item select_actions = <select_actions> net_id = <net_id> player = <player_index> controlling_player = <controlling_player>
				addarrayelement {
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
				addarrayelement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 1 controlling_player = <controlling_player>}}
			else
				addarrayelement array = <array> element = {focus band_lobby_popup_change_focus params = {focus_type = focus select_actions = <select_actions> selectable = 0 controlling_player = <controlling_player>}}
			endif
			<id> :settags {0xf32d9b88 = <num_items>}
		endif
	else
		<id> :settags is_friends_list = 1
		if (<cant_invite> = 0)
			addarrayelement array = <array> element = {pad_choose band_lobby_send_invite params = {instrument = guitar net_id = <net_id> name = <gamertag_text> controlling_player = <controlling_player>}}
		endif
		if isxenonorwindx
			addarrayelement array = <array> element = {pad_option2 band_lobby_request_player_card params = {net_id_first = <net_id_first> net_id_second = <net_id_second>}}
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
		<id> :obj_spawnscriptnow band_lobby_player_ui_update_loop params = {part = <part> difficulty = <difficulty> player_index = <player_index>}
	endif
endscript

script band_lobby_remove_player_ui_from_popup 
	requireparams \{[
			player_index
			parent_id
		]
		all}
	printf \{channel = band_lobby
		qs(0xbbff7a42)}
	target_index = <player_index>
	if getscreenelementchildren id = <parent_id>
		getarraysize <children>
		i = 0
		begin
		(<children> [<i>]) :getsingletag player_index
		if (<target_index> = <player_index>)
			destroyscreenelement id = (<children> [<i>])
			return
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_lobby_popup_change_focus 
	requireparams \{[
			focus_type
		]
		all}
	printf \{channel = band_lobby
		qs(0xe3891cb2)}
	obj_getid
	if checksumequals a = <focus_type> b = focus
		<objid> :se_setprops {
			highlight_cont_alpha = 1
			focus_highlight_cont_alpha = 1
			unfocused_cont_alpha = 0.0
			gamertag_rgba = ($uicolorref_palette.black.rgba)
			metadata_rgba = ($uicolorref_palette.black.rgba)
		}
		if gotparam \{selectable}
			if (<selectable> = 1)
				if NOT user_control_helper_exists \{button = green}
					getplayerinfo <controlling_player> controller
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
					getscreenelementchildren \{id = user_control_container}
					getarraysize <children>
					if (<array_size> > 1)
						user_control_container :menu_setitemindex index = (<array_size> - 1) newindex = 1
					endif
				endif
			else
				if screenelementexists \{id = green_helper_pill_id}
					destroyscreenelement \{id = green_helper_pill_id}
				endif
			endif
		endif
		if <objid> :desc_resolvealias name = 0xa9485fce param = 0x12b40ebc
			<0x12b40ebc> :obj_spawnscript 0x00e3a9a7
		else
			scriptassert \{'UI_art'}
		endif
	else
		<objid> :se_setprops {
			highlight_cont_alpha = 0.0
			focus_highlight_cont_alpha = 0.0
			unfocused_cont_alpha = 0.5
			gamertag_rgba = ($uicolorref_palette.ntscwhite.rgba)
			metadata_rgba = ($uicolorref_palette.ntscwhite.rgba)
		}
	endif
endscript

script band_lobby_simple_change_focus 
	requireparams \{[
			focus_type
		]
		all}
	obj_getid
	if checksumequals a = <focus_type> b = focus
		<objid> :se_setprops rgba = ($uicolorref_palette.p6_dk.rgba)
	elseif checksumequals a = <focus_type> b = unfocus
		<objid> :se_setprops rgba = [125 125 125 255]
	endif
endscript

script band_lobby_update_vote 
	requireparams \{[
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0x43aad51e)}
	obj_getid
	band_lobby_update_vote_loop objid = <objid>
	resolve_voting_outcome
	if ($global_should_use_net_debugging = 1)
		result = {element = ($g_force_vote) text = qs(0x91affe2e)}
	else
		result = (<voting_items_array> [<winner_index>])
	endif
	if ininternetmode
		if ishost
			sendstructure {
				callback = band_lobby_conclude_voting
				data_to_send = {
					result = <result>
				}
			}
			band_lobby_conclude_voting objid = <objid> result = <result>
		endif
	else
		band_lobby_conclude_voting objid = <objid> result = <result>
	endif
endscript

script band_lobby_conclude_voting 
	requireparams \{[
			result
		]
		all}
	printf \{channel = band_lobby
		qs(0xefcb0ec2)}
	if NOT gotparam \{objid}
		if screenelementexists \{id = current_band_lobby_popup}
			resolvescreenelementid \{id = [
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
			if screenelementexists id = <resolved_id>
				objid = <resolved_id>
			else
				return
			endif
		else
			return
		endif
	endif
	if screenelementexists id = <objid>
		band_lobby_display_winner objid = <objid> result = <result>
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
	requireparams \{[
			objid
		]
		all}
	printf \{channel = band_lobby
		qs(0x43470d78)}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 0}
	]
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 0.0
	endif
	removeparameter \{resolved_id}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 1}
	]
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 0.0
	endif
	removeparameter \{resolved_id}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 2}
	]
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops alpha = 1.0
	endif
	resolvescreenelementid id = [
		{id = <resolved_id>}
		{local_id = vote_item}
	]
	if screenelementexists id = <resolved_id>
		<resolved_id> :se_setprops text = (<result>.text)
	endif
endscript

script band_lobby_update_vote_loop 
	requireparams \{[
			objid
		]
		all}
	printf \{channel = band_lobby
		qs(0x2c68b0df)}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 0}
		{local_id = vote_count}
	]
	item_0_id = <resolved_id>
	removeparameter \{resolved_id}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 1}
		{local_id = vote_count}
	]
	item_1_id = <resolved_id>
	removeparameter \{resolved_id}
	resolvescreenelementid id = [
		{id = <objid>}
		{index = 2}
	]
	item_2_id = <resolved_id>
	removeparameter \{resolved_id}
	getnumplayersingame
	if (<num_players> > 0)
		begin
		if screenelementexists id = <item_0_id>
			formattext textname = vote_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			<item_0_id> :se_setprops text = <vote_count>
		endif
		if screenelementexists id = <item_1_id>
			formattext textname = vote_count qs(0x48c6d14c) d = ($g_vote_counts [1])
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
		wait \{0.25
			seconds}
		repeat 40
		killspawnedscript \{name = band_lobby_update_voting_timer}
	endif
endscript

script band_lobby_update_voting_timer 
	printf \{channel = band_lobby
		qs(0x0b104388)}
	obj_getid
	onexitrun band_lobby_reset_voting_timer params = {objid = <objid>}
	i = 10
	begin
	formattext textname = countdown qs(0x48c6d14c) d = <i>
	<objid> :se_setprops pu_helper_msg_text = <countdown>
	i = (<i> - 1)
	wait \{1
		second}
	repeat 10
endscript

script band_lobby_reset_voting_timer 
	requireparams \{[
			objid
		]
		all}
	printf \{channel = band_lobby
		qs(0x41142ac4)}
	<objid> :se_setprops pu_helper_msg_text = qs(0x6160dbf3)
endscript

script band_lobby_cancel_voting 
	requireparams \{[
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
	requireparams \{[
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
	requireparams \{[
			part
			difficulty
			player_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x2b6cad8e)}
	current_difficulty = <difficulty>
	obj_getid
	begin
	if NOT playerinfoequals <player_index> part = <part>
		getplayerinfo <player_index> part
		band_lobby_get_part_icon_parts part = <part>
		<objid> :se_setprops <part_props>
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
		<objid> :se_setprops difficulty_text_text = <text> difficulty_texture = <texture>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_get_difficulty_icon_and_string 
	requireparams \{[
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
		scriptassert \{qs(0xde65f643)}
	endswitch
	return text = <text> texture = <texture>
endscript

script band_lobby_get_part_icon_parts 
	requireparams \{[
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
		case none
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
	requireparams \{[
			func
			params
			device_num
		]
		all}
	printf \{channel = band_lobby
		qs(0x55953908)}
	band_lobby_signin func = <func> params = <params> controller = <device_num>
	if screenelementexists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
endscript

script band_lobby_popup_menu 
	change \{g_suppress_anim_in = 1}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_desc_id :obj_killspawnedscript \{name = band_lobby_update_mics}
	ui_event_wait \{event = menu_change
		data = {
			is_popup
			state = uistate_mic_binding
		}}
endscript

script band_lobby_popup_change_popup_focus 
	requireparams \{[
			focus_type
		]
		all}
	printf \{channel = band_lobby
		qs(0xfb1bab52)}
	if screenelementexists \{id = current_band_lobby_popup}
		launchevent type = <focus_type> target = current_band_lobby_popup
	endif
endscript

script band_lobby_popup_create_submenu 
	requireparams \{[
			controlling_player
			player
			select_actions
		]
		all}
	printf \{channel = band_lobby
		qs(0x2cd64fe0)}
	gh5_band_screen_ui_sound player_num = <player> choose = 1
	obj_getid
	<objid> :gettags
	if gotparam \{0x579b05bb}
		0xf32d9b88 = (<0xf32d9b88> + 1)
	endif
	if screenelementexists \{id = band_lobby_desc_id}
		if NOT band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent
				param = popup_cont}
			scriptassert \{'could not get band lobby popup container!'}
		endif
	else
		popup_cont = current_band_lobby_popup
	endif
	if screenelementexists \{id = band_lobby_popup_menu}
		launchevent \{type = unfocus
			target = band_lobby_popup_menu}
	endif
	if screenelementexists \{id = current_band_lobby_popup}
		launchevent \{type = unfocus
			target = current_band_lobby_popup}
	endif
	if screenelementexists \{id = band_lobby_manage_player}
		destroyscreenelement \{id = band_lobby_manage_player}
	endif
	createscreenelement {
		type = descinterface
		local_id = submenu
		id = band_lobby_manage_player
		desc = 'band_lobby_pu_player_manage'
		parent = <popup_cont>
		z_priority = 1500
	}
	desc_id = <id>
	if <id> :desc_resolvealias name = alias_game_rules_vmenu param = menu_id
		<menu_id> :se_setprops event_handlers = [{pad_back band_lobby_popup_destroy_submenu params = {submenu_id = <popup_cont>}}]
		if (1 != <0xf32d9b88>)
			<menu_id> :se_setprops {
				event_handlers = [
					{pad_up gh5_band_screen_ui_sound params = {player_num = <player> up = 1}}
					{pad_down gh5_band_screen_ui_sound params = {player_num = <player> down = 1}}
				]
			}
		endif
		if band_lobby_manage_player :desc_resolvealias \{name = 0x1c92d292}
			if screenelementexists id = <resolved_id>
				<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 color = [61 218 250 200]}
			endif
		else
			scriptassert \{'UI_art: couldnt create songlist glitter. alias missing?'}
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
		<id> :desc_resolvealias name = alias_band_lobby_item_boot param = item_id
		if innetgame
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
				item_text_rgba = ($uicolorref_palette.0x8d470aac.rgba)
			}
		else
			<item_id> :se_setprops {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :desc_resolvealias name = alias_band_lobby_item_leadership param = item_id
		add_grant_option = 0
		if ((<leader> = 1) && ($g_net_leader_player_num != <player>))
			if playerinfoequals <player> is_local_client = 1
				getplayerinfo <player> controller
				band_lobby_get_is_guest device_num = <controller>
				if ($g_career_search = null)
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
					{pad_choose band_lobby_popup_submenu_select params = {action = leader net_id = <net_id> player = <player>}}
				]
				highlight_btn_alpha = 0
				item_text_rgba = ($uicolorref_palette.0x8d470aac.rgba)
			}
		else
			<item_id> :se_setprops {
				not_focusable
				item_text_rgba = <unfocusable_color>
				highlight_btn_alpha = 0
			}
		endif
		<id> :desc_resolvealias name = alias_band_lobby_item_gamercard param = item_id
		if isxenonorwindx
			<is_focusable> = 0
			getplayerinfo <controlling_player> controller
			if checkforsignin local controller_index = <controller>
				if netsessionfunc func = canviewprofile params = {controller_index = <controller>}
					if (((<net_id> [0]) != 0) && ((<net_id> [1]) != 0))
						<item_id> :se_setprops {
							event_handlers = [
								{focus band_lobby_popup_submenu_item_focus}
								{unfocus band_lobby_popup_submenu_item_unfocus}
								{pad_choose band_lobby_popup_submenu_select params = {action = player_card net_id = <net_id> player = <player>}}
							]
							highlight_btn_alpha = 0
							item_text_rgba = ($uicolorref_palette.0x8d470aac.rgba)
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
			destroyscreenelement id = <item_id>
		endif
		obj_getid
		<id> :desc_resolvealias name = alias_band_lobby_item_rock_record param = item_id
		if <objid> :getsingletag has_rock_record
			if (<has_rock_record> = 1)
				<item_id> :se_setprops {
					event_handlers = [
						{focus band_lobby_popup_submenu_item_focus}
						{unfocus band_lobby_popup_submenu_item_unfocus}
						{pad_choose band_lobby_popup_submenu_select params = {action = rock_record net_id = <net_id> player = <player>}}
					]
					highlight_btn_alpha = 0
					item_text_rgba = ($uicolorref_palette.0x8d470aac.rgba)
				}
			else
				<item_id> :se_setprops {
					not_focusable
					item_text_rgba = <unfocusable_color>
					highlight_btn_alpha = 0
				}
			endif
		endif
		getplayerinfo <player> gamertag
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
		launchevent type = focus target = <menu_id>
	endif
endscript

script band_lobby_popup_submenu_item_focus 
	obj_getid
	<objid> :se_setprops {
		item_text_rgba = [5 50 65 255]
		0x24cf9fe8 = fontgrid_title_a1
		highlight_btn_alpha = 1
	}
	extendcrcwithstring checksum = <objid> string = '_particle'
	<objid> :obj_spawnscript 0x0542334f params = {id = <extendedchecksum> pos = (600.0, 0.0) z = 2000}
endscript

script band_lobby_popup_submenu_item_unfocus 
	obj_getid
	<objid> :se_setprops {
		item_text_rgba = ($uicolorref_palette.0x8d470aac.rgba)
		0x24cf9fe8 = fontgrid_text_a1
		highlight_btn_alpha = 0
	}
	extendcrcwithstring checksum = <objid> string = '_particle'
	destroy2dparticlesystem id = <extendedchecksum> kill_when_empty
endscript

script band_lobby_popup_destroy_submenu 
	requireparams \{[
			submenu_id
		]
		all}
	printf \{channel = band_lobby
		qs(0x22e9c419)}
	gh5_band_screen_ui_sound player_num = <player> back = 1
	if screenelementexists id = {<submenu_id> child = submenu}
		destroyscreenelement id = {<submenu_id> child = submenu}
	endif
	if screenelementexists \{id = band_lobby_popup_menu}
		launchevent \{type = focus
			target = band_lobby_popup_menu}
	elseif screenelementexists \{id = current_band_lobby_popup}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script band_lobby_popup_submenu_focus 
	printf \{channel = band_lobby
		qs(0x9a15d357)}
	se_getprops
	adjust_pos = (-183.0, -60.0)
	<desc_id> :se_setprops songlist_manage_playlist_selection_bar_pos = (<pos> + <adjust_pos>)
endscript

script band_lobby_popup_submenu_select 
	requireparams \{[
			action
		]
		all}
	printf \{channel = band_lobby
		qs(0xdc79b3fb)}
	se_getparentid
	if gotparam \{controlling_player}
		player = <controlling_player>
	endif
	gh5_band_screen_ui_sound player_num = <player> choose = 1
	switch <action>
		case kick
		requireparams \{[
				controlling_player
			]
			all}
		band_lobby_kick_remote_player_popup user_id = <net_id> controlling_player = <controlling_player>
		case leader
		if savegame_async_is_busy
			return
		endif
		if screenelementexists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :obj_spawnscriptlater band_lobby_popup_submenu_grant_leadership params = {player = <player> user_id = <net_id>}
		endif
		case player_card
		band_lobby_request_player_card device_num = <device_num> net_id_first = (<net_id> [0]) net_id_second = (<net_id> [1])
		case rock_record
		if screenelementexists \{id = band_lobby_popup_menu}
			band_lobby_popup_menu :obj_spawnscriptlater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = band_lobby_popup_menu player = <player>}
		elseif screenelementexists \{id = current_band_lobby_popup}
			current_band_lobby_popup :obj_spawnscriptlater band_lobby_popup_submenu_rock_record params = {device_num = <device_num> net_id = <net_id> unfocus_id = current_menu player = <player>}
		endif
	endswitch
	launchevent type = pad_back target = <parent_id>
endscript

script band_lobby_popup_submenu_grant_leadership 
	printf \{channel = band_lobby
		qs(0xc2989b06)}
	wait \{2
		frames}
	band_lobby_grant_leadership player = <player> user_id = <net_id>
endscript

script band_lobby_popup_submenu_rock_record 
	printf \{channel = band_lobby
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
	if ((<leader> = 1) && ($g_net_leader_player_num != <player>))
		if playerinfoequals <player> is_local_client = 1
			getplayerinfo <player> controller
			band_lobby_get_is_guest device_num = <controller>
			if ($g_career_search = null)
				if (<is_guest> = 0)
					num_items = (<num_items> + 1)
				endif
			endif
		endif
	endif
	if isxenonorwindx
		getplayerinfo <controlling_player> controller
		if checkforsignin local controller_index = <controller>
			if netsessionfunc func = canviewprofile params = {controller_index = <controller>}
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
	printf \{channel = band_lobby
		qs(0x0b94f8aa)}
	if screenelementexists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent
				param = popup_cont}
			if getscreenelementchildren id = <popup_cont>
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
