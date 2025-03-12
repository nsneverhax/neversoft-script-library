global_end_session_when_write_completes = 0

script check_score_leap_event 
	getnumplayersingame \{local}
	if (0 < <num_players>)
		getfirstplayer \{local}
		begin
		<error_flag> = 0
		getplayerinfo <player> part
		getplayerinfo <player> controller
		if playerinfoequals <player> bot_play = 1
			getplayerinfo <player> bot_original_controller
			if (4 > <bot_original_controller>)
				<controller> = <bot_original_controller>
			else
				<error_flag> = 1
			endif
		endif
		if (0 = <error_flag>)
			getnetid controller_index = <controller>
			if gman_getgoalsbyplayer player = <player>
				<goal_index> = 0
				begin
				<user_ids> = []
				<current_goal> = (<goal_strings_by_player> [<goal_index>])
				gman_getdata goal = (<goals_by_player> [<goal_index>]) player = <player> name = current_progress
				<current_player_score> = <current_progress>
				friendstats_getscores goal_name = <current_goal> controller_index = <controller> instrument = <part>
				getarraysize \{rows
					param = num_friend_entries}
				if (0 < <num_friend_entries>)
					<friend_index> = 0
					getnetid controller_index = <controller>
					begin
					if (<current_player_score> > (<rows> [<friend_index>].score))
						<current_friend_index> = <friend_index>
						if (<num_friend_entries> - <current_friend_index> > 0)
							begin
							if (<net_id_first> = (<rows> [<friend_index>].player_id [0]) &&
									<net_id_second> = (<rows> [<friend_index>].player_id [1]))
								printf \{qs(0xd3c172de)}
								break
							endif
							addarrayelement array = <user_ids> element = (<rows> [<friend_index>].player_id)
							<user_ids> = <array>
							<friend_index> = (1 + <friend_index>)
							repeat (<num_friend_entries> - <current_friend_index>)
						endif
						break
					elseif (<net_id_first> = (<rows> [<friend_index>].player_id [0]) &&
							<net_id_second> = (<rows> [<friend_index>].player_id [1]))
						break
					endif
					<friend_index> = (1 + <friend_index>)
					repeat <num_friend_entries>
				endif
				send_leap_score_event player = <player> controller = <controller> goal = <current_goal> user_ids = <user_ids>
				<goal_index> = (1 + <goal_index>)
				repeat <goals_by_player_size>
			endif
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
endscript

script send_leap_score_event \{player = !i1768515945
		controller = !i1768515945
		goal = !q1768515945
		user_ids = !a1768515945}
	getarraysize \{user_ids
		param = num_players_beat}
	if (0 < <num_players_beat>)
		broadcastevent {
			type = beat_score
			data = {
				player = <player>
				controller_index = <controller>
				challenge_type = <goal>
				friends_beat = <user_ids>
			}
		}
	endif
endscript

script check_for_leaderboard_write 
	printf \{channel = net_leaderboards
		qs(0x669a0012)}
	gamemode_gettype
	if NOT (<type> = freeplay)
		if NOT isbandcheating
			if NOT song_is_jamsession song = <song_checksum>
				writeleaderboards \{leaderboard_id = lb_rock_record_2
					callback = rockrecordwritecomplete}
			endif
			if ((<type> = quickplay) && (<end_credits> = 0))
				getnumplayersingame
				get_song_struct song = <song_checksum>
				if (<num_players> = 1)
					get_player_num_from_controller controller_index = ($primary_controller)
					if (<player_num> != -1)
						getplayerinfo <player_num> part
					else
						part = none
					endif
					switch (<part>)
						case guitar
						part_text = 'guitar'
						case bass
						part_text = 'backup'
						case drum
						part_text = 'drums'
						case vocals
						part_text = 'mic'
						case rhythm
						part_text = 'backup'
						default
						part_text = 'none'
					endswitch
					formattext checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = <part_text>
				else
					if is_traditional_game
						formattext checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = 'band'
					else
						formattext checksumname = lb_song_id '%s_%p' s = (<song_struct>.name) p = 'altband'
					endif
				endif
				get_highest_difficulty
				if (<highest_difficulty> != beginner)
					if ($is_network_game = 1)
						write_leaderboard_stats song_checksum = <song_checksum> end_session = <end_session> game_type = <type> lb_song_id = <lb_song_id>
					else
						if (<song_checksum> != jamsession)
							write_leaderboard_stats song_checksum = <song_checksum> end_session = <end_session> game_type = <type> lb_song_id = <lb_song_id>
						elseif (<song_checksum> = jamsession && <end_session> = 1)
							end_singleplayer_game
						endif
					endif
				endif
				if (<end_session> = 1 && (($is_network_game) = 1))
					if netsessionfunc \{obj = session
							func = has_active_session}
						netsessionfunc \{obj = session
							func = end_active_session}
					endif
				endif
			else
				if ($is_network_game = 1)
					if netsessionfunc \{obj = session
							func = has_active_session}
						netsessionfunc \{obj = session
							func = end_active_session}
					endif
				else
					end_singleplayer_game
					spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
				endif
			endif
		else
			if ($is_network_game = 1)
				netsessionfunc \{obj = session
					func = end_active_session}
			else
				xenon_singleplayer_session_begin_uninit
			endif
		endif
	else
		if ($is_network_game = 1)
			netsessionfunc \{obj = session
				func = end_active_session}
		else
			xenon_singleplayer_session_begin_uninit
		endif
	endif
