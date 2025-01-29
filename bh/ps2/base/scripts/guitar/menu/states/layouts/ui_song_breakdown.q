track_last_song = None
g_leader_player_num = -1
ui_song_breakdown_players_rdy = [
	0
	0
	0
	0
]
ui_song_breakdown_wrote_tr = 0
ui_song_breakdown_pulsate_helper_pill = 0
ui_song_breakdown_helper_params = {
}
0x0e45c8b7 = 0
g_song_breakdown_noncompetitive_stats_order = [
	{
		career_only = 0
		Name = accuracy
		title_text = qs(0x8795155b)
		caption_text = qs(0x7d221f06)
		use_unit_text = 1
		unit_text = qs(0x0c40a1b2)
	}
	{
		career_only = 0
		Name = score
		title_text = qs(0xfb40ab1c)
		caption_text = qs(0x01991b09)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		career_only = 0
		Name = streak
		title_text = qs(0x9a210119)
		caption_text = qs(0x9a210119)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		career_only = 0
		Name = multiplier
		title_text = qs(0x1ae60c3c)
		caption_text = qs(0xd250fe14)
		use_unit_text = 1
		unit_text = qs(0x96d1a609)
	}
]

script ui_init_song_breakdown 
	Change \{playing_song = 0}
	Change \{sb_trans_flag = 0}
	gamemode_gettype
	if (<Type> = practice)
		SpawnScriptNow \{kill_gem_scroller}
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'select_song_section'
			}}
		return
	endif
	0xc1c4e84c \{mode = 0x07071941}
	if NOT (<Type> = career || <Type> = quickplay)
		ui_gig_cash_clear_gig_earnings
	endif
	Change \{ui_song_breakdown_wrote_tr = 0}
	if ($is_network_game = 1)
		0xd475ac09
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
	if (<Type> = quickplay)
		if ($track_last_song != jamsession)
			menu_top_rockers_check_for_new_top_score \{nowrite = 1}
			if (<new_score> != -1)
				Change \{ui_song_breakdown_pulsate_helper_pill = 1}
			endif
		endif
	endif
endscript

script ui_create_song_breakdown 
	Change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		Change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	Change \{song_breakdown_busy_flag = 1}
	ui_song_breakdown_clear_ready_up_book_keeping
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		DestroyScreenElement \{id = song_breakdown_noncompetitive_id}
	endif
	GetGlobalTags \{band_info}
	bandname = <Name>
	gman_songtool_getcurrentsong
	my_song = <current_song>
	if NOT ($track_last_song = None)
		my_song = ($track_last_song)
	endif
	get_song_title song = <my_song>
	gamemode_gettype
	if (<Type> = practice)
		ui_create_song_breakdown_practice <...>
	else
		ui_create_song_breakdown_normal <...>
	endif
	ui_event_add_params Type = <Type>
endscript

script ui_destroy_song_breakdown 
	clean_up_user_control_helpers
	Change \{song_breakdown_countdown_time = -1}
	stopsound \{outro_five_stars}
	stopsound \{outro_four_stars}
	stopsound \{outro_three_stars}
	stopsound \{outro_two_stars}
	stopsound \{0xcc8b03a1}
	KillSpawnedScript \{Name = pulsate_helper_pill}
	if (<Type> = practice)
		DestroyScreenElement \{id = my_breakdown_practice_id}
	else
		DestroyScreenElement \{id = song_breakdown_noncompetitive_id}
		ui_destroy_encore_confirmation
	endif
endscript

script ui_deinit_song_breakdown 

	if ($track_last_song != jamsession)
		song_breakdown_auto_write_top_rockers
	endif
	ui_song_breakdown_clean_up_highest_multipliers
endscript

script ui_song_breakdown_anim_in_script 
	setscriptcannotpause
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	stars_alpha = 1.0
	StartRendering \{reason = menu_transition}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops {
			song_complete_stars_alpha = <stars_alpha> time = 0.1 anim = gentle
		}
		Wait \{0.3
			Second}
	endif
	Change \{song_breakdown_busy_flag = 0}
endscript

script ui_song_breakdown_anim_out_script 
	setscriptcannotpause
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	StartRendering \{reason = menu_transition}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops \{song_complete_stars_alpha = 0
			time = 0.05
			anim = gentle}
		Wait \{0.3
			Second}
	endif
endscript

script ui_create_song_breakdown_practice 
	disable_pause
	0xce69e479
	load_songqpak \{song_name = $current_song}
	progression_updatedetailedstatsforgig \{failed_or_practice}
	ui_song_breakdown_get_basic_player_data
	if NOT playerinfoequals <player_index> part = vocals
		if (<total_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x3bf547a6)
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_practice_id
		Type = descinterface
		desc = 'song_breakdown_practice'
		dlog_title_text = <song_title>
		dlog_continue_notes_entry_text = <percent_text>
		dlog_continue_streak_entry_text = <streak_text>
		icon_difficulty_medium_texture = <diff_texture>
		dlog_fail_song_difficulty_text = <difficulty_text>
		exclusive_device = ($primary_controller)
	}
	my_breakdown_practice_id :desc_resolvealias \{Name = alias_dlog_vmenu}
	AssignAlias id = <resolved_id> alias = current_menu
	AssignAlias \{id = my_breakdown_practice_id
		alias = current_menu_anchor}
	current_menu :SetTags {color_scheme = ($0xe28faff4)}
	SetScreenElementProps {
		id = <resolved_id>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	0xeff4f945 {
		parent = <resolved_id>
		text = qs(0x4994d173)
		event_handlers = [
			{pad_choose practice_restart_song}
		]
	}
	0xeff4f945 {
		parent = <resolved_id>
		text = qs(0x1d227332)
		event_handlers = [
			{pad_choose generic_event_choose params = {state = uistate_song_summary_details}}
		]
	}
	0xeff4f945 {
		parent = <resolved_id>
		text = qs(0xde4bb13a)
		event_handlers = [
			{pad_choose generic_event_back params = {state = uistate_select_song_section}}
		]
	}
	if NOT playerinfoequals \{1
			part = vocals}
		0xeff4f945 {
			parent = <resolved_id>
			text = qs(0x2586eb28)
			event_handlers = [
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
			]
		}
	endif
	if ($came_to_practice_from = main_menu)
		continue_text = qs(0x3e482764)
	else
		if ($came_to_practice_from = p1_quickplay)
			continue_text = qs(0x0a96ac96)
		else
			continue_text = qs(0xb435bc8c)
		endif
	endif
	0xeff4f945 {
		parent = <resolved_id>
		text = <continue_text>
		event_handlers = [
			{pad_choose ui_win_song_continue_next_menu params = {for_practice = 1}}
		]
	}
	0xeff4f945 {
		parent = <resolved_id>
		text = qs(0x793e4d21)
		event_handlers = [
			{pad_choose song_ended_menu_select_quit}
		]
	}
	AssignAlias id = <resolved_id> alias = current_menu
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xc18d5e76) button = green z = 100000
	spawnscript \{highlight_motion}
	unload_songqpak
