
script request_news_feed_item_rr_stat \{controllers = !a1768515945
		num_items = !i1768515945}
	printf \{qs(0x67962579)}
	GetArraySize \{controllers
		param = num_controllers}
	if (0 < <num_controllers>)
		<index> = 0
		begin
		GetArraySize ($g_ff_rock_record_messages) param = num_msgs
		if (0 < <num_msgs>)
			<num_items_per_controller> = (((1.0) * <num_items>) / <num_controllers>)
			roundtointeger \{num_items_per_controller}
			if (<num_items_per_controller> > 0)
				<msg_index> = 0
				<all_msgs_viewed> = 1
				<msgs_contain_controller> = 0
				begin
				<msg_data> = ($g_ff_rock_record_messages [<msg_index>])
				if (<msg_data>.controller = <controllers> [<index>])
					<msgs_contain_controller> = 1
					if (<msg_data>.viewed = 0)
						<all_msgs_viewed> = 0
						<feed_data> = {
							controller_index = (<controllers> [<index>])
							item_type = rock_record
							sender_id = (<msg_data>.sender_id)
							sender_name = (<msg_data>.sender_name)
							feed_string = (<msg_data>.msg_string)
							link_params = {shortcut = None}
						}
						if newsfeedmanager func = add_item Type = rock_record params = <feed_data>
							SetArrayElement ArrayName = g_ff_rock_record_messages globalarray index = <msg_index> NewValue = {<msg_data> viewed = 1}
							<num_items> = (<num_items> - 1)
						endif
					endif
					<num_items_per_controller> = (<num_items_per_controller> - 1)
					if (<num_items_per_controller> <= 0)
						break
					endif
				endif
				<msg_index> = (1 + <msg_index>)
				if (<num_items> <= 0)
					break
				endif
				if (<num_msgs> <= <msg_index>)
					if (<all_msgs_viewed> = 1 && <msgs_contain_controller> = 1)
						<i> = 0
						begin
						<msg_data> = ($g_ff_rock_record_messages [<i>])
						if (<msg_data>.controller = <controllers> [<index>])
							SetArrayElement ArrayName = g_ff_rock_record_messages globalarray index = <i> NewValue = {<msg_data> viewed = 0}
						endif
						<i> = (<i> + 1)
						repeat <num_msgs>
						<msg_index> = 0
					else
						break
					endif
				endif
				repeat
			endif
		endif
		if (<num_items> <= 0)
			break
		endif
		<index> = (1 + <index>)
		repeat <num_controllers>
	endif
endscript

script request_news_feed_item_ads \{controllers = !a1768515945
		num_items = !i1768515945}
	printf \{qs(0x95c628bc)}
	if isxenonorwindx
		fastgetarraysize array = <controllers>
		<num_controllers> = <array_Size>
		if (0 < <num_controllers>)
			fastgetarraysize array = ($g_valid_ad_ids)
			<num_ads> = <array_Size>
			if (0 < <num_ads> && 0 < <num_items>)
				begin
				if NOT (<num_ads> > $g_ad_index)
					Change \{g_ad_index = 0}
				endif
				if dynamic_ad_get_2d_subscriber_info id = ($g_valid_ad_ids [($g_ad_index)])
					<feed_data> = {
						controller_index = (<controllers> [0])
						item_type = ad
						ad_params = <item>
						sender_id = [0 , 0]
						sender_name = ''
						link_params = {shortcut = ad shortcut_string = qs(0x00000000) item_type = ad}
					}
					if NOT newsfeedmanager func = add_item Type = ad params = <feed_data>
						printf \{qs(0xe3ff6c20)}
					endif
				endif
				Change g_ad_index = (1 + ($g_ad_index))
				repeat <num_items>
			endif
		endif
	endif
endscript

