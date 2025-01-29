
script attempt_to_add_friend_feed \{parent_id = root_window
		menu = !q1768515945
		event_handler = current_menu
		songlist_mode = None
		alpha = 1.0}
	printf \{channel = friend_feed
		qs(0xd5461f01)}
	if inroadiebattlemode
		return
	endif
	controller_index = -1
	switch <menu>
		case band_lobby
		if (-1 != $g_leader_player_num)
			getplayerinteger Player = ($g_leader_player_num) checksum = controller
			<controller_index> = <integer_value>
		else
			<controller_index> = ($primary_controller)
		endif
		case SongList
		if (leaderboard = <songlist_mode>
				|| practice = <songlist_mode>
				|| play_song = <songlist_mode>
				|| playlist = <songlist_mode>
				|| sing_a_long = <songlist_mode>
			)
			if (1 = $primary_controller_assigned)
				<controller_index> = ($primary_controller)
			else
				<controller_index> = -1
			endif
		elseif (music_store = <songlist_mode>)
			<controller_index> = -1
		elseif (None = <songlist_mode>)
			<controller_index> = -1
		else
			getplayerinteger Player = ($g_leader_player_num) checksum = controller
			<controller_index> = <integer_value>
		endif
		case main
		case main_play
		case main_generic
		controller_index = ($primary_controller)
		case freeplay
		if (1 = $primary_controller_assigned)
			controller_index = ($primary_controller)
		endif
		case debug
		if (1 = $primary_controller_assigned)
			<controller_index> = ($primary_controller)
		else
			<controller_index> = -1
		endif
	endswitch
	<parent_id> = root_window
	if NOT create_friend_feed parent_id = <parent_id> menu = <menu> controller_index = <controller_index> event_handler = <event_handler> alpha = <alpha>
		news_feed_adjust_feed_pos_by_menu menu = <menu>
		news_feed_update_menu_tag menu = <menu>
		news_feed_set_interactive_state menu = <menu> event_handler_id = <event_handler>
	endif
endscript

script create_friend_feed \{parent_id = !q1768515945
		menu = !q1768515945
		event_handler = current_menu
		controller_index = -1
		alpha = 1.0}
	<ret> = FALSE
	if screenelementexistssimpleid id = <parent_id>
		if NOT screenelementexistssimpleid \{id = friends_feed_desc_id}
			if (-1 != <controller_index>)
				if ff_can_use_friend_feed controller_index = <controller_index>
					newsfeedmanager func = add_controller controller_index = <controller_index>
				endif
			endif
			newsfeedmanager \{func = update_news_feed_data}
			fastcreatescreenelement params = {
				parent = <parent_id>
				id = friends_feed_desc_id
				Type = descinterface
				desc = 'friend_feed'
				alpha = <alpha>
				autosizedims = true
			}
			news_feed_update_menu_tag menu = <menu>
			friends_feed_desc_id :Obj_SpawnScriptNow \{ff_cleanup_spawned}
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				Handlers = [
					{focus news_feed_add_control_helpers}
					{unfocus clean_up_user_control_helpers}
				]
				<friend_feed_scrolling_menu_id> :se_setprops event_handlers = <Handlers> alpha = 1.0 exclusive_device = 10
				<friend_feed_scrolling_menu_id> :obj_setmultipletags tags = {most_recent_msg_id = [-1 -1] return_menu = None}
			endif
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_scroll_feed_items
				Handlers = [
					{pad_up ff_change_item_scroll params = {Dir = up}}
					{pad_down ff_change_item_scroll params = {Dir = down}}
					{($friend_feed_menu_data.<menu>.pad_handler) generic_blocking_execute_script params = {pad_script = ff_attempt_to_collapse_feed}}
					{pad_back generic_blocking_execute_script params = {pad_script = ff_attempt_to_collapse_feed}}
				]
				<friend_feed_vmenu_id> :se_setprops event_handlers = <Handlers>
				<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_mini_feed_request_update_loop
				<friend_feed_vmenu_id> :obj_setmultipletags tags = {state = Idle}
			endif
			friends_feed_desc_id :Obj_SpawnScriptLater \{news_feed_add_valid_controllers}
			news_feed_set_interactive_state menu = <menu> event_handler_id = <event_handler>
			news_feed_adjust_feed_pos_by_menu menu = <menu>
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_icon_anim
					param = icon_anim_id}
				<icon_anim_id> :Obj_SpawnScriptNow ui_ff_loading_pulse
			endif
			if (1 = $g_ff_debug)
				dynamicaddebugoverlay
				friends_feed_desc_id :se_setprops \{debug_cont_alpha = 1.0}
				friends_feed_desc_id :Obj_SpawnScriptLater \{debug_ff_update_output}
			endif
			if ((isps3) || (isngc))
				friends_feed_desc_id :Obj_SpawnScriptLater \{ff_poll_for_ps3_boot_time_refresh}
			endif
			<ret> = true
		endif
	endif
	return <ret>
endscript

script destroy_friend_feed 
	printscriptinfo \{'destroy_friend_feed'}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		news_feed_outstanding_destroy_cleanup
		destroyscreenelementsimpleid \{id = friends_feed_desc_id}
	endif
endscript

script ff_cleanup_spawned 
	OnExitRun \{ff_cleanup}
	Block \{Type = ff_cleanup}
endscript

script ff_cleanup 
	news_feed_fix_main_menu_button_helpers
	newsfeedmanager \{func = cleanup}
	netfeeddebugoverlay_destroy
endscript

script news_feed_outstanding_destroy_cleanup 
	if newsfeedmanager \{func = is_expanded_feed}
		if screenelementexistssimpleid \{id = friends_feed_desc_id}
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				<friend_feed_scrolling_menu_id> :obj_getchecksumtag tag_name = return_menu
				if screenelementexistssimpleid id = <checksum_value>
					AssignAlias id = <checksum_value> alias = current_menu
					current_menu :se_setprops \{unblock_events}
					LaunchEvent \{Type = focus
						target = current_menu}
				endif
			endif
		endif
	endif
endscript

script news_feed_fix_main_menu_button_helpers 
	ui_event_get_top
	if (<base_name> = 'mainmenu')
		if newsfeedmanager \{func = is_expanded_feed}
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100
				all_buttons}
			add_user_control_helper \{text = qs(0x8a778398)
				button = yellow
				z = 100
				all_buttons}
			mainmenu_id :obj_spawnscript \{main_menu_add_friendfeed_button_pill_spawned}
		endif
	endif
endscript

script news_feed_set_interactive_state \{menu = !q1768515945
		event_handler_id = !q1768515945}
	if screenelementexistssimpleid id = <event_handler_id>
		if (1 = ($friend_feed_menu_data.<menu>.interactive))
			<event_handler_id> :se_setprops {
				event_handlers = [
					{($friend_feed_menu_data.<menu>.pad_handler) generic_blocking_execute_script params = {pad_script = ff_attempt_to_expand_feed}}
				]
				replace_handlers
			}
		else
			<event_handler_id> :se_setprops {
				event_handlers = [
					{($friend_feed_menu_data.<menu>.pad_handler) empty_script}
				]
				replace_handlers
			}
		endif
	endif
endscript