endscript

script 0xeff4f945 
	if NOT <parent> :GetSingleTag color_scheme
		color_scheme = ($default_color_scheme)
	endif
	CreateScreenElement {
		parent = <parent>
		Type = TextElement
		text = <text>
		rgba = (<color_scheme>.text_color)
		font = fontgrid_title_a1
		event_handlers = <event_handlers>
	}
	<id> :se_setprops {
		event_handlers = [
			{focus 0x5a57283a}
			{unfocus 0xfd504fec}
		]
	}
endscript

script 0x5a57283a 
	if NOT current_menu :GetSingleTag \{color_scheme}
		color_scheme = ($default_color_scheme)
	endif
	se_setprops {
		rgba = (<color_scheme>.text_focus_color)
	}
endscript

script 0xfd504fec 
	if NOT current_menu :GetSingleTag \{color_scheme}
		color_scheme = ($default_color_scheme)
	endif
	se_setprops {
		rgba = (<color_scheme>.text_color)
	}
endscript

script song_breakdown_is_single_player_game 
	gamemode_gettype
	if (isSinglePlayerGame)
		return \{true}
	elseif (<Type> = freeplay)
		freeplay_get_num_active_players
		if (<num_active_players> = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script ui_create_song_breakdown_normal 
	display_stats_index = 0
	SoundEvent \{event = menu_song_complete_in}
	star_rgba = [254 204 55 255]
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		Player = 1
		begin
		get_percent_notes_hit player_index = <Player>
		if GotParam \{percent_notes_hit}
			if (<percent_notes_hit> < 100)
				star_rgba = [255 255 255 255]
			endif
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	gamemode_gettype
	if (<Type> = career)
		get_current_band_name
	else
		band_name = ''
	endif
	if song_breakdown_is_single_player_game
		challenge_meter_alpha = 0
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			Type = descinterface
			desc = 'song_summary_single'
			band_name_text = <band_name>
			song_title_text = <song_title>
			hud_meter_challenge_alpha = <challenge_meter_alpha>
			tags = {
				display_stats_index = <display_stats_index>
				transition_param = None
			}
		}
	else
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			Type = descinterface
			desc = 'song_summary_multi'
			band_name_text = <band_name>
			song_title_text = <song_title>
			tags = {
				display_stats_index = <display_stats_index>
				transition_param = None
			}
		}
		if (<Type> = pro_faceoff)
			winner_text = qs(0x238e0b78)
			if ($gig_detailed_stats [0] [0].score > $gig_detailed_stats [1] [0].score)
				ui_song_breakdown_get_player_display_name \{player_index = 1}
				formatText TextName = winner_text qs(0x8113e038) p = <player_name_text>
			elseif ($gig_detailed_stats [0] [0].score < $gig_detailed_stats [1] [0].score)
				ui_song_breakdown_get_player_display_name \{player_index = 2}
				formatText TextName = winner_text qs(0x8113e038) p = <player_name_text>
			endif
			song_breakdown_noncompetitive_id :se_setprops {
				0x293c9809 = 0.0
				0x03a716c4 = 0.0
				0x96530a1d = 0.0
				0x3dcdef18 = 0.0
				0x534edf30 = 1.0
				0x49824af6 = <winner_text>
			}
		endif
		ui_song_breakdown_hide_player_data
		song_breakdown_assign_strips_data stats_index = <display_stats_index>
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	song_breakdown_assign_band_data star_rgba = <star_rgba> song_name = <song_title>
	ui_song_breakdown_setup_handler_scripts <...>
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_add_page_counters
		if ($is_network_game = 1)
			if NOT GotParam \{continue_setlist_transition}
				song_breakdown_noncompetitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_start_timer_spawned params = {<...>}
			endif
		endif
	endif
endscript

