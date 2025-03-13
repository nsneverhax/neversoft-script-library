
script request_news_feed_item_rr_stat \{controllers = !a1768515945
		num_items = !i1768515945}
endscript

script request_news_feed_item_ads \{controllers = !a1768515945
		num_items = !i1768515945}
endscript

script request_news_feed_item_motd \{controllers = !a1768515945
		num_items = !i1768515945}
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
			link_params = {shortcut = none shortcut_string = qs(0x00000000) item_type = hint}
		}
		if NOT newsfeedmanager func = add_item type = hint params = <feed_data>
			printf \{qs(0xde0fa54a)}
		endif
		repeat <num_items>
	endif
endscript

script request_news_feed_items_friend_update \{controllers = !a1768515945
		num_items = !i1768515945}
endscript
