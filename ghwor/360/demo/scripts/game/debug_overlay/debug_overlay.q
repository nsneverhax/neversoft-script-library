g_debug_overlay_on = 0

script toggle_debug_overlay 
	if ($g_debug_overlay_on = 1)
		if screenelementexists \{id = debug_overlay}
			debug_overlay :se_setprops \{alpha = 1.0}
		endif
	else
		if screenelementexists \{id = debug_overlay}
			debug_overlay :se_setprops \{alpha = 0.0}
		endif
	endif
endscript

script create_debug_overlay 
	begin
	if ($boot_movie_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	<alpha> = 0.0
	if globalexists \{name = g_debug_overlay_on}
		if ($g_debug_overlay_on = 1)
			<alpha> = 1.0
		endif
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'debug_overlay'
		id = debug_overlay
		alpha = <alpha>
	}
endscript

script destroy_debug_overlay 
	destroyscreenelement \{id = debug_overlay}
endscript

script update_debug_overlay \{game_mode_text = 0x69696969
		competitive_rules_text = 0x69696969
		leader = !i1768515945
		net_leader = !i1768515945
		primary_controller = !i1768515945
		players_in_game = !i1768515945
		party_text = 0x69696969
		game_session_text = 0x69696969
		goals_text = 0x69696969
		show_goals = 0
		news_feed_overlay_alpha = !i1768515945}
	formattext textname = game_mode_text qs(0x5d9eae64) g = <game_mode_text>
	formattext textname = competitive_rules_text qs(0x5d9eae64) g = <competitive_rules_text>
	formattext textname = leader_text qs(0x5d9eae64) g = <leader>
	formattext textname = net_leader_text qs(0x5d9eae64) g = <net_leader>
	formattext textname = primary_controller_text qs(0x5d9eae64) g = <primary_controller>
	formattext textname = players_in_game_text qs(0x5d9eae64) g = <players_in_game>
	formattext textname = party_text qs(0x5d9eae64) g = <party_text>
	formattext textname = game_session_text qs(0x5d9eae64) g = <game_session_text>
	if screenelementexists \{id = debug_overlay}
		debug_overlay :se_setprops {
			game_mode_text = <game_mode_text>
			competitive_rules_text = <competitive_rules_text>
			leader_text = <leader_text>
			net_leader_text = <net_leader_text>
			primary_controller_text = <primary_controller_text>
			players_in_game_text = <players_in_game_text>
			party_text = <party_text>
			game_session_text = <game_session_text>
		}
		if (<show_goals> = 1)
			debug_overlay :se_setprops {
				debug_overlay_goals_alpha = 1.0
				active_goals_text = <goals_text>
			}
		else
			debug_overlay :se_setprops \{debug_overlay_goals_alpha = 0.0}
		endif
		if (1 = <news_feed_overlay_alpha>)
			formattext textname = num_feed_items qs(0x0bc409e2) a = <num_feed_items>
			formattext textname = num_ads_downloaded qs(0x0bc409e2) a = <num_ads_downloaded>
			formattext textname = num_motd_downloaded qs(0x0bc409e2) a = <num_motd_downloaded>
			formattext textname = rock_record qs(0x0bc409e2) a = <rock_record>
			formattext textname = ads qs(0x0bc409e2) a = <ads>
			formattext textname = motd qs(0x0bc409e2) a = <motd>
			formattext textname = hints qs(0x0bc409e2) a = <hints>
			formattext textname = friend_msg qs(0x0bc409e2) a = <friend_msg>
			formattext textname = c0_queue_size qs(0x0bc409e2) a = <c0_queue_size>
			formattext textname = c1_queue_size qs(0x0bc409e2) a = <c1_queue_size>
			formattext textname = c2_queue_size qs(0x0bc409e2) a = <c2_queue_size>
			formattext textname = c3_queue_size qs(0x0bc409e2) a = <c3_queue_size>
			debug_overlay :se_setprops {
				debug_news_feed_alpha = 1.0
				num_feed_items_text = <num_feed_items>
				num_ads_downloaded_text = <num_ads_downloaded>
				num_motds_downloaded_text = <num_motd_downloaded>
				rock_record_text = <rock_record>
				ads_text = <ads>
				motd_text = <motd>
				hints_text = <hints>
				friend_msg_text = <friend_msg>
				controller_1_queue_size_text = <c0_queue_size>
				controller_2_queue_size_text = <c1_queue_size>
				controller_3_queue_size_text = <c2_queue_size>
				controller_4_queue_size_text = <c3_queue_size>
			}
		else
			debug_overlay :se_setprops \{debug_news_feed_alpha = 0.0}
		endif
	endif
endscript
