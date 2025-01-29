tr_max_band_characters = 3
num_top_scores = 3
g_tr_went_past_max_width = 0

script create_top_rockers_menu for_options = 0 write_scores = 0 toprockerssong = ($last_song_played)
	disable_pause
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_tr_page
		type = DescInterface
		desc = 'top_rockers'
		exclusive_device = <exclusive_device>
	}
	if <id> :Desc_ResolveAlias name = alias_bling_anim
		<resolved_id> :Obj_SpawnScript anim_bling_box
	endif
	if <id> :Desc_ResolveAlias name = alias_skull_frame_512
		<resolved_id> :Obj_SpawnScript ui_blink
	endif
	if <id> :Desc_ResolveAlias name = alias_skull_frame_reflect
		<resolved_id> :Obj_SpawnScript ui_blink
	endif
	if <id> :Desc_ResolveAlias name = alias_message
		<resolved_id> :Obj_SpawnScript ui_frazzmatazz_03
	endif
	if <id> :Desc_ResolveAlias name = alias_bkg_anim
		<resolved_id> :Obj_SpawnScript ui_alphablast
	endif
	if <id> :Desc_ResolveAlias name = alias_particles
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 0.5 float_time = 10 start_dims = (30.0, 30.0)}
	endif
	if <id> :Desc_ResolveAlias name = alias_particles
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1.0 float_time = 10 start_dims = (30.0, 30.0) Color = [200 80 255 150]}
	endif
	new_score = -1
	if (<write_scores> = 1)
		if NOT ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = gh4_p3_career || $game_mode = gh4_p4_career || $game_mode = p2_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p6_pro_faceoff_no_mics || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			SpawnScript \{menu_music_on}
		endif
		menu_top_rockers_check_for_new_top_score \{write_scores = 1}
	endif
	menu_top_rockers_create_paper for_options = <for_options> toprockerssong = <toprockerssong>
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc224796c)
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
		return \{false}
	endif
	if (<compare> = expert)
		return \{true}
	endif
	if (<against> = hard)
		return \{false}
	endif
	if (<compare> = hard)
		return \{true}
	endif
	if (<against> = medium)
		return \{false}
	endif
	if (<compare> = medium)
		return \{true}
	endif
	if (<against> = easy)
		return \{false}
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
	return \{false}
endscript

script get_highest_difficulty 
	highest_difficulty = beginner
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		if difficulty_is_higher compare = <difficulty> against = <highest_difficulty>
			highest_difficulty = <difficulty>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return highest_difficulty = <highest_difficulty>
endscript

script get_percent_notes_hit_for_band 
	cumulative_percent_hit = 0
	num_members = 0
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> Band out = this_band
		if (<Band> = <this_band>)
			if PlayerInfoEquals <player> part = vocals
				GetPlayerInfo <player> vocal_phrase_quality
				GetPlayerInfo <player> vocal_phrase_max_qual
				notes_hit = <vocal_phrase_quality>
				max_notes = <vocal_phrase_max_qual>
			else
				GetPlayerInfo <player> notes_hit
				GetPlayerInfo <player> max_notes
			endif
			if (<max_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
				if (<percent_notes_hit> = 0 && <notes_hit> > 0)
					<percent_notes_hit> = 1
				endif
				cumulative_percent_hit = (<cumulative_percent_hit> + <percent_notes_hit>)
				num_members = (<num_members> + 1)
			endif
		endif
		GetNextPlayer on_screen player = <player>
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
		GetFirstPlayer \{in_game
			local}
		player_num = <player>
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
	GetNumPlayersInGame
	if (<for_options> = 1)
		switch ($current_leaderboard_instrument)
			case 'guitar'
			part = guitar
			case 'backup'
			part = bass
			case 'drums'
			part = Drum
			case 'mic'
			part = vocals
			case 'band'
			case 'altband'
			part = Band
		endswitch
	else
		if (<num_players> = 1)
			GetPlayerInfo <player_num> part
		else
			part = Band
		endif
	endif
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	if is_song_debug name = <toprockerssong>
		return {
			<...>
			tr_names = [qs(0x00000000) qs(0x00000000) qs(0x00000000)]
			($default_topscores [0])
			($default_songtags_global)
			($default_songtags_tr)
			write_scores = 0
		}
	endif
	GetGlobalTags <songname>
	get_difficulty_text difficulty = <highest_difficulty>
	GetUpperCaseString <song_title>
	song_title = <UpperCaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UpperCaseString>
	if (<for_options> = 0)
		if (<num_players> = 1)
			getScoreFromDetailedStats player = <player_num>
			getStarsFromDetailedStats player = <player_num>
			percent_notes_hit = 0
			if (<part> = vocals)
				getVocalPhraseMaxQualFromDetailedStats player = <player_num>
				getVocalPhraseQualityFromDetailedStats player = <player_num>
				if (<vocal_phrase_max_qual> > 0)
					percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
					mathFloor <percent_notes_hit>
					<percent_notes_hit> = <floor>
					if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
						<percent_notes_hit> = 1
					endif
				endif
			else
				getMaxNotesFromDetailedStats player = <player_num>
				getNotesHitFromDetailedStats player = <player_num>
				<percent_notes_hit> = 0
				if GotParam \{max_notes}
					if (<max_notes> > 0)
						<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
					endif
				endif
			endif
		else
			GetPlayerInfo <player_num> Band
			score = ($song_stats_backup_band [(<Band> - 1)].score)
			STARS = ($song_stats_backup_band [(<Band> - 1)].STARS)
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
	FormatText TextName = my_song_text qs(0x48c6d14c) d = <song_title>
	my_tr_page :SE_SetProps song_title_text_text = <my_song_text>
	FormatText TextName = my_diff_text qs(0x48c6d14c) d = <difficulty_text>
	my_tr_page :SE_SetProps difficulty_text_text = <my_diff_text>
	FormatText checksumname = my_diff_texture 'icon_difficulty_%s' s = <difficulty_text_nl>
	my_tr_page :SE_SetProps icon_difficulty_texture = <my_diff_texture> icon_difficulty_texture2 = <my_diff_texture>
	if my_tr_page :Desc_ResolveAlias \{name = alias_top_rockers_desc_menu}
	else
		ScriptAssert \{qs(0x2870b673)}
	endif
	GetScreenElementChildren id = <resolved_id>
	entry_idx = 0
	begin
	FormatText TextName = song_score_text qs(0x73307931) s = (<tr_scores> [<entry_idx>]) UseCommas
	FormatText TextName = score_name_text qs(0x73307931) s = (<tr_names> [<entry_idx>])
	FormatText checksumname = score_name_id 'score_name%d' d = (<entry_idx> + 1)
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
		type = TextElement
		parent = root_window
		id = continue_button
		scale = 0.9
		Pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		type = TextElement
		parent = continue_button
		id = continue_text
		scale = 0.8
		Pos = (40.0, 23.0)
		font = fontgrid_text_A1
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_back <callback>}
		]
	}
	LaunchEvent \{type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{write_scores = 0
		auto_write_name = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	player_score = 0
	player_stars = 0
	menu_top_rockers_get_top_rocker_data
	player_stars = <STARS>
	player_score = <score>
	score_array = [0 0 0]
	name_array = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
	stars_array = [0 0 0]
	score_index = 0
	begin
	SetArrayElement arrayName = score_array index = <score_index> newValue = (<tr_scores> [<score_index>])
	SetArrayElement arrayName = name_array index = <score_index> newValue = (<tr_names> [<score_index>])
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
				SetArrayElement arrayName = score_array index = (<score_shift_index> + 1) newValue = (<score_array> [<score_shift_index>])
				SetArrayElement arrayName = name_array index = (<score_shift_index> + 1) newValue = (<name_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			SetArrayElement arrayName = score_array index = <score_index> newValue = <player_score>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if IsBandCheating
		new_score = -1
	else
		if (<write_scores> = 1)
			if (<auto_write_name> = 1)
				if (<new_score> > -1 && <new_score> < $num_top_scores)
					get_current_band_name savegame = <savegame>
					my_tr_bandname = <band_name>
					ShortenUIString {
						ui_string = <my_tr_bandname>
						max_len = 3
						no_periods
					}
					my_tr_bandname = <short_ui_string>
					SetArrayElement arrayName = name_array index = <new_score> newValue = <my_tr_bandname>
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
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> controller
		get_savegame_from_controller controller = <controller>
		GetGlobalTags <songname> savegame = <savegame>
		if (<setlist_bestscore> < <player_score>)
			printf 'New setlist best score for %p, score=%s' p = <player> s = <player_score>
			SetGlobalTags <songname> params = {setlist_bestscore = <player_score> setlist_beststars = <player_stars> setlist_bestpercentage = <player_percentage>} savegame = <savegame>
			new_hi = 1
		endif
		GetNextPlayer local player = <player>
		repeat <num_players>
	endif
	if GotParam \{new_hi}
		return \{true}
	endif
	return \{false}
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		GetGlobalTags \{user_options
			param = default_tr_name}
		SetArrayElement arrayName = new_band_name GlobalArray newValue = (<default_tr_name> [0]) index = 0
		SetArrayElement arrayName = new_band_name GlobalArray newValue = (<default_tr_name> [1]) index = 1
		SetArrayElement arrayName = new_band_name GlobalArray newValue = (<default_tr_name> [2]) index = 2
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
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	SetScreenElementProps id = <score_name_id> event_handlers = <event_handlers> replace_handlers
	LaunchEvent type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	FormatText TextName = band_name_text_string qs(0xb1608115) a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) H = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf qs(0xc3250a01) d = <score_index>
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> name_text = (<band_name_text_string>)
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	SoundEvent \{event = Enter_Band_Name_Finish}
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	menu_top_rockers_get_top_rocker_data
	globaltag_tr_name = [qs(0x00000000) qs(0x00000000) qs(0x00000000)]
	SetArrayElement arrayName = globaltag_tr_name index = 0 newValue = ($new_band_name [0])
	SetArrayElement arrayName = globaltag_tr_name index = 1 newValue = ($new_band_name [1])
	SetArrayElement arrayName = globaltag_tr_name index = 2 newValue = ($new_band_name [2])
	SetGlobalTags user_options params = {default_tr_name = <globaltag_tr_name>}
	SetArrayElement arrayName = tr_names index = <score_index> newValue = <new_string>
	SetGlobalTags <songname> params = {tr_names = <tr_names>}
	generic_event_back
endscript

script menu_tr_change_character_up 
	SoundEvent \{event = Enter_Band_Name_Scroll_Up}
	SetArrayElement arrayName = default_band_indexes GlobalArray index = $new_band_index newValue = ($default_band_indexes [$new_band_index] + 1)
	GetArraySize \{$default_tr_characters}
	if ($default_band_indexes [$new_band_index] > (<array_size> -1))
		SetArrayElement \{arrayName = default_band_indexes
			GlobalArray
			index = $new_band_index
			newValue = 0}
	endif
	SetArrayElement arrayName = new_band_name GlobalArray index = $new_band_index newValue = ($default_tr_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	SoundEvent \{event = Enter_Band_Name_Scroll_Down}
	SetArrayElement arrayName = default_band_indexes GlobalArray index = $new_band_index newValue = ($default_band_indexes [$new_band_index] -1)
	GetArraySize \{$default_tr_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		SetArrayElement arrayName = default_band_indexes GlobalArray index = $new_band_index newValue = (<array_size> -1)
	endif
	SetArrayElement arrayName = new_band_name GlobalArray index = $new_band_index newValue = ($default_tr_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		SoundEvent \{event = Enter_Band_Name_Select}
		Change new_band_index = ($new_band_index + 1)
		SetArrayElement arrayName = new_band_name GlobalArray index = $new_band_index newValue = ($default_tr_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	else
		SoundEvent \{event = UI_SFX_Negative_Select}
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		SoundEvent \{event = Enter_Band_Name_Back}
		SetArrayElement arrayName = default_band_indexes GlobalArray index = ($new_band_index) newValue = 0
		Change new_band_index = ($new_band_index -1)
		SetArrayElement arrayName = new_band_name GlobalArray index = ($new_band_index + 1) newValue = qs(0x03ac90f0)
		if ($g_tr_went_past_max_width > 0)
			Change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				SetScreenElementProps id = <score_name_id> scale = (0.6, 0.8)
			else
				GetScreenElementProps id = <score_name_id>
				SetScreenElementProps id = <score_name_id> scale = 1
				fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) Pos = <Pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if isguitarcontroller controller = <device_num>
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