script news_feed_update_menu_tag \{menu = !q1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_setchecksumtag tag_name = menu checksum_value = <menu>
	endif
endscript

script news_feed_get_menu_tag 
	<ret> = FALSE
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		AddParam structure_name = return_struct Name = menu value = <checksum_value>
		<ret> = true
	endif
	return <ret> <return_struct>
endscript

script ff_refresh_feed \{force_refresh = 0}
	printf \{channel = ff
		qs(0x933e7e4c)}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			newsfeedmanager \{func = request_items}
			<friend_feed_vmenu_id> :news_feed_add_screen_elements force_update = <force_refresh>
		endif
	endif
endscript

script news_feed_friend_update_request_loop 
	<request_updates> = 1
	<spawn_request> = 0
	begin
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		<request_updates> = 0
	elseif InNetGame
		<request_updates> = 0
	else
		<request_updates> = 1
	endif
	if (1 = <request_updates>)
		<array> = []
		GetActiveControllers
		fastgetarraysize array = <active_controllers>
		<num_controllers> = <array_Size>
		if (0 < <num_controllers>)
			<index> = 0
			begin
			if (1 = (<active_controllers> [<index>]))
				if ff_can_use_friend_feed controller_index = <index>
					addintegerarrayelement2 array = <array> element = <index>
				endif
			endif
			<index> = (1 + <index>)
			repeat <num_controllers>
		endif
		fastgetarraysize array = <array>
		<num_valid_controllers> = <array_Size>
		if (0 < <num_valid_controllers>)
			<index> = 0
			begin
			<spawn_request> = 0
			if netfeed func = createlocalinbox controller_index = (<array> [<index>])
				if NOT netfeed func = isnewmessagewaitingeventhandlerregistered controller_index = (<array> [<index>])
					if netfeed func = registernewmessagewaitingeventhandler controller_index = (<array> [<index>]) qeventhandler = friend_update_message_handler
						<spawn_request> = 1
					endif
				endif
				if netfeed func = isnewmessagewaiting controller_index = (<array> [<index>])
					netfeed func = clearnewmessagewaitingflag controller_index = (<array> [<index>])
					<spawn_request> = 1
				endif
				if (1 = <spawn_request>)
					SpawnScriptLater {
						news_feed_request_friend_updates
						params = {
							controller_index = (<array> [<index>])
							num_items = 25
						}
					}
				endif
			endif
			<index> = (1 + <index>)
			repeat <num_valid_controllers>
		endif
	endif
	waitseconds num_seconds = ($g_friend_update_wait_period)
	repeat
endscript

script news_feed_request_friend_updates \{controller_index = !i1768515945
		num_items = !i1768515945}
	printf \{channel = friend_feed
		qs(0x89a45020)}
	<messagecount> = 0
	<array> = []
	ff_wait_for_feed_ready controller_index = <controller_index>
	ff_wait_for_inbox_ready controller_index = <controller_index>
	if ff_can_use_friend_feed controller_index = <controller_index>
		netfeed {
			func = updatelocalinbox
			controller_index = <controller_index>
			qeventhandler = friend_update_message_handler
			index = 0
			numitems = <num_items>
			acceptmessagesfromfriendsonly = 1
		}
		ff_wait_for_inbox_ready controller_index = <controller_index>
		netfeed func = getmessagecount controller_index = <controller_index> out = messagecount
		if (0 < <messagecount>)
			if netfeed func = getmsgidfront controller_index = <controller_index> out = msgid out_first = msgid_first out_second = msgid_second
				begin
				addarrayarrayelement array = <array> element = <msgid>
				if NOT netfeed func = getmsgidnext controller_index = <controller_index> msgid = (<msgid>) out = msgid out_first = msgid_first out_second = msgid_second
					break
				endif
				repeat
			endif
			fastgetarraysize array = <array>
			<num_headers> = <array_Size>
			if (0 < <num_headers>)
				if netfeed func = fetchmessages msgidlist = <array> controller_index = <controller_index> qeventhandler = friend_update_message_handler
					printf \{channel = friend_feed
						qs(0x063c1956)}
				endif
			endif
		endif
	endif
endscript

script friend_update_message_handler \{controller_index = !i1768515945}
	printf \{channel = friend_feed
		qs(0x3d40bd68)}
	switch <event>
		case gotmsgdata
		if netfeed func = getmsgheader msgid = <msgid> userid = <userid> out = msg_header
			if ((<msg_header>.senderfriendstatus) = friend)
				news_feed_get_message_queue_global index = <controller_index>
				fastgetarraysize array = ($<msg_queue>)
				<num_msgs> = <array_Size>
				<element> = {
					sender_id = (<msg_header>.senderid)
					sender_name = (<msg_header>.sendername)
					msg_id = <msgid>
					msg = <msg>
				}
				if (0 != <num_msgs>)
					insertarrayelement array = ($<msg_queue>) element = <element> index = 0
				else
					addstructurearrayelement array = ($<msg_queue>) element = <element>
				endif
				if ($g_friend_update_max_msg_in_queue < (1 + <num_msgs>))
					RemoveArrayElement array = <array> index = ($g_friend_update_max_msg_in_queue)
				endif
				changeglobalarray global_name = <msg_queue> new_value = <array>
				RemoveParameter \{array}
			else
				netfeed \{func = logmessage
					msg = 'friend_update_message_handler: senderfriendstatus != friend.  Message dropped.'}
			endif
		else
			netfeed \{func = logmessage
				msg = 'friend_update_message_handler: Failed to get header. Message dropped.'}
		endif
		case msgadded
		case filteredmsgadded
		case sendmessagesstarted
		case sendmessagesdone
		case sendmessagesfailure
		case updatelocalinboxstarted
		case updatelocalinboxdone
		case updatelocalinboxfailure
		case fetchmessagesstarted
		case fetchmessagesdone
		case fetchmessagesfailure
		case flushremoteinboxstarted
		case flushremoteinboxdone
		case flushremoteinboxfailure
		case deleteremotemessagesstarted
		case deleteremotemessagesdone
		case deleteremotemessagesfailure
		case newmessagewaitingnotify
		printf channel = friend_feed qs(0xfc2e4305) a = <event>
		default
		dbreak
	endswitch
endscript

script ff_wait_for_feed_ready \{controller_index = !i1768515945}
	begin
	if netfeed func = isready controller_index = <controller_index>
		netfeed \{func = logmessage
			msg = 'ff_wait_for_feed_ready: net feed is now ready.'}
		break
	endif
	waitseconds \{num_seconds = 1.0}
	repeat
endscript

script ff_wait_for_inbox_ready \{controller_index = !i1768515945}
	begin
	if NOT netfeed func = islocalinboxbusy controller_index = <controller_index>
		netfeed \{func = logmessage
			msg = 'ff_wait_for_inbox_ready: local inbox no longer busy.'}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script news_feed_adjust_feed_pos_by_menu \{menu = !q1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		Pos = (0.0, 0.0)
		z_priority = 0.0
		Pos = ($friend_feed_menu_data.<menu>.Pos)
		z_priority = ($friend_feed_menu_data.<menu>.z_priority)
		friends_feed_desc_id :se_setprops Pos = <Pos> z_priority = <z_priority>
	endif
endscript

script news_feed_add_screen_elements \{force_update = 0}
	begin
	obj_getchecksumtag \{tag_name = state}
	menu_getselectedindex
	if (Idle = <checksum_value>
			&& ($g_max_items_in_mini_feed) > (<selected_index> + 1)
		)
		if NOT newsfeedmanager \{func = create_item}
			break
		endif
	elseif (1 = <force_update>)
		if NOT newsfeedmanager \{func = create_item}
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ff_create_news_feed_item \{feed_string = qs(0xaf3e73b9)
		controller_index = !i1768515945
		item_type = None}
	printf \{channel = friend_feed
		qs(0x0ee5d8c4)}
	<ret> = FALSE
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<screen_element_params> = {parent = <friend_feed_vmenu_id> Type = descinterface autosizedims = true alpha = 0.0 exclusive_device = 10}
			<screen_element_tags> = {item_type = <item_type> mini_feed_display_count = 0
				sender_id_first = (<sender_id> [0]) sender_id_second = (<sender_id> [1])
				sender_name = <sender_name> controller_index = <controller_index>
			}
			switch <item_type>
				case ad
				<screen_element_params> = {
					<screen_element_params>
					desc = 'friend_feed_ad_item'
					tags = {
						<screen_element_tags>
						ad_texture = (<ad_params>.texturechecksum)
						subscriber_id = (<ad_params>.id)
					}
				}
				case rock_record
				case motd
				case friend
				case hint
				<screen_element_params> = {
					<screen_element_params>
					desc = 'friend_feed_item'
					message_text = <feed_string>
					tags = <screen_element_tags>
				}
				default
				printf \{channel = friend_feed
					qs(0xb2d4d295)}
			endswitch
			CreateScreenElement <screen_element_params>
			AddParam structure_name = return_struct Name = id value = <id>
			<new_item_id> = <id>
			<new_item_id> :ff_set_friend_feed_item_icon {
				sender_id = <sender_id>
				sender_gamertag = <sender_name>
				controller_index = <controller_index>
				item_type = <item_type>
			}
			if (ad = <item_type>)
				if ScreenElementExists id = (<ad_params>.id)
					printf channel = friend_feed qs(0x1f3acbab) d = (<ad_params>.id)
					DestroyScreenElement id = (<ad_params>.id)
					newsfeedmanager func = destroy_item id = (<ad_params>.id)
				endif
				CreateScreenElement {
					parent = <new_item_id>
					id = (<ad_params>.id)
					Pos = (56.0, 5.0)
					just = [left top]
					Type = dynamicadspriteelement
					texture = (<ad_params>.texturechecksum)
					dynamicad2dsubscriberid = (<ad_params>.id)
				}
			endif
			<new_item_id> :obj_setintegertag tag_name = have_rock_record integer_value = <have_rock_record>
			<array> = [
				{focus ff_change_item_focus params = {focus_type = focus shortcut = (<link_params>.shortcut) shortcut_string = (<link_params>.shortcut_string) controller_index = <controller_index>}}
				{unfocus ff_change_item_focus params = {focus_type = unfocus shortcut = (<link_params>.shortcut) shortcut_string = (<link_params>.shortcut_string)}}
			]
			if (ad != <item_type>)
				AddArrayElement array = <array> element = {focus news_feed_scroll_text_start}
				AddArrayElement array = <array> element = {unfocus news_feed_scroll_text_stop}
			endif
			if (None != <link_params>.shortcut)
				AddArrayElement array = <array> element = {pad_choose ff_attempt_to_follow_shortcut_action params = {link_params = <link_params>}}
			else
				AddArrayElement array = <array> element = {pad_choose ui_sfx params = {menustate = Generic uitype = negativeselect}}
			endif
			if (0 != <sender_id> [0] && 0 != <sender_id> [1])
				if (1 = <have_rock_record>)
					if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
							param = friend_feed_scrolling_menu_id}
						AddArrayElement array = <array> element = {pad_L1 news_feed_display_rock_record params = {net_id = <sender_id>}}
					endif
				endif
			endif
			<new_item_id> :se_setprops event_handlers = <array>
			GetScreenElementChildren id = <friend_feed_vmenu_id>
			GetArraySize <children> param = num_ff_items
			if (1 < <num_ff_items>)
				if NOT (($g_max_items_in_mini_feed) > (<num_ff_items> - 1))
					DestroyScreenElement id = (<children> [(<num_ff_items> - 2)])
					newsfeedmanager func = destroy_item id = (<children> [(<num_ff_items> - 2)])
				endif
				<friend_feed_vmenu_id> :menu_setitemindex id = <new_item_id> newindex = 0
			endif
			<ret> = true
		endif
	endif
	return <ret> <return_struct>
endscript

script news_feed_adjust_scrolling_menu 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :se_getprops
				<friend_feed_scrolling_menu_id> :se_setprops dims = <dims>
			endif
		endif
	endif
endscript

script ff_destroy_news_feed_item \{id = !q1768515945}
	<ret> = FALSE
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				GetScreenElementChildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				<num_ff_items> = <array_Size>
				if (0 < <num_ff_items>)
					<item_index> = 0
					begin
					if (<id> = (<children> [<item_index>]))
						destroyscreenelementsimpleid id = (<children> [<item_index>])
						news_feed_adjust_scrolling_menu
						<ret> = true
						break
					endif
					<item_index> = (1 + <item_index>)
					repeat <num_ff_items>
				endif
			endif
		endif
	endif
	return <ret>
endscript

script ff_set_friend_feed_item_icon \{controller_index = !i1768515945
		sender_id = !a1768515945
		sender_gamertag = 0x69696969}
	<have_rock_record> = 0
	if (0 != <sender_id> [0] && 0 != <sender_id> [1])
		if friendstats_getquickplaystars user_id = <sender_id> gamer_tag = <sender_gamertag> controller_index = <controller_index>
			quickplay_get_award_rank_ui_data award_points = <quickplay_stars>
			se_setprops {
				rank_container_alpha = 1.0
				rank_number_text = <rank_number_text>
			}
			<have_rock_record> = 1
		else
			if NOT ScriptIsRunning \{rock_record_read_friends}
				SpawnScriptNow \{rock_record_read_friends}
			endif
			Obj_SpawnScriptNow ff_wait_for_rank_data params = {
				user_id = <sender_id>
				gamer_tag = <sender_gamertag>
				controller_index = <controller_index>
			}
		endif
		if (NetSessionFunc Obj = friends func = is_in_rivals_list params = {net_id = <sender_id>})
			<texture> = rival_online
		else
			<texture> = friendslist_online
		endif
		se_setprops {
			icon_left_texture = <texture>
		}
	elseif GotParam \{item_type}
		printf channel = friend_feed 'ff_set_friend_feed_item_icon - msg_type = %m' m = <item_type>
		switch (<item_type>)
			case motd
			se_setprops \{icon_left_texture = ff_icon_motd}
			case server
			se_setprops \{icon_left_texture = ff_icon_server}
			case hint
			se_setprops \{icon_left_texture = ff_icon_hint}
			default
			se_setprops \{icon_left_texture = ff_icon_community}
		endswitch
	else
		se_setprops \{icon_left_texture = icon_gh6}
	endif
	return have_rock_record = <have_rock_record>
endscript

script ff_wait_for_rank_data 
	begin
	if friendstats_getquickplaystars user_id = <user_id> gamer_tag = <gamer_tag> controller_index = <controller_index>
		printf \{qs(0x48b5591b)}
		quickplay_get_award_rank_ui_data award_points = <quickplay_stars>
		se_setprops {
			rank_container_alpha = 1.0
			rank_number_text = <rank_number_text>
			event_handlers = {
				{pad_L1 news_feed_display_rock_record params = {net_id = <user_id>}}
			}
			replace_handlers
		}
		Obj_GetID
		<objID> :obj_setintegertag tag_name = have_rock_record integer_value = 1
		break
	endif
	Wait \{1.0
		Second}
	repeat 30
endscript

script ff_scroll_feed_items 
	Obj_GetID
	begin
	<item_type> = None
	<additional_time> = 0.0
	if GetScreenElementChildren id = <objID>
		fastgetarraysize array = <children>
		if ($friend_feed_menu_data.mini_feed_num_items_to_scroll <= <array_Size>)
			menu_getselectedindex
			obj_setchecksumtag \{tag_name = state
				checksum_value = animating}
			(<children> [<selected_index>]) :se_setprops alpha = 0.0 time = ($friend_feed_menu_data.item_fade_in_time)
			(<children> [<selected_index>]) :se_waitprops
			if screenelementexistssimpleid id = (<children> [<selected_index>])
				(<children> [<selected_index>]) :obj_getintegertag tag_name = mini_feed_display_count
				(<children> [<selected_index>]) :obj_setintegertag tag_name = mini_feed_display_count integer_value = (<integer_value> + 1)
			endif
			if ((1 + <selected_index>) = <array_Size>)
				if screenelementexistssimpleid id = (<children> [0])
					(<children> [0]) :se_setprops alpha = 0.0
				endif
			else
				if screenelementexistssimpleid id = (<children> [(1 + <selected_index>)])
					(<children> [(1 + <selected_index>)]) :se_setprops alpha = 0.0
				endif
			endif
			menu_changeselection \{down}
			menu_getselectedindex
			if screenelementexistssimpleid id = (<children> [<selected_index>])
				(<children> [<selected_index>]) :se_setprops message_pos = (0.0, 0.0)
				(<children> [<selected_index>]) :se_setprops alpha = 1.0 time = ($friend_feed_menu_data.item_fade_out_time)
				(<children> [<selected_index>]) :se_waitprops
			endif
			if screenelementexistssimpleid id = (<children> [<selected_index>])
				(<children> [<selected_index>]) :obj_getchecksumtag tag_name = item_type
				<item_type> = <checksum_value>
				if (<children> [<selected_index>]) :desc_resolvealias Name = alias_message param = msg_id
					if countscreenelementchildren id = <msg_id>
						if (($friend_feed_menu_data.msg_scroll_threshold) < <num_children>)
							<additional_time> = ((<num_children> - ($friend_feed_menu_data.msg_scroll_threshold)) * ($friend_feed_menu_data.additional_time_per_line))
							<msg_id> :Obj_SpawnScriptNow news_feed_scroll_message_text params = {item_type = <item_type> additional_time = <additional_time>}
						endif
					endif
				endif
			endif
		endif
	endif
	obj_setchecksumtag \{tag_name = state
		checksum_value = Idle}
	if news_feed_get_item_data item_type = <item_type>
		<wait_time> = ((<item_data>.time) + <additional_time>)
	else
		<wait_time> = ($friend_feed_menu_data.scroll_time)
	endif
	Wait <wait_time> Seconds
	repeat
endscript

script news_feed_scroll_message_text \{item_type = !q1768515945
		additional_time = !f1768515945
		Loop = 0}
	if news_feed_get_item_data item_type = <item_type>
		<time> = ((<item_data>.time) + <additional_time>)
		begin
		se_getprops
		se_setprops {
			Pos = ((0.0, 55.0) - (0.0, 1.0) * (<dims> [1]))
			time = <time>
		}
		se_waitprops
		if (<Loop> = 0)
			break
		endif
		se_setprops {
			Pos = ((0.0, 1.0) * (<dims> [1]) - (0.0, 55.0))
			time = <time>
		}
		se_waitprops
		repeat
	endif
endscript

script ff_mini_feed_request_update_loop 
	if NOT news_feed_is_each_item_type_available
		waitseconds num_seconds = ($g_request_spin_time)
	endif
	Obj_GetID
	begin
	<request> = 0
	if GetScreenElementChildren id = <objID>
		fastgetarraysize array = <children>
		<ff_index> = 0
		<num_items_displayed> = 0
		if (0 < <array_Size>)
			begin
			(<children> [<ff_index>]) :GetSingleTag mini_feed_display_count
			if (0 < <mini_feed_display_count>)
				<num_items_displayed> = (1 + <num_items_displayed>)
			endif
			<ff_index> = (1 + <ff_index>)
			repeat <array_Size>
		endif
		if (<num_items_displayed> = <array_Size>)
			<request> = 1
		endif
	else
		<request> = 1
	endif
	if ((1 = <request>) && (0 = ($g_wii_pause_friend_feed)))
		newsfeedmanager \{func = request_items}
		<objID> :news_feed_add_screen_elements
	endif
	waitseconds num_seconds = ($friend_feed_menu_data.mini_feed_request_wait)
	repeat
endscript

script news_feed_get_item_data \{item_type = !q1768515945
		out_param = item_data}
	<ret> = FALSE
	fastgetarraysize array = ($g_news_item_data)
	if (0 < <array_Size>)
		<type_index> = 0
		begin
		if (<item_type> = ($g_news_item_data [<type_index>].checksum))
			AddParam structure_name = return_struct Name = <out_param> value = ($g_news_item_data [<type_index>])
			<ret> = true
			break
		endif
		<type_index> = (1 + <type_index>)
		repeat <array_Size>
	endif
	return <ret> <return_struct>
endscript

script ff_can_use_friend_feed \{controller_index = !i1768515945
		from_expand = 0}
	<ret> = FALSE
	<error_msg> = qs(0x00000000)
	if CheckForSignIn controller_index = <controller_index> network_platform_only dont_set_primary
		<ret> = true
	elseif (1 = <from_expand>)
		<ret> = true
	else
		if isxenonorwindx
			Change \{g_ff_has_error_message = 1}
			<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
		endif
	endif
	if (true = <ret>)
		if isngc
			<ret> = true
		elseif isxenonorwindx
			if NOT NetSessionFunc func = xenonisguest params = {controller_index = <controller_index>}
				if NetSessionFunc func = checkprofilepriveleges params = {check = communication controller_index = <controller_index>}
					if NetSessionFunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index>}
						<ret> = true
					elseif NetSessionFunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index> friends}
						<ret> = true
					else
						Change \{g_ff_has_error_message = 1}
						<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
						<ret> = FALSE
					endif
				elseif NetSessionFunc func = checkprofilepriveleges params = {check = communication controller_index = <controller_index> friends}
					if NetSessionFunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index>}
						<ret> = true
					elseif NetSessionFunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index> friends}
						<ret> = true
					else
						Change \{g_ff_has_error_message = 1}
						<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
						<ret> = FALSE
					endif
				else
					Change \{g_ff_has_error_message = 1}
					<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
					<ret> = FALSE
				endif
			else
				Change \{g_ff_has_error_message = 1}
				<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
				<ret> = FALSE
			endif
		elseif isps3
			if NetSessionFunc \{func = has_network_platform_account}
				if NetSessionFunc \{Obj = voice
						func = voice_allowed}
					<ret> = true
				else
					<ret> = FALSE
				endif
			else
				<ret> = FALSE
			endif
		endif
	endif
	return <ret> error_msg = <error_msg>
endscript

script ff_attempt_to_follow_shortcut_action \{link_params = 0x69696969}
	printf \{channel = friend_feed
		qs(0x28aad7bd)}
	printstruct channel = friend_feed <link_params>
	<can_follow> = 0
	friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
	if (main = <checksum_value>)
		<valid> = 1
		<error> = 0
		<params> = {}
		net_counter_increment \{counter_name = globalcounter_friend_feed_click}
		get_savegame_from_controller controller = <device_num>
		switch (<link_params>.item_type)
			case ad
			net_counter_increment \{counter_name = globalcounter_friend_feed_click_ad}
			case motd
			net_counter_increment \{counter_name = globalcounter_friend_feed_click_motd}
			case friend
			net_counter_increment \{counter_name = globalcounter_friend_feed_click_friend}
			default
			net_counter_increment \{counter_name = globalcounter_friend_feed_click_other}
		endswitch
		can_follow = 1
		if (ad = <link_params>.item_type)
			ui_sfx \{menustate = friendfeed
				uitype = negativeselect}
			<can_follow> = 0
		elseif (motd = <link_params>.item_type)
			main_menu_select_motd device_num = <device_num>
		else
			switch (<link_params>.event)
				case beat_score
				if is_song_downloaded song_checksum = (<link_params>.song_name)
					GetGlobalTags (<link_params>.song_name) savegame = <savegame> param = unlocked
					if (<unlocked> = 1)
						<params> = {
							song_name = (<link_params>.song_name)
							instrument_type = (<link_params>.instrument_type)
							challenge_type = (<link_params>.challenge_type)
							sender_id = (<link_params>.sender_id)
						}
						<valid> = 1
					else
						AddParam \{structure_name = error_params
							Name = error
							value = invalid_song_unlock}
						AddParam structure_name = error_params Name = song_name value = (<link_params>.song_name)
						<error> = 1
						<valid> = 0
					endif
				else
					AddParam \{structure_name = error_params
						Name = error
						value = invalid_song_dlc}
					AddParam structure_name = error_params Name = song_name value = (<link_params>.song_name)
					<error> = 1
					<valid> = 0
				endif
				case encore_complete
				<params> = {
					encore_complete = (<link_params>.encore_complete)
				}
				<valid> = 0
				case career_complete
				<params> = {
					difficulty = (<link_params>.difficulty)
				}
				<valid> = 0
				case song_uploaded
				case created_rocker
				case unlock_item
				case dlc_purchased
				<params> = {}
				<valid> = 0
				case wiiward_unlocked
				<params> = {
					friend_id = (<link_params>.sender_id)
					friend_name = (<link_params>.sender_name)
				}
				<valid> = 1
				default
				ui_sfx \{menustate = friendfeed
					uitype = negativeselect}
				<can_follow> = 0
				<valid> = 0
			endswitch
			Change g_shortcut_data = {valid = <valid> shortcut = (<link_params>.shortcut) <params>}
			if (1 = <error>)
				AddParam structure_name = error_params Name = controller_index value = <device_num>
				news_feed_generic_error_popup <error_params>
			else
				switch (<link_params>.shortcut)
					case quickplay_lobby
					ui_sfx \{menustate = friendfeed
						uitype = gotogameplay}
					main_menu_select_band_lobby lobby_mode = quickplay device_num = <device_num>
					case career_lobby
					ui_sfx \{menustate = friendfeed
						uitype = gotogameplay}
					main_menu_select_band_lobby lobby_mode = career device_num = <device_num>
					case vs_lobby
					ui_sfx \{menustate = friendfeed
						uitype = gotogameplay}
					main_menu_select_band_lobby lobby_mode = vs device_num = <device_num>
					case car
					ui_sfx \{menustate = friendfeed
						uitype = select}
					main_menu_select_cas device_num = <device_num>
					case music_store
					ui_sfx \{menustate = friendfeed
						uitype = select}
					main_menu_select_music_store device_num = <device_num>
					case gh_tunes
					ui_sfx \{menustate = friendfeed
						uitype = select}
					music_central_select_music_studio device_num = <device_num> show_help_page = 0
					case wiiwards_menu
					destroy_friend_feed
					main_menu_select_hall_of_records device_num = <device_num>
					default
					ui_sfx \{menustate = friendfeed
						uitype = negativeselect}
					dbreak
				endswitch
				destroy_friend_feed
			endif
		endif
	elseif (SongList = <checksum_value>)
		ui_sfx \{menustate = Generic
			uitype = negativeselect}
	endif
	if (1 = <can_follow>)
		GetGlobalTags achievement_info savegame = <savegame> param = ff_clicks
		achievement_global_tags = {<achievement_global_tags> ff_clicks = (<ff_clicks> + 1)}
		SetGlobalTags achievement_info savegame = <savegame> params = <achievement_global_tags>
		test_feed_achievements controller = <device_num>
	endif
endscript

script news_feed_add_control_helpers 
	if newsfeedmanager \{func = is_expanded_feed}
		clean_up_user_control_helpers
		add_user_control_helper text = ($friend_feed_strings.button_blue) button = blue z = 100 all_buttons
	endif
endscript

script ff_change_item_scroll 
	Obj_GetID
	menu_getselectedindex
	if (up = <Dir>)
		if (<selected_index> > 0)
			ui_sfx \{menustate = friendfeed
				uitype = scrollup}
		endif
	else
		if GetScreenElementChildren id = <objID>
			fastgetarraysize array = <children>
			if (<selected_index> < <array_Size> - 1)
				ui_sfx \{menustate = friendfeed
					uitype = scrolldown}
			endif
		endif
	endif
endscript

script ff_change_item_focus \{focus_type = !q1768515945
		shortcut = !q1768515945
		have_rock_record = 0}
	Obj_GetID
	if newsfeedmanager \{func = is_expanded_feed}
		if (focus = <focus_type>)
			<objID> :se_setprops alpha = 1.0
			if <objID> :obj_getintegertag tag_name = have_rock_record assert = 0
				<have_rock_record> = <integer_value>
			endif
			se_setprops \{bkgd_highlight_cont_alpha = 0.8
				divider_512_alpha = 1}
			if screenelementexistssimpleid \{id = friends_feed_desc_id}
				if friends_feed_desc_id :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
					se_getparentid
					<parent_id> :menu_getselectedindex
					generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <selected_index>
				endif
			endif
			clean_up_user_control_helpers
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			<menu> = <checksum_value>
			news_feed_get_exclusive_device
			if (main = <menu>)
				add_gamertag_helper exclusive_device = <exclusive_device>
				if (None != <shortcut>)
					if (motd = <shortcut>)
						add_super_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_shortcut_motd) button = green z = 100
					elseif (ad != <shortcut>)
						fastformattext format_string = ($friend_feed_strings.button_green) format_params = {a = <shortcut_string>}
						add_super_user_control_helper controller = <exclusive_device> text = <formatted_text> button = green z = 100
					endif
					if news_feed_get_exclusive_device
						if ((isps3) || (isngc))
							if IsGuitarController controller = <exclusive_device>
								se_setprops \{ff_icon_jump_alpha = 1.0}
							endif
						else
							se_setprops \{ff_icon_jump_alpha = 1.0}
						endif
					endif
				endif
			else
				printf \{channel = friend_feed
					qs(0x49358915)}
			endif
			<objID> :obj_getchecksumtag tag_name = item_type
			if ((rock_record = <checksum_value>) || (friend = <checksum_value>))
				if isxenonorwindx
					add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_yellow) button = yellow z = 100
				endif
			endif
			if (<menu> = SongList)
				add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_blue) button = blue z = 100
			else
				add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_blue) button = blue z = 100
			endif
			<objID> :obj_getchecksumtag tag_name = item_type
			if ((rock_record = <checksum_value>) || (friend = <checksum_value>))
				if (1 = <have_rock_record> && main = <menu>)
					add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_orange) button = orange z = 100
				endif
			endif
		else
			se_setprops \{bkgd_highlight_cont_alpha = 0.0
				divider_512_alpha = 0.3
				ff_icon_jump_alpha = 0.0}
		endif
	endif
