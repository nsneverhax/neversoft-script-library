
script attempt_to_add_friend_feed \{parent_id = root_window
		menu = !q1768515945
		event_handler = current_menu
		songlist_mode = none
		alpha = 1.0}
	printf \{channel = friend_feed
		qs(0xd5461f01)}
	controller_index = -1
	switch <menu>
		case band_lobby
		if (-1 != $g_leader_player_num)
			getplayerinteger player = ($g_leader_player_num) checksum = controller
			<controller_index> = <integer_value>
		else
			<controller_index> = ($primary_controller)
		endif
		case songlist
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
		elseif (none = <songlist_mode>)
			<controller_index> = -1
		else
			getplayerinteger player = ($g_leader_player_num) checksum = controller
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
	<ret> = false
	if screenelementexistssimpleid id = <parent_id>
		if NOT screenelementexistssimpleid \{id = friends_feed_desc_id}
			if (-1 != <controller_index>)
				if ff_can_use_friend_feed controller_index = <controller_index>
					newsfeedmanager func = add_controller controller_index = <controller_index>
					dynamic_ad_start_friends_feed
				endif
			endif
			newsfeedmanager \{func = update_news_feed_data}
			fastcreatescreenelement params = {
				parent = <parent_id>
				id = friends_feed_desc_id
				type = descinterface
				desc = 'friend_feed'
				alpha = <alpha>
				autosizedims = true
			}
			news_feed_update_menu_tag menu = <menu>
			friends_feed_desc_id :obj_spawnscriptnow \{ff_cleanup_spawned}
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				handlers = [
					{focus news_feed_add_control_helpers}
					{unfocus clean_up_user_control_helpers}
				]
				<friend_feed_scrolling_menu_id> :se_setprops event_handlers = <handlers> alpha = 1.0 exclusive_device = 10
				<friend_feed_scrolling_menu_id> :obj_setmultipletags tags = {most_recent_msg_id = [-1 -1] return_menu = none}
			endif
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :obj_spawnscriptlater ff_scroll_feed_items
				handlers = [
					{pad_up ff_change_item_scroll params = {dir = up}}
					{pad_down ff_change_item_scroll params = {dir = down}}
					{($friend_feed_menu_data.<menu>.pad_handler) generic_blocking_execute_script params = {pad_script = ff_attempt_to_collapse_feed}}
					{pad_back generic_blocking_execute_script params = {pad_script = ff_attempt_to_collapse_feed}}
				]
				<friend_feed_vmenu_id> :se_setprops event_handlers = <handlers>
				<friend_feed_vmenu_id> :obj_spawnscriptlater ff_mini_feed_request_update_loop
				<friend_feed_vmenu_id> :obj_setmultipletags tags = {state = idle}
			endif
			friends_feed_desc_id :obj_spawnscriptlater \{news_feed_add_valid_controllers}
			news_feed_set_interactive_state menu = <menu> event_handler_id = <event_handler>
			news_feed_adjust_feed_pos_by_menu menu = <menu>
			if friends_feed_desc_id :desc_resolvealias \{name = alias_icon_anim
					param = icon_anim_id}
				<icon_anim_id> :obj_spawnscriptnow ui_ff_loading_pulse
			endif
			if (1 = $g_ff_debug)
				dynamicaddebugoverlay
				friends_feed_desc_id :se_setprops \{debug_cont_alpha = 1.0}
				friends_feed_desc_id :obj_spawnscriptlater \{debug_ff_update_output}
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
	onexitrun \{ff_cleanup}
	block \{type = ff_cleanup}
endscript

script ff_cleanup 
	news_feed_fix_main_menu_button_helpers
	newsfeedmanager \{func = cleanup}
	spawnscriptnow \{dynamic_ad_stop}
	netfeeddebugoverlay_destroy
	dynamicaddebugoverlay_destroy
endscript

