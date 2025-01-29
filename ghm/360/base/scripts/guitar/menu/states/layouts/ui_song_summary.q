
script ui_init_song_summary 
	SpawnScriptNow \{kill_gem_scroller}
endscript

script ui_create_song_summary 
	set_focus_color
	set_unfocus_color
	my_events = [
		{pad_choose ui_song_summary_continue_next_screen params = {<...>}}
		{pad_back generic_event_choose params = {state = uistate_detailed_stats}}
	]
	gamemode_gettype
	if NOT ((<Type> = battle) || (<Type> = faceoff) || (<Type> = pro_faceoff))
		getplayerinfo \{1
			controller}
		if CheckForSignIn controller_index = <controller>
			my_events = [
				{pad_choose ui_song_summary_continue_next_screen params = {<...>}}
				{pad_back generic_event_choose params = {state = uistate_detailed_stats}}
				{pad_option2 ui_leaderboard_view_current_song}
			]
		endif
	endif
	switch ($current_num_players)
		case 1
		build_page_for_1p <...>
		case 2
		build_page_for_2p <...>
		case 3
		build_page_for_3p <...>
		case 4
		build_page_for_4p <...>
	endswitch
	gamemode_gettype
	printstruct channel = mychannel <...>
	if (<Type> = training)
		build_menu_for_practice_mode
	else
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0x3f11367e)
			button = red
			z = 100000}
		if NOT ((<Type> = battle) || (<Type> = faceoff) || (<Type> = pro_faceoff))
			if CheckForSignIn controller_index = <controller>
				add_user_control_helper \{text = qs(0x87251a1f)
					button = yellow
					z = 100000}
			endif
		endif
		AssignAlias \{id = summary_page_id
			alias = current_menu}
	endif
	if (<Type> = quickplay)
		if NOT GotParam \{failed_song}
			menu_top_rockers_check_for_new_top_score \{nowrite = 1}
		endif
	endif
endscript

script ui_destroy_song_summary 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = summary_page_id}
endscript

script my_get_player_data \{player_index = 1}
	getplayerinfo <player_index> part
	getplayerinfo <player_index> best_run
	getplayerinfo <player_index> score
	getplayerinfo <player_index> max_notes
	getplayerinfo <player_index> notes_hit
	getplayerinfo <player_index> stars
	if (<max_notes> = 0)
		max_notes = 1
	endif
	if (<stars> < 3)
		stars = 3
	endif
	switch <player_index>
		case 1
		get_difficulty_text_nl difficulty = ($player1_status.difficulty)
		case 2
		get_difficulty_text_nl difficulty = ($player2_status.difficulty)
		case 3
		get_difficulty_text_nl difficulty = ($player3_status.difficulty)
		case 4
		get_difficulty_text_nl difficulty = ($player4_status.difficulty)
	endswitch
	CastToInteger \{score}
	formatText TextName = player_text qs(0x5c5cedaa) p = <player_index>
	formatText TextName = score_text qs(0x4d4555da) s = <score> DecimalPlaces = 0 usecommas
	formatText TextName = difficulty_text qs(0x48c6d14c) d = <difficulty_text_nl>
	formatText TextName = percent_text qs(0x49412198) p = (((<notes_hit> * 1.0) / <max_notes>) * 100.0) DecimalPlaces = 0
	formatText TextName = streak_text qs(0xb22939c6) n = <best_run> DecimalPlaces = 0
	switch (<part>)
		case guitar
		icon_texture = guitar_stat
		case bass
		icon_texture = bass_stat
		case drum
		icon_texture = drum_stat
		case vocals
		icon_texture = vocal_stat
	endswitch
	return <...>
endscript

script build_page_for_1p 
	CreateScreenElement {
		parent = root_window
		id = summary_page_id
		Type = descinterface
		desc = 'song_summary_1p'
		event_handlers = <my_events>
	}
	if summary_page_id :desc_resolvealias \{Name = alias_song_summary_1p_collumn}
	else
		ScriptAssert \{qs(0x471a8e40)}
	endif
	my_get_player_data
	SetScreenElementProps {
		id = <resolved_id>
		name_text = <player_text>
		score_number_value_text = <score_text>
		note_streak_value_text = <streak_text>
		notes_hit_value_text = <percent_text>
		title_text = <difficulty_text>
		song_summary_star_empty01_texture = song_summary_star_full
		song_summary_star_empty02_texture = song_summary_star_full
		song_summary_star_empty03_texture = song_summary_star_full
	}
	if (<stars> > 3)
		SetScreenElementProps {
			id = <resolved_id>
			song_summary_star_empty04_texture = song_summary_star_full
		}
	endif
	if (<stars> > 4)
		SetScreenElementProps {
			id = <resolved_id>
			song_summary_star_empty05_texture = song_summary_star_full
		}
	endif
endscript