endscript

script news_feed_scroll_text_start 
	if newsfeedmanager \{func = is_expanded_feed}
		Obj_GetID
		<objID> :obj_getchecksumtag tag_name = item_type
		if <objID> :desc_resolvealias Name = alias_message param = msg_id
			if countscreenelementchildren id = <msg_id>
				if (($friend_feed_menu_data.msg_scroll_threshold) < <num_children>)
					<additional_time> = ((<num_children> - ($friend_feed_menu_data.msg_scroll_threshold)) * ($friend_feed_menu_data.additional_time_per_line))
					<msg_id> :news_feed_scroll_message_text item_type = <checksum_value> additional_time = <additional_time> Loop = 1
				endif
			endif
		endif
	endif
endscript

script news_feed_scroll_text_stop 
	if newsfeedmanager \{func = is_expanded_feed}
		Obj_GetID
		<objID> :Obj_KillSpawnedScript Name = news_feed_scroll_text_start
		<objID> :se_setprops message_pos = (0.0, 0.0)
	endif
endscript

script news_feed_display_rock_record \{device_num = !i1768515945
		net_id = !a1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			if (main = <checksum_value>)
				if CheckForSignIn network_platform_only controller_index = <device_num>
					display_rock_record net_id = <net_id> unfocus_id = <friend_feed_scrolling_menu_id> device_num = <device_num>
					ui_sfx \{menustate = friendfeed
						uitype = select}
				else
					Change \{g_ff_has_error_message = 1}
					<error_msg> = ($friend_feed_strings.error_message_not_signed_ngc)
					friends_feed_desc_id :Obj_SpawnScriptNow ff_display_error_message params = {error_msg = <error_msg>}
					ui_sfx \{menustate = friendfeed
						uitype = negativeselect}
				endif
			endif
		endif
	endif
endscript

script news_feed_generic_error_popup \{error = !q1768515945
		controller_index = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	<array> = [{func = generic_event_back func_params = {} text = ($friend_feed_strings.error_popup_ok)}]
	<formatted_text> = ($friend_feed_strings.error_popup_generic)
	switch (<error>)
		case invalid_song_unlock
		if NOT get_song_title_no_assert song = <song_name>
			<song_name> = qs(0xb2359d6b)
		endif
		fastformattext format_string = ($friend_feed_strings.error_popup_invalid_song_unlock) format_params = {a = <song_name>}
		case invalid_song_dlc
		if NOT get_song_title_no_assert song = <song_name>
			<song_name> = qs(0xb2359d6b)
		endif
		fastformattext format_string = ($friend_feed_strings.error_popup_invalid_song_dlc) format_params = {a = <song_name>}
		default
		printf \{channel = friend_feed
			qs(0x2baa5297)}
	endswitch
	generic_event_choose state = uistate_generic_dialog_box data = {
		is_popup
		template = cancel_confirm
		heading_text = ($friend_feed_strings.error_popup_warning)
		body_text = <formatted_text>
		player_device = <controller_index>
		options = <array>
	}
endscript

script news_feed_add_valid_controllers 
	begin
	<update> = 0
	<button_prompt_is_present> = 0
	<array> = []
	GetActiveControllers
	fastgetarraysize array = <active_controllers>
	<num_active_controllers> = <array_Size>
	if (0 < <num_active_controllers>)
		<active_index> = 0
		begin
		if (1 = (<active_controllers> [<active_index>]))
			if ff_can_use_friend_feed controller_index = <active_index>
				addintegerarrayelement2 array = <array> element = <active_index>
				if NOT newsfeedmanager func = is_controller_added controller_index = <active_index>
					newsfeedmanager func = add_controller controller_index = <active_index>
					if news_feed_should_add_button_helper
						if NOT user_control_helper_exists \{button = blue}
							add_user_control_helper \{text = qs(0x226893e8)
								button = blue
								z = 100
								all_buttons}
						else
							user_control_helper_change_text \{button = blue
								text = qs(0x226893e8)}
						endif
					endif
					<update> = 1
				endif
			endif
		endif
		<active_index> = (1 + <active_index>)
		repeat <num_active_controllers>
	endif
	if news_feed_should_add_button_helper
		if NOT user_control_helper_exists \{button = blue}
			add_user_control_helper \{text = qs(0x226893e8)
				button = blue
				z = 100
				all_buttons}
		endif
		<button_prompt_is_present> = 1
	endif
	if newsfeedmanager \{func = get_controllers}
		fastgetarraysize array = <controllers>
		<num_current_controllers> = <array_Size>
		if (0 < <num_current_controllers>)
			<current_index> = 0
			begin
			if NOT ArrayContains array = <array> contains = (<controllers> [<current_index>])
				newsfeedmanager func = remove_controller controller_index = (<controllers> [<current_index>])
				<update> = 1
			endif
			<current_index> = (1 + <current_index>)
			repeat <num_current_controllers>
		endif
	endif
	if NOT newsfeedmanager \{func = is_any_controller_added}
		if (1 = <button_prompt_is_present>)
			user_control_destroy_helper \{button = blue}
		endif
		fastgetarraysize array = ($g_prev_registered_controllers)
		if (0 < <array_Size>)
		endif
	endif
	if (1 = <update>)
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			newsfeedmanager \{func = request_items}
			<friend_feed_vmenu_id> :news_feed_add_screen_elements
		endif
	endif
	changeglobalarray global_name = g_prev_registered_controllers new_value = <array>
	waitseconds num_seconds = ($g_controller_update_time)
	repeat
endscript

script news_feed_is_each_item_type_available 
	fastgetarraysize array = ($g_valid_ad_ids)
	if (0 = <array_Size>)
		return \{FALSE}
	endif
	fastgetarraysize array = ($g_news_feed_hints)
	if (0 = <array_Size>)
		return \{FALSE}
	endif
	fastgetarraysize array = ($g_ff_rock_record_messages)
	if (0 = <array_Size>)
		return \{FALSE}
	endif
	if (qs(0x00000000) = $message_of_the_day)
		return \{FALSE}
	endif
	<all_queues_empty> = 1
	<index> = 0
	begin
	news_feed_get_message_queue_global index = <index>
	fastgetarraysize array = ($<msg_queue>)
	if (0 < <array_Size>)
		<all_queues_empty> = 0
		break
	endif
	<index> = (1 + <index>)
	repeat ($g_num_msg_queues)
	if (1 = <all_queues_empty>)
		return \{FALSE}
	endif
	return \{true}
endscript

script news_feed_is_scroll_and_slide_anim_done 
	<ret> = FALSE
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :obj_getchecksumtag tag_name = state
			if (Idle = <checksum_value>)
				if NOT ScriptIsRunning \{ff_run_expand_anim}
					<ret> = true
				endif
			endif
		endif
	endif
	return <ret>
endscript

script ff_has_error_message 
	if ($g_ff_has_error_message = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ff_display_error_message \{error_msg = 0x69696969}
	se_setprops {
		info_message_text = <error_msg>
	}
	se_setprops \{message_cont_alpha = 1.0
		time = 0.1
		motion = smooth}
	se_waitprops
	Wait \{2
		Seconds}
	se_setprops \{message_cont_alpha = 0.0
		time = 0.4
		motion = smooth}
	se_waitprops
	se_setprops \{info_message_text = qs(0x00000000)}
	Change \{g_ff_has_error_message = 0}
endscript

script ff_kill_error_message 
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :Obj_KillSpawnedScript \{Name = ff_display_error_message}
		friends_feed_desc_id :se_setprops \{message_cont_alpha = 0.0
			info_message_text = qs(0x00000000)}
	endif
endscript

script ff_has_motd_or_friend_messages \{controller_index = !i1768515945}
	<has_data> = 0
	<has_motd> = 0
	<has_friends> = 0
	news_feed_get_message_queue_global index = <controller_index>
	fastgetarraysize array = ($<msg_queue>)
	if (<array_Size> > 0)
		<has_data> = 1
		<has_friends> = 1
	endif
	if (qs(0x00000000) != $message_of_the_day)
		<has_data> = 1
		<has_motd> = 1
	endif
	return {
		has_data = <has_data>
		has_motd = <has_motd>
		has_friends = <has_friends>
	}
endscript

script ff_poll_for_ps3_boot_time_refresh 
	if ($g_ff_ps3_boot_time_refresh_done = 1)
		return
	endif
	<has_data> = 0
	<has_motd> = 0
	<has_friends> = 0
	Wait \{2
		Seconds}
	<wait_for_friend_msgs_time> = (30 * 5)
	begin
	ff_has_motd_or_friend_messages \{controller_index = 0}
	if ((<has_motd> = 1) && (<has_friends> = 1))
		break
	endif
	Wait \{1
		gameframe}
	repeat <wait_for_friend_msgs_time>
	if (<has_data> = 0)
		begin
		ff_has_motd_or_friend_messages \{controller_index = 0}
		if (<has_data> = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	if (<has_data> = 1)
		Change \{g_ff_ps3_boot_time_refresh_done = 1}
		ff_refresh_feed
	endif
endscript

script news_feed_signin_change_cleanup \{controller_index = !i1768515945}
	news_feed_reset_messages_stored_locally controller_index = <controller_index>
	netfeed func = unregisternewmessagewaitingeventhandler controller_index = <controller_index>
	ui_event_get_stack
	if ('songlist' = (<stack> [0].base_name))
		if ScreenElementExists \{id = songlist_component}
			songlist_component :membfunc_songlist_uistack_getmode
			attempt_to_add_friend_feed menu = SongList songlist_mode = <mode>
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			if screenelementexistssimpleid \{id = SongList}
				SongList :se_setprops \{songlist_ff_dimmer_alpha = 0.0}
			endif
		endif
	elseif ('band_lobby' = (<stack> [0].base_name))
		attempt_to_add_friend_feed \{menu = band_lobby}
	elseif ('band_lobby' = (<stack> [1].base_name))
		if StructureContains structure = (<stack> [0]) is_popup
			attempt_to_add_friend_feed \{menu = band_lobby}
		endif
	elseif ('mainmenu' = (<stack> [0].base_name))
		attempt_to_add_friend_feed \{menu = main}
	elseif ('mainmenu' = (<stack> [1].base_name))
		if StructureContains structure = (<stack> [0]) is_popup
			if ('rock_record' = (<stack> [0].base_name))
				generic_event_back
				ui_event_wait_for_safe
				clean_up_user_control_helpers
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100
					all_buttons}
				add_user_control_helper \{text = qs(0x8a778398)
					button = yellow
					z = 100
					all_buttons}
			endif
			attempt_to_add_friend_feed \{menu = main}
		endif
	endif
endscript

script news_feed_reset_messages_stored_locally \{controller_index = !i1768515945}
	news_feed_get_message_queue_global index = <controller_index>
	changeglobalarray global_name = <msg_queue> new_value = []
	netfeed func = destroysender controller_index = <controller_index>
	netfeed func = destroylocalinbox controller_index = <controller_index>
endscript

script news_feed_get_message_queue_global \{index = !i1768515945}
	if ((isps3) || (isngc))
		return \{msg_queue = q_msg_queue_0}
	else
		formatchecksum format_string = 'q_msg_queue_%a' format_params = {a = <index>}
		return msg_queue = <checksum>
	endif
endscript

script ff_attempt_to_expand_feed \{device_num = !i1768515945}
	if (-1 != <device_num>)
		if ff_can_use_friend_feed controller_index = <device_num> from_expand = 0
			if NOT InNetGame
				if ff_has_error_message
					ff_kill_error_message
					Change \{g_ff_has_error_message = 0}
				endif
				if screenelementexistssimpleid \{id = friends_feed_desc_id}
					if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
							param = friend_feed_vmenu_id}
						GetScreenElementChildren id = <friend_feed_vmenu_id>
						if GotParam \{children}
							GetArraySize <children> param = num_ff_items
							if (1 < <num_ff_items>)
								newsfeedmanager func = add_controller controller_index = <device_num>
								ff_expand_feed controller_index = <device_num>
								return
							endif
						endif
					endif
					Change \{g_ff_has_error_message = 1}
					<error_msg> = ($friend_feed_strings.error_message_refreshing)
					friends_feed_desc_id :Obj_SpawnScriptNow ff_display_error_message params = {error_msg = <error_msg>}
				endif
			endif
		else
			printf \{channel = friend_feed
				qs(0x5bc2d488)}
			if ff_has_error_message
				if ScreenElementExists \{id = friends_feed_desc_id}
					ff_kill_error_message
					friends_feed_desc_id :Obj_SpawnScriptNow ff_display_error_message params = {error_msg = <error_msg>}
				endif
			endif
		endif
	endif
endscript

script ff_attempt_to_collapse_feed \{device_num = !i1768515945}
	ff_collapse_feed controller_index = <device_num>
endscript

script ff_expand_feed \{controller_index = !i1768515945
		do_refresh = 1}
	sdcardmanagerfunc \{func = push_lock_card}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			net_counter_increment \{counter_name = globalcounter_expand_friends_feed}
			Obj_GetID
			LaunchEvent Type = unfocus target = <objID>
			<objID> :se_setprops block_events
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			if (SongList = <checksum_value>)
				if screenelementexistssimpleid \{id = SongList}
					SongList :se_setprops \{songlist_ff_dimmer_alpha = 0.6}
				endif
			endif
			<friend_feed_vmenu_id> :Obj_KillSpawnedScript Name = ff_mini_feed_request_update_loop
			friends_feed_desc_id :Obj_KillSpawnedScript \{Name = news_feed_add_valid_controllers}
			<friend_feed_vmenu_id> :se_getparentid
			<parent_id> :Obj_SpawnScriptNow ff_run_expand_anim
			begin
			if news_feed_is_scroll_and_slide_anim_done
				break
			endif
			WaitOneGameFrame
			repeat
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :Obj_KillSpawnedScript Name = ff_scroll_feed_items
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				LaunchEvent Type = unfocus target = <friend_feed_scrolling_menu_id>
			endif
			<friend_feed_vmenu_id> :se_setprops allow_wrap = FALSE
			newsfeedmanager \{func = get_controllers}
			fastgetarraysize array = <controllers>
			if (1 = <array_Size>)
				if (<controller_index> = (<controllers> [0]))
					<do_refresh> = 0
				endif
			endif
			if (1 = <do_refresh>)
				newsfeedmanager func = remove_all_controllers controller_index = <controller_index>
				ff_refresh_feed \{force_refresh = 1}
			endif
			<friend_feed_vmenu_id> :ff_setup_expanded_view controller_index = <controller_index>
			broadcastevent \{Type = feed_anim_start_expand}
			Block \{Type = feed_anim_finish_expand}
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			newsfeedmanager \{func = change_state
				state = expanded_feed}
			friends_feed_desc_id :news_feed_setup_scrollbar
			news_feed_change_items_exclusive_device controller_index = <controller_index>
			<parent_id> :obj_setchecksumtag tag_name = return_menu checksum_value = <objID>
			AssignAlias id = <friend_feed_vmenu_id> alias = current_menu
			<friend_feed_vmenu_id> :menu_getselectedindex
			if GetScreenElementChildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				if (0 < <array_Size> && 7 < <array_Size>)
					<child_index> = 0
					begin
					(<children> [<child_index>]) :se_setprops unhide alpha = 1.0
					<child_index> = (1 + <child_index>)
					repeat 7
				endif
			endif
			LaunchEvent \{Type = focus
				target = current_menu
				data = {
					child_index = 0
				}}
		endif
	endif
endscript

script ff_collapse_feed \{controller_index = !i1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		if (SongList = <checksum_value>)
			if screenelementexistssimpleid \{id = SongList}
				SongList :se_setprops \{songlist_ff_dimmer_alpha = 0.0}
			endif
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :obj_getchecksumtag tag_name = return_menu
			if screenelementexistssimpleid id = <checksum_value>
				Obj_GetID
				LaunchEvent Type = unfocus target = <objID>
				news_feed_get_num_hidden_items
				Obj_SpawnScriptNow ff_run_colapse_anim params = {goal_loc = <loc_in_menu>}
				begin
				if NOT ScriptIsRunning \{ff_run_colapse_anim}
					break
				endif
				Wait \{1
					gameframe}
				repeat
				friends_feed_desc_id :Obj_SpawnScriptNow \{news_feed_add_valid_controllers}
				if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
						param = friend_feed_vmenu_id}
					<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_scroll_feed_items
					<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_mini_feed_request_update_loop
					<friend_feed_vmenu_id> :se_setprops allow_wrap = true
				endif
				ff_cleanup_expanded_view controller_index = <controller_index>
				if screenelementexistssimpleid id = <checksum_value>
					AssignAlias id = <checksum_value> alias = current_menu
					current_menu :se_setprops \{unblock_events}
					LaunchEvent \{Type = focus
						target = current_menu}
				endif
			endif
		endif
	endif
	sdcardmanagerfunc \{func = pop_lock_card}
endscript

script news_feed_change_items_exclusive_device \{controller_index = !i1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :se_setprops exclusive_device = <controller_index>
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :se_setprops exclusive_device = <controller_index>
				if GetScreenElementChildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					if (0 < <array_Size>)
						<index> = 0
						begin
						(<children> [<index>]) :se_setprops exclusive_device = <controller_index>
						<index> = (1 + <index>)
						repeat <array_Size>
					endif
				endif
			endif
		endif
		friends_feed_desc_id :obj_setintegertag tag_name = ff_exclusive_device integer_value = <controller_index>
	endif
endscript

script news_feed_setup_scrollbar 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_generic_scrollbar_wgt
		AssignAlias id = <resolved_id> alias = news_feed_scrollbar_wgt
		generic_scrollbar_wgt_initialize \{id = news_feed_scrollbar_wgt}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			countscreenelementchildren id = <friend_feed_vmenu_id>
			generic_scrollbar_wgt_set_resolution id = news_feed_scrollbar_wgt num_elements = <num_children>
		endif
	else
		ScriptAssert \{qs(0x7631f46d)}
	endif
endscript

script ff_setup_expanded_view \{controller_index = !i1768515945}
	printf \{channel = friend_feed
		'ff_setup_expanded_view'}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	<Name> = qs(0x00000000)
	NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller_index>}
	friends_feed_desc_id :se_setprops friends_feed_tiled_bg_gamertag_text = <Name>
	NetSessionFunc func = get_user_id params = {controller_index = <controller_index>}
	generateasciifromutf16 string = <Name>
	friends_feed_desc_id :se_setprops \{friends_feed_tiled_bg_gamerpic_texture = icon_gh6}
	friends_feed_desc_id :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
		local_id = <controller_index>
		local_user_index = <controller_index>
		se_prop = friends_feed_tiled_bg_gamerpic_texture
		failure_texture = icon_gh6
	}
	Obj_GetID
	if GetScreenElementChildren id = <objID>
		fastgetarraysize array = <children>
		if (0 < <array_Size>)
			<index> = 0
			begin
			(<children> [<index>]) :se_setprops alpha = 1.0
			<index> = (1 + <index>)
			repeat <array_Size>
		endif
	endif
	Obj_GetID
	if GetScreenElementChildren id = <objID>
		fastgetarraysize array = <children>
		if (0 < <array_Size>)
			<child_index> = 0
			begin
			(<children> [<child_index>]) :se_setprops Hide
			<child_index> = (1 + <child_index>)
			repeat <array_Size>
		endif
	endif
endscript

script ff_cleanup_expanded_view 
	newsfeedmanager \{func = change_state
		state = mini_feed}
	news_feed_change_items_exclusive_device \{controller_index = 10}
	if screenelementexistssimpleid \{id = current_menu}
		ui_event_get_top
		if (<base_name> = 'mainmenu')
			RunScriptOnScreenElement \{id = current_menu
				mainmenu_freeplay_timer}
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		if (main = <checksum_value>)
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100
				all_buttons}
			add_user_control_helper \{text = qs(0x8a778398)
				button = yellow
				z = 100
				all_buttons}
			if news_feed_should_add_button_helper
				add_user_control_helper \{text = qs(0x226893e8)
					button = blue
					z = 100
					all_buttons}
			endif
		elseif (SongList = <checksum_value>)
			if screenelementexistssimpleid \{id = songlist_component}
				songlist_component :membfunc_songlist_uistack_getmode
				clean_up_user_control_helpers
				songlist_create_default_user_control_helpers mode = <mode>
				if NOT is_current_playlist_empty
					if NOT ininternetmode
						songlist_allow_continue
					endif
				endif
			endif
		endif
	endif