script news_feed_outstanding_destroy_cleanup 
	if newsfeedmanager \{func = is_expanded_feed}
		if screenelementexistssimpleid \{id = friends_feed_desc_id}
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				<friend_feed_scrolling_menu_id> :obj_getchecksumtag tag_name = return_menu
				if screenelementexistssimpleid id = <checksum_value>
					assignalias id = <checksum_value> alias = current_menu
					current_menu :se_setprops \{unblock_events}
					launchevent \{type = focus
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
			mainmenu_id :obj_spawnscript \{main_menu_add_friendfeed_button_pill_spawned}
		endif
	endif
endscript

script ff_clear_mini_feed_items 
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
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		addparam structure_name = return_struct name = menu value = <checksum_value>
		<ret> = true
	endif
	return <ret> <return_struct>
endscript

script ff_refresh_feed \{force_refresh = 0}
	printf \{channel = ff
		qs(0x933e7e4c)}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
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
	if ui_event_exists_in_stack \{name = 'gameplay'}
		<request_updates> = 0
	elseif innetgame
		<request_updates> = 0
	else
		<request_updates> = 1
	endif
	if (1 = <request_updates>)
		<array> = []
		getactivecontrollers
		fastgetarraysize array = <active_controllers>
		<num_controllers> = <array_size>
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
		<num_valid_controllers> = <array_size>
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
					spawnscriptlater {
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
			<num_headers> = <array_size>
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
				<num_msgs> = <array_size>
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
					removearrayelement array = <array> index = ($g_friend_update_max_msg_in_queue)
				endif
				changeglobalarray global_name = <msg_queue> new_value = <array>
				removeparameter \{array}
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
	waitonegameframe
	repeat
endscript

script ff_adjust_feed_pos \{time = 0.0
		pos = 0x69696969}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops pos = <pos> time = <time> motion = ease_out
	endif
endscript

script news_feed_adjust_feed_pos_by_menu \{menu = !q1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		pos = (0.0, 0.0)
		z_priority = 0.0
		pos = ($friend_feed_menu_data.<menu>.pos)
		z_priority = ($friend_feed_menu_data.<menu>.z_priority)
		friends_feed_desc_id :se_setprops pos = <pos> z_priority = <z_priority>
	endif
endscript

script news_feed_add_screen_elements \{force_update = 0}
	begin
	obj_getchecksumtag \{tag_name = state}
	menu_getselectedindex
	if (idle = <checksum_value>
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
	wait \{1
		gameframe}
	repeat
endscript

script ff_create_news_feed_item \{feed_string = qs(0xaf3e73b9)
		controller_index = !i1768515945
		item_type = none}
	printf \{channel = friend_feed
		qs(0x0ee5d8c4)}
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<screen_element_params> = {parent = <friend_feed_vmenu_id> type = descinterface autosizedims = true alpha = 0.0 exclusive_device = 10}
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
			createscreenelement <screen_element_params>
			addparam structure_name = return_struct name = id value = <id>
			<new_item_id> = <id>
			<new_item_id> :ff_set_friend_feed_item_icon {
				sender_id = <sender_id>
				sender_gamertag = <sender_name>
				controller_index = <controller_index>
				item_type = <item_type>
			}
			if (ad = <item_type>)
				if screenelementexists id = (<ad_params>.id)
					printf channel = friend_feed qs(0x1f3acbab) d = (<ad_params>.id)
					destroyscreenelement id = (<ad_params>.id)
					newsfeedmanager func = destroy_item id = (<ad_params>.id)
				endif
				createscreenelement {
					parent = <new_item_id>
					id = (<ad_params>.id)
					pos = (56.0, 5.0)
					just = [left top]
					type = dynamicadspriteelement
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
				addarrayelement array = <array> element = {focus news_feed_scroll_text_start}
				addarrayelement array = <array> element = {unfocus news_feed_scroll_text_stop}
			endif
			if (none != <link_params>.shortcut)
				addarrayelement array = <array> element = {pad_choose ff_attempt_to_follow_shortcut_action params = {link_params = <link_params>}}
			else
				addarrayelement array = <array> element = {pad_choose ui_sfx params = {menustate = generic uitype = negativeselect}}
			endif
			if (0 != <sender_id> [0] && 0 != <sender_id> [1])
				if (1 = <have_rock_record>)
					if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
							param = friend_feed_scrolling_menu_id}
						addarrayelement array = <array> element = {pad_l1 news_feed_display_rock_record params = {net_id = <sender_id>}}
					endif
				endif
				addarrayelement array = <array> element = {pad_option2 request_gamer_card params = {player_xuid = <sender_id>}}
			endif
			<new_item_id> :se_setprops event_handlers = <array>
			getscreenelementchildren id = <friend_feed_vmenu_id>
			getarraysize <children> param = num_ff_items
			if (1 < <num_ff_items>)
				if NOT (($g_max_items_in_mini_feed) > (<num_ff_items> - 1))
					destroyscreenelement id = (<children> [(<num_ff_items> - 2)])
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
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :se_getprops
				<friend_feed_scrolling_menu_id> :se_setprops dims = <dims>
			endif
		endif
	endif
endscript

script ff_destroy_news_feed_item \{id = !q1768515945}
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				getscreenelementchildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				<num_ff_items> = <array_size>
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
			if NOT scriptisrunning \{rock_record_read_friends}
				spawnscriptnow \{rock_record_read_friends}
			endif
			obj_spawnscriptnow ff_wait_for_rank_data params = {
				user_id = <sender_id>
				gamer_tag = <sender_gamertag>
				controller_index = <controller_index>
			}
		endif
		se_setprops \{icon_left_texture = icon_gh6}
		obj_spawnscriptnow gamerpic_set_screenelement_texture params = {
			net_id_64_bit = <sender_id>
			net_id_gamertag = <sender_gamertag>
			local_user_index = <controller_index>
			se_prop = icon_left_texture
			failure_texture = icon_gh6
			loading_alpha_property = loading_container_alpha
		}
	elseif gotparam \{item_type}
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
				{pad_l1 news_feed_display_rock_record params = {net_id = <user_id>}}
			}
			replace_handlers
		}
		obj_getid
		<objid> :obj_setintegertag tag_name = have_rock_record integer_value = 1
		break
	endif
	wait \{1.0
		second}
	repeat 30
endscript

script ff_scroll_feed_items 
	obj_getid
	begin
	<item_type> = none
	<additional_time> = 0.0
	if getscreenelementchildren id = <objid>
		fastgetarraysize array = <children>
		if ($friend_feed_menu_data.mini_feed_num_items_to_scroll <= <array_size>)
			menu_getselectedindex
			obj_setchecksumtag \{tag_name = state
				checksum_value = animating}
			(<children> [<selected_index>]) :se_setprops alpha = 0.0 time = ($friend_feed_menu_data.item_fade_in_time)
			(<children> [<selected_index>]) :se_waitprops
			if screenelementexistssimpleid id = (<children> [<selected_index>])
				(<children> [<selected_index>]) :obj_getintegertag tag_name = mini_feed_display_count
				(<children> [<selected_index>]) :obj_setintegertag tag_name = mini_feed_display_count integer_value = (<integer_value> + 1)
			endif
			if ((1 + <selected_index>) = <array_size>)
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
				if (<children> [<selected_index>]) :desc_resolvealias name = alias_message param = msg_id
					if countscreenelementchildren id = <msg_id>
						if (($friend_feed_menu_data.msg_scroll_threshold) < <num_children>)
							<additional_time> = ((<num_children> - ($friend_feed_menu_data.msg_scroll_threshold)) * ($friend_feed_menu_data.additional_time_per_line))
							<msg_id> :obj_spawnscriptnow news_feed_scroll_message_text params = {item_type = <item_type> additional_time = <additional_time>}
						endif
					endif
				endif
			endif
		endif
	endif
	obj_setchecksumtag \{tag_name = state
		checksum_value = idle}
	if news_feed_get_item_data item_type = <item_type>
		<wait_time> = ((<item_data>.time) + <additional_time>)
	else
		<wait_time> = ($friend_feed_menu_data.scroll_time)
	endif
	wait <wait_time> seconds
	repeat
endscript

script news_feed_scroll_message_text \{item_type = !q1768515945
		additional_time = !f1768515945
		loop = 0}
	if news_feed_get_item_data item_type = <item_type>
		<time> = ((<item_data>.time) + <additional_time>)
		begin
		se_getprops
		se_setprops {
			pos = ((0.0, 55.0) - (0.0, 1.0) * (<dims> [1]))
			time = <time>
		}
		se_waitprops
		if (<loop> = 0)
			break
		endif
		se_setprops {
			pos = ((0.0, 1.0) * (<dims> [1]) - (0.0, 55.0))
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
	obj_getid
	begin
	<request> = 0
	if getscreenelementchildren id = <objid>
		fastgetarraysize array = <children>
		<ff_index> = 0
		<num_items_displayed> = 0
		if (0 < <array_size>)
			begin
			(<children> [<ff_index>]) :getsingletag mini_feed_display_count
			if (0 < <mini_feed_display_count>)
				<num_items_displayed> = (1 + <num_items_displayed>)
			endif
			<ff_index> = (1 + <ff_index>)
			repeat <array_size>
		endif
		if (<num_items_displayed> = <array_size>)
			<request> = 1
		endif
	else
		<request> = 1
	endif
	if (1 = <request>)
		newsfeedmanager \{func = request_items}
		<objid> :news_feed_add_screen_elements
	endif
	waitseconds num_seconds = ($friend_feed_menu_data.mini_feed_request_wait)
	repeat
endscript

script news_feed_get_item_data \{item_type = !q1768515945
		out_param = item_data}
	<ret> = false
	fastgetarraysize array = ($g_news_item_data)
	if (0 < <array_size>)
		<type_index> = 0
		begin
		if (<item_type> = ($g_news_item_data [<type_index>].checksum))
			addparam structure_name = return_struct name = <out_param> value = ($g_news_item_data [<type_index>])
			<ret> = true
			break
		endif
		<type_index> = (1 + <type_index>)
		repeat <array_size>
	endif
	return <ret> <return_struct>
endscript

script ff_can_use_friend_feed \{controller_index = !i1768515945
		from_expand = 0}
	<ret> = false
	<error_msg> = qs(0x00000000)
	if checkforsignin controller_index = <controller_index> network_platform_only dont_set_primary
		<ret> = true
	elseif (1 = <from_expand>)
		<ret> = true
	else
		if isxenonorwindx
			change \{g_ff_has_error_message = 1}
			<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
		endif
	endif
	if (true = <ret>)
		if isxenonorwindx
			if NOT netsessionfunc func = xenonisguest params = {controller_index = <controller_index>}
				if netsessionfunc func = checkprofilepriveleges params = {check = communication controller_index = <controller_index>}
					if netsessionfunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index>}
						<ret> = true
					elseif netsessionfunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index> friends}
						<ret> = true
					else
						change \{g_ff_has_error_message = 1}
						<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
						<ret> = false
					endif
				elseif netsessionfunc func = checkprofilepriveleges params = {check = communication controller_index = <controller_index> friends}
					if netsessionfunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index>}
						<ret> = true
					elseif netsessionfunc func = checkprofilepriveleges params = {check = presence controller_index = <controller_index> friends}
						<ret> = true
					else
						change \{g_ff_has_error_message = 1}
						<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
						<ret> = false
					endif
				else
					change \{g_ff_has_error_message = 1}
					<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
					<ret> = false
				endif
			else
				change \{g_ff_has_error_message = 1}
				<error_msg> = ($friend_feed_strings.error_message_not_signed_in_insufficient_privileges)
				<ret> = false
			endif
		elseif isps3
			if netsessionfunc \{func = has_network_platform_account}
				if netsessionfunc \{obj = voice
						func = voice_allowed}
					<ret> = true
				else
					<ret> = false
				endif
			else
				<ret> = false
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
					getglobaltags (<link_params>.song_name) savegame = <savegame> param = unlocked
					if (<unlocked> = 1)
						<params> = {
							song_name = (<link_params>.song_name)
							instrument_type = (<link_params>.instrument_type)
							challenge_type = (<link_params>.challenge_type)
							sender_id = (<link_params>.sender_id)
						}
						<valid> = 1
					else
						addparam \{structure_name = error_params
							name = error
							value = invalid_song_unlock}
						addparam structure_name = error_params name = song_name value = (<link_params>.song_name)
						<error> = 1
						<valid> = 0
					endif
				else
					addparam \{structure_name = error_params
						name = error
						value = invalid_song_dlc}
					addparam structure_name = error_params name = song_name value = (<link_params>.song_name)
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
				default
				ui_sfx \{menustate = friendfeed
					uitype = negativeselect}
				<can_follow> = 0
				<valid> = 0
			endswitch
			change g_shortcut_data = {valid = <valid> shortcut = (<link_params>.shortcut) <params>}
			if (1 = <error>)
				addparam structure_name = error_params name = controller_index value = <device_num>
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
					default
					ui_sfx \{menustate = friendfeed
						uitype = negativeselect}
					dbreak
				endswitch
				destroy_friend_feed
			endif
		endif
	elseif (songlist = <checksum_value>)
		ui_sfx \{menustate = generic
			uitype = negativeselect}
	endif
	if (1 = <can_follow>)
		getglobaltags achievement_info savegame = <savegame> param = ff_clicks
		achievement_global_tags = {<achievement_global_tags> ff_clicks = (<ff_clicks> + 1)}
		setglobaltags achievement_info savegame = <savegame> params = <achievement_global_tags>
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
	obj_getid
	menu_getselectedindex
	if (up = <dir>)
		if (<selected_index> > 0)
			ui_sfx \{menustate = friendfeed
				uitype = scrollup}
		endif
	else
		if getscreenelementchildren id = <objid>
			fastgetarraysize array = <children>
			if (<selected_index> < <array_size> - 1)
				ui_sfx \{menustate = friendfeed
					uitype = scrolldown}
			endif
		endif
	endif
