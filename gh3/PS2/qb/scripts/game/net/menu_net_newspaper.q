g_np_player1_ready = 0
g_np_player2_ready = 0
np_safe = 0

script net_create_newspaper_menu 
	change \{np_safe = 0}
	change \{g_np_player1_ready = 0}
	change \{g_np_player2_ready = 0}
	create_ready_icons \{pos1 = (260.0, 200.0)
		pos2 = (880.0, 180.0)}
	record_net_statistics
	change net_song_num = ($net_song_num + 1)
	determine_if_game_over
	if (<game_over> = 0)
		get_number_of_songs
		if ((($net_song_num) != (<num_songs> - 1)) || ($game_mode = p2_coop))
			spawnscriptnow \{net_np_create_timer}
			change current_song = ($net_setlist_songs [($net_song_num)])
			setglobaltags progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
		else
			do_tie_breaker_selection
		endif
	else
		net_stats_calculate_wins
		if (<p1_wins> = 1)

			retrieve_player_net_id \{player = 2}
			checkandwritemakerachievement player_xuid = <net_id>
		endif
		if screenelementexists \{id = newspaper_vmenu}
			launchevent \{type = unfocus
				target = newspaper_vmenu}
			newspaper_vmenu :obj_spawnscriptlater \{net_wait_and_focus_newspaper}
		endif
		spawnscriptnow \{online_match_end_write_stats}
	endif
	change \{np_safe = 1}
endscript