script ui_song_breakdown_normal_animate_stats 

	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops \{song_summary_illo_pos = (-463.0, 138.0)
			relative
			time = 0.4}
		Wait \{0.7
			Seconds}
		if (<num_stars> > 0)
			i = 1
			curr_time = 0.0
			Change \{0x0e45c8b7 = 1}
			if (<num_stars> = 1)
				0xeddff95f = [0.4 0.9]
			else
				0xeddff95f = [0.25 0.55 1.0 1.3 1.8 2.3]
			endif
			outro_stars num_stars = <num_stars>
			begin
			r = RandomInteger (90.0, 360.0)
			0x41c0cbda = (<0xeddff95f> [(<i> - 1)] - <curr_time>)
			song_breakdown_noncompetitive_id :se_setprops {
				flying_star_pos = (0.0, 0.0)
				flying_star_rot_angle = <r>
				motion = ease_in
				time = <0x41c0cbda>
			}
			song_breakdown_noncompetitive_id :se_waitprops
			formatText TextName = stars_text qs(0xfd68af01) i = <i>
			song_breakdown_noncompetitive_id :se_setprops {
				stars_number_text = <stars_text>
				stars_number_scale = 2.0
				song_summary_star_scale = 1.0
				song_summary_star2_scale = 0.7
				star_glow_alpha = 1.0
				star_glow_scale = 1.3
				time = 0
			}
			song_breakdown_noncompetitive_id :se_waitprops
			curr_time = (<curr_time> + <0x41c0cbda>)
			0x9c94f90c = ((<0xeddff95f> [<i>] - <curr_time>) / 2.0)
			song_breakdown_noncompetitive_id :se_setprops {
				stars_number_scale = 1.0
				song_summary_star_scale = 0.8
				song_summary_star2_scale = 1.0
				star_glow_alpha = 0
				star_glow_scale = 0.25
				motion = ease_out
				time = <0x9c94f90c>
			}
			song_breakdown_noncompetitive_id :se_waitprops
			if NOT (<i> = <num_stars>)
				song_breakdown_noncompetitive_id :se_setprops \{flying_star_pos = (305.0, -405.0)}
			else
				song_breakdown_noncompetitive_id :se_setprops \{flying_star_pos = (-1305.0, -405.0)}
			endif
			song_breakdown_noncompetitive_id :se_waitprops
			curr_time = (<curr_time> + <0x9c94f90c>)
			<i> = (<i> + 1)
			repeat <num_stars>
			create_ui_star_particles \{params = {
					parent = song_breakdown_noncompetitive_id
					Pos = (0.0, 0.0)
				}}
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{anim_star_wiggle_loop
				params = {
				}}
		else
			formatText TextName = stars_text qs(0xfd68af01) i = <num_stars>
			song_breakdown_noncompetitive_id :se_setprops {
				stars_number_text = <stars_text>
				flying_star_pos = (-1000.0, 0.0)
			}
		endif
		Change \{0x0e45c8b7 = 0}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (110.0, 59.0)
			relative
			time = 0.6}
		song_breakdown_noncompetitive_id :se_waitprops
		Wait \{0.3
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1022.0, 0.0)
			relative
			time = 0.7}
		song_breakdown_noncompetitive_id :se_waitprops
		Wait \{0.3
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{0x8139224c = (313.0, 160.0)
			relative
			time = 0.7}
	endif
endscript

script song_breakdown_add_page_counters 
	gamemode_gettype
	i = 0
	GetArraySize ($g_song_breakdown_noncompetitive_stats_order)
	stats_count = <array_Size>
	if (<Type> = quickplay || <Type> = freeplay)
		stats_count = 0
		begin
		if (($g_song_breakdown_noncompetitive_stats_order [<i>].career_only) = 0)
			<stats_count> = (<stats_count> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_page_counter}
			GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> < <stats_count>)
				begin
				CreateScreenElement {
					parent = <resolved_id>
					Type = SpriteElement
					texture = dot_64
					rgba = black
					alpha = 0.4
					dims = (15.0, 15.0)
					just = [center , center]
					pos_anchor = [left , top]
					z_priority = 4
				}
				repeat (<stats_count> - <array_Size>)
			endif
		endif
	endif
endscript

script song_breakdown_assign_strips_data 

	gamemode_gettype
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :GetSingleTag \{display_stats_index}
		song_breakdown_noncompetitive_id :se_setprops {
			stat_title_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].title_text)
		}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_page_counter}
			GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> > 0)
				i = 0
				begin
				if (<i> = <display_stats_index>)
					dot_alpha = 1
				else
					dot_alpha = 0.4
				endif
				(<children> [<i>]) :se_setprops alpha = <dot_alpha>
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		if (<Type> = freeplay)
			freeplay_get_num_active_players
			num_players_shown = <num_active_players>
		else
			gamemode_getnumplayersshown
		endif
		if (<num_players_shown> > 0)
			if (<Type> = freeplay)
				freeplay_get_first_active_player
			else
				Player = 1
			endif
			<i> = 1
			begin
			formatText checksumName = player_stats_bg_panel 'alias_song_summary_playerStats_BG_%i' i = <i>
			if song_breakdown_noncompetitive_id :desc_resolvealias Name = <player_stats_bg_panel>
				DestroyScreenElement id = <resolved_id> preserve_parent
				getplayerinfo <Player> part
				ui_song_breakdown_get_player_instrument_texture part = <part>
				0x65ff61a6 player_num = <Player> stat_index = <display_stats_index>
				if (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = score)
					stat_desc_name = 'song_summary_player_score'
				else
					stat_desc_name = 'song_summary_player_accuracy'
				endif
				if (<i> = 1)
					0x1e2336ee = <p1_md>
				elseif (<i> = 2)
					0x1e2336ee = <gh51_blue_lt>
				elseif (<i> = 3)
					0x1e2336ee = <gh51_purple_lt>
				elseif (<i> = 4)
					0x1e2336ee = <0xeba53270>
				endif
				CreateScreenElement {
					parent = <resolved_id>
					Type = descinterface
					desc = <stat_desc_name>
					pos_anchor = [left , top]
					just = [left , top]
					Pos = (5.0, -47.0)
					accuracy_text = <stat_text>
					0xaa804eff = <0x1e2336ee>
					accuracy_caption_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].caption_text)
					0x776bfae3 = <0x1e2336ee>
					percent_symbol_alpha = (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].use_unit_text))
					percent_symbol_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].unit_text)
					z_priority = 15.0
					autosizedims = true
				}
				ui_song_breakdown_get_player_display_name player_index = <Player>
				formatText checksumName = player_name_checksum 'p%i_name_text' i = <i>
				AddParam structure_name = player_name Name = <player_name_checksum> value = <player_name_text>
				song_breakdown_noncompetitive_id :se_setprops {
					<player_name>
				}
				formatText checksumName = leader_icon_alpha_checksum 'leader_icon_p%i_alpha' i = <i>
				0x1147ffb8 id = <leader_icon_alpha_checksum> value = 1.0
				song_breakdown_noncompetitive_id :se_setprops <variable>
				formatText checksumName = 0xe74b7836 'leader_icon_p%i_texture' i = <i>
				0x1147ffb8 id = <0xe74b7836> value = <icon_texture>
				song_breakdown_noncompetitive_id :se_setprops <variable>
			endif
			if (<Type> = freeplay)
				freeplay_get_next_active_player Player = <Player>
			else
				<Player> = (<Player> + 1)
			endif
			<i> = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script 0x65ff61a6 

	ui_song_breakdown_get_basic_player_data player_index = <player_num> no_units
	switch ($g_song_breakdown_noncompetitive_stats_order [<stat_index>].Name)
		case accuracy
		stat_text = <percent_text>
		case score
		stat_text = <score_text>
		case streak
		stat_text = <streak_text>
		case multiplier
		getplayerinfo <player_num> highest_multiplier
		formatText TextName = stat_text qs(0x99046a05) m = <highest_multiplier>
		default

	endswitch
	return stat_text = <stat_text>
endscript