script request_news_feed_item_motd \{controllers = !a1768515945
		num_items = !i1768515945}
	printf \{qs(0xa49b8d9d)}
	if (qs(0x00000000) != $message_of_the_day)
		begin
		if ($g_num_motds = $g_motd_index)
			Change \{g_motd_index = 0}
		endif
		if (3 > $g_motd_index)
			formatText checksumName = motd_global 'motd_header_%a' a = (1 + $g_motd_index)
		else
			<motd_global> = motd_music_store
		endif
		<feed_data> = {
			controller_index = -1
			item_type = motd
			sender_id = [0 , 0]
			sender_name = ''
			feed_string = ($<motd_global>)
			link_params = {shortcut = motd shortcut_string = qs(0x00000000) motd_index = ($g_motd_index) item_type = motd}
		}
		if NOT newsfeedmanager func = add_item Type = motd params = <feed_data>
			printf \{qs(0xe15548d6)}
		endif
		Change g_motd_index = (1 + ($g_motd_index))
		repeat <num_items>
	endif
endscript

script request_news_feed_item_community_stat 
	printf \{qs(0x06514d4a)}
endscript

script request_news_feed_item_hint \{controllers = !a1768515945
		num_items = !i1768515945}
	printf \{qs(0xa61483ca)}
	if (0 < <num_items>)
		begin
		getrandomarrayelement ($g_news_feed_hints)
		<feed_data> = {
			controller_index = -1
			item_type = hint
			sender_id = [0 , 0]
			sender_name = ''
			feed_string = <element>
			link_params = {shortcut = None shortcut_string = qs(0x00000000) item_type = hint}
		}
		if NOT newsfeedmanager func = add_item Type = hint params = <feed_data>
			printf \{qs(0xde0fa54a)}
		endif
		repeat <num_items>
	endif
endscript

script request_news_feed_items_friend_update \{controllers = !a1768515945
		num_items = !i1768515945}
	printf \{qs(0xe8785b38)}
	fastgetarraysize array = <controllers>
	<num_controllers> = <array_Size>
	if (0 < <num_controllers>)
		<index> = 0
		begin
		news_feed_get_message_queue_global index = (<controllers> [<index>])
		fastgetarraysize array = ($<msg_queue>)
		<num_msgs> = <array_Size>
		if (0 < <num_msgs>)
			<num_items_per_controller> = (((1.0) * <num_items>) / <num_controllers>)
			roundtointeger \{num_items_per_controller}
			if (<num_msgs> < <num_items_per_controller>)
				<num_loops> = <num_msgs>
				<left_over> = (<num_items_per_controller> - <num_msgs>)
			else
				<num_loops> = <num_items_per_controller>
			endif
			if (0 < <num_loops>)
				<msg_index> = 0
				begin
				<msg_data> = ($<msg_queue> [<msg_index>])
				nick_name = (<msg_data>.sender_name)
				if NetSessionFunc Obj = friends func = get_friend_name params = {net_id = (<msg_data>.sender_id)}
					<nick_name> = <friend_name>
				endif
				if friend_feed_get_message_string_from_message {
						Platform = (<msg_data>.msg.Platform)
						titleid = (<msg_data>.msg.titleid)
						event = (<msg_data>.msg.event)
						msg_type = Default
						msg = (<msg_data>.msg)
						gamertag_string = <nick_name>
						out_string = msg_string
						out_params = link_params
					}
					feed_data = {
						controller_index = (<controllers> [<index>])
						item_type = friend
						msg_type = (<msg_data>.msg.event)
						sender_id = (<msg_data>.sender_id)
						sender_name = <nick_name>
						feed_string = <msg_string>
						msg_id = (<msg_data>.msg_id)
						link_params = {<link_params> (<msg_data>.msg) sender_id = (<msg_data>.sender_id) sender_name = <nick_name> item_type = friend}
					}
					if NOT newsfeedmanager func = add_item Type = friend params = <feed_data>
						printf \{qs(0x2b5280bb)}
					endif
				else
					netfeed \{func = logmessage
						msg = 'friend_update_message_handler: Failed getting message string. Message dropped.'}
				endif
				<msg_index> = (1 + <msg_index>)
				repeat <num_loops>
			endif
		endif
		<index> = (1 + <index>)
		repeat <num_controllers>
	endif
endscript