endscript

script news_feed_should_add_button_helper 
	<ret> = FALSE
	if NOT InNetGame
		if newsfeedmanager \{func = is_any_controller_added}
			if news_feed_get_menu_tag
				if (1 = ($friend_feed_menu_data.<menu>.interactive))
					if NOT ui_event_is_top_popup
						<ret> = true
						if (<menu> = main)
							ui_event_get_top
							if NOT (<base_name> = 'mainmenu')
								<ret> = FALSE
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	if (<ret> = true)
		if screenelementexistssimpleid \{id = friends_feed_desc_id}
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			if (SongList = <menu>)
				<ret> = FALSE
				if newsfeedmanager func = is_controller_added controller_index = ($primary_controller)
					<ret> = true
				endif
			endif
		endif
	endif
	return <ret>
endscript

script news_feed_get_num_hidden_items 
	<num_hidden_items> = 0
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			if GetScreenElementChildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				if (0 < <array_Size>)
					<index> = 0
					begin
					(<children> [<index>]) :se_getprops
					if (true = <hiddenlocal>)
						<num_hidden_items> = (1 + <num_hidden_items>)
					else
						break
					endif
					<index> = (1 + <index>)
					repeat <array_Size>
				endif
			endif
		endif
	endif
	return num_hidden_items = <num_hidden_items>