script np_net_create_options_menu \{pos = (600.0, 300.0)
		rot = 0
		scale = 0.8
		menu_font = fontgrid_title_gh3}
	setscreenelementprops id = newspaper_scroll pos = <pos>
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	set_focus_color rgba = <offwhite>
	set_unfocus_color rgba = <reddish>
	if NOT ($game_mode = p2_coop)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	displaytext id = np_option_0 parent = newspaper_container text = 'CONTINUE' pos = (($g_np_option_props [0].pos) + <menu_offset> + (0.0, 13.0)) scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
	setscreenelementprops id = <id> font_spacing = 2 space_spacing = 4
	retail_menu_focus \{id = np_option_0}
	retail_menu_unfocus \{id = np_option_1}
	switch $g_ss_mag_number
		case 0
		<ss_hilite_color> = $g_ss_black
		<ss_menu_icon> = song_summary_menu_icon_backyard
		case 1
		<ss_hilite_color> = [109 76 44 255]
		<ss_menu_icon> = song_summary_menu_icon_bar
		case 2
		<ss_hilite_color> = $g_ss_paste_brownish
		<ss_menu_icon> = song_summary_menu_icon_paste
		case 3
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = song_summary_menu_icon_decibel
		case 4
		<ss_hilite_color> = $g_ss_ap_blueish
		<ss_menu_icon> = song_summary_menu_icon_ap
		case 5
		<ss_hilite_color> = $g_ss_kerrang_reddish
		<ss_menu_icon> = song_summary_menu_icon_kerrang
		case 6
		<ss_hilite_color> = $g_ss_gp_blueish
		<ss_menu_icon> = song_summary_menu_icon_gplayer
		case 7
		<ss_hilite_color> = $g_ss_hell_darker_reddish
		<ss_menu_icon> = song_summary_menu_icon_hell
	endswitch
	displaysprite {
		id = ss_menu_hilite_id
		parent = newspaper_container
		tex = song_summary_menu_hilite
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + <menu_offset>)
		rgba = <ss_hilite_color>
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		dims = (320.0, 40.0)
		z = 1
	}
	displaysprite {
		id = ss_menu_icon_id
		parent = newspaper_container
		tex = <ss_menu_icon>
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		dims = (80.0, 80.0)
		z = 3
	}
	createscreenelement {
		type = textelement
		parent = newspaper_vmenu
		font = <menu_font>
		event_handlers = [
			{focus retail_menu_focus}
			{focus setscreenelementprops params = {id = np_option_0 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
			{unfocus retail_menu_unfocus}
			{unfocus setscreenelementprops params = {id = np_option_0 no_shadow}}
			{pad_choose net_np_ready_for_next_song}
			{pad_start menu_show_gamercard}
		]
	}
	net_create_newspaper_menu
endscript

script net_np_ready_for_next_song \{player = 1}
	begin
	if ($np_safe = 1)
		break
	endif
	waitonegameframe
	repeat
	if ((<player> = 1) && ($g_np_player1_ready))
		return
	elseif ((<player> = 2) && ($g_np_player2_ready))
		return
	endif
	formattext checksumname = player_status 'player%p_status' p = <player>
	get_number_of_songs
	determine_if_game_over
	if (<game_over> = 1)
		if (<player_status>.is_local_client)
			ui_flow_manager_respond_to_action \{action = continue_to_net_stats}
		endif
		return
	else
		if (<player_status>.is_local_client)
			sendnetmessage \{type = start_next_round}
			change \{g_np_player1_ready = 1}
		else
			change \{g_np_player2_ready = 1}
		endif
		update_np_timer
		drop_in_ready_sign player = <player>
	endif
endscript

script net_np_create_timer \{player = 1}
	timer_z = 3.1
	createscreenelement {
		type = containerelement
		parent = root_window
		id = net_timer_container
		pos = (350.0, 210.0)
		just = [left top]
		z_priority = <timer_z>
	}
	create_pause_menu_frame x_scale = 0.2 y_scale = 0.25 parent = net_timer_container z = <timer_z> gradient = 0
	createscreenelement {
		type = textelement
		id = timer_text
		parent = net_timer_container
		just = [center center]
		scale = (1.75, 1.75)
		text = '20'
		pos = (645.0, 360.0)
		font = text_a1
		rgba = [125 0 0 255]
		z_priority = (<timer_z> + 5)
	}
	text_id = <id>
	runscriptonscreenelement id = <text_id> np_timer_countdown
endscript

script np_timer_countdown 
	obj_getid
	<objid> :settags timer_value = 20
	begin
	wait \{1
		seconds}
	<objid> :gettags
	<timer_value> = (<timer_value> - 1)
	<objid> :settags timer_value = <timer_value>
	formattext textname = timer_text_value '%t' t = <timer_value>
	<objid> :setprops text = <timer_text_value>
	if (<timer_value> < 1)
		spawnscriptlater \{load_and_sync_timing
			params = {
				start_delay = 3000
				player_status = player1_status
			}}
		ui_flow_manager_respond_to_action \{action = continue_to_next_song}
		break
	endif
	repeat
endscript

script cleanup_newspaper_other_player_quit 

	change \{g_np_player1_ready = 0}
	change \{g_np_player2_ready = 0}
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
endscript

script update_np_timer 
	players_ready = ($g_np_player1_ready + $g_np_player2_ready)
	timer_text :gettags
	if (<players_ready> = 2)
		if (<timer_value> > 6)
			<timer_value> = 6
		endif
	elseif (<players_ready> = 1)
		if (<timer_value> > 11)
			<timer_value> = 11
		endif
	endif
	timer_text :settags timer_value = <timer_value>
endscript

script net_np_destroy_timer 
	if screenelementexists \{id = net_timer_container}
		destroyscreenelement \{id = net_timer_container}
	endif
endscript

script net_destroy_newspaper_menu 
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
	change \{np_safe = 0}
endscript

script net_np_confirm_quit 
endscript

script determine_if_game_over 
	get_number_of_songs
	game_over = 0
	if (($player2_present = 0) || ($net_song_num >= <num_songs>))
		<game_over> = 1
	elseif NOT ($game_mode = p2_coop)
		net_stats_calculate_wins
		if ((<p1_wins> > (<num_songs> / 2)) || (<p2_wins> > (<num_songs> / 2)))
			<game_over> = 1
		endif
	endif
	return game_over = <game_over>
endscript

script do_tie_breaker_selection 
	startgamenetscriptpump
	get_number_of_songs
	launchevent \{type = unfocus
		target = newspaper_vmenu}
	formattext textname = final_song_text 'The score is even at %d-%d.  The tie-breaker song will be chosen by...' d = (<num_songs> / 2)
	create_popup_warning_menu {
		title = 'FINAL SONG'
		title_props = {scale = 1.0}
		textblock = {
			id = tb_text
			text = <final_song_text>
			pos = (640.0, 380.0)
		}
		menu_pos = (570.0, 475.0)
		no_background
	}
	runscriptonscreenelement id = tb_text animate_names params = {id = tb_text text = <final_song_text>}
endscript

script animate_names 
	netsessionfunc \{obj = match
		func = get_gamertag}
	name1 = <name>
	name2 = ($opponent_gamertag)
	if ($tie_breaker = host)
		if (ishost)
			winner = <name1>
		else
			winner = <name2>
		endif
	else
		if (ishost)
			winner = <name2>
		else
			winner = <name1>
		endif
	endif
	name = <name1>
	wait_time = 0.025
	if screenelementexists id = <id>
		begin
		if (<name> = <name1>)
			<name> = <name2>
		else
			<name> = <name1>
		endif
		formattext textname = new_text '%a\\n\\n%b' a = <text> b = <name>
		<id> :setprops text = <new_text>
		if ((<wait_time> > 0.75) && (<name> = <winner>))
			break
		endif
		wait <wait_time> seconds
		<wait_time> = (<wait_time> * 1.1)
		repeat
	endif
	animate_names_finish
endscript

script animate_names_finish 
	wait \{1.5
		seconds}
	destroy_popup_warning_menu
	change \{g_tie_breaker_song = 1}
	set_final_song_selection
	ui_flow_manager_respond_to_action \{action = choose_tie_breaker_song}
endscript

script set_final_song_selection 
	if ($tie_breaker = host)
		change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	if (ishost)
		setsongselections
	endif
endscript

script net_wait_and_focus_newspaper 
	wait \{3
		seconds}
	launchevent \{type = focus
		target = newspaper_vmenu}
endscript
