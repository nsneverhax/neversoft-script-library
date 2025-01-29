0xe2d08a33 = {
	create = create_select_difficulty_menu
	destroy = destroy_select_difficulty_menu
	actions = [
		{
			action = continue
			flow_state = 0xc2b552da
			transition_right
		}
		{
			action = go_back
			flow_state = 0x303ae628
			transition_left
		}
	]
}
0xc2b552da = {
	create = create_setlist_menu
	destroy = destroy_setlist_menu
	actions = [
		{
			action = continue
			flow_state = 0x1ddceb70
			transition_right
		}
		{
			action = go_back
			flow_state = 0xe2d08a33
			transition_left
		}
	]
}
0x1ddceb70 = {
	create = 0x34a3d649
	destroy = 0xf44b17c2
	actions = [
		{
			action = continue
			flow_state = 0xc2b552da
			transition_left
		}
	]
}

script 0x12d0169b 
	change game_mode = p1_quickplay
endscript

script 0x34a3d649 
	disable_pause
	create_menu_backdrop {
		texture = toprockers_bg
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = 0x5290b098
		pos = (0.0, 0.0)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	launchevent {
		type = focus
		target = 0x5290b098
	}
	0xc1eb90e3
	0xb81e27f1
	add_user_control_helper text = "BACK" button = red z = 100
endscript

script 0xf44b17c2 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu {
		menu_id = 0x5290b098
	}
endscript

script 0xc1eb90e3 
	displaysprite {
		parent = 0x5290b098
		tex = venue_overlay
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50
	}
	createscreenelement {
		type = spriteelement
		parent = 0x5290b098
		texture = toprockers_poster
		pos = (740.0, 30.0)
		just = [right top]
		dims = (620.0, 620.0)
		z_priority = 1.2
		rot_angle = -3
	}
	formattext {
		textname = 0x6f3ef50a
		"\\c5%c\\c0%v"
		c = "CUTOFF"
		v = "VIEWER"
	}
	createscreenelement {
		type = textelement
		parent = 0x5290b098
		pos = (460.0, 610.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3
		text = <0x6f3ef50a>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
endscript

script 0xb81e27f1 
	createscreenelement {
		type = containerelement
		parent = 0x5290b098
		id = 0x705db1e4
		pos = (630.0, 90.0)
	}
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	getglobaltags <songname>
	get_difficulty_text difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	song_title = <uppercasestring>
	getuppercasestring <difficulty_text>
	difficulty_text = <uppercasestring>
	stringtochararray string = <song_title>
	getarraysize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_size> >= <max_characters>)
		new_song_text = ""
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = " ")
				printf \{"found space"}
				break
			endif
		endif
		repeat
		<song_title> = (<new_song_text> + "...")
		<max_width> = 270
	endif
	formattext textname = song_diff_text "\\c1%s \\c5%d" s = <song_title> d = <difficulty_text>
	createscreenelement {
		type = textelement
		parent = 0x5290b098
		id = 0xb882f470
		pos = (435.0, 135.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3.5
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
	displaysprite {
		parent = 0x5290b098
		tex = toprockers_tape_1
		pos = (500.0, -10.0)
		dims = (140.0, 70.0)
		z = 50
	}
	displaysprite {
		parent = 0x5290b098
		tex = toprockers_tape_2
		pos = (280.0, 240.0)
		z = 50
		rot_angle = 90
		dims = (140.0, 70.0)
	}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 80.0)
	name_offset = (140.0, 0.0)
	bar_offset = (-100.0, 0.0)
	skull_offset = (-20.0, 0.0)
	load_songqpak song_name = ($current_song) async = 0
	setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
	calc_songscoreinfo
	0x78eea835 = 0
	begin
	0x97da590f = ($player1_status.base_score)
	switch (<0x78eea835>)
		case 0
		formattext textname = 0x08acfa28 "Base Score"
		case 1
		formattext textname = 0x08acfa28 "4 Stars"
		<0x97da590f> = (<0x97da590f> * 2.0)
		case 2
		formattext textname = 0x08acfa28 "5 Stars"
		<0x97da590f> = (<0x97da590f> * 2.8)
		case 3
		formattext textname = 0x08acfa28 "6 Stars"
		<0x97da590f> = (<0x97da590f> * 3.6)
		case 4
		formattext textname = 0x08acfa28 "7 Stars"
		<0x97da590f> = (<0x97da590f> * 4.4)
		case 5
		formattext textname = 0x08acfa28 "8 Stars"
		<0x97da590f> = (<0x97da590f> * 5.2)
		case 6
		formattext textname = 0x08acfa28 "9 Stars"
		<0x97da590f> = (<0x97da590f> * 6)
	endswitch
	if ($0x276f739f = 0)
		ceil = <0x97da590f>
		casttointeger ceil
		if (<ceil> != <0x97da590f>)
			<ceil> = (<ceil> + 1)
		endif
		formattext textname = song_score_text "%a" a = <ceil> usecommas
	else
		formattext textname = song_score_text "%a" a = <0x97da590f>
	endif
	score_scale = (0.6, 0.8)
	rand = Random (@ 1 @ 2 )
	formattext checksumname = bar_tex 'Toprockers_Bar_%d' d = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
	elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	bar_rgba = (($g_menu_colors).dk_violet_grey)
	text_rgba = [220 220 220 255]
	createscreenelement {
		type = spriteelement
		parent = 0x705db1e4
		pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (800.0, 45.0)
		alpha = 0.9
		<bar_flags>
	}
	createscreenelement {
		scale = <score_scale>
		type = textelement
		parent = 0x705db1e4
		pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <0x08acfa28>
		font = fontgrid_title_gh3
	}
	fit_text_in_rectangle id = <id> dims = (80.0, 40.0)
	createscreenelement {
		scale = (0.8, 0.8)
		type = textelement
		parent = 0x705db1e4
		pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
	}
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<0x78eea835> = (<0x78eea835> + 1)
	repeat 7
	unload_songqpak
endscript
0x276f739f = 0