endscript

script write_leaderboard_stats \{end_session = 0}
	printf \{channel = net_leaderboards
		qs(0x81aa287d)}
	gamemode_gettype
	if (<type> = quickplay)
		get_song_struct song = <song_checksum>
		formattext checksumname = qp_challenge_lb_id '%s_%p' s = (<song_struct>.name) p = 'challenge'
		writeleaderboards leaderboard_id = <qp_challenge_lb_id> callback = quickplay_challenger_lb_write_complete
	endif
	if gman_ispowerscoreenabled
		if (<end_session> = 1)
			change \{global_end_session_when_write_completes = 1}
		endif
	else
		if (<end_session> = 1)
			change \{global_end_session_when_write_completes = 1}
			writeleaderboards leaderboard_id = <lb_song_id> callback = writestatscallback
		else
			writeleaderboards leaderboard_id = <lb_song_id> callback = writestatscallback
		endif
	endif
endscript

script is_traditional_game 
	<num_guitar> = 0
	<num_drum> = 0
	<num_vocals> = 0
	<num_bass> = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		switch (<part>)
			case guitar
			<num_guitar> = (<num_guitar> + 1)
			case bass
			<num_bass> = (<num_bass> + 1)
			case drum
			<num_drum> = (<num_drum> + 1)
			case vocals
			<num_vocals> = (<num_vocals> + 1)
		endswitch
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<num_guitar> <= 1)
		if (<num_drum> <= 1)
			if (<num_vocals> <= 1)
				if (<num_bass> <= 1)
					return \{true}
				endif
			endif
		endif
	endif
	return \{false}
endscript

script net_retrieve_controller_scores 
	getnumplayersingame
	total_score = 0
	primary_index = 0
	<array> = []
	getfirstplayer \{out = index}
	if (<num_players> > 0)
		begin
		getplayerinfo <index> score
		casttointeger \{score}
		getplayerinfo <index> controller
		if (<controller> = $primary_controller)
			<primary_index> = (<index> - 1)
		endif
		addarrayelement array = <array> element = <score>
		<total_score> = (<total_score> + <score>)
		printstruct <...>
		getnextplayer player = <index> out = index
		repeat <num_players>
	endif
	player_scores = <array>
	return {
		scores = <player_scores>
		total_score = <total_score>
		primary_index = <primary_index>
	}
endscript

script net_retrieve_primary_controller_part 
	getplayerinfo \{1
		controller
		out = controller1}
	getplayerinfo \{2
		controller
		out = controller2}
	if (<controller1> = ($primary_controller))
		getplayerinfo \{1
			part}
		return primary_part = <part>
	elseif (<controller2> = ($primary_controller))
		getplayerinfo \{2
			part}
		return primary_part = <part>
	else
		return \{primary_part = guitar}
	endif
endscript

script writestatscallback 
	if (1 = ($global_end_session_when_write_completes))
		change \{global_end_session_when_write_completes = 0}
		end_singleplayer_game
	endif
endscript

script quickplay_challenger_lb_write_complete 
	printf \{qs(0x37b1d5b7)}
	if gman_ispowerscoreenabled
		printf \{qs(0xb22fcccb)}
		if (1 = ($global_end_session_when_write_completes))
			change \{global_end_session_when_write_completes = 0}
			printf \{qs(0x15c80607)}
			end_singleplayer_game
		endif
	endif
endscript

script rockrecordwritecomplete 
endscript