endscript

script ff_change_item_focus \{focus_type = !q1768515945
		shortcut = !q1768515945
		have_rock_record = 0}
	obj_getid
	if newsfeedmanager \{func = is_expanded_feed}
		if (focus = <focus_type>)
			<objid> :se_setprops alpha = 1.0
			if <objid> :obj_getintegertag tag_name = have_rock_record assert = 0
				<have_rock_record> = <integer_value>
			endif
			se_setprops \{bkgd_highlight_cont_alpha = 0.8
				divider_512_alpha = 1}
			if screenelementexistssimpleid \{id = friends_feed_desc_id}
				if friends_feed_desc_id :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
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
				if (none != <shortcut>)
					if (motd = <shortcut>)
						add_super_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_shortcut_motd) button = green z = 100
					elseif (ad != <shortcut>)
						fastformattext format_string = ($friend_feed_strings.button_green) format_params = {a = <shortcut_string>}
						add_super_user_control_helper controller = <exclusive_device> text = <formatted_text> button = green z = 100
					endif
					if news_feed_get_exclusive_device
						if isps3
							if isguitarcontroller controller = <exclusive_device>
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
			<objid> :obj_getchecksumtag tag_name = item_type
			if ((rock_record = <checksum_value>) || (friend = <checksum_value>))
				if isxenonorwindx
					add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_yellow) button = yellow z = 100
				endif
			endif
			if (<menu> = songlist)
				add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_blue) button = blue z = 100
			else
				add_user_control_helper controller = <exclusive_device> text = ($friend_feed_strings.button_blue) button = blue z = 100
			endif
			<objid> :obj_getchecksumtag tag_name = item_type
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
		obj_getid
		<objid> :obj_getchecksumtag tag_name = item_type
		if <objid> :desc_resolvealias name = alias_message param = msg_id
			if countscreenelementchildren id = <msg_id>
				if (($friend_feed_menu_data.msg_scroll_threshold) < <num_children>)
					<additional_time> = ((<num_children> - ($friend_feed_menu_data.msg_scroll_threshold)) * ($friend_feed_menu_data.additional_time_per_line))
					<msg_id> :news_feed_scroll_message_text item_type = <checksum_value> additional_time = <additional_time> loop = 1
				endif
			endif
		endif
	endif
endscript

script news_feed_scroll_text_stop 
	if newsfeedmanager \{func = is_expanded_feed}
		obj_getid
		<objid> :obj_killspawnedscript name = news_feed_scroll_text_start
		<objid> :se_setprops message_pos = (0.0, 0.0)
	endif
endscript

script news_feed_display_rock_record \{device_num = !i1768515945
		net_id = !a1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			if (main = <checksum_value>)
				if checkforsignin network_platform_only controller_index = <device_num>
					display_rock_record net_id = <net_id> unfocus_id = <friend_feed_scrolling_menu_id> device_num = <device_num>
					ui_sfx \{menustate = friendfeed
						uitype = select}
				else
					change \{g_ff_has_error_message = 1}
					if isxenonorwindx
						<error_msg> = ($friend_feed_strings.error_message_not_signed_xbox)
					else
						<error_msg> = ($friend_feed_strings.error_message_not_signed_ps3)
					endif
					friends_feed_desc_id :obj_spawnscriptnow ff_display_error_message params = {error_msg = <error_msg>}
					ui_sfx \{menustate = friendfeed
						uitype = negativeselect}
				endif
			endif
		endif
	endif
endscript

script news_feed_remove_ad_item \{ad_id = !q1768515945}
endscript

script news_feed_generic_error_popup \{error = !q1768515945
		controller_index = !i1768515945}
	setspawninstancelimits \{max = 1
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
	getactivecontrollers
	fastgetarraysize array = <active_controllers>
	<num_active_controllers> = <array_size>
	if (0 < <num_active_controllers>)
		<active_index> = 0
		begin
		if (1 = (<active_controllers> [<active_index>]))
			if ff_can_use_friend_feed controller_index = <active_index>
				addintegerarrayelement2 array = <array> element = <active_index>
				if NOT newsfeedmanager func = is_controller_added controller_index = <active_index>
					newsfeedmanager func = add_controller controller_index = <active_index>
					dynamic_ad_start_friends_feed
					if news_feed_should_add_button_helper
					endif
					<update> = 1
				endif
			endif
		endif
		<active_index> = (1 + <active_index>)
		repeat <num_active_controllers>
	endif
	if news_feed_should_add_button_helper
		<button_prompt_is_present> = 1
	endif
	if newsfeedmanager \{func = get_controllers}
		fastgetarraysize array = <controllers>
		<num_current_controllers> = <array_size>
		if (0 < <num_current_controllers>)
			<current_index> = 0
			begin
			if NOT arraycontains array = <array> contains = (<controllers> [<current_index>])
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
		if (0 < <array_size>)
			dynamic_ad_stop
		endif
	endif
	if (1 = <update>)
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
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
	if (0 = <array_size>)
		return \{false}
	endif
	fastgetarraysize array = ($g_news_feed_hints)
	if (0 = <array_size>)
		return \{false}
	endif
	fastgetarraysize array = ($g_ff_rock_record_messages)
	if (0 = <array_size>)
		return \{false}
	endif
	if (qs(0x00000000) = $message_of_the_day)
		return \{false}
	endif
	<all_queues_empty> = 1
	<index> = 0
	begin
	news_feed_get_message_queue_global index = <index>
	fastgetarraysize array = ($<msg_queue>)
	if (0 < <array_size>)
		<all_queues_empty> = 0
		break
	endif
	<index> = (1 + <index>)
	repeat ($g_num_msg_queues)
	if (1 = <all_queues_empty>)
		return \{false}
	endif
	return \{true}
endscript

script news_feed_is_scroll_and_slide_anim_done 
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :obj_getchecksumtag tag_name = state
			if (idle = <checksum_value>)
				if NOT scriptisrunning \{ff_run_expand_anim}
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
		return \{false}
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
	wait \{2
		seconds}
	se_setprops \{message_cont_alpha = 0.0
		time = 0.4
		motion = smooth}
	se_waitprops
	se_setprops \{info_message_text = qs(0x00000000)}
	change \{g_ff_has_error_message = 0}
endscript

script ff_kill_error_message 
	if screenelementexists \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_killspawnedscript \{name = ff_display_error_message}
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
	if (<array_size> > 0)
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
	wait \{2
		seconds}
	<wait_for_friend_msgs_time> = (30 * 5)
	begin
	ff_has_motd_or_friend_messages \{controller_index = 0}
	if ((<has_motd> = 1) && (<has_friends> = 1))
		break
	endif
	wait \{1
		gameframe}
	repeat <wait_for_friend_msgs_time>
	if (<has_data> = 0)
		begin
		ff_has_motd_or_friend_messages \{controller_index = 0}
		if (<has_data> = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if (<has_data> = 1)
		change \{g_ff_ps3_boot_time_refresh_done = 1}
		ff_refresh_feed
	endif
endscript

script news_feed_signin_change_cleanup \{controller_index = !i1768515945}
	news_feed_reset_messages_stored_locally controller_index = <controller_index>
	netfeed func = unregisternewmessagewaitingeventhandler controller_index = <controller_index>
	ui_event_get_stack
	if ('songlist' = (<stack> [0].base_name))
		if screenelementexists \{id = songlist_component}
			songlist_component :membfunc_songlist_uistack_getmode
			attempt_to_add_friend_feed menu = songlist songlist_mode = <mode>
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			if screenelementexistssimpleid \{id = songlist}
				songlist :se_setprops \{songlist_ff_dimmer_alpha = 0.0}
			endif
		endif
	elseif ('band_lobby' = (<stack> [0].base_name))
		attempt_to_add_friend_feed \{menu = band_lobby}
	elseif ('band_lobby' = (<stack> [1].base_name))
		if structurecontains structure = (<stack> [0]) is_popup
			attempt_to_add_friend_feed \{menu = band_lobby}
		endif
	elseif ('mainmenu' = (<stack> [0].base_name))
		attempt_to_add_friend_feed \{menu = main}
	elseif ('mainmenu' = (<stack> [1].base_name))
		if structurecontains structure = (<stack> [0]) is_popup
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
	if isps3
		return \{msg_queue = q_msg_queue_0}
	else
		formatchecksum format_string = 'q_msg_queue_%a' format_params = {a = <index>}
		return msg_queue = <checksum>
	endif
endscript

script ff_attempt_to_expand_feed \{device_num = !i1768515945}
	return
	if (-1 != <device_num>)
		if ff_can_use_friend_feed controller_index = <device_num> from_expand = 0
			if NOT innetgame
				if ff_has_error_message
					ff_kill_error_message
					change \{g_ff_has_error_message = 0}
				endif
				if screenelementexistssimpleid \{id = friends_feed_desc_id}
					if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
							param = friend_feed_vmenu_id}
						getscreenelementchildren id = <friend_feed_vmenu_id>
						if gotparam \{children}
							getarraysize <children> param = num_ff_items
							if (1 < <num_ff_items>)
								newsfeedmanager func = add_controller controller_index = <device_num>
								ff_expand_feed controller_index = <device_num>
								return
							endif
						endif
					endif
					change \{g_ff_has_error_message = 1}
					<error_msg> = ($friend_feed_strings.error_message_refreshing)
					friends_feed_desc_id :obj_spawnscriptnow ff_display_error_message params = {error_msg = <error_msg>}
				endif
			endif
		else
			printf \{channel = friend_feed
				qs(0x5bc2d488)}
			if ff_has_error_message
				if screenelementexists \{id = friends_feed_desc_id}
					ff_kill_error_message
					friends_feed_desc_id :obj_spawnscriptnow ff_display_error_message params = {error_msg = <error_msg>}
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
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			net_counter_increment \{counter_name = globalcounter_expand_friends_feed}
			obj_getid
			launchevent type = unfocus target = <objid>
			<objid> :se_setprops block_events
			friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
			if (songlist = <checksum_value>)
				if screenelementexistssimpleid \{id = songlist}
					songlist :se_setprops \{songlist_ff_dimmer_alpha = 0.6}
				endif
			endif
			<friend_feed_vmenu_id> :obj_killspawnedscript name = ff_mini_feed_request_update_loop
			friends_feed_desc_id :obj_killspawnedscript \{name = news_feed_add_valid_controllers}
			<friend_feed_vmenu_id> :se_getparentid
			<parent_id> :obj_spawnscriptnow ff_run_expand_anim
			begin
			if news_feed_is_scroll_and_slide_anim_done
				break
			endif
			waitonegameframe
			repeat
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :obj_killspawnedscript name = ff_scroll_feed_items
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
					param = friend_feed_scrolling_menu_id}
				launchevent type = unfocus target = <friend_feed_scrolling_menu_id>
			endif
			<friend_feed_vmenu_id> :se_setprops allow_wrap = false
			newsfeedmanager \{func = get_controllers}
			fastgetarraysize array = <controllers>
			if (1 = <array_size>)
				if (<controller_index> = (<controllers> [0]))
					<do_refresh> = 0
				endif
			endif
			if (1 = <do_refresh>)
				newsfeedmanager func = remove_all_controllers controller_index = <controller_index>
				ff_refresh_feed \{force_refresh = 1}
			endif
			<friend_feed_vmenu_id> :ff_setup_expanded_view controller_index = <controller_index>
			broadcastevent \{type = feed_anim_start_expand}
			block \{type = feed_anim_finish_expand}
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			newsfeedmanager \{func = change_state
				state = expanded_feed}
			friends_feed_desc_id :news_feed_setup_scrollbar
			news_feed_change_items_exclusive_device controller_index = <controller_index>
			<parent_id> :obj_setchecksumtag tag_name = return_menu checksum_value = <objid>
			assignalias id = <friend_feed_vmenu_id> alias = current_menu
			<friend_feed_vmenu_id> :menu_getselectedindex
			if getscreenelementchildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				if (0 < <array_size> && 7 < <array_size>)
					<child_index> = 0
					begin
					(<children> [<child_index>]) :se_setprops unhide alpha = 1.0
					<child_index> = (1 + <child_index>)
					repeat 7
				endif
			endif
			launchevent \{type = focus
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
		if (songlist = <checksum_value>)
			if screenelementexistssimpleid \{id = songlist}
				songlist :se_setprops \{songlist_ff_dimmer_alpha = 0.0}
			endif
		endif
	endif
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :obj_getchecksumtag tag_name = return_menu
			if screenelementexistssimpleid id = <checksum_value>
				obj_getid
				launchevent type = unfocus target = <objid>
				news_feed_get_num_hidden_items
				obj_spawnscriptnow ff_run_colapse_anim params = {goal_loc = <loc_in_menu>}
				begin
				if NOT scriptisrunning \{ff_run_colapse_anim}
					break
				endif
				wait \{1
					gameframe}
				repeat
				friends_feed_desc_id :obj_spawnscriptnow \{news_feed_add_valid_controllers}
				if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
						param = friend_feed_vmenu_id}
					<friend_feed_vmenu_id> :obj_spawnscriptlater ff_scroll_feed_items
					<friend_feed_vmenu_id> :obj_spawnscriptlater ff_mini_feed_request_update_loop
					<friend_feed_vmenu_id> :se_setprops allow_wrap = true
				endif
				ff_cleanup_expanded_view controller_index = <controller_index>
				if screenelementexistssimpleid id = <checksum_value>
					assignalias id = <checksum_value> alias = current_menu
					current_menu :se_setprops \{unblock_events}
					launchevent \{type = focus
						target = current_menu}
				endif
			endif
		endif
	endif
endscript

script news_feed_change_all_items_alpha \{alpha = 1.0}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :menu_getselectedindex
			if getscreenelementchildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				if (0 < <array_size>)
					<index> = 0
					begin
					(<children> [<index>]) :se_setprops alpha = <alpha>
					<index> = (1 + <index>)
					repeat <array_size>
					if (0.0 = <alpha>)
						(<children> [<selected_index>]) :se_setprops alpha = 1.0
					endif
				endif
			endif
		endif
	endif
endscript

script news_feed_change_items_exclusive_device \{controller_index = !i1768515945}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :se_setprops exclusive_device = <controller_index>
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :se_setprops exclusive_device = <controller_index>
				if getscreenelementchildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					if (0 < <array_size>)
						<index> = 0
						begin
						(<children> [<index>]) :se_setprops exclusive_device = <controller_index>
						<index> = (1 + <index>)
						repeat <array_size>
					endif
				endif
			endif
		endif
		friends_feed_desc_id :obj_setintegertag tag_name = ff_exclusive_device integer_value = <controller_index>
	endif
endscript

script news_feed_setup_scrollbar 
	obj_getid
	if <objid> :desc_resolvealias name = alias_generic_scrollbar_wgt
		assignalias id = <resolved_id> alias = news_feed_scrollbar_wgt
		generic_scrollbar_wgt_initialize \{id = news_feed_scrollbar_wgt}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			countscreenelementchildren id = <friend_feed_vmenu_id>
			generic_scrollbar_wgt_set_resolution id = news_feed_scrollbar_wgt num_elements = <num_children>
		endif
	else
		scriptassert \{qs(0x7631f46d)}
	endif
endscript

script ff_setup_expanded_view \{controller_index = !i1768515945}
	printf \{channel = friend_feed
		'ff_setup_expanded_view'}
	<name> = qs(0x00000000)
	netsessionfunc obj = match func = get_gamertag params = {controller = <controller_index>}
	friends_feed_desc_id :se_setprops friends_feed_tiled_bg_gamertag_text = <name>
	netsessionfunc func = get_user_id params = {controller_index = <controller_index>}
	generateasciifromutf16 string = <name>
	friends_feed_desc_id :se_setprops \{friends_feed_tiled_bg_gamerpic_texture = icon_gh6}
	friends_feed_desc_id :obj_spawnscriptnow gamerpic_set_screenelement_texture params = {
		local_id = <controller_index>
		local_user_index = <controller_index>
		se_prop = friends_feed_tiled_bg_gamerpic_texture
		failure_texture = icon_gh6
	}
	obj_getid
	if getscreenelementchildren id = <objid>
		fastgetarraysize array = <children>
		if (0 < <array_size>)
			<index> = 0
			begin
			(<children> [<index>]) :se_setprops alpha = 1.0
			<index> = (1 + <index>)
			repeat <array_size>
		endif
	endif
	obj_getid
	if getscreenelementchildren id = <objid>
		fastgetarraysize array = <children>
		if (0 < <array_size>)
			<child_index> = 0
			begin
			(<children> [<child_index>]) :se_setprops hide
			<child_index> = (1 + <child_index>)
			repeat <array_size>
		endif
	endif
endscript

script ff_cleanup_expanded_view 
	newsfeedmanager \{func = change_state
		state = mini_feed}
	news_feed_change_items_exclusive_device \{controller_index = 10}
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		if (main = <checksum_value>)
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100
				all_buttons}
		elseif (songlist = <checksum_value>)
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
	return \{false}
	<ret> = false
	if NOT innetgame
		if newsfeedmanager \{func = is_any_controller_added}
			if news_feed_get_menu_tag
				if (1 = ($friend_feed_menu_data.<menu>.interactive))
					if NOT ui_event_is_top_popup
						<ret> = true
						if (<menu> = main)
							ui_event_get_top
							if NOT (<base_name> = 'mainmenu')
								<ret> = false
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
			if (songlist = <menu>)
				<ret> = false
				if newsfeedmanager func = is_controller_added controller_index = ($primary_controller)
					<ret> = true
				endif
			endif
		endif
	endif
	return <ret>
