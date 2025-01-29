tr_max_band_characters = 11
num_top_scores = 3
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	Change menu_flow_locked = ($menu_flow_locked + 1)
	disable_pause
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_tr_page
		Type = descinterface
		desc = 'top_rockers'
		exclusive_device = <exclusive_device>
	}
	new_score = -1
	if (<for_options> = 0)
		if NOT ($game_mode = p2_faceoff || $game_mode = p1_career || $game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p2_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p6_pro_faceoff_no_mics || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
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
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script destroy_top_rockers_menu 
	if songispreviewplaying
		songstoppreview
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
	0x4bc2badb
	DestroyScreenElement \{id = my_tr_page}
	0x4bc2badb
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script menu_top_rockers_get_top_rocker_data \{for_options = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		player_num = 1
	endif
	if (<player_num> < 1)
		player_num = 1
	endif
	if (<player_num> > 4)
		player_num = 1
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		get_band_difficulty
		<difficulty> = <band_difficulty>
	else
		getplayerinfo <player_num> difficulty
	endif
	get_difficulty_text_nl difficulty = <difficulty>
	get_song_prefix song = ($track_last_song)
	get_song_title song = ($track_last_song)
	if isSinglePlayerGame
		getplayerinfo <player_num> part
	else
		part = Band
	endif
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	GetGlobalTags <songname>
	get_difficulty_text difficulty = <difficulty>
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	if (<for_options> = 0)
		if isSinglePlayerGame
			getscorefromdetailedstats Player = <player_num>
			getstarsfromdetailedstats Player = <player_num>
			getplayerinfo <player_num> part
		else
			part = Band
			score = ($gig_detailed_stats_band.score)
			stars = ($gig_detailed_stats_band.stars)
		endif
	endif
	return <...>
endscript

script menu_top_rockers_create_paper 
	menu_top_rockers_get_top_rocker_data for_options = <for_options>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 30
	if (<array_Size> >= <max_characters>)
		new_song_text = qs(0x03ac90f0)
		char_index = 0
		begin
		0x4bc2badb
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_Size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = qs(0x713755f7))

				break
			endif
		endif
		repeat
		<song_title> = (<new_song_text> + qs(0xb723938a))
		<max_width> = 270
	endif
	formatText TextName = my_song_text qs(0x48c6d14c) d = <song_title>
	my_tr_page :se_setprops song_title_text_text = <my_song_text>
	formatText TextName = my_diff_text qs(0x48c6d14c) d = <difficulty_text>
	my_tr_page :se_setprops difficulty_text_text = <my_diff_text>
	my_diff_texture = icon_difficulty_beginner
	switch <difficulty>
		case easy_rhythm
		my_diff_texture = icon_difficulty_beginner
		case easy
		my_diff_texture = icon_difficulty_easy
		case medium
		my_diff_texture = icon_difficulty_medium
		case hard
		my_diff_texture = icon_difficulty_hard
		case expert
		my_diff_texture = icon_difficulty_expert
	endswitch
	my_tr_page :se_setprops icon_difficulty_texture = <my_diff_texture> icon_difficulty_texture2 = <my_diff_texture>
	if my_tr_page :desc_resolvealias \{Name = alias_top_rockers_desc_menu}
	else

	endif
	GetScreenElementChildren id = <resolved_id>
	entry_idx = 0
	begin
	0x4bc2badb
	formatText TextName = song_score_text qs(0x73307931) s = (<scores> [<entry_idx>]) usecommas
	formatText TextName = score_name_text qs(0x73307931) s = (<names> [<entry_idx>])
	formatText checksumName = score_name_id 'score_name%d' d = (<entry_idx> + 1)
	SetScreenElementProps {
		id = (<children> [<entry_idx>])
		score_text = <song_score_text>
		name_text = <score_name_text>
	}
	AssignAlias id = (<children> [<entry_idx>]) alias = <score_name_id>
	<entry_idx> = (<entry_idx> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	get_all_exclusive_devices
	CreateScreenElement {
		Type = TextElement
		parent = root_window
		id = continue_button
		Scale = 0.9
		Pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement \{Type = TextElement
		parent = continue_button
		id = continue_text
		Scale = 0.8
		Pos = (40.0, 23.0)
		font = fontgrid_text_a8
		rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			center
		]
		z_priority = 4
		event_handlers = [
			{
				pad_back
				0x8137e9a8
			}
		]}
	LaunchEvent \{Type = focus
		target = continue_text}
endscript

script 0x8137e9a8 
	Change \{target_setlist_songpreview = None}
	generic_event_back
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> > 0)
		getplayerinfo <player_num> part
		count_players_by_part \{part = drum}
		if (<players_by_part> > 0)
			if (<part> = drum)
				if ($cheat_autokick = 1 || $cheat_freedrum = 1)
					return \{new_score = -1
						newbestscore = 0}
				endif
			endif
		endif
	endif
	RemoveParameter \{part}
	nowrite_full = 0
	count_players_by_part \{part = guitar}
	gtrs_cnt = <players_by_part>
	count_players_by_part \{part = bass}
	gtrs_cnt = (<players_by_part> + <gtrs_cnt>)
	if (<gtrs_cnt> > 0)
		if ($cheat_alwaysslide = 1)
			return \{new_score = -1
				newbestscore = 0}
		endif
	endif
	newbestscore = 0
	player_score = 0
	player_stars = 0
	menu_top_rockers_get_top_rocker_data
	player_stars = <stars>
	player_score = <score>
	CastToInteger \{player_score}
	score_array = [0 0 0]
	name_array = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
	stars_array = [0 0 0]
	score_index = 0
	begin
	SetArrayElement ArrayName = score_array index = <score_index> NewValue = (<scores> [<score_index>])
	SetArrayElement ArrayName = name_array index = <score_index> NewValue = (<names> [<score_index>])
	SetArrayElement ArrayName = stars_array index = <score_index> NewValue = (<tr_stars> [<score_index>])
	0x4bc2badb
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
				SetArrayElement ArrayName = score_array index = (<score_shift_index> + 1) NewValue = (<score_array> [<score_shift_index>])
				SetArrayElement ArrayName = name_array index = (<score_shift_index> + 1) NewValue = (<name_array> [<score_shift_index>])
				SetArrayElement ArrayName = stars_array index = (<score_shift_index> + 1) NewValue = (<stars_array> [<score_shift_index>])
				0x4bc2badb
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			SetArrayElement ArrayName = score_array index = <score_index> NewValue = <player_score>
			SetArrayElement ArrayName = stars_array index = <score_index> NewValue = <player_stars>
		endif
		break
	endif
	0x4bc2badb
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		if (<nowrite_full> = 0)
			SetGlobalTags <songname> params = {bestscore = <bestscore>}
			SetGlobalTags <songname> params = {beststars = <beststars>}
			getplayerinfo <player_num> part
			getplayerinfo <player_num> double_kick_drum
			if ($current_song != jamsession)
				0x8dbdaee4 \{qs(0xf8a89caf)}
				if ($permanent_songlist_props.($current_song).double_kick = 1 && <part> = drum && <double_kick_drum> = 1)
					SetGlobalTags <songname> params = {double_bass_complete = 1}
				endif
			endif
		endif
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = <newbestscore>
	endif
	if (<score_index> > -1 && <score_index> < $num_top_scores)
		get_current_band_info
		GetGlobalTags <band_info>
		my_tr_bandname = <Name>
		shortenuistring {
			ui_string = <my_tr_bandname>
			max_len = 8
		}
		my_tr_bandname = <short_ui_string>
		SetArrayElement ArrayName = name_array index = <score_index> NewValue = <my_tr_bandname>
	endif
	if (<nowrite_full> = 0)
		SetGlobalTags <songname> params = {scores = <score_array>}
		SetGlobalTags <songname> params = {names = <name_array>}
		SetGlobalTags <songname> params = {tr_stars = <stars_array>}
	endif
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		Change \{new_band_name = [
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
		Change \{default_band_indexes = [
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
		Change \{new_band_index = 0}
		Change \{tr_first_time_initialised = 1}
	endif
	SetScreenElementProps \{id = root_window
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
	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	SetScreenElementProps id = <score_name_id> event_handlers = <event_handlers> replace_handlers
	LaunchEvent Type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	formatText TextName = band_name_text_string qs(0xb1608115) a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}

	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> name_text = (<band_name_text_string>)
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	SoundEvent \{event = enter_band_name_finish}
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	menu_top_rockers_get_top_rocker_data
	SetArrayElement ArrayName = names index = <score_index> NewValue = <new_string>
	SetGlobalTags <songname> params = {names = <names>}
	generic_event_back
endscript

script menu_tr_change_character_up 
	SoundEvent \{event = enter_band_name_scroll_up}
	SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] + 1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_Size> -1))
		SetArrayElement \{ArrayName = default_band_indexes
			globalarray
			index = $new_band_index
			NewValue = 0}
	endif
	SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	SoundEvent \{event = enter_band_name_scroll_down}
	SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] -1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = (<array_Size> -1)
	endif
	SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		SoundEvent \{event = enter_band_name_select}
		Change new_band_index = ($new_band_index + 1)
		SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		SoundEvent \{event = enter_band_name_back}
		SetArrayElement ArrayName = default_band_indexes globalarray index = ($new_band_index) NewValue = 0
		Change new_band_index = ($new_band_index -1)
		SetArrayElement ArrayName = new_band_name globalarray index = ($new_band_index + 1) NewValue = qs(0x03ac90f0)
		if ($g_tr_went_past_max_width > 0)
			Change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				SetScreenElementProps id = <score_name_id> Scale = (0.6, 0.8)
			else
				GetScreenElementProps id = <score_name_id>
				SetScreenElementProps id = <score_name_id> Scale = 1
				fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) Pos = <Pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if IsGuitarController controller = <device_num>
		if GotParam \{up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if GotParam \{up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript
