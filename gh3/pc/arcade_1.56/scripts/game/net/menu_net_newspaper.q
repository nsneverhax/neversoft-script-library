g_np_player1_ready = 0
g_np_player2_ready = 0
np_safe = 0

script net_create_newspaper_menu 
	printscriptinfo \{"MJS --- net_create_newspaper_menu"}
	Change \{np_safe = 0}
	Change \{g_np_player1_ready = 0}
	Change \{g_np_player2_ready = 0}
	create_ready_icons \{pos1 = (260.0, 200.0)
		pos2 = (880.0, 180.0)}
	record_net_statistics
	Change net_song_num = ($net_song_num + 1)
	determine_if_game_over
	printscriptinfo \{"MJS --- checking game_over"}
	if (<game_over> = 0)
		printscriptinfo \{"MJS --- game_over is 0"}
		get_number_of_songs
		if ((($net_song_num) != (<num_songs> - 1)) || ($game_mode = p2_coop))
			SpawnScriptNow \{net_np_create_timer}
			Change current_song = ($net_setlist_songs [($net_song_num)])
			SetGlobalTags Progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
		else
			do_tie_breaker_selection
		endif
	else
		printscriptinfo \{"MJS --- game_over is 1"}
		net_stats_calculate_wins
		if (<p1_wins> = 1)
			printscriptinfo \{"MJS --- <p1_wins> = 1"}
			printf \{"Player 1 won! Checking if we can give them the make achievement!"}
			retrieve_player_net_id \{Player = 2}
			CheckAndWriteMakerAchievement player_xuid = <net_id>
		endif
		if ScreenElementExists \{id = newspaper_vmenu}
			printscriptinfo \{"ScreenElementExists id=newspaper_vmenu"}
			LaunchEvent \{Type = unfocus
				target = newspaper_vmenu}
			newspaper_vmenu :Obj_SpawnScriptLater \{net_wait_and_focus_newspaper}
		endif
		printscriptinfo \{"SpawnScriptNow online_match_end_write_stats"}
		SpawnScriptNow \{online_match_end_write_stats}
	endif
	Change \{np_safe = 1}
endscript