endscript

script news_feed_get_view_index_data 
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :obj_getintegertag tag_name = view_index
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				if getscreenelementchildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					if (<integer_value> < <array_size>)
						<ret> = true
						addparam structure_name = return_params name = id value = (<children> [<integer_value>])
						(<children> [<integer_value>]) :obj_getchecksumtag tag_name = item_type
						addparam structure_name = return_params name = item_type value = <checksum_value>
					endif
				endif
			endif
		endif
	endif
	return <ret> <return_params>
endscript

script news_feed_get_item_index_by_id \{id = nullchecksum}
	<ret> = false
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				if getscreenelementchildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					if (0 < <array_size>)
						<index> = 0
						begin
						if (<id> = (<children> [<index>]))
							<item_index> = <index>
							<ret> = true
							break
						endif
						<index> = (1 + <index>)
						repeat <array_size>
					endif
				endif
			endif
		endif
	endif
	if NOT gotparam \{item_index}
		<item_index> = 0
	endif
	return <ret> item_index = <item_index>
endscript

script news_feed_get_num_hidden_items 
	<num_hidden_items> = 0
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			if getscreenelementchildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				if (0 < <array_size>)
					<index> = 0
					begin
					(<children> [<index>]) :se_getprops
					if (true = <hiddenlocal>)
						<num_hidden_items> = (1 + <num_hidden_items>)
					else
						break
					endif
					<index> = (1 + <index>)
					repeat <array_size>
				endif
			endif
		endif
	endif
	return num_hidden_items = <num_hidden_items>