endscript

script ff_run_expand_anim 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		<menu> = <checksum_value>
		<anim> = ($friend_feed_menu_data.<menu>.expand_anim)
		fastgetarraysize array = ($g_friend_feed_anims.<anim>)
		<anim_steps> = <array_Size>
		if (<anim_steps> > 0)
			<anim_index> = 0
			ui_sfx \{menustate = friendfeed
				uitype = animateinslide}
			begin
			friends_feed_desc_id :se_setprops {
				Pos = {(($g_friend_feed_anims.<anim> [<anim_index>]).Pos) relative}
				time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
				motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
			}
			friends_feed_desc_id :se_waitprops
			<anim_index> = (1 + <anim_index>)
			repeat <anim_steps>
		endif
	endif
	Obj_GetID
	<objID> :Obj_SpawnScriptNow ff_run_expand_anim_part_two
endscript

script ff_run_expand_anim_part_two 
	Block \{Type = feed_anim_start_expand}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		ui_sfx \{menustate = friendfeed
			uitype = animateopen}
		friends_feed_desc_id :se_setprops \{freeplayresults_bord_alpha = 0
			friendsfeed_bord_alpha = 0.0
			friends_feed_tiled_bg_alpha = 1.0
			friends_feed_tiled_bg_gamertag_cont_alpha = 1.0}
		friends_feed_desc_id :se_setprops \{friends_feed_tiled_bg_gamertag_cont_pos = {
				(0.0, -77.0)
				relative
			}
			motion = ease_in
			time = 0.2}
		friends_feed_desc_id :se_waitprops
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friends_feed_tiled_bg
				param = bg_desc}
			if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_mid param = sprite_element_id
				if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_top param = end_sprite_element_id
					begin
					if GetScreenElementChildren id = <sprite_element_id>
						<sprite_element_id> = (<children> [0])
						if (<sprite_element_id> != <end_sprite_element_id>)
							<sprite_element_id> :se_setprops Pos = {(0.0, -45.0) relative} time = 0.005
							friends_feed_desc_id :se_getprops
							friends_feed_desc_id :se_setprops {
								friend_feed_scrolling_menu_pos = {(0.0, -45.0) relative}
								friend_feed_scrolling_menu_dims = ((0.0, 43.0) + <friend_feed_scrolling_menu_dims>)
								time = 0.005
							}
							<sprite_element_id> :se_waitprops
						else
							break
						endif
					else
						break
					endif
					repeat
				endif
			endif
			friends_feed_desc_id :se_setprops \{scroll_bar_alpha = 1.0
				freeplayresults_bord_alpha = 1
				time = 0.01}
			if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_mid param = sprite_element_id
				if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_top param = end_sprite_element_id
					begin
					if GetScreenElementChildren id = <sprite_element_id>
						<sprite_element_id> = (<children> [0])
						if (<sprite_element_id> != <end_sprite_element_id>)
							<sprite_element_id> :se_setprops Pos = {(0.0, 1.0) relative} time = 0.01
							friends_feed_desc_id :se_setprops \{friend_feed_scrolling_menu_pos = {
									(0.0, 1.0)
									relative
								}}
							<sprite_element_id> :se_waitprops
						else
							break
						endif
					else
						break
					endif
					repeat
				endif
			endif
		endif
	endif
	broadcastevent \{Type = feed_anim_finish_expand}
endscript

