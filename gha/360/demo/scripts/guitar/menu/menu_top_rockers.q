tr_max_band_characters = 14
num_top_scores = 5
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	disable_pause
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = tr_container
		pos = (0.0, 0.0)}
	menu_top_rockers_create_poster
	new_score = -1
	if (<for_options> = 0)
		menu_top_rockers_check_for_new_top_score
	endif
	menu_top_rockers_create_paper highlight_index = (<new_score> + 1)
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "DELETE"
			button = red
			z = 100}
		add_user_control_helper \{text = "UP/DOWN"
			button = strumbar
			z = 100}
		add_user_control_helper \{text = "ACCEPT"
			button = start
			z = 100}
	else
		menu_top_rockers_create_continue_button
		add_user_control_helper \{text = "CONTINUE"
			button = green
			z = 100}
		add_user_control_helper \{text = "CONTINUE"
			button = red
			z = 100}
		add_user_control_helper \{text = "CONTINUE"
			button = start
			z = 100}
	endif
endscript

script destroy_top_rockers_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = tr_container}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script menu_top_rockers_create_poster 
	displaysprite \{parent = tr_container
		tex = venue_overlay
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	createscreenelement \{type = spriteelement
		parent = tr_container
		texture = toprockers_poster
		pos = (740.0, 30.0)
		just = [
			right
			top
		]
		dims = (620.0, 620.0)
		z_priority = 1.2
		rot_angle = -3}
	formattext \{textname = rockers_title
		"\\c5%T\\c0%R"
		t = "TOP"
		r = "ROCKERS"}
	createscreenelement {
		type = textelement
		parent = tr_container
		pos = (460.0, 610.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3
		text = <rockers_title>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
endscript

script menu_top_rockers_create_paper 
	createscreenelement \{type = containerelement
		parent = tr_container
		id = tr_paper_container
		pos = (630.0, 90.0)}
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
		parent = tr_container
		id = tr_song_name
		pos = (435.0, 135.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3.5
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
	displaysprite \{parent = tr_container
		tex = toprockers_tape_1
		pos = (500.0, -10.0)
		dims = (140.0, 70.0)
		z = 50}
	displaysprite \{parent = tr_container
		tex = toprockers_tape_2
		pos = (280.0, 240.0)
		z = 50
		rot_angle = 90
		dims = (140.0, 70.0)}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 80.0)
	name_offset = (140.0, 7.0)
	bar_offset = (-100.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	formattext checksumname = song_score_cs 'score%d' d = <score_val>
	formattext textname = song_score_text "%s" s = (<...>.<song_score_cs>) usecommas
	formattext checksumname = score_name_cs 'name%d' d = <score_val>
	formattext textname = score_name_text "%s" s = (<...>.<score_name_cs>)
	formattext textname = number_text "%n" n = <score_val>
	formattext checksumname = song_score_id 'song_score%d' d = <score_val>
	formattext checksumname = score_name_id 'score_name%d' d = <score_val>
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
	show_num = 1
	if (<score_val> = <highlight_index>)
		<bar_rgba> = [0 0 0 255]
		<text_rgba> = [190 160 30 255]
		<show_num> = 0
	endif
	createscreenelement {
		type = spriteelement
		parent = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (800.0, 45.0)
		alpha = 0.9
		<bar_flags>
	}
	if (<show_num> = 1)
		createscreenelement {
			scale = 1.0
			type = textelement
			parent = tr_paper_container
			pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 17.0))
			z_priority = 1.3
			rgba = [0 0 0 255]
			just = [left bottom]
			text = <number_text>
			font = fontgrid_title_gh3
		}
	else
		createscreenelement {
			type = spriteelement
			parent = tr_paper_container
			pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <skull_offset>)
			z_priority = 1.3
			rgba = [255 255 255 255]
			just = [left bottom]
			texture = toprockers_skull
			dims = (48.0, 48.0)
		}
	endif
	createscreenelement {
		scale = <score_scale>
		type = textelement
		parent = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
		id = <song_score_id>
	}
	fit_text_in_rectangle id = <id> dims = (65.0, 40.0) only_if_larger_x = 1
	createscreenelement {
		scale = (0.8, 0.8)
		type = textelement
		parent = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 3.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <score_name_text>
		font = fontgrid_title_gh3
		id = <score_name_id>
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = (135.0, 35.0) only_if_larger_x = 1 pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset>)
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<score_val> = (<score_val> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	createscreenelement {
		type = textelement
		parent = root_window
		id = continue_button
		scale = 0.9
		pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		parent = continue_button
		id = continue_text
		scale = 0.8
		pos = (40.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
			{pad_back ui_flow_manager_respond_to_action params = {action = continue}}
			{pad_start ui_flow_manager_respond_to_action params = {action = continue}}
		]
		exclusive_device = $primary_controller
	}
	launchevent \{type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	if ($current_song = kingsandqueenscredits)
		return
	endif
	newbestscore = 0
	player_score = ($player1_status.score)
	casttointeger \{player_score}
	if ($game_mode = p2_quickplay)
		player_stars = (($player1_status.stars + $player2_status.stars) / 2)
	else
		player_stars = ($player1_status.stars)
	endif
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
		<player_score> = (<player_score> + ($player2_status.score))
		casttointeger \{player_score}
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	getglobaltags <songname>
	score_array = [0 0 0 0 0]
	name_array = ["" "" "" "" ""]
	stars_array = [0 0 0 0 0]
	score_index = 0
	begin
	formattext checksumname = score_cs 'score%d' d = (<score_index> + 1)
	formattext checksumname = name_cs 'name%d' d = (<score_index> + 1)
	formattext checksumname = stars_cs 'stars%d' d = (<score_index> + 1)
	setarrayelement arrayname = score_array index = <score_index> newvalue = (<...>.<score_cs>)
	setarrayelement arrayname = name_array index = <score_index> newvalue = (<...>.<name_cs>)
	setarrayelement arrayname = stars_array index = <score_index> newvalue = (<...>.<stars_cs>)
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	<score_index> = 0
	new_score = -1
	begin
	if (<player_score> > (<score_array> [<score_index>]))
		<new_score> = <score_index>
		if (<nowrite> = 0)
			score_shift_index = ($num_top_scores - 2)
			if NOT (($num_top_scores - (<score_index> + 1)) = 0)
				begin
				setarrayelement arrayname = score_array index = (<score_shift_index> + 1) newvalue = (<score_array> [<score_shift_index>])
				setarrayelement arrayname = name_array index = (<score_shift_index> + 1) newvalue = (<name_array> [<score_shift_index>])
				setarrayelement arrayname = stars_array index = (<score_shift_index> + 1) newvalue = (<stars_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			if gotparam \{use_band_name}
				get_current_band_info
				getglobaltags <band_info> param = name
				setarrayelement arrayname = name_array index = <score_index> newvalue = <name>
			endif
			setarrayelement arrayname = score_array index = <score_index> newvalue = <player_score>
			setarrayelement arrayname = stars_array index = <score_index> newvalue = <player_stars>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		setglobaltags <songname> params = {bestscore = <bestscore>}
		setglobaltags <songname> params = {beststars = <beststars>}
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = 1
	endif
	setglobaltags <songname> params = {score1 = (<score_array> [0]) score2 = (<score_array> [1]) score3 = (<score_array> [2]) score4 = (<score_array> [3]) score5 = (<score_array> [4])}
	setglobaltags <songname> params = {name1 = (<name_array> [0]) name2 = (<name_array> [1]) name3 = (<name_array> [2]) name4 = (<name_array> [3]) name5 = (<name_array> [4])}
	setglobaltags <songname> params = {stars1 = (<stars_array> [0]) stars2 = (<stars_array> [1]) stars3 = (<stars_array> [2]) stars4 = (<stars_array> [3]) stars5 = (<stars_array> [4])}
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		change \{new_band_name = [
				"A"
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
			]}
		change \{default_band_indexes = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]}
		change \{new_band_index = 0}
		change \{tr_first_time_initialised = 1}
	endif
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	event_handlers = [
		{pad_up menu_tr_change_character params = {up score_index = (<score_index>)}}
		{pad_down menu_tr_change_character params = {down score_index = (<score_index>)}}
		{pad_choose menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_back menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_start menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
	]
	exclusive_device = $primary_controller
	formattext checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	setscreenelementprops id = <score_name_id> event_handlers = <event_handlers> exclusive_device = <exclusive_device> replace_handlers
	launchevent type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	formattext textname = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf "Score index is %d" d = <score_index>
	formattext checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	setscreenelementprops id = <score_name_id> text = (<band_name_text_string>)
	getscreenelementdims id = <score_name_id>
	if (<width> >= 200)
		getscreenelementprops id = <score_name_id>
		setscreenelementprops id = <score_name_id> scale = 1
		fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) pos = <pos>
		if gotparam \{add_2_width}
			change g_tr_went_past_max_width = ($g_tr_went_past_max_width + 1)
		endif
	endif
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	stringremovetrailingwhitespace string = <band_name_text_string>
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	switch (<score_index> + 1)
		case 1
		setglobaltags <songname> params = {name1 = <new_string>}
		case 2
		setglobaltags <songname> params = {name2 = <new_string>}
		case 3
		setglobaltags <songname> params = {name3 = <new_string>}
		case 4
		setglobaltags <songname> params = {name4 = <new_string>}
		case 5
		setglobaltags <songname> params = {name5 = <new_string>}
	endswitch
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tr_change_character_up 
	generic_menu_up_or_down_sound \{up}
	setarrayelement arrayname = default_band_indexes globalarray index = $new_band_index newvalue = ($default_band_indexes [$new_band_index] + 1)
	getarraysize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_size> -1))
		setarrayelement \{arrayname = default_band_indexes
			globalarray
			index = $new_band_index
			newvalue = 0}
	endif
	setarrayelement arrayname = new_band_name globalarray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	generic_menu_up_or_down_sound \{down}
	setarrayelement arrayname = default_band_indexes globalarray index = $new_band_index newvalue = ($default_band_indexes [$new_band_index] -1)
	getarraysize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		setarrayelement arrayname = default_band_indexes globalarray index = $new_band_index newvalue = (<array_size> -1)
	endif
	setarrayelement arrayname = new_band_name globalarray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		soundevent \{event = ui_sfx_select}
		change new_band_index = ($new_band_index + 1)
		setarrayelement arrayname = new_band_name globalarray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		soundevent \{event = generic_menu_back_sfx}
		setarrayelement arrayname = default_band_indexes globalarray index = ($new_band_index) newvalue = 0
		change new_band_index = ($new_band_index -1)
		setarrayelement arrayname = new_band_name globalarray index = ($new_band_index + 1) newvalue = ""
		if ($g_tr_went_past_max_width > 0)
			change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			formattext checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				setscreenelementprops id = <score_name_id> scale = (0.6, 0.8)
			else
				getscreenelementprops id = <score_name_id>
				setscreenelementprops id = <score_name_id> scale = 1
				fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) pos = <pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if isguitarcontroller controller = <device_num>
		if gotparam \{up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if gotparam \{up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript
