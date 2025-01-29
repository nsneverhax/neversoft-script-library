tr_max_band_characters = 3
num_top_scores = 3
g_tr_went_past_max_width = 0

script create_top_rockers_menu for_options = 0 write_scores = 0 toprockerssong = ($last_song_played)
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
	if (<write_scores> = 1)
		if NOT ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = gh4_p3_career || $game_mode = gh4_p4_career || $game_mode = p2_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p6_pro_faceoff_no_mics || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			spawnscript \{menu_music_on}
		endif
		menu_top_rockers_check_for_new_top_score \{write_scores = 1}
	endif
	menu_top_rockers_create_paper for_options = <for_options> toprockerssong = <toprockerssong>
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0x43f2255e)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xe3576d13)
			button = blue
			z = 100}
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = start
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
	DestroyScreenElement \{id = my_tr_page}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script difficulty_is_higher 
	RequireParams \{[
			compare
			against
		]
		all}
	if (<against> = expert)
		return \{FALSE}
	endif
	if (<compare> = expert)
		return \{true}
	endif
	if (<against> = hard)
		return \{FALSE}
	endif
	if (<compare> = hard)
		return \{true}
	endif
	if (<against> = medium)
		return \{FALSE}
	endif
	if (<compare> = medium)
		return \{true}
	endif
	if (<against> = easy)
		return \{FALSE}
	endif
	if (<compare> = easy)
		return \{true}
	endif
	if (<against> != <compare>)
		ScriptAssert 'Improper compare %a vs %b' a = <against> b = <compare>
	endif
	if (<against> != beginner)
		ScriptAssert 'Unknown difficulty %a' a = <against>
	endif
	return \{FALSE}
endscript

script get_highest_difficulty 
	highest_difficulty = beginner
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		if difficulty_is_higher compare = <difficulty> against = <highest_difficulty>
			highest_difficulty = <difficulty>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return highest_difficulty = <highest_difficulty>
endscript

script get_percent_notes_hit_for_band 
	cumulative_percent_hit = 0
	num_members = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> Band out = this_band
		if (<Band> = <this_band>)
			getplayerinfo <Player> notes_hit
			getplayerinfo <Player> max_notes
			if (<max_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
				if (<percent_notes_hit> = 0 && <notes_hit> > 0)
					<percent_notes_hit> = 1
				endif
				cumulative_percent_hit = (<cumulative_percent_hit> + <percent_notes_hit>)
				num_members = (<num_members> + 1)
			endif
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	percent_notes_hit = 0
	if (<num_members> > 0)
		percent_notes_hit = (<cumulative_percent_hit> / <num_members>)
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script menu_top_rockers_get_top_rocker_data \{for_options = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		getfirstplayer \{in_game
			local}
		player_num = <Player>
	endif
	if (<for_options> = 1)
		highest_difficulty = ($current_leaderboard_difficulty)
	else
		get_highest_difficulty
	endif
	get_difficulty_text_nl difficulty = <highest_difficulty>
	if NOT GotParam \{toprockerssong}
		toprockerssong = ($last_song_played)
	endif
	get_song_prefix song = <toprockerssong>
	get_song_title song = <toprockerssong>
	getnumplayersingame
	if (<for_options> = 1)
		switch ($current_leaderboard_instrument)
			case 'guitar'
			part = guitar
			case 'backup'
			part = bass
			case 'drums'
			part = drum
			case 'mic'
			part = vocals
			case 'band'
			case 'altband'
			part = Band
		endswitch
	else
		if (<num_players> = 1)
			getplayerinfo <player_num> part
		else
			part = Band
		endif
	endif
	setupdlcsongtag prefix = <song_prefix> savegame = 0
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	if StructureContains structure = ($debug_songlist_props) <toprockerssong>
		return
	endif
	GetGlobalTags <songname>
	get_difficulty_text difficulty = <highest_difficulty>
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	if (<for_options> = 0)
		if (<num_players> = 1)
			getscorefromdetailedstats Player = <player_num>
			getstarsfromdetailedstats Player = <player_num>
			percent_notes_hit = 0
			if (<part> = vocals)
				getvocalphrasemaxqualfromdetailedstats Player = <player_num>
				getvocalphrasequalityfromdetailedstats Player = <player_num>
				if (<vocal_phrase_max_qual> > 0)
					percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
					MathFloor <percent_notes_hit>
					<percent_notes_hit> = <floor>
					if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
						<percent_notes_hit> = 1
					endif
				endif
			else
				getmaxnotesfromdetailedstats Player = <player_num>
				getnoteshitfromdetailedstats Player = <player_num>
				if (<max_notes> > 0)
					<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
			endif
		else
			getplayerinfo <player_num> Band
			score = ($song_stats_backup_band [(<Band> - 1)].score)
			stars = ($song_stats_backup_band [(<Band> - 1)].stars)
			get_percent_notes_hit_for_band Band = <Band>
		endif
		CastToInteger \{percent_notes_hit}
		if (<percent_notes_hit> < 0)
			percent_notes_hit = 0
		endif
		if (<percent_notes_hit> > 100)
			percent_notes_hit = 100
		endif
		CastToInteger \{score}
	endif
	return <...>
endscript

script menu_top_rockers_create_paper 
	menu_top_rockers_get_top_rocker_data for_options = <for_options> toprockerssong = <toprockerssong>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_Size> >= <max_characters>)
		new_song_text = qs(0x03ac90f0)
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_Size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = qs(0x713755f7))
				printf \{qs(0x45c414aa)}
				break
			endif
		endif
		repeat
		if (<char_index> < <array_Size>)
			<song_title> = (<new_song_text> + qs(0xb723938a))
			<max_width> = 270
		endif
	endif
	formatText TextName = my_song_text qs(0x48c6d14c) d = <song_title>
	my_tr_page :se_setprops song_title_text_text = <my_song_text>
	formatText TextName = my_diff_text qs(0x48c6d14c) d = <difficulty_text>
	my_tr_page :se_setprops difficulty_text_text = <my_diff_text>
	formatText checksumName = my_diff_texture 'icon_difficulty_%s' s = <difficulty_text_nl>
	my_tr_page :se_setprops icon_difficulty_texture = <my_diff_texture> icon_difficulty_texture2 = <my_diff_texture>
	if my_tr_page :desc_resolvealias \{Name = alias_top_rockers_desc_menu}
	else
		ScriptAssert \{qs(0x2870b673)}
	endif
	GetScreenElementChildren id = <resolved_id>
	entry_idx = 0
	begin
	formatText TextName = song_score_text qs(0x73307931) s = (<tr_scores> [<entry_idx>]) usecommas
	formatText TextName = score_name_text qs(0x73307931) s = (<tr_names> [<entry_idx>])
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
	callback = {generic_event_back}
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
	CreateScreenElement {
		Type = TextElement
		parent = continue_button
		id = continue_text
		Scale = 0.8
		Pos = (40.0, 23.0)
		font = fontgrid_text_a1
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_back <callback>}
		]
	}
	LaunchEvent \{Type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{write_scores = 0
		auto_write_name = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	player_score = 0
	player_stars = 0
	menu_top_rockers_get_top_rocker_data
	player_stars = <stars>
	player_score = <score>
	score_array = [0 0 0]
	name_array = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
	stars_array = [0 0 0]
	score_index = 0
	begin
	SetArrayElement ArrayName = score_array index = <score_index> NewValue = (<tr_scores> [<score_index>])
	SetArrayElement ArrayName = name_array index = <score_index> NewValue = (<tr_names> [<score_index>])
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	<score_index> = 0
	new_score = -1
	begin
	if (<player_score> > (<score_array> [<score_index>]))
		<new_score> = <score_index>
		if (<write_scores> = 1)
			score_shift_index = ($num_top_scores - 2)
			if NOT (($num_top_scores - (<score_index> + 1)) = 0)
				begin
				SetArrayElement ArrayName = score_array index = (<score_shift_index> + 1) NewValue = (<score_array> [<score_shift_index>])
				SetArrayElement ArrayName = name_array index = (<score_shift_index> + 1) NewValue = (<name_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			SetArrayElement ArrayName = score_array index = <score_index> NewValue = <player_score>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if isbandcheating
		new_score = -1
	else
		if (<write_scores> = 1)
			if (<auto_write_name> = 1)
				if (<new_score> > -1 && <new_score> < $num_top_scores)
					get_current_band_name savegame = <savegame>
					my_tr_bandname = <band_name>
					shortenuistring {
						ui_string = <my_tr_bandname>
						max_len = 3
						no_periods
					}
					my_tr_bandname = <short_ui_string>
					SetArrayElement ArrayName = name_array index = <new_score> NewValue = <my_tr_bandname>
					printf 'Auto-wrote top rocker name %s' s = <my_tr_bandname>
				endif
			endif
			SetGlobalTags <songname> params = {tr_scores = <score_array>
				tr_names = <name_array>
			}
			printf \{'Wrote top rockers...'}
			printstruct {tr_scores = <score_array>
				tr_names = <name_array>
			}
		endif
	endif
	return new_score = <new_score>
endscript

script consider_setlist_score 
	RequireParams \{[
			player_score
			player_stars
			player_percentage
			songname
		]
		all}
	printscriptinfo \{'consider_setlist_score'}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		get_savegame_from_controller controller = <controller>
		GetGlobalTags <songname> savegame = <savegame>
		if (<setlist_bestscore> < <player_score>)
			printf 'New setlist best score for %p, score=%s' p = <Player> s = <player_score>
			SetGlobalTags <songname> params = {setlist_bestscore = <player_score> setlist_beststars = <player_stars> setlist_bestpercentage = <player_percentage>} savegame = <savegame>
			new_hi = 1
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
	if GotParam \{new_hi}
		return \{true}
	endif
	return \{FALSE}
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		GetGlobalTags \{user_options
			param = default_tr_name}
		SetArrayElement ArrayName = new_band_name globalarray NewValue = (<default_tr_name> [0]) index = 0
		SetArrayElement ArrayName = new_band_name globalarray NewValue = (<default_tr_name> [1]) index = 1
		SetArrayElement ArrayName = new_band_name globalarray NewValue = (<default_tr_name> [2]) index = 2
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
		{pad_option menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_choose menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_start menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
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
	printf qs(0xc3250a01) d = <score_index>
	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> name_text = (<band_name_text_string>)
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	SoundEvent \{event = enter_band_name_finish}
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	menu_top_rockers_get_top_rocker_data
	globaltag_tr_name = [qs(0x00000000) qs(0x00000000) qs(0x00000000)]
	SetArrayElement ArrayName = globaltag_tr_name index = 0 NewValue = ($new_band_name [0])
	SetArrayElement ArrayName = globaltag_tr_name index = 1 NewValue = ($new_band_name [1])
	SetArrayElement ArrayName = globaltag_tr_name index = 2 NewValue = ($new_band_name [2])
	SetGlobalTags user_options params = {default_tr_name = <globaltag_tr_name>}
	SetArrayElement ArrayName = tr_names index = <score_index> NewValue = <new_string>
	SetGlobalTags <songname> params = {tr_names = <tr_names>}
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
	else
		SoundEvent \{event = ui_sfx_negative_select}
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