script ff_run_colapse_anim \{goal_loc = 0}
	printscriptinfo \{'ff_run_colapse_anim'}
	if friends_feed_desc_id :desc_resolvealias \{Name = alias_friends_feed_tiled_bg
			param = bg_desc}
		if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_mid param = sprite_element_id
			if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_top param = end_sprite_element_id
				ui_sfx \{menustate = friendfeed
					uitype = animateclose}
				begin
				if GetScreenElementChildren id = <sprite_element_id>
					<sprite_element_id> = (<children> [0])
					if (<sprite_element_id> != <end_sprite_element_id>)
						<sprite_element_id> :se_setprops Pos = {(0.0, -1.0) relative} time = 0.01
						friends_feed_desc_id :se_setprops \{friend_feed_scrolling_menu_pos = {
								(0.0, -1.0)
								relative
							}}
						<sprite_element_id> :se_waitprops
					else
						break
					endif
				else
					break
				endif
				repeat
			endif
		endif
		friends_feed_desc_id :se_setprops \{freeplayresults_bord_alpha = 0}
		friends_feed_desc_id :se_setprops \{scroll_bar_alpha = 0.0
			time = 0.01}
		if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_mid param = sprite_element_id
			if <bg_desc> :desc_resolvealias Name = alias_friendsfeed_bord_top param = end_sprite_element_id
				begin
				if GetScreenElementChildren id = <sprite_element_id>
					<sprite_element_id> = (<children> [0])
					if (<sprite_element_id> != <end_sprite_element_id>)
						<sprite_element_id> :se_setprops Pos = {(0.0, 45.0) relative} time = 0.005
						friends_feed_desc_id :se_getprops
						friends_feed_desc_id :se_setprops {
							friend_feed_scrolling_menu_pos = {(0.0, 45.0) relative}
							friend_feed_scrolling_menu_dims = ((0.0, -43.0) + <friend_feed_scrolling_menu_dims>)
							time = 0.005
						}
						<sprite_element_id> :se_waitprops
					else
						break
					endif
				else
					break
				endif
				repeat
			endif
		endif
	endif
	friends_feed_desc_id :se_setprops \{friends_feed_tiled_bg_gamertag_cont_pos = {
			(0.0, 77.0)
			relative
		}
		motion = ease_in
		time = 0.2}
	friends_feed_desc_id :se_waitprops
	friends_feed_desc_id :se_getprops
	friends_feed_desc_id :se_setprops \{friendsfeed_bord_alpha = 1
		friends_feed_tiled_bg_alpha = 0}
	friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
	<anim> = ($friend_feed_menu_data.<checksum_value>.expand_anim)
	fastgetarraysize array = ($g_friend_feed_anims.<anim>)
	<anim_steps> = <array_Size>
	if (<anim_steps> > 0)
		<anim_index> = 0
		ui_sfx \{menustate = friendfeed
			uitype = animateoutslide}
		begin
		friends_feed_desc_id :se_setprops {
			Pos = {((-1) * (($g_friend_feed_anims.<anim> [<anim_index>]).Pos)) relative}
			time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
			motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
		}
		friends_feed_desc_id :se_waitprops
		<anim_index> = (1 + <anim_index>)
		repeat <anim_steps>
	endif
endscript

script news_feed_get_exclusive_device 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :obj_getintegertag \{tag_name = ff_exclusive_device}
			return true exclusive_device = <integer_value>
		endif
	endif
	return \{FALSE}
endscript

script debug_ff_update_output 
	Obj_GetID
	if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
			param = friend_feed_scrolling_menu_id}
		if <objID> :desc_resolvealias Name = alias_friend_feed_vmenu param = friend_feed_vmenu_id
			begin
			<friend_feed_vmenu_id> :menu_getselectedindex
			countscreenelementchildren id = <friend_feed_vmenu_id>
			fastformattext format_string = qs(0x35b12509) format_params = {a = <num_children>}
			<num_items_string> = <formatted_text>
			fastformattext format_string = qs(0x35b12509) format_params = {a = (1 + <selected_index>)}
			se_setprops {
				num_items_value_text = <num_items_string>
				view_index_value_text = <formatted_text>
			}
			WaitOneGameFrame
			repeat
		endif
	endif
endscript

script debug_dump_msg_queue 
	<queue_index> = 0
	begin
	news_feed_get_message_queue_global index = <queue_index>
	<msg_queue> = <checksum>
	fastgetarraysize array = ($<msg_queue>)
	<num_msgs> = <array_Size>
	if (0 < <num_msgs>)
		<msg_index> = 0
		begin
		printf channel = friend_feed qs(0x1a95fee4) a = <queue_index> b = <msg_index>
		<msg> = ($<msg_queue> [<msg_index>])
		printstruct <msg>
		<msg_index> = (1 + <msg_index>)
		repeat <num_msgs>
	else
		printf channel = friend_feed qs(0x02e19561) a = <queue_index>
	endif
	<queue_index> = (1 + <queue_index>)
	repeat 7
endscript

script debug_dump_current_item_data 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :obj_getintegertag tag_name = view_index
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				if GetScreenElementChildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					<num_ff_items> = <array_Size>
					if (0 < <num_ff_items> && <integer_value> < (<num_ff_items> - 1))
						(<children> [<integer_value>]) :GetTags
						(<children> [<integer_value>]) :se_getprops
						dbreak
					endif
				endif
			endif
		endif
	endif
endscript

script debug_news_feed_restart 
	destroy_friend_feed
	attempt_to_add_friend_feed \{menu = main}
endscript

script debug_news_feed_grab_overlay_data \{num_motd_downloaded = 0
		num_feed_items = 0
		rock_record = 0
		ads = 0
		motd = 0
		hints = 0
		friend_msg = 0}
	fastgetarraysize \{array = $q_msg_queue_0}
	AddParam structure_name = return_struct Name = c0_queue_size value = <array_Size>
	fastgetarraysize \{array = $q_msg_queue_1}
	AddParam structure_name = return_struct Name = c1_queue_size value = <array_Size>
	fastgetarraysize \{array = $q_msg_queue_2}
	AddParam structure_name = return_struct Name = c2_queue_size value = <array_Size>
	fastgetarraysize \{array = $q_msg_queue_3}
	AddParam structure_name = return_struct Name = c3_queue_size value = <array_Size>
	fastgetarraysize \{array = $g_valid_ad_ids}
	AddParam structure_name = return_struct Name = num_ads_downloaded value = <num_feed_items>
	<index> = 0
	begin
	if (3 > <index>)
		formatText checksumName = motd_global 'motd_header_%a' a = (1 + <index>)
	else
		<motd_global> = motd_music_store
	endif
	if (qs(0x00000000) != ($<motd_global>))
		<num_motd_downloaded> = (1 + <num_motd_downloaded>)
	endif
	<index> = (1 + <index>)
	repeat 4
	AddParam structure_name = return_struct Name = num_motd_downloaded value = <num_motd_downloaded>
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			if GetScreenElementChildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				<num_feed_items> = <array_Size>
				<index> = 0
				begin
				(<children> [<index>]) :obj_getchecksumtag tag_name = item_type
				if (rock_record = <checksum_value>)
					<rock_record> = (1 + <rock_record>)
				elseif (ad = <checksum_value>)
					<ads> = (1 + <ads>)
				elseif (motd = <checksum_value>)
					<motd> = (1 + <motd>)
				elseif (hint = <checksum_value>)
					<hints> = (1 + <hints>)
				elseif (friend = <checksum_value>)
					<friend_msg> = (1 + <friend_msg>)
				endif
				<index> = (1 + <index>)
				repeat <num_feed_items>
			endif
		endif
	endif
	AddParam structure_name = return_struct Name = num_feed_items value = <num_feed_items>
	AddParam structure_name = return_struct Name = rock_record value = <rock_record>
	AddParam structure_name = return_struct Name = ads value = <ads>
	AddParam structure_name = return_struct Name = motd value = <motd>
	AddParam structure_name = return_struct Name = hints value = <hints>
	AddParam structure_name = return_struct Name = friend_msg value = <friend_msg>
	return <return_struct>
endscript

script wii_pause_friend_feed 
	Change \{g_wii_pause_friend_feed = 1}
endscript

script wii_unpause_friend_feed 
	Change \{g_wii_pause_friend_feed = 0}
endscript

script wii_rich_presence_update_handler \{sender_id = !a1768515945
		sender_name = 0x69696969
		rich_presence_string = 0x69696969}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if netfeed \{func = gettitleid
				out = title_id}
			<msg_queue> = q_msg_queue_0
			fastgetarraysize array = ($<msg_queue>)
			<num_msgs> = <array_Size>
			msg_data = {
				event = rich_presence
				titleid = <title_id>
				Platform = ngc
				rich_presence_string = <rich_presence_string>
			}
			if NOT update_rich_presence_item_from_sender sender_id = <sender_id> msg_data = <msg_data>
				<element> = {
					sender_id = <sender_id>
					sender_name = <sender_name>
					msg = <msg_data>
				}
				if (0 != <num_msgs>)
					insertarrayelement array = ($<msg_queue>) element = <element> index = 0
				else
					addstructurearrayelement array = ($<msg_queue>) element = <element>
				endif
				if ($g_friend_update_max_msg_in_queue < (1 + <num_msgs>))
					RemoveArrayElement array = <array> index = ($g_friend_update_max_msg_in_queue)
				endif
				changeglobalarray global_name = <msg_queue> new_value = <array>
			endif
		else
			printf \{qs(0xa034a921)}
		endif
	endif
endscript

script update_rich_presence_item_from_sender \{sender_id = !a1768515945
		msg_data = 0x69696969}
	ret = FALSE
	<msg_queue> = q_msg_queue_0
	fastgetarraysize array = ($<msg_queue>)
	<num_msgs> = <array_Size>
	if (<array_Size> > 0)
		index = 0
		begin
		<element> = ($<msg_queue> [<index>])
		if net_id_compare net_id_left = (<element>.sender_id) net_id_right = <sender_id>
			setstructureparam struct_name = element param = msg value = <msg_data>
			RemoveArrayElement array = ($<msg_queue>) index = <index>
			insertarrayelement array = <array> element = <element> index = <index>
			changeglobalarray global_name = <msg_queue> new_value = <array>
			<ret> = true
			break
		endif
		<index> = (<index> + 1)
		repeat <num_msgs>
	endif
	return <ret>
endscript