script song_breakdown_scroll_stats 

	if NOT ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		return
	endif
	if ($0x0e45c8b7 = 1)
		return
	endif
	gamemode_gettype
	song_breakdown_noncompetitive_id :GetSingleTag \{display_stats_index}
	new_stat_index_found = 0
	GetArraySize ($g_song_breakdown_noncompetitive_stats_order)
	if ((<direction> = left) || (<direction> = up))
		unit_to_add = -1
		generic_menu_up_or_down_sound \{up}
	else
		unit_to_add = 1
		generic_menu_up_or_down_sound \{down}
	endif
	new_display_stats_index = (<display_stats_index> + <unit_to_add>)
	begin
	if (<new_display_stats_index> < 0)
		<new_display_stats_index> = (<array_Size> - 1)
	elseif (<new_display_stats_index> >= <array_Size>)
		<new_display_stats_index> = 0
	endif
	if (<Type> = quickplay || <Type> = freeplay)
		if ($g_song_breakdown_noncompetitive_stats_order [<new_display_stats_index>].career_only)
			<new_display_stats_index> = (<new_display_stats_index> + <unit_to_add>)
		else
			<new_stat_index_found> = 1
			break
		endif
	else
		<new_stat_index_found> = 1
		break
	endif
	repeat <array_Size>
	if (<new_stat_index_found> = 1)
		song_breakdown_noncompetitive_id :SetTags display_stats_index = <new_display_stats_index>
		song_breakdown_assign_strips_data stats_index = <new_display_stats_index>
	endif
endscript

script song_breakdown_strips_focus 

	<strip_id> :se_setprops character_name_rgba = blue2_md
endscript

script song_breakdown_strips_unfocus 

	<strip_id> :se_setprops character_name_rgba = [220 122 5 255]
endscript
song_breakdown_countdown_time = -1
song_breakdown_countdown_time_added = 0

script net_ui_song_breakdown_wait_for_timer 

	if ($song_breakdown_countdown_time = -1)
		Change song_breakdown_countdown_time = ($net_song_breakdown_countdown_time)
	endif
	<screen_id> :se_setprops {
		net_timer_text_alpha = 1
	}
	begin
	formatText TextName = timer_msg qs(0xb976bc16) d = ($song_breakdown_countdown_time)
	<screen_id> :se_setprops {
		net_timer_text_text = <timer_msg>
	}
	if (($song_breakdown_countdown_time) = 0)
		break
	endif
	Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) - 1)
	Wait \{1
		Second}
	repeat
	Wait \{1
		Second}
	<screen_id> :se_setprops {
		net_timer_text_alpha = 0
	}
	Change \{song_breakdown_countdown_time = -1}
	Change \{song_breakdown_countdown_time_added = 0}
endscript

script net_ui_song_breakdown_start_timer_spawned 
	Obj_GetID
	screen_id = <objID>
	net_ui_song_breakdown_wait_for_timer screen_id = <screen_id>
	gamemode_gettype
	if ($is_network_game = 1)
		if GotParam \{continue_to_next_song}
			if (<Type> = career)
				Change \{songtime_paused = 0}
				generic_event_back \{nosound
					state = Uistate_gameplay}
			elseif ($game_mode = fest_mode)
				display_competitive_rules_voting \{voting_callback = song_breakdown_back_to_gameplay}
			elseif (<Type> = pro_faceoff || <Type> = competitive)
				song_breakdown_back_to_gameplay
			else
				Change \{songtime_paused = 0}
				gman_shutdowngamemodegoal
				gman_startgamemodegoal
				generic_event_back \{nosound
					state = Uistate_gameplay}
			endif
		elseif (<Type> = career)
			if IsHost
				net_ui_song_breakdown_continue_to_next_screen_gig_complete
			endif
		else
			net_ui_song_breakdown_go_to_setlist
		endif
	else
		if ((<Type> = career) || (<Type> = quickplay))
			net_song_breakdown_end_of_timer_transition_local <...>
		else
			net_song_breakdown_competitive_end_of_timer_transition_local <...>
		endif
	endif
endscript

script net_song_breakdown_add_to_timer 
	if ($song_breakdown_countdown_time_added = 0)
		Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
		Change \{song_breakdown_countdown_time_added = 1}
		if IsHost
			SendStructure \{callback = net_song_breakdown_add_to_timer
				data_to_send = {
					None
				}}
		endif
	endif
endscript

script net_song_breakdown_end_of_timer_transition_local 
	if GotParam \{end_of_setlist_transition}
		ui_song_breakdown_continue_to_next_screen_gig_complete
	elseif GotParam \{ENCORE_TRANSITION}
		ui_song_breakdown_continue_to_next_screen_encore
	elseif (GotParam add_setlist_continue_handlers)
		if ((($sb_trans_flag) = 1) || (GotParam add_setlist_continue_handlers))
			ui_song_breakdown_continue_to_next_screen_song_transition
		endif
	endif
endscript