script request_friend_stats \{song = !q1768515945}
	friendstats_resetscores
	if ($autolaunch_startnow = 0)
		get_song_struct song = <song>
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> controller
			if checkforsignin controller_index = <controller> network_platform_only dont_set_primary
				if (<num_players> > 1)
					if is_traditional_game
						formattext checksumname = leaderboard_id '%s_%p' s = (<song_struct>.name) p = '_band'
					else
						formattext checksumname = leaderboard_id '%s_%p' s = (<song_struct>.name) p = '_altband'
					endif
				else
					getplayerinfo <player> part
					switch (<part>)
						case guitar
						part_text = 'guitar'
						case bass
						part_text = 'backup'
						case drum
						part_text = 'drums'
						case vocals
						part_text = 'mic'
						case rhythm
						part_text = 'backup'
						default
						part_text = 'none'
					endswitch
					formattext checksumname = leaderboard_id '%s_%p' s = (<song_struct>.name) p = <part_text>
				endif
				readleaderboardbyfriendslist {
					callback = request_friend_stats_callback
					leaderboard_id = <leaderboard_id>
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = <controller>
				}
				formattext checksumname = leaderboard_id '%s_challenge' s = (<song_struct>.name)
				readleaderboardbyfriendslist {
					callback = request_friend_stats_challenge_callback
					leaderboard_id = <leaderboard_id>
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = <controller>
				}
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	endif
endscript

script request_friend_stats_callback 
	if (<status> != failed)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer
			begin
			if playerinfoequals <player> controller = <controller_index>
				<config> = qp_score_points
				if (<num_players> > 1)
					if is_traditional_game
						<config> = qp_score_points_stdband
					else
						<config> = qp_score_points_band
					endif
				endif
				friendstats_setscores rows = <rows> config = <config> controller_index = <controller_index>
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	endif
	broadcastevent \{type = lb_read}
endscript

script request_friend_stats_challenge_callback 
	if (<status> != failed)
		friendstats_setscores rows = <rows> config = challenges controller_index = <controller_index>
	endif
	broadcastevent \{type = lb_read}
endscript

script get_friend_stats_scores 
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> controller
		if checkforsignin controller_index = <controller> network_platform_only dont_set_primary
			getplayerinfo <player> part
			gman_getgoalsbyplayer player = <player>
			index = 0
			begin
			friendstats_getscores goal_name = (<goal_strings_by_player> [<index>]) controller_index = <controller> instrument = <part>
			printstruct <...>
			index = (<index> + 1)
			repeat <goals_by_player_size>
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script rock_record_read_friends 
	<written_controllers> = [0 0 0 0 0 0 0 0]
	change \{g_ff_rock_record_messages = [
		]}
	begin
	getactivecontrollers
	getarraysize \{active_controllers}
	if (<array_size> > 0)
		<controller_index> = 0
		ui_leaderboard_reinit
		begin
		if (<active_controllers> [<controller_index>] = 1 && <written_controllers> [<controller_index>] = 0)
			if checkforsignin controller_index = <controller_index> network_platform_only
				if ff_can_use_friend_feed controller_index = <controller_index>
					if netsessionfunc \{func = is_leaderboard_lobby_available}
						setarrayelement arrayname = written_controllers index = <controller_index> newvalue = 1
						readleaderboardbyfriendslist {
							callback = rock_record_friends_lb_callback
							leaderboard_id = lb_rock_record_2
							offset = 0
							num_rows = ($g_max_num_friends)
							controller_id = <controller_index>
						}
					endif
				endif
			endif
		endif
		<controller_index> = (<controller_index> + 1)
		repeat <array_size>
	endif
	wait \{1
		second}
	repeat 30
endscript

script rock_record_friends_lb_callback 
	printf \{qs(0xa9827d54)}
	if NOT checksumequals a = <status> b = failed
		getnetid controller_index = <controller_index>
		<net_id> = [0 0]
		setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
		setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
		if gotparam \{rows}
			getarraysize \{rows}
			if (<array_size> > 0)
				<index> = 0
				begin
				<player_id> = (<rows> [<index>].player_id)
				if (<net_id> [0] = <player_id> [0] && <net_id> [1] = <player_id> [1])
					<user_rock_record> = (<rows> [<index>])
					removearrayelement array = <rows> index = <index>
					<rows> = <array>
					break
				endif
				<index> = (<index> + 1)
				repeat <array_size>
				<num_msgs> = ($g_ff_num_rock_record_messages)
				if gotparam \{user_rock_record}
					<ff_rock_record_stats_to_use> = ($g_ff_rock_record_stats)
					begin
					getrandomarrayelement \{rows}
					if gotparam \{element}
						<highest_percent_diff> = 0.0
						<current_percent> = 0.0
						<friend_feed_msg> = qs(0x03ac90f0)
						<gamertag_text> = (<rows> [<index>].gamer_tag)
						getarraysize <ff_rock_record_stats_to_use> param = stats_size
						if (<stats_size> > 0)
							<stat_index> = 0
							<stat_used> = -1
							begin
							<ff_rock_record_stat_struct> = (<ff_rock_record_stats_to_use> [<stat_index>])
							getarraysize (<ff_rock_record_stat_struct>.columns)
							if (<array_size> = 1)
								<stat_checksum> = (<ff_rock_record_stat_struct>.columns [0])
								<element_data> = (<element>.<stat_checksum>)
								<user_data> = (<user_rock_record>.<stat_checksum>)
								if (<stat_checksum> = total_time_playing_in_seconds)
									<element_data> = (<element_data> / 60)
									<user_data> = (<user_data> / 60)
									printf qs(0x8d85dc83) d = <user_data> e = <element_data>
								endif
							elseif (<array_size> > 1)
								<stat_total_chk> = (<ff_rock_record_stat_struct>.columns [0])
								<stat_divisor_chk> = (<ff_rock_record_stat_struct>.columns [1])
								if ((<user_rock_record>.<stat_divisor_chk>) > 0)
									<user_data> = ((<user_rock_record>.<stat_total_chk>) / (<user_rock_record>.<stat_divisor_chk>))
								else
									<user_data> = 0
								endif
								if ((<element>.<stat_divisor_chk>) > 0)
									<element_data> = ((<element>.<stat_total_chk>) / (<element>.<stat_divisor_chk>))
								else
									<element_data> = 0
								endif
							endif
							if ((<element_data> > <user_data>)
									|| (<element_data> < <user_data>))
								<difference> = ((<element_data> - <user_data>) * 1.0)
								<format_string> = (<ff_rock_record_stat_struct>.more_string)
								if (<difference> < 0.0)
									<difference> = (<difference> * -1.0)
									<format_string> = (<ff_rock_record_stat_struct>.less_string)
								endif
								<current_percent> = (<difference> / ((<element_data> + <user_data>) * 1.0))
								if (<current_percent> > <highest_percent_diff>)
									<highest_percent_diff> = <current_percent>
									if structurecontains structure = <ff_rock_record_stat_struct> integer
										casttointeger \{difference}
									endif
									<stat_used> = <stat_index>
									formattext textname = friend_feed_msg <format_string> s = <gamertag_text> n = <element_data> d = <difference>
								endif
							endif
							<stat_index> = (<stat_index> + 1)
							repeat <stats_size>
							if (<stat_used> != -1)
								removearrayelement array = <ff_rock_record_stats_to_use> index = <stat_used>
								<ff_rock_record_stats_to_use> = <array>
								generateasciifromutf16 string = <gamertag_text>
								addarrayelement array = ($g_ff_rock_record_messages) element = {controller = <controller_index> msg_string = <friend_feed_msg> sender_id = (<element>.player_id) sender_name = <nlstring> viewed = 0}
								change g_ff_rock_record_messages = <array>
								if (<array_size> > 1)
									removearrayelement array = <rows> index = <index>
									<rows> = <array>
									<array_size> = (<array_size> - 1)
								endif
							endif
						endif
					endif
					repeat <num_msgs>
				endif
			endif
		endif
	endif
endscript
current_friend_leaderboard_rating = 1

script debug_write_user_leaderboard 
	if NOT retailbuild
		if isxenon
			<wrote_lb> = 0
			<controllers> = [0 1 2 3]
			begin
			getarraysize \{controllers}
			if (<array_size> <= 0)
				break
			endif
			<index> = 0
			begin
			ui_leaderboard_reinit
			<device_num> = (<controllers> [<index>])
			<player> = (<device_num> + 1)
			getnetid controller_index = (<device_num>)
			array = [0 0]
			setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
			<net_id> = <array>
			if NOT (<net_id> [0] = 0 && <net_id> [1] = 0)
				if netsessionfunc \{func = is_leaderboard_lobby_available}
					<wrote_lb> = 1
					writeleaderboards \{leaderboard_id = lb_debug_friends
						callback = debug_friends_leaderboard_callback
						num_players = 4}
					getrandomvalue \{name = score
						a = 1.0
						b = 25000.0}
					setplayerinfo <player> score = <score>
					getplayerinfo <player> in_game
					setplayerinfo <player> in_game = 1
					getplayerinfo <player> difficulty
					setplayerinfo <player> difficulty = medium
					writeleaderboards \{leaderboard_id = getfree_guitar
						callback = debug_friends_leaderboard_callback}
					setplayerinfo <player> score = 0.0
					setplayerinfo <player> in_game = <in_game>
					setplayerinfo <player> difficulty = <difficulty>
					break
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
			if (<wrote_lb> = 1)
				break
			endif
			wait \{1
				second}
			repeat 30
		endif
	endif
	printf \{qs(0x6e4cdf4e)}
endscript

script debug_friends_leaderboard_callback 
	printf \{qs(0x421b3991)}
endscript