endscript

script ff_run_expand_menu_fix_anim 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		se_setprops \{dims = (500.0, 504.0)}
		se_setprops \{pos = (0.0, -440.0)
			time = 0.05}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<friend_feed_vmenu_id> :menu_changeselection down
		endif
	endif
endscript

script ff_run_expand_anim 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		friends_feed_desc_id :obj_getchecksumtag \{tag_name = menu}
		<menu> = <checksum_value>
		<anim> = ($friend_feed_menu_data.<menu>.expand_anim)
		fastgetarraysize array = ($g_friend_feed_anims.<anim>)
		<anim_steps> = <array_size>
		if (<anim_steps> > 0)
			<anim_index> = 0
			ui_sfx \{menustate = friendfeed
				uitype = animateinslide}
			begin
			friends_feed_desc_id :se_setprops {
				pos = {(($g_friend_feed_anims.<anim> [<anim_index>]).pos) relative}
				time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
				motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
			}
			friends_feed_desc_id :se_waitprops
			<anim_index> = (1 + <anim_index>)
			repeat <anim_steps>
		endif
	endif
	obj_getid
	<objid> :obj_spawnscriptnow ff_run_expand_anim_part_two
endscript

script ff_run_expand_anim_part_two 
	block \{type = feed_anim_start_expand}
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
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friends_feed_tiled_bg
				param = bg_desc}
			if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_mid param = sprite_element_id
				if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_top param = end_sprite_element_id
					begin
					if getscreenelementchildren id = <sprite_element_id>
						<sprite_element_id> = (<children> [0])
						if (<sprite_element_id> != <end_sprite_element_id>)
							<sprite_element_id> :se_setprops pos = {(0.0, -45.0) relative} time = 0.005
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
			if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_mid param = sprite_element_id
				if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_top param = end_sprite_element_id
					begin
					if getscreenelementchildren id = <sprite_element_id>
						<sprite_element_id> = (<children> [0])
						if (<sprite_element_id> != <end_sprite_element_id>)
							<sprite_element_id> :se_setprops pos = {(0.0, 1.0) relative} time = 0.01
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
	broadcastevent \{type = feed_anim_finish_expand}
endscript

script ff_run_colapse_anim \{goal_loc = 0}
	printscriptinfo \{'ff_run_colapse_anim'}
	if friends_feed_desc_id :desc_resolvealias \{name = alias_friends_feed_tiled_bg
			param = bg_desc}
		if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_mid param = sprite_element_id
			if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_top param = end_sprite_element_id
				ui_sfx \{menustate = friendfeed
					uitype = animateclose}
				begin
				if getscreenelementchildren id = <sprite_element_id>
					<sprite_element_id> = (<children> [0])
					if (<sprite_element_id> != <end_sprite_element_id>)
						<sprite_element_id> :se_setprops pos = {(0.0, -1.0) relative} time = 0.01
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
		if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_mid param = sprite_element_id
			if <bg_desc> :desc_resolvealias name = alias_friendsfeed_bord_top param = end_sprite_element_id
				begin
				if getscreenelementchildren id = <sprite_element_id>
					<sprite_element_id> = (<children> [0])
					if (<sprite_element_id> != <end_sprite_element_id>)
						<sprite_element_id> :se_setprops pos = {(0.0, 45.0) relative} time = 0.005
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
	<anim_steps> = <array_size>
	if (<anim_steps> > 0)
		<anim_index> = 0
		ui_sfx \{menustate = friendfeed
			uitype = animateoutslide}
		begin
		friends_feed_desc_id :se_setprops {
			pos = {((-1) * (($g_friend_feed_anims.<anim> [<anim_index>]).pos)) relative}
			time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
			motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
		}
		friends_feed_desc_id :se_waitprops
		<anim_index> = (1 + <anim_index>)
		repeat <anim_steps>
	endif
endscript

script news_feed_collapse_anim_reposition_scrolling_menu \{menu_pos_index = 0
		time = 0.0}
	<fudge> = (0.0, 7.0)
	printstruct <...>
	if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
			param = friend_feed_vmenu_id}
		<friend_feed_vmenu_id> :se_getprops
		if getscreenelementchildren id = <friend_feed_vmenu_id>
			fastgetarraysize array = <children>
			if (0 < <array_size>)
				(<children> [0]) :se_getprops
				<step> = (<spacing_between> + <dims> [1])
				<num_steps> = (($friend_feed_menu_data.number_items_expanded_feed - 1) - <menu_pos_index>)
				se_getprops
				se_setprops pos = (<fudge> + <pos> + ((0.0, 1.0) * (<step> * <num_steps>))) time = <time>
			endif
		endif
	endif
endscript

script news_feed_get_exclusive_device 
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :obj_getintegertag \{tag_name = ff_exclusive_device}
			return true exclusive_device = <integer_value>
		endif
	endif
	return \{false}
endscript

script debug_ff_update_output 
	obj_getid
	if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
			param = friend_feed_scrolling_menu_id}
		if <objid> :desc_resolvealias name = alias_friend_feed_vmenu param = friend_feed_vmenu_id
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
			waitonegameframe
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
	<num_msgs> = <array_size>
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
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_scrolling_menu
				param = friend_feed_scrolling_menu_id}
			<friend_feed_scrolling_menu_id> :obj_getintegertag tag_name = view_index
			if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				if getscreenelementchildren id = <friend_feed_vmenu_id>
					fastgetarraysize array = <children>
					<num_ff_items> = <array_size>
					if (0 < <num_ff_items> && <integer_value> < (<num_ff_items> - 1))
						(<children> [<integer_value>]) :gettags
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
	addparam structure_name = return_struct name = c0_queue_size value = <array_size>
	fastgetarraysize \{array = $q_msg_queue_1}
	addparam structure_name = return_struct name = c1_queue_size value = <array_size>
	fastgetarraysize \{array = $q_msg_queue_2}
	addparam structure_name = return_struct name = c2_queue_size value = <array_size>
	fastgetarraysize \{array = $q_msg_queue_3}
	addparam structure_name = return_struct name = c3_queue_size value = <array_size>
	fastgetarraysize \{array = $g_valid_ad_ids}
	addparam structure_name = return_struct name = num_ads_downloaded value = <num_feed_items>
	<index> = 0
	begin
	if (3 > <index>)
		formattext checksumname = motd_global 'motd_header_%a' a = (1 + <index>)
	else
		<motd_global> = motd_music_store
	endif
	if (qs(0x00000000) != ($<motd_global>))
		<num_motd_downloaded> = (1 + <num_motd_downloaded>)
	endif
	<index> = (1 + <index>)
	repeat 4
	addparam structure_name = return_struct name = num_motd_downloaded value = <num_motd_downloaded>
	if screenelementexistssimpleid \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			if getscreenelementchildren id = <friend_feed_vmenu_id>
				fastgetarraysize array = <children>
				<num_feed_items> = <array_size>
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
	addparam structure_name = return_struct name = num_feed_items value = <num_feed_items>
	addparam structure_name = return_struct name = rock_record value = <rock_record>
	addparam structure_name = return_struct name = ads value = <ads>
	addparam structure_name = return_struct name = motd value = <motd>
	addparam structure_name = return_struct name = hints value = <hints>
	addparam structure_name = return_struct name = friend_msg value = <friend_msg>
	return <return_struct>
endscript
