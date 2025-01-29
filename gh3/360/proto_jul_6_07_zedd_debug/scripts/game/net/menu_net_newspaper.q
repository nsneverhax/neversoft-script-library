g_np_player1_ready = 0
g_np_player2_ready = 0
0xfa86f7a0 = 20

script net_create_newspaper_menu 
	change \{0xfa86f7a0 = 20}
	change \{g_np_player1_ready = 0}
	change \{g_np_player2_ready = 0}
	create_ready_icons \{pos1 = (260.0, 200.0)
		pos2 = (880.0, 180.0)}
	record_net_statistics
	change net_song_num = ($net_song_num + 1)
	get_number_of_songs
	if ($net_song_num < <num_songs>)
		spawnscriptnow \{net_np_create_timer}
		change current_song = ($net_setlist_songs [($net_song_num)])
		setglobaltags progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
	endif
endscript

script np_net_create_options_menu pos = (600.0, 300.0) rot = 0 scale = 0.8 menu_font = fontgrid_title_gh3
	setscreenelementprops id = newspaper_scroll pos = <pos>
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	set_focus_color rgba = <offwhite>
	set_unfocus_color rgba = <reddish>
	displaytext id = np_option_0 parent = newspaper_container text = "CONTINUE" pos = ($g_np_option_props [0].pos) scale = (0.6, 0.6) rot = 2 font = <menu_font>
	retail_menu_focus id = np_option_0
	displaysprite id = 0x513623d3 parent = newspaper_container tex = white pos = ($g_np_option_props [0].pos) rgba = [0 0 0 255] scale = ($g_np_option_props [$g_np_options_index].scale) rot_angle = 3 z = 1
	createscreenelement {
		type = textelement
		parent = newspaper_vmenu
		font = <menu_font>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose net_np_ready_for_next_song}
			{pad_start menu_show_gamercard}
		]
	}
	net_create_newspaper_menu
endscript

script net_np_ready_for_next_song player = 1
	if ((<player> = 1) && ($g_np_player1_ready))
		return
	elseif ((<player> = 2) && ($g_np_player2_ready))
		return
	endif
	formattext checksumname = player_status 'player%p_status' p = <player>
	get_number_of_songs
	if NOT ($net_song_num < <num_songs>)
		if (<player_status>.is_local_client)
			ui_flow_manager_respond_to_action action = continue_to_net_stats
		endif
		return
	else
		if (<player_status>.is_local_client)
			sendnetmessage {type = start_next_round}
			change g_np_player1_ready = 1
		else
			change g_np_player2_ready = 1
		endif
		update_np_timer
		drop_in_ready_sign player = <player>
	endif
endscript

script net_np_create_timer player = 1
	timer_z = 3.1
	createscreenelement {
		type = containerelement
		parent = root_window
		id = net_timer_container
		pos = (400.0, 210.0)
		just = [left top]
		z_priority = <timer_z>
	}
	create_pause_menu_frame x_scale = 0.25 y_scale = 0.25 parent = net_timer_container z = <timer_z> gradient = 0
	createscreenelement {
		type = textelement
		id = timer_text
		parent = net_timer_container
		just = [center center]
		scale = (1.75, 1.75)
		text = "20"
		pos = (645.0, 370.0)
		font = text_a1
		rgba = [125 0 0 255]
		z_priority = (<timer_z> + 5)
	}
	begin
	wait 1 seconds
	change 0xfa86f7a0 = ($0xfa86f7a0 - 1)
	formattext textname = timer_value "%t" t = ($0xfa86f7a0)
	timer_text :setprops text = <timer_value>
	if ($0xfa86f7a0 < 1)
		formattext checksumname = player_status 'player%n_status' n = <player>
		spawnscriptlater load_and_sync_timing params = {start_delay = 3000 player_status = <player_status>}
		ui_flow_manager_respond_to_action action = continue_to_next_song
		break
	endif
	repeat
endscript

script update_np_timer 
	players_ready = ($g_np_player1_ready + $g_np_player2_ready)
	if (<players_ready> = 2)
		if ($0xfa86f7a0 > 6)
			change \{0xfa86f7a0 = 6}
		endif
	elseif (<players_ready> = 1)
		if ($0xfa86f7a0 > 11)
			change \{0xfa86f7a0 = 11}
		endif
	endif
endscript

script net_np_destroy_timer 
	if screenelementexists \{id = net_timer_container}
		destroyscreenelement \{id = net_timer_container}
	endif
endscript

script net_destroy_newspaper_menu 
	destroy_ready_icons
	net_np_destroy_timer
endscript

script 0x45560ce7 
	net_np_destroy_timer
	change \{0xfa86f7a0 = 20}
	net_np_create_timer
endscript