script song_breakdown_assign_band_data 

	challenge_text = qs(0x03ac90f0)
	band_challenge_alpha = 0
	gamemode_gettype
	if song_breakdown_is_single_player_game
		if (<Type> = freeplay)
			freeplay_get_first_active_player
		else
			Player = 1
		endif
		ui_song_breakdown_get_basic_player_data player_index = <Player>
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_name>
			score_main_text = <score_text>
			accuracy_main_text = <percent_text>
			streak_main_text = <streak_text>
			diff_icon_texture = <diff_texture>
			inst_icon_fill_texture = <icon_texture>
			inst_icon_out_texture = <icon_texture>
			stars_number_text = qs(0x03ac90f0)
		}
	else
		if (($g_leader_player_num) != -1)
			getplayerinfo ($g_leader_player_num) Band
		else
			Player = 1

		endif
		b_note_streak = ($gig_detailed_stats_band.high_2p_streak)
		if (($gig_detailed_stats_band.high_3p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_3p_streak)
		endif
		if (($gig_detailed_stats_band.high_4p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_4p_streak)
		endif
		score = ($gig_detailed_stats_band.score)
		b_high_mult = ($gig_detailed_stats_band.high_mult)
		CastToInteger \{b_high_mult}
		CastToInteger \{score}
		formatText TextName = song_text qs(0x4d4555da) s = <song_name>
		formatText TextName = band_score_text qs(0xb22939c6) n = <score> DecimalPlaces = 0 usecommas
		formatText TextName = band_high_mult_text qs(0x2543b917) n = <b_high_mult>
		formatText TextName = band_high_note_streak qs(0xb22939c6) n = <b_note_streak>
		stars = ($gig_detailed_stats_band.stars)
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_text>
			score_main_text = <band_score_text>
			accuracy_main_text = <band_high_mult_text>
			accuracy_caption_text = qs(0xb823b02f)
			streak_main_text = <band_high_note_streak>
			streak_caption_text = qs(0xf475f778)
			stars_number_text = qs(0x03ac90f0)
		}
		if (<Type> = pro_faceoff)
			song_breakdown_noncompetitive_id :se_setprops \{0x96530a1d = 0.0
				0x293c9809 = 0.0
				0x03a716c4 = 0.0
				0x3dcdef18 = 0.0}
			stars = -1
		endif
	endif
	song_breakdown_noncompetitive_id :Obj_SpawnScriptNow ui_song_breakdown_normal_animate_stats params = {num_stars = <stars>}
endscript

script ui_song_breakdown_setup_handler_scripts 
	continue_script = nullscript
	back_script = nullscript
	option_script = nullscript
	option2_script = nullscript
	continue_text = qs(0x182f0173)
	back_text = qs(0x3f11367e)
	option_text = qs(0x88572463)
	option2_text = qs(0x87251a1f)
	back_params = {}
	transition_param = None
	if GotParam \{0xaabed717}
		continue_script = 0x2205e2b5
		back_script = song_breakdown_go_to_stats_from_transition
		option_script = song_breakdown_run_top_rockers_from_transition
	elseif GotParam \{end_of_setlist_transition}
		if ($is_network_game = 1)
			continue_script = net_ui_song_breakdown_continue_to_next_screen_gig_complete
		else
			continue_script = ui_song_breakdown_continue_to_next_screen_gig_complete
			back_script = song_breakdown_go_to_stats_from_transition
			gamemode_gettype
			if (<Type> = quickplay)
				option_script = song_breakdown_run_top_rockers_from_transition
			endif
		endif
		transition_param = end_of_setlist_transition
	elseif GotParam \{ENCORE_TRANSITION}
		continue_script = ui_song_breakdown_continue_to_next_screen_encore
		if ($is_network_game = 0)
			back_script = song_breakdown_go_to_stats_from_transition
		endif
		transition_param = ENCORE_TRANSITION
	elseif ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		if ((($sb_trans_flag) = 1) || (GotParam add_setlist_continue_handlers))
			continue_script = ui_song_breakdown_continue_to_next_screen_song_transition
			back_script = song_breakdown_go_to_stats_from_transition
			gamemode_gettype
			if (<Type> = quickplay)
				option_script = song_breakdown_run_top_rockers_from_transition
			endif
			if ($is_network_game = 1)
				song_breakdown_noncompetitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_start_timer_spawned params = {<...>}
			endif
			if GotParam \{continue_setlist_transition}
				transition_param = continue_setlist_transition
			else
				transition_param = add_setlist_continue_handlers
			endif
		endif
	elseif GotParam \{net_transition_not_career}
		continue_script = net_ui_song_breakdown_go_to_setlist
		continue_text = qs(0xd31dcde6)
		back_script = postgame_lobby_quit
		back_params = {id = song_breakdown_noncompetitive_id}
		back_text = qs(0x67d9c56d)
		option_script = nullscript
		option2_script = song_breakdown_go_to_stats_from_transition
		option2_text = qs(0x3f11367e)
		transition_param = net_transition_not_career
	else
		0x93d8d5cf \{'Invalid transition from song breakdown'}
	endif
	if (GotParam no_wait)
		SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_breakdown_noncompetitive_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			back_params = <back_params>
			transition_param = <transition_param>
			no_wait
		}
	else
		SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_breakdown_noncompetitive_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			back_params = <back_params>
			transition_param = <transition_param>
		}
	endif
endscript

script net_ui_song_breakdown_focus_player_strips_menu_for_rocker_record 
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if isscreenelementinfocus \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_player_stats_element}
			LaunchEvent Type = focus target = <resolved_id> data = {child_index = 0}
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		else

		endif
	endif
endscript

script net_ui_song_breakdown_unfocus_player_strips_menu 
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_player_stats_element}
			if isscreenelementinfocus id = <resolved_id>
				LaunchEvent Type = unfocus target = <resolved_id>
			endif
		endif
		clean_up_user_control_helpers
		ui_song_breakdown_setup_handler_scripts \{net_transition_not_career
			no_wait}
	endif
endscript

script net_ui_song_breakdown_launch_rock_record 

	getplayerinfo <Player> gamertag
	xuid = [0 0]
	getplayerinfo <Player> net_id_first
	getplayerinfo <Player> net_id_second
	SetArrayElement ArrayName = xuid index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = xuid index = 1 NewValue = <net_id_second>
	Name = $<gamertag>
	clean_up_user_control_helpers
	display_rock_record {
		device_num = <device_num>
		net_id = <xuid>
		player_name = <Name>
		unfocus_id = <unfocus_id>
		parent = <parent_id>
	}
endscript

script ui_return_song_breakdown 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :GetSingleTag \{transition_param}
			ui_song_breakdown_setup_handler_scripts <transition_param> no_wait
		endif
	endif
endscript

script ui_song_breakdown_hide_player_data 
	gamemode_gettype
	if (<Type> != freeplay)
		gamemode_getnumplayersshown
	else
		freeplay_get_num_active_players
		num_players = <num_active_players>
	endif
	if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_player_stat_list}
		num_data_strips_to_hide = (4 - <num_players_shown>)
		if (<num_data_strips_to_hide> > 0)
			GetScreenElementChildren id = <resolved_id>
			i = 3
			begin
			(<children> [<i>]) :se_setprops alpha = 0
			<i> = (<i> - 1)
			repeat <num_data_strips_to_hide>
		endif
	endif
endscript

script ui_song_breakdown_get_basic_player_data \{player_index = 1}
	gamemode_gettype
	if ((<Type> = career || <Type> = quickplay || <Type> = freeplay) && ($is_network_game = 0))
		getscorefromdetailedstats Player = <player_index>
		getbestrunfromdetailedstats Player = <player_index>
		getmaxnotesfromdetailedstats Player = <player_index>
		getnoteshitfromdetailedstats Player = <player_index>
		getstarsfromdetailedstats Player = <player_index>
		getvocalstreakphrasesfromdetailedstats Player = <player_index>
		getvocalphrasequalityfromdetailedstats Player = <player_index>
		getvocalphrasemaxqualfromdetailedstats Player = <player_index>
		getcashrankupfromdetailedstats Player = <player_index>
		gettotalnotesfromdetailedstats Player = <player_index>
		getcareerearningsfromdetailedstats Player = <player_index>
	else
		getplayerinfo <player_index> best_run
		getplayerinfo <player_index> score
		getplayerinfo <player_index> max_notes
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> stars
		getplayerinfo <player_index> cash_rank_up
		getplayerinfo <player_index> vocal_streak_phrases
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		getplayerinfo <player_index> total_notes
		getplayerinfo <player_index> career_earnings
	endif
	getplayerinfo <player_index> part
	getplayerinfo <player_index> difficulty
	getplayerinfo <player_index> new_cash
	if (<max_notes> = 0)
		max_notes = 1
	endif
	getplayerinfo <player_index> difficulty
	get_difficulty_text difficulty = <difficulty>
	getplayerinfo <player_index> double_kick_drum
	if (<part> = drum)
		if (<double_kick_drum> = 1)
			<difficulty_text> = qs(0x7a19b5f7)
		endif
	endif
	CastToInteger \{score}
	formatText TextName = score_text qs(0x73307931) s = <score> usecommas
	ui_song_breakdown_get_player_display_name player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<Type> = practice)
			if (<total_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		else
			if (<max_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			<percent_notes_hit> = 1
		endif
		if GotParam \{no_units}
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		else
			formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit>
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
			if GotParam \{no_units}
				formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
			else
				formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit> DecimalPlaces = 0
			endif
		else
			<percent_text> = qs(0x4c1271a9)
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
	endif
	formatText TextName = cash_text qs(0x31c078e8) n = <new_cash> usecommas
	ui_song_breakdown_get_player_instrument_texture part = <part>
	getplayerinfo <player_index> double_kick_drum
	ui_song_breakdown_get_player_difficulty_texture {
		part = <part>
		difficulty = <difficulty>
		double_kick_drum = <double_kick_drum>
	}
	return <...>
endscript

script ui_song_breakdown_get_player_display_name 

	<Name> = qs(0x00000000)
	if ($is_network_game = 1)
		getplayerinfo <player_index> gamertag
		Name = $<gamertag>
	else
		if isXenon
			getplayerinfo <player_index> controller
			if NOT ((<controller> < 0) || (<controller> > 3))
				if getlocalgamertag controller = <controller>
					<Name> = <gamertag>
				endif
			endif
		endif
	endif
	if (<Name> = qs(0x00000000))
		getplayerinfo <player_index> character_id
		get_savegame_from_player_status Player = <player_index>
		get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
		<player_name_text> = <fullname>
	else
		<player_name_text> = <Name>
	endif
	return player_name_text = <player_name_text>
endscript

script ui_song_breakdown_get_player_instrument_texture 

	switch (<part>)
		case guitar
		icon_texture = icon_guitar_fill
		case bass
		icon_texture = icon_bass_fill
		case drum
		icon_texture = icon_drum_fill
		case vocals
		icon_texture = icon_vocals_fill
	endswitch
	return icon_texture = <icon_texture>
endscript

script ui_song_breakdown_get_player_difficulty_texture 

	switch (<difficulty>)
		case beginner
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
		if (<part> = drum)
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	return diff_texture = <diff_texture>
endscript

script get_percent_notes_hit 
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script ui_song_breakdown_add_handlers_for_next_transition_spawned 

	if NOT song_breakdown_is_single_player_game
		array = [
			{pad_up song_breakdown_scroll_stats params = {direction = up}}
			{pad_down song_breakdown_scroll_stats params = {direction = down}}
			{pad_left song_breakdown_scroll_stats params = {direction = left}}
			{pad_right song_breakdown_scroll_stats params = {direction = right}}
		]
	else
		array = []
	endif
	if NOT (<continue_script> = nullscript)
		if GotParam \{continue_params}
			AddArrayElement array = <array> element = {pad_choose <continue_script> params = <continue_params>}
		else
			AddArrayElement array = <array> element = {pad_choose <continue_script>}
		endif
		add_user_control_helper ($ui_song_breakdown_helper_params) text = <continue_text> button = green z = 100000
	endif
	if NOT (<back_script> = nullscript)
		if GotParam \{back_params}
			AddArrayElement array = <array> element = {pad_back <back_script> params = <back_params>}
		else
			AddArrayElement array = <array> element = {pad_back <back_script>}
		endif
		add_user_control_helper ($ui_song_breakdown_helper_params) text = <back_text> button = red z = 100000
	endif
	if NOT (<option2_script> = nullscript)
		if GotParam \{option2_params}
			AddArrayElement array = <array> element = {pad_option2 <option2_script> params = <option2_params>}
		else
			AddArrayElement array = <array> element = {pad_option2 <option2_script>}
		endif
		add_user_control_helper ($ui_song_breakdown_helper_params) text = <option2_text> button = yellow z = 100000
	endif
	if NOT (<option_script> = nullscript)
		if GotParam \{option_params}
			AddArrayElement array = <array> element = {pad_option <option_script> params = <option_params>}
		else
			AddArrayElement array = <array> element = {pad_option <option_script>}
		endif
		add_user_control_helper ($ui_song_breakdown_helper_params) text = <option_text> button = blue z = 100000
	endif
	<screen_element_id> :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists id = <screen_element_id>
			<screen_element_id> :se_setprops {
				exclusive_device = <exclusive_devices>
			}
			<screen_element_id> :SetTags transition_param = <transition_param>
		endif
	endif
	if (($sb_trans_flag) = 1)
		Change \{sb_trans_flag = 0}
	else
		if NOT (GotParam no_wait)
			Wait \{10
				gameframes}
		endif
	endif
	if (<continue_script> != nullscript)
		if ScreenElementExists id = <screen_element_id>
			if NOT isscreenelementinfocus id = <screen_element_id>
				LaunchEvent Type = focus target = <screen_element_id>
			endif
		endif
	endif
endscript

script song_breakdown_run_top_rockers_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	Change \{sb_trans_flag = 1}
	Change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	song_breakdown_run_top_rockers
endscript

script song_breakdown_run_top_rockers 

	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	Change \{song_breakdown_countdown_time = -1}
	if (($ui_song_breakdown_wrote_tr) = 0)
		Change \{ui_song_breakdown_wrote_tr = 1}
		Change \{ui_song_breakdown_pulsate_helper_pill = 0}
		generic_event_choose \{state = uistate_top_rockers}
	else
		generic_event_choose \{state = uistate_top_rockers
			data = {
				for_options = 1
			}}
	endif
endscript

script song_breakdown_auto_write_top_rockers 
	gamemode_gettype
	if (<Type> = quickplay)
		if (($ui_song_breakdown_wrote_tr) = 0)
			Change \{ui_song_breakdown_wrote_tr = 1}
			Change \{ui_song_breakdown_pulsate_helper_pill = 0}

		endif
	endif
endscript

script song_breakdown_anim_band_banner_up 
	SetScreenElementProps \{id = song_breakdown_noncompetitive_id
		band_header_container_pos = {
			(0.0, -30.0)
			relative
		}
		time = 0.08
		anim = gentle}
endscript

script ui_song_breakdown_continue_to_next_screen_gig_complete 

	ui_win_song_continue_next_menu
endscript

script net_ui_song_breakdown_continue_to_next_screen_gig_complete 
	SoundEvent \{event = menu_song_complete_out}

	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_training)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	if IsHost
		if ($net_breakdown_continue_msg_sent = 0)
			Change \{net_breakdown_continue_msg_sent = 1}
		else
			return
		endif
	else
		SendStructure \{callback = net_ui_song_breakdown_continue_to_next_screen_gig_complete
			data_to_send = {
				None
			}}
		return
	endif
	ui_win_song_continue_next_menu
endscript

script ui_song_breakdown_continue_to_next_screen_encore 
	if ($is_network_game = 1)
		if IsHost
			if ($net_encore_msg_start_sent = 0)
				Change \{net_encore_msg_start_sent = 1}
				SendStructure \{callback = encore_play
					data_to_send = {
						None
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_encore
				data_to_send = {
					None
				}}
			SoundEvent \{event = menu_song_complete_out}
			return
		endif
	endif

	SoundEvent \{event = menu_song_complete_out}
	encore_play
endscript

script ui_song_breakdown_pause_between_songs 
	ui_song_breakdown_add_components_for_transitions <...>
endscript
sb_trans_flag = 0
song_breakdown_busy_flag = 0

script song_breakdown_go_to_leaderboard_from_transition 
	if isXenon
		Change lb_controller = <device_num>
	elseif isps3
		get_all_exclusive_devices
		Change lb_controller = <exclusive_device>
	endif
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	Change \{sb_trans_flag = 1}
	Change \{song_breakdown_busy_flag = 1}
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	Change \{song_breakdown_countdown_time = -1}
	ui_event_wait_for_safe
endscript

script song_breakdown_go_to_stats_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	if ($is_network_game = 1)
		if ($song_breakdown_countdown_time_added = 0)
			if IsHost
				Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
				Change \{song_breakdown_countdown_time_added = 1}
				SendStructure \{callback = net_song_breakdown_add_to_timer
					data_to_send = {
						None
					}}
			else
				SendStructure \{callback = net_song_breakdown_add_to_timer
					data_to_send = {
						None
					}}
			endif
		endif
	else
		KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
		Change \{song_breakdown_countdown_time = -1}
	endif
	Change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	Change \{sb_trans_flag = 1}
	generic_event_choose \{state = uistate_song_summary_details}
endscript

script 0x2205e2b5 
	generic_menu_pad_choose_sound
	Change \{gameplay_restart_song = 1}
	generic_event_back \{nosound
		state = Uistate_gameplay}
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition 

	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	Change \{song_breakdown_busy_flag = 1}
	generic_menu_pad_choose_sound
	SoundEvent \{event = menu_song_complete_out}
	Change \{songtime_paused = 0}
	if ($track_last_song = jamsession)
		jam_ratesong_check_for_rating
	else
		gamemode_gettype
		generic_event_back \{nosound
			state = Uistate_gameplay}
	endif
endscript

script song_breakdown_check_bot_play 
	bot_play_is_enabled = 0
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		Player = 1
		begin
		getplayerinfo <Player> bot_play
		if (<bot_play> = 1)
			bot_play_is_enabled = 1
			break
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	return bot_play = <bot_play_is_enabled>
endscript

script song_breakdown_get_exclusive_devices 
	exclusive_devices = []
	if GotParam \{band_leader_only}
		getplayerinfo ($g_leader_player_num) controller
		AddArrayElement array = <exclusive_devices> element = <controller>
		<exclusive_devices> = <array>
	else
		gamemode_getnumplayersshown
		if (<num_players_shown> > 0)
			Player = 1
			begin
			getplayerinfo <Player> controller
			AddArrayElement array = <exclusive_devices> element = <controller>
			<exclusive_devices> = <array>
			<Player> = (<Player> + 1)
			repeat <num_players_shown>
		endif
	endif
	return exclusive_devices = <exclusive_devices>
endscript

script ui_song_breakdown_should_allow_transition_to_leaderboards 
	gamemode_gettype
	if (<Type> = freeplay)
		return \{FALSE}
	endif
	if ui_song_breakdown_someone_signed_in
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_song_breakdown_someone_signed_in 
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		Player = 1
		begin
		getplayerinfo <Player> controller
		if CheckForSignIn <signin_params> controller_index = <controller>
			return \{true}
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	return \{FALSE}
endscript

script ui_song_breakdown_clean_up_highest_multipliers 
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		Player = 1
		begin
		setplayerinfo <Player> highest_multiplier = 1
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
endscript

script ui_song_breakdown_clear_ready_up_book_keeping 
	Change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script ui_song_breakdown_set_player_ready 
	if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_player_stats_element}
		GetScreenElementChildren id = <resolved_id>
		GetScreenElementProps id = (<children> [<dev_num>])
		if (<check_mark_alpha> = 0)
			if (($game_mode = gh4_p1_career) || ($game_mode = practice) || ($game_mode = tutorial) || ($game_mode = p1_quickplay))
				generic_menu_pad_choose_sound
			else
				SoundEvent \{event = Box_Check_SFX}
			endif
		endif
		(<children> [<dev_num>]) :se_setprops {
			check_mark_alpha = 1
		}
	endif
endscript

script 0xe4fb434b 
	Change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script 0x1b678b72 
	gamemode_getnumplayersshown
	player_idx = 1
	begin
	setplayerinfo <player_idx> highest_multiplier = 1
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
endscript

script getscorefromdetailedstats \{Player = 1}
	score = ($gig_detailed_stats [(<Player> - 1)] [0].score)
	return score = <score>
endscript

script getbestrunfromdetailedstats \{Player = 1}
	best_run = ($gig_detailed_stats [(<Player> - 1)] [0].best_run)
	return best_run = <best_run>
endscript

script getstarsfromdetailedstats \{Player = 1}
	stars = ($gig_detailed_stats [(<Player> - 1)] [0].stars)
	return stars = <stars>
endscript

script getnoteshitfromdetailedstats \{Player = 1}
	notes_hit = ($gig_detailed_stats [(<Player> - 1)] [0].notes_hit)
	return notes_hit = <notes_hit>
endscript

script getmaxnotesfromdetailedstats \{Player = 1}
	max_notes = ($gig_detailed_stats [(<Player> - 1)] [0].max_notes)
	return max_notes = <max_notes>
endscript

script gettotalnotesfromdetailedstats \{Player = 1}
	total_notes = ($gig_detailed_stats [(<Player> - 1)] [0].total_notes)
	return total_notes = <total_notes>
endscript

script getspphraseshitfromdetailedstats \{Player = 1}
	sp_phrases_hit = ($gig_detailed_stats [(<Player> - 1)] [0].sp_phrases_hit)
	return sp_phrases_hit = <sp_phrases_hit>
endscript

script getavgmultiplierfromdetailedstats \{Player = 1}
	avg_multiplier = ($gig_detailed_stats [(<Player> - 1)] [0].avg_multiplier)
	return avg_multiplier = <avg_multiplier>
endscript

script getvocalstreakphrasesfromdetailedstats \{Player = 1}
	vocal_streak_phrases = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_streak_phrases)
	return vocal_streak_phrases = <vocal_streak_phrases>