script np_net_create_options_menu \{Pos = (600.0, 300.0)
		rot = 0
		Scale = 0.8
		menu_font = fontgrid_title_gh3}
	SetScreenElementProps id = newspaper_scroll Pos = <Pos>
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	set_focus_color rgba = <offwhite>
	set_unfocus_color rgba = <reddish>
	if NOT ($game_mode = p2_coop)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	displayText id = np_option_0 parent = newspaper_container text = "CONTINUE" Pos = (($g_np_option_props [0].Pos) + <menu_offset> + (0.0, 13.0)) Scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
	SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 4
	retail_menu_focus \{id = np_option_0}
	retail_menu_unfocus \{id = np_option_1}
	switch $g_ss_mag_number
		case 0
		<ss_hilite_color> = $g_ss_black
		<ss_menu_icon> = Song_Summary_Menu_Icon_BACKYARD
		case 1
		<ss_hilite_color> = [109 76 44 255]
		<ss_menu_icon> = Song_Summary_Menu_Icon_BAR
		case 2
		<ss_hilite_color> = $g_ss_Paste_brownish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Paste
		case 3
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Decibel
		case 4
		<ss_hilite_color> = $g_ss_AP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_AP
		case 5
		<ss_hilite_color> = $g_ss_Kerrang_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Kerrang
		case 6
		<ss_hilite_color> = $g_ss_GP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_GPlayer
		case 7
		<ss_hilite_color> = $g_ss_HELL_darker_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_HELL
	endswitch
	displaySprite {
		id = ss_menu_hilite_id
		parent = newspaper_container
		tex = Song_Summary_Menu_Hilite
		Pos = (($g_np_option_props [0].Pos) + ($g_np_option_props [0].offset) + <menu_offset>)
		rgba = <ss_hilite_color>
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		dims = (320.0, 40.0)
		z = 1
	}
	displaySprite {
		id = ss_menu_icon_id
		parent = newspaper_container
		tex = <ss_menu_icon>
		Pos = (($g_np_option_props [0].Pos) + ($g_np_option_props [0].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		dims = (80.0, 80.0)
		z = 3
	}
	CreateScreenElement {
		Type = TextElement
		parent = newspaper_vmenu
		font = <menu_font>
		event_handlers = [
			{focus retail_menu_focus}
			{focus SetScreenElementProps params = {id = np_option_0 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
			{unfocus retail_menu_unfocus}
			{unfocus SetScreenElementProps params = {id = np_option_0 no_shadow}}
			{pad_choose net_np_ready_for_next_song}
			{pad_start menu_show_gamercard}
		]
	}
	net_create_newspaper_menu
endscript

script net_np_ready_for_next_song \{Player = 1}
	begin
	if ($np_safe = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ((<Player> = 1) && ($g_np_player1_ready))
		return
	elseif ((<Player> = 2) && ($g_np_player2_ready))
		return
	endif
	formatText checksumName = player_status 'player%p_status' p = <Player>
	get_number_of_songs
	determine_if_game_over
	if (<game_over> = 1)
		if (<player_status>.is_local_client)
			ui_flow_manager_respond_to_action \{action = continue_to_net_stats}
		endif
		return
	else
		if (<player_status>.is_local_client)
			SendNetMessage \{Type = start_next_round}
			Change \{g_np_player1_ready = 1}
		else
			Change \{g_np_player2_ready = 1}
		endif
		update_np_timer
		drop_in_ready_sign Player = <Player>
	endif
endscript

script net_np_create_timer \{Player = 1}
	timer_z = 3.1
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = net_timer_container
		Pos = (350.0, 210.0)
		just = [left top]
		z_priority = <timer_z>
	}
	create_pause_menu_frame x_scale = 0.2 y_scale = 0.25 parent = net_timer_container z = <timer_z> gradient = 0
	CreateScreenElement {
		Type = TextElement
		id = timer_text
		parent = net_timer_container
		just = [center center]
		Scale = (1.75, 1.75)
		text = "20"
		Pos = (640.0, 341.0)
		font = text_a4
		rgba = [125 0 0 255]
		z_priority = (<timer_z> + 5)
	}
	text_id = <id>
	RunScriptOnScreenElement id = <text_id> np_timer_countdown
endscript

script np_timer_countdown 
	Obj_GetID
	<objID> :SetTags timer_value = 20
	begin
	Wait \{1
		Seconds}
	<objID> :GetTags
	<timer_value> = (<timer_value> - 1)
	<objID> :SetTags timer_value = <timer_value>
	formatText TextName = timer_text_value "%t" t = <timer_value>
	<objID> :SetProps text = <timer_text_value>
	if (<timer_value> < 1)
		SpawnScriptLater \{load_and_sync_timing
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
	printf \{"cleanup newspaper the other player has quit"}
	Change \{g_np_player1_ready = 0}
	Change \{g_np_player2_ready = 0}
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
endscript

script update_np_timer 
	players_ready = ($g_np_player1_ready + $g_np_player2_ready)
	timer_text :GetTags
	if (<players_ready> = 2)
		if (<timer_value> > 6)
			<timer_value> = 6
		endif
	elseif (<players_ready> = 1)
		if (<timer_value> > 11)
			<timer_value> = 11
		endif
	endif
	timer_text :SetTags timer_value = <timer_value>
endscript

script net_np_destroy_timer 
	if ScreenElementExists \{id = net_timer_container}
		DestroyScreenElement \{id = net_timer_container}
	endif
endscript

script net_destroy_newspaper_menu 
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
	Change \{np_safe = 0}
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
	StartGameNetScriptPump
	get_number_of_songs
	LaunchEvent \{Type = unfocus
		target = newspaper_vmenu}
	formatText TextName = final_song_text "The score is even at %d-%d.  The tie-breaker song will be chosen by..." d = (<num_songs> / 2)
	create_popup_warning_menu {
		title = "FINAL SONG"
		title_props = {Scale = 1.0}
		textblock = {
			id = tb_text
			text = <final_song_text>
			Pos = (640.0, 380.0)
		}
		menu_pos = (570.0, 475.0)
		no_background
	}
	RunScriptOnScreenElement id = tb_text animate_names params = {id = tb_text text = <final_song_text>}
endscript

script animate_names 
	if (NetSessionFunc Obj = match func = get_gamertag)
		name1 = <Name>
	endif
	name2 = ($opponent_gamertag)
	if ($tie_breaker = HOST)
		if (IsHost)
			winner = <name1>
		else
			winner = <name2>
		endif
	else
		if (IsHost)
			winner = <name2>
		else
			winner = <name1>
		endif
	endif
	Name = <name1>
	wait_time = 0.025
	if ScreenElementExists id = <id>
		begin
		if (<Name> = <name1>)
			<Name> = <name2>
		else
			<Name> = <name1>
		endif
		formatText TextName = new_text "%a\\n\\n%b" a = <text> b = <Name>
		<id> :SetProps text = <new_text>
		if ((<wait_time> > 0.75) && (<Name> = <winner>))
			break
		endif
		Wait <wait_time> Seconds
		<wait_time> = (<wait_time> * 1.1)
		repeat
	endif
	animate_names_finish
endscript

script animate_names_finish 
	Wait \{1.5
		Seconds}
	destroy_popup_warning_menu
	Change \{g_tie_breaker_song = 1}
	set_final_song_selection
	ui_flow_manager_respond_to_action \{action = choose_tie_breaker_song}
endscript

script set_final_song_selection 
	if ($tie_breaker = HOST)
		Change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		Change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	if (IsHost)
		SetSongSelections
	endif
endscript

script net_wait_and_focus_newspaper 
	Wait \{3
		Seconds}
	LaunchEvent \{Type = focus
		target = newspaper_vmenu}
endscript
