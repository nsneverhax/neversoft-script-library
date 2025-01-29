tr_max_band_characters = 13
num_top_scores = 3
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	disable_pause
	get_all_exclusive_devices
	createscreenelement {
		parent = root_window
		id = my_tr_page
		type = descinterface
		desc = 'top_rockers'
		exclusive_device = <exclusive_device>
	}
	new_score = -1
	if (<for_options> = 0)
		if NOT ($game_mode = p2_faceoff || $game_mode = p1_career || $game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p2_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			spawnscript \{menu_music_on}
		endif
		menu_top_rockers_check_for_new_top_score
	endif
	menu_top_rockers_create_paper for_options = <for_options>
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x2a08d9a6)
			button = yellow
			z = 100}
		add_user_control_helper \{text = qs(0x1c2cd639)
			button = blue
			z = 100}
	else
		menu_top_rockers_create_continue_button for_options = <for_options>
		if should_use_all_buttons
			all_button_params = {all_buttons}
		endif
		add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100
	endif
endscript

script destroy_top_rockers_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroyscreenelement \{id = my_tr_page}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script menu_top_rockers_get_top_rocker_data \{for_options = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		player_num = 1
	endif
	getplayerinfo <player_num> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	get_song_prefix song = ($track_last_song)
	get_song_title song = ($track_last_song)
	if issingleplayergame
		getplayerinfo <player_num> part
	else
		part = band
	endif
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	getglobaltags <songname>
	get_difficulty_text difficulty = <difficulty>
	getuppercasestring <song_title>
	song_title = <uppercasestring>
	getuppercasestring <difficulty_text>
	difficulty_text = <uppercasestring>
	if (<for_options> = 0)
		if issingleplayergame
			getscorefromdetailedstats player = <player_num>
			getstarsfromdetailedstats player = <player_num>
			getplayerinfo <player_num> part
		else
			part = band
			score = ($gig_detailed_stats_band.score)
			stars = ($gig_detailed_stats_band.stars)
		endif
	endif
	return <...>
endscript

script menu_top_rockers_create_paper 
	menu_top_rockers_get_top_rocker_data for_options = <for_options>
	stringtochararray string = <song_title>
	getarraysize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_size> >= <max_characters>)
		new_song_text = qs(0x03ac90f0)
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = qs(0x713755f7))
				printf \{qs(0x45c414aa)}
				break
			endif
		endif
		repeat
		<song_title> = (<new_song_text> + qs(0xb723938a))
		<max_width> = 270
	endif
	formattext textname = my_song_text qs(0x48c6d14c) d = <song_title>
	my_tr_page :se_setprops song_title_text_text = <my_song_text>
	formattext textname = my_diff_text qs(0x48c6d14c) d = <difficulty_text>
	my_tr_page :se_setprops difficulty_text_text = <my_diff_text>
	my_diff_texture = icon_diff_outline_01
	switch <difficulty>
		case easy_rhythm
		my_diff_texture = icon_diff_outline_01
		case easy
		my_diff_texture = icon_diff_outline_02
		case medium
		my_diff_texture = icon_diff_outline_03
		case hard
		my_diff_texture = icon_diff_outline_04
		case expert
		my_diff_texture = icon_diff_outline_05
	endswitch
	my_tr_page :se_setprops icon_difficulty_texture = <my_diff_texture> icon_difficulty_texture2 = <my_diff_texture>
	if my_tr_page :desc_resolvealias \{name = alias_top_rockers_desc_menu}
	else
		scriptassert \{qs(0x2870b673)}
	endif
	getscreenelementchildren id = <resolved_id>
	entry_idx = 0
	begin
	formattext textname = song_score_text qs(0x73307931) s = (<scores> [<entry_idx>]) usecommas
	formattext textname = score_name_text qs(0x73307931) s = (<names> [<entry_idx>])
	formattext checksumname = score_name_id 'score_name%d' d = (<entry_idx> + 1)
	setscreenelementprops {
		id = (<children> [<entry_idx>])
		score_text = <song_score_text>
		name_text = <score_name_text>
	}
	assignalias id = (<children> [<entry_idx>]) alias = <score_name_id>
	<entry_idx> = (<entry_idx> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	callback = {generic_event_back}
	get_all_exclusive_devices
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
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = textelement
		parent = continue_button
		id = continue_text
		scale = 0.8
		pos = (40.0, 23.0)
		font = fontgrid_text_a8
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_back <callback>}
		]
	}
	launchevent \{type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> > 0)
		getplayerinfo <player_num> part
		if (<part> = drum)
			if ($cheat_autokick = 1)
				return \{new_score = -1
					newbestscore = 0}
			endif
		endif
	endif
	removeparameter \{part}
	nowrite_full = 0
	if ($cheat_alwaysslide = 1)
		<nowrite> = 1
		<nowrite_full> = 1
	endif
	newbestscore = 0
	player_score = 0
	player_stars = 0
	menu_top_rockers_get_top_rocker_data
	player_stars = <stars>
	player_score = <score>
	casttointeger \{player_score}
	score_array = [0 0 0]
	name_array = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
	stars_array = [0 0 0]
	score_index = 0
	begin
	setarrayelement arrayname = score_array index = <score_index> newvalue = (<scores> [<score_index>])
	setarrayelement arrayname = name_array index = <score_index> newvalue = (<names> [<score_index>])
	setarrayelement arrayname = stars_array index = <score_index> newvalue = (<tr_stars> [<score_index>])
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
		if (<nowrite_full> = 0)
			setglobaltags <songname> params = {bestscore = <bestscore>}
			setglobaltags <songname> params = {beststars = <beststars>}
		endif
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = <newbestscore>
	endif
	if (<score_index> > -1 && <score_index> < $num_top_scores)
		get_current_band_info
		getglobaltags <band_info>
		my_tr_bandname = <name>
		shortenuistring {
			ui_string = <my_tr_bandname>
			max_len = 9
		}
		my_tr_bandname = <short_ui_string>
		setarrayelement arrayname = name_array index = <score_index> newvalue = <my_tr_bandname>
	endif
	if (<nowrite_full> = 0)
		setglobaltags <songname> params = {scores = <score_array>}
		setglobaltags <songname> params = {names = <name_array>}
		setglobaltags <songname> params = {tr_stars = <stars_array>}
	endif
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		change \{new_band_name = [
				qs(0x0dd10f11)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
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
		{pad_option2 menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_option menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_choose menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
	]
	formattext checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	setscreenelementprops id = <score_name_id> event_handlers = <event_handlers> replace_handlers
	launchevent type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	formattext textname = band_name_text_string qs(0xb1608115) a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf qs(0xc3250a01) d = <score_index>
	formattext checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	setscreenelementprops id = <score_name_id> name_text = (<band_name_text_string>)
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	soundevent \{event = enter_band_name_finish}
	stringremovetrailingwhitespace string = <band_name_text_string>
	menu_top_rockers_get_top_rocker_data
	setarrayelement arrayname = names index = <score_index> newvalue = <new_string>
	setglobaltags <songname> params = {names = <names>}
	generic_event_back
endscript

script menu_tr_change_character_up 
	soundevent \{event = enter_band_name_scroll_up}
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
	soundevent \{event = enter_band_name_scroll_down}
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
		soundevent \{event = enter_band_name_select}
		change new_band_index = ($new_band_index + 1)
		setarrayelement arrayname = new_band_name globalarray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		soundevent \{event = enter_band_name_back}
		setarrayelement arrayname = default_band_indexes globalarray index = ($new_band_index) newvalue = 0
		change new_band_index = ($new_band_index -1)
		setarrayelement arrayname = new_band_name globalarray index = ($new_band_index + 1) newvalue = qs(0x03ac90f0)
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