endscript

script getvocalphrasequalityfromdetailedstats \{Player = 1}
	vocal_phrase_quality = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_phrase_quality)
	return vocal_phrase_quality = <vocal_phrase_quality>
endscript

script getvocalphrasemaxqualfromdetailedstats \{Player = 1}
	vocal_phrase_max_qual = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_phrase_max_qual)
	return vocal_phrase_max_qual = <vocal_phrase_max_qual>
endscript

script getcashrankupfromdetailedstats \{Player = 1}
	cash_rank_up = ($gig_detailed_stats [(<Player> - 1)] [0].cash_rank_up)
	return cash_rank_up = <cash_rank_up>
endscript

script getnewcashfromdetailedstats \{Player = 1}
	new_cash = ($gig_detailed_stats [(<Player> - 1)] [0].new_cash)
	return new_cash = <new_cash>
endscript

script getcareerearningsfromdetailedstats \{Player = 1}
	career_earnings = ($gig_detailed_stats [(<Player> - 1)] [0].career_earnings)
	return career_earnings = <career_earnings>
endscript

script song_breakdown_drop_player 


	if (<is_game_over> = 0)
		gamemode_gettype
		if (<Type> = career)
			wait_for_safe_shutdown
			SpawnScriptNow gameplay_drop_player params = {<...>}
		endif
		sb_kill_timer_remove_handlers
	endif