script build_page_for_2p 
	CreateScreenElement {
		parent = root_window
		id = summary_page_id
		Type = descinterface
		desc = 'song_summary_2p'
		event_handlers = <my_events>
	}
	summary_page_id :desc_resolvealias \{Name = alias_collumns_container}
	col_container_id = <resolved_id>
	GetScreenElementChildren id = <col_container_id>
	col_cont_children = <children>
	i = 1
	begin
	my_get_player_data player_index = <i>
	SetScreenElementProps {
		id = (<col_cont_children> [(<i> -1)])
		name_text = <player_text>
		title_text = <difficulty_text>
		score_number_value_text = <score_text>
		note_streak_value_text = <streak_text>
		notes_hit_value_text = <percent_text>
		instrument_texture = <icon_texture>
		song_summary_star_empty01_texture = song_summary_star_full
		song_summary_star_empty02_texture = song_summary_star_full
		song_summary_star_empty03_texture = song_summary_star_full
	}
	if (<stars> > 3)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty04_texture = song_summary_star_full
		}
	endif
	if (<stars> > 4)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty05_texture = song_summary_star_full
		}
	endif
	i = (<i> + 1)
	repeat 2
endscript

script build_page_for_3p 
	CreateScreenElement {
		parent = root_window
		id = summary_page_id
		Type = descinterface
		desc = 'song_summary_3p'
		event_handlers = <my_events>
	}
	summary_page_id :desc_resolvealias \{Name = alias_collumn_container}
	col_container_id = <resolved_id>
	GetScreenElementChildren id = <col_container_id>
	col_cont_children = <children>
	i = 1
	begin
	my_get_player_data player_index = <i>
	SetScreenElementProps {
		id = (<col_cont_children> [(<i> -1)])
		name_text = <player_text>
		title_text = <difficulty_text>
		score_number_value_text = <score_text>
		note_streak_value_text = <streak_text>
		notes_hit_value_text = <percent_text>
		instrument_texture = <icon_texture>
		song_summary_star_empty01_texture = song_summary_star_full
		song_summary_star_empty02_texture = song_summary_star_full
		song_summary_star_empty03_texture = song_summary_star_full
	}
	if (<stars> > 3)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty04_texture = song_summary_star_full
		}
	endif
	if (<stars> > 4)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty05_texture = song_summary_star_full
		}
	endif
	i = (<i> + 1)
	repeat 3
endscript

script build_page_for_4p 
	CreateScreenElement {
		parent = root_window
		id = summary_page_id
		Type = descinterface
		desc = 'song_summary_4p'
		event_handlers = <my_events>
	}
	summary_page_id :desc_resolvealias \{Name = alias_collumn_container}
	col_container_id = <resolved_id>
	GetScreenElementChildren id = <col_container_id>
	col_cont_children = <children>
	i = 1
	begin
	my_get_player_data player_index = <i>
	SetScreenElementProps {
		id = (<col_cont_children> [(<i> -1)])
		name_text = <player_text>
		title_text = <difficulty_text>
		score_number_value_text = <score_text>
		note_streak_value_text = <streak_text>
		notes_hit_value_text = <percent_text>
		song_summary_star_empty01_texture = song_summary_star_full
		song_summary_star_empty02_texture = song_summary_star_full
		song_summary_star_empty03_texture = song_summary_star_full
		instrument_texture = <icon_texture>
	}
	if (<stars> > 3)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty04_texture = song_summary_star_full
		}
	endif
	if (<stars> > 4)
		SetScreenElementProps {
			id = (<col_cont_children> [(<i> -1)])
			song_summary_star_empty05_texture = song_summary_star_full
		}
	endif
	i = (<i> + 1)
	repeat 4
endscript

script ui_song_summary_continue_next_screen 
	printf \{channel = mychannel
		'made it to my continue'}
	printstruct channel = mychannel <...>
	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	sponsored = ($progression_got_sponsored_last_song)
	gamemode_gettype
	if (<Type> = career)
	endif
	if (<Type> = training)
		ui_win_song_continue_next_menu
	elseif (<sponsored> = true)
		generic_event_choose \{state = uistate_sponsor_new}
	elseif (<array_Size> > 0)
		generic_event_choose \{state = uistate_rewards}
	elseif progression_anyplayerwoncash
		generic_event_choose \{state = uistate_cash_rewards_3}
	else
		ui_win_song_continue_next_menu
	endif
endscript

script build_menu_for_practice_mode 
	disable_pause
	if summary_page_id :desc_resolvealias \{Name = alias_my_menu}
	else
		ScriptAssert \{qs(0x293d0971)}
	endif
	continue_script = song_summary_continue_practice_mode
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0x5e743602)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_song_summary_continue_next_screen params = {for_practice = 1}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0xcbd10828)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_detailed_stats}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0x0c711699)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_restart_song}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0x4a1f8323)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0x07b66aa5)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_back params = {state = uistate_select_song_section}}
		]
	}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :obj_spawnscript \{menu_music_on}
endscript
