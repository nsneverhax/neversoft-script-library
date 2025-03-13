
script create_news_feed_events 
	getarraysize \{$news_feed_events
		param = num_feed_events}
	array_entry = 0
	if (0 < <num_feed_events>)
		begin
		<event> = ($news_feed_events [<array_entry>].event)
		<scr> = ($news_feed_events [<array_entry>].scr)
		seteventhandler response = call_script event = <event> scr = <scr> params = {}
		array_entry = (<array_entry> + 1)
		repeat <num_feed_events>
	endif
	block
endscript

script feed_event_beat_score 
	printf \{qs(0x180be70c)}
	printstruct <...>
	netfeed func = createsender controller_index = <controller_index>
	if netfeed \{func = gettitleid
			out = title_id}
		getplayerinfo <player> part
		if friend_feed_get_message_structure {
				titleid = <title_id>
				event = beat_score
				msg_type = `default`
				controller_index = <controller_index>
				player = <player>
				out_param = msg_pak
				challenge_type = <challenge_type>
				challenge_metric = <challenge_type>
			}
			if netfeed func = isoktosend controller_index = <controller_index>
				msg = {event = beat_score <msg_pak>}
				if gotparam \{friends_beat}
					if NOT netfeed {
							func = sendmessage
							controller_index = <controller_index>
							qeventhandler = friend_update_message_handler
							sendtolist = <friends_beat>
							msg = <msg>
						}
						printf \{qs(0x90b0776a)}
					endif
				else
					printf \{qs(0x0213df35)}
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_cheated 
	printf \{qs(0xe003e856)}
	printstruct <...>
	netfeed \{func = logmessage
		msg = 'feed_event_cheated'}
	netfeed func = createsender controller_index = <controller_index>
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = cheated msg_type = `default` controller_index = <controller_index> player = <player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = <controller_index>
				msg = {event = cheated <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				else
					dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'cheated'
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_created_rocker 
	printf \{qs(0x760fc908)}
	printstruct <...>
	netfeed \{func = logmessage
		msg = 'feed_event_created_rocker'}
	netfeed func = createsender controller_index = <controller_index>
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = created_rocker msg_type = `default` controller_index = <controller_index> player = <player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = <controller_index>
				msg = {event = created_rocker <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				else
					dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'created_rocker'
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_completed_encore 
	printf \{qs(0xf8d92c6c)}
	printstruct <...>
	netfeed \{func = logmessage
		msg = 'feed_event_completed_encore'}
	netfeed func = createsender controller_index = <controller_index>
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = encore_complete msg_type = `default` controller_index = <controller_index> player = <player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = <controller_index>
				msg = {event = encore_complete <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				else
					dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'encore_complete'
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_unlock_item_type 
	printf \{qs(0x69ca2032)}
	printstruct <...>
	netfeed \{func = logmessage
		msg = 'feed_event_unlock_item_type'}
	if gotparam \{item_type}
		netfeed func = createsender controller_index = <controller_index>
		if netfeed \{func = gettitleid
				out = title_id}
			if friend_feed_get_message_structure titleid = <title_id> event = unlock_item msg_type = `default` controller_index = <controller_index> player = <player> out_param = msg_pak item_type = <item_type> item_name = <item_name>
				if netfeed func = isoktosend controller_index = <controller_index>
					msg = {event = unlock_item <msg_pak>}
					if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
						printf \{qs(0x90b0776a)}
					else
						dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'unlock_item'
					endif
				else
					printf \{qs(0x87bee461)}
				endif
			else
				printf \{qs(0x1dcf5125)}
			endif
		else
			printf \{qs(0xa034a921)}
		endif
	endif
endscript

script feed_event_dlc_purchased \{store_purchase = nullchecksum}
	if (nullchecksum != <store_purchase>)
		netfeed \{func = logmessage
			msg = 'feed_event_dlc_purchased'}
		netfeed func = createsender controller_index = <controller_index>
		if netfeed \{func = gettitleid
				out = title_id}
			if friend_feed_get_message_structure {
					titleid = <title_id>
					event = dlc_purchased
					msg_type = `default`
					controller_index = <controller_index>
					player = <player>
					out_param = msg_pak
					store_purchase = <store_purchase>
				}
				if netfeed func = isoktosend controller_index = <controller_index>
					msg = {event = dlc_purchased <msg_pak>}
					if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
						printf \{qs(0x90b0776a)}
					else
						dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'dlc_purchased'
					endif
				else
					printf \{qs(0x87bee461)}
				endif
			else
				printf \{qs(0x1dcf5125)}
			endif
		else
			printf \{qs(0xa034a921)}
		endif
	endif
endscript

script feed_event_song_uploaded 
	netfeed \{func = logmessage
		msg = 'feed_event_song_uploaded'}
	netfeed func = createsender controller_index = <controller_index>
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure {
				titleid = <title_id>
				event = song_uploaded
				msg_type = `default`
				controller_index = <controller_index>
				player = <player>
				out_param = msg_pak
			}
			if netfeed func = isoktosend controller_index = <controller_index>
				msg = {event = song_uploaded <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = friend_update_message_handler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				else
					dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = <controller_index> debugmsg = 'song_uploaded'
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script friend_update_check_if_cheating 
	gamemode_gettype
	if (freeplay != <type>)
		if isbandcheating
			playlist_getcurrentsong
			if NOT arraycontains array = ($g_transformation_dummy_songs) contains = <current_song>
				getnumplayersingame \{local}
				if (0 < <num_players>)
					getfirstplayer \{local}
					begin
					getplayerinfo <player> controller
					broadcastevent type = cheated data = {player = <player> controller_index = <controller>}
					getnextplayer player = <player>
					repeat <num_players>
				endif
			endif
		endif
	endif
endscript