endscript

script sb_kill_timer_remove_handlers 
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	gamemode_gettype
	if (<Type> = career || <Type> = quickplay)
		screen_id = song_breakdown_noncompetitive_id
	else
		screen_id = song_breakdown_competitive_id
	endif
	if ScreenElementExists id = <screen_id>
		LaunchEvent Type = unfocus target = <screen_id>
		<screen_id> :se_setprops {
			net_timer_text_alpha = 0
			event_handlers = [
				{pad_choose nullscript}
				{pad_option nullscript}
				{pad_option2 nullscript}
				{pad_L1 nullscript}
				{pad_start nullscript}
			]
			replace_handlers
		}
	endif
endscript

script song_breakdown_end_game 


	destroy_dialog_box
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			generic_event_back
			ui_event_wait_for_safe
		endif
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formatText TextName = msg qs(0x78bb855f) s = <first_msg>
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'encore_confirmation')
			Transition_KillAll
		endif
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if ScreenElementExists \{id = dialog_box_container}
			dialog_box_container :se_setprops \{z_priority = 1500.2}
		endif
		if ScreenElementExists \{id = dialog_box_desc_id}
			dialog_box_desc_id :Obj_SpawnScriptNow song_breakdown_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
		endif
		sb_kill_timer_remove_handlers
	endif
endscript

script song_breakdown_end_game_spawned 
	Change \{net_ready_to_start = 1}

	Wait \{3
		Seconds}

	destroy_net_popup
	gamemode_gettype
	if (<Type> = career || <Type> = quickplay)
		screen_id = song_breakdown_noncompetitive_id
	else
		screen_id = song_breakdown_competitive_id
	endif
	if ScreenElementExists id = <screen_id>
		LaunchEvent Type = focus target = <screen_id>
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		ui_memcard_autosave \{event = menu_back
			state = uistate_group_play
			data = {
				all_active_players = true
			}}
	endif
endscript

script create_ui_star_particles 
	Destroy2DParticleSystem \{id = 0x7c9b8359}
	Create2DParticleSystem \{id = 0x7c9b8359
		Pos = (640.0, 340.0)
		z_priority = 1000
		texture = white
		blend = blend
		parent = song_breakdown_noncompetitive_id
		start_color = [
			255
			255
			255
			255
		]
		end_color = [
			255
			255
			255
			255
		]
		start_scale = (1.55, 1.55)
		end_scale = (1.3499999, 1.3499999)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 12
		emit_radius = 1
		Emit_Rate = 0.035
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 28.0
		friction = (0.0, 88.0)
		time = 1.0}
	Wait \{1
		Second}
	Destroy2DParticleSystem \{kill_when_empty
		id = 0x7c9b8359}
endscript

script anim_star_wiggle_loop 
	begin
	my_alpha = Random (@ 1 @ 0.9 @ 0.8 )
	my_alpha2 = Random (@ 1 @ 0.8 )
	my_scale1 = Random (@ (1.03, 0.96999997) @ (0.96999997, 1.03) @*20 (1.0, 1.0) )
	my_scale2 = Random (@ (0.81, 0.78999996) @ (0.78999996, 0.81) @*20 (0.8, 0.8) )
	se_setprops {
		song_summary_star2_alpha = <my_alpha>
		song_summary_star_alpha = <my_alpha2>
		motion = ease_out
		time = 0.1
	}
	se_setprops {
		song_summary_star_scale = <my_scale2>
		song_summary_star2_scale = <my_scale1>
		motion = ease_out
		time = 0.05
	}
	se_waitprops
	repeat
endscript
