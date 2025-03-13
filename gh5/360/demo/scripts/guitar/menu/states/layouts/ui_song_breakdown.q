last_song_played = none
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
ui_song_breakdown_already_animated_stats = 0
ui_song_breakdown_continuing_from_sb = 0
g_song_breakdown_noncompetitive_stats_order = [
	{
		career_only = 0
		name = accuracy
		title_text = qs(0x8795155b)
		caption_text = qs(0x7d221f06)
		use_unit_text = 1
		unit_text = qs(0x0c40a1b2)
	}
	{
		career_only = 0
		name = score
		title_text = qs(0xfb40ab1c)
		caption_text = qs(0x01991b09)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		career_only = 0
		name = streak
		title_text = qs(0x9a210119)
		caption_text = qs(0x9a210119)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		career_only = 0
		name = multiplier
		title_text = qs(0x1ae60c3c)
		caption_text = qs(0xd250fe14)
		use_unit_text = 1
		unit_text = qs(0x96d1a609)
	}
	{
		career_only = 1
		name = challenge
		title_text = qs(0x1b7b63c5)
		caption_text = qs(0x2739838c)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
]

script ui_init_song_breakdown 
	change \{song_breakdown_countdown_time_added = 0}
	change \{ui_song_breakdown_already_animated_stats = 0}
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	change \{ui_song_breakdown_continuing_from_sb = 0}
	change \{song_breakdown_countdown_time = -1}
	change \{playing_song = 0}
	change \{sb_trans_flag = 0}
	disable_pause
	gamemode_gettype
	if (<type> = practice)
		spawnscriptnow \{kill_gem_scroller}
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'select_song_section'
			}}
		return
	endif
	change \{ui_song_breakdown_wrote_tr = 0}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
	if (<type> = quickplay)
		if ($last_song_played != jamsession)
			menu_top_rockers_check_for_new_top_score
			if (<new_score> != -1)
				change \{ui_song_breakdown_pulsate_helper_pill = 1}
			endif
		endif
	endif
endscript

script ui_create_song_breakdown 
	change \{ui_song_breakdown_helper_params = {
		}}
	change \{ui_song_breakdown_continuing_from_sb = 0}
	if should_use_all_buttons
		change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	change \{song_breakdown_busy_flag = 1}
	ui_song_breakdown_clear_ready_up_book_keeping
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		destroyscreenelement \{id = song_breakdown_noncompetitive_id}
	endif
	get_current_band_name savegame = <savegame>
	bandname = <band_name>
	gman_songtool_getcurrentsong
	my_song = <current_song>
	if ($game_mode != practice)
		if NOT ($last_song_played = none)
			my_song = ($last_song_played)
		endif
	endif
	get_song_title song = <my_song>
	gamemode_gettype
	if (<type> = practice)
		ui_create_song_breakdown_practice <...>
	else
		ui_create_song_breakdown_normal <...>
	endif
	change \{song_breakdown_busy_flag = 0}
endscript

script ui_destroy_song_breakdown 
	clean_up_user_control_helpers
	killspawnedscript \{name = pulsate_helper_pill}
	if screenelementexists \{id = my_breakdown_practice_id}
		destroyscreenelement \{id = my_breakdown_practice_id}
	endif
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :getsingletag \{num_stars}
			kill_outro_stars num_stars = <num_stars>
		endif
		if song_breakdown_noncompetitive_id :getsingletag \{players_list_id}
			if screenelementexists id = <players_list_id>
				destroyscreenelement id = <players_list_id>
			endif
		endif
		destroyscreenelement \{id = song_breakdown_noncompetitive_id}
	endif
	destroy2dparticlesystem \{id = ui_star_particles}
	change \{song_breakdown_busy_flag = 0}
	reset_song_loading_hack_global
endscript

script ui_deinit_song_breakdown 
	change \{song_breakdown_countdown_time = -1}
	change \{song_breakdown_countdown_time_added = 0}
	change \{ui_song_breakdown_already_animated_stats = 0}
	printf \{channel = zdebug
		qs(0xf4674b8a)}
	ui_song_breakdown_clean_up_highest_multipliers
endscript

script ui_song_breakdown_anim_in_script 
	setscriptcannotpause
	gamemode_gettype
	if (<type> = practice)
		return
	endif
	stars_alpha = 1.0
	startrendering \{reason = menu_transition}
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops {
			song_complete_stars_alpha = <stars_alpha> time = 0.1 anim = gentle
		}
		wait \{0.3
			second}
	endif
	change \{song_breakdown_busy_flag = 0}
endscript

script ui_song_breakdown_anim_out_script 
	setscriptcannotpause
	gamemode_gettype
	if (<type> = practice)
		return
	endif
	startrendering \{reason = menu_transition}
	clean_up_user_control_helpers
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops \{song_complete_stars_alpha = 0
			time = 0.05
			anim = gentle}
		wait \{0.3
			second}
	endif
endscript

script ui_create_song_breakdown_practice 
	disable_pause
	progression_updatedetailedstatsforgig \{failed_or_practice}
	getfirstplayer
	ui_song_breakdown_get_basic_player_data player_index = <player>
	formattext textname = percent_text qs(0x581d2af2) p = ($practice_current_percentage) decimalplaces = 0
	createscreenelement {
		parent = root_window
		id = my_breakdown_practice_id
		type = descinterface
		desc = 'song_breakdown_practice'
		dlog_title_text = <song_title>
		dlog_continue_notes_entry_text = <percent_text>
		dlog_continue_streak_entry_text = <streak_text>
		icon_difficulty_medium_texture = <diff_texture>
		dlog_fail_song_difficulty_text = <difficulty_text>
		exclusive_device = ($primary_controller)
	}
	my_breakdown_practice_id :desc_resolvealias \{name = alias_dlog_vmenu}
	setscreenelementprops {
		id = <resolved_id>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	createscreenelement {
		parent = <resolved_id>
		type = textelement
		font = fontgrid_title_a1
		text = qs(0x4994d173)
		scale = 0.5
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_restart_song}
		]
	}
	createscreenelement {
		parent = <resolved_id>
		type = textelement
		font = fontgrid_title_a1
		text = qs(0x1d227332)
		scale = 0.5
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_song_summary_details}}
		]
	}
	createscreenelement {
		parent = <resolved_id>
		type = textelement
		font = fontgrid_title_a1
		text = qs(0xde4bb13a)
		scale = 0.5
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_select_song_section data = {from_in_game = 1}}}
		]
	}
	if NOT playerinfoequals \{1
			part = vocals}
		createscreenelement {
			parent = <resolved_id>
			type = textelement
			font = fontgrid_title_a1
			text = qs(0x2586eb28)
			scale = 0.5
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_choose params = {state = uistate_practice_select_speed data = {from_song_breakdown = 1}}}
			]
		}
	endif
	createscreenelement {
		parent = <resolved_id>
		type = textelement
		font = fontgrid_title_a1
		text = qs(0x67d9c56d)
		scale = 0.5
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_replace params = {state = uistate_pausemenu_song_ended}}
		]
	}
	assignalias id = <resolved_id> alias = current_menu
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xc18d5e76) button = green z = 100000
	if my_breakdown_practice_id :desc_resolvealias \{name = alias_skullborder_animate
			param = skullborder_id}
		<skullborder_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if my_breakdown_practice_id :desc_resolvealias \{name = alias_skull_frame
			param = skull_frame_id}
		<skullborder_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'dschorn1'}
	endif
	if my_breakdown_practice_id :desc_resolvealias \{name = alias_flame2_container
			param = flame2_id}
		<flame2_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'dschorn1'}
	endif
	if my_breakdown_practice_id :desc_resolvealias \{name = alias_flame2_container
			param = flame2_id}
		<flame2_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	spawnscriptnow \{reset_mainmenu_camera}
endscript

script song_breakdown_is_single_player_game 
	gamemode_gettype
	if (issingleplayergame)
		return \{true}
	elseif (<type> = freeplay)
		freeplay_get_num_active_players
		if (<num_active_players> = 1)
			return \{true}
		endif
	endif
	return \{false}
endscript

script ui_create_song_breakdown_normal 
	unpausegame
	display_stats_index = 0
	soundevent \{event = menu_song_complete_in}
	achieved_gold_stars = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		get_percent_notes_hit player_index = <player>
		if gotparam \{percent_notes_hit}
			if (<percent_notes_hit> < 100)
				<achieved_gold_stars> = 0
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	get_current_band_name
	if song_breakdown_is_single_player_game
		getfirstplayer
		if (<type> = quickplay || $end_credits > 0)
			challenge_meter_alpha = 0
			challenge_na_text_alpha = 0
		else
			gman_challengemanagerfunc \{goal = career
				tool = challenges
				func = get_current_challenge}
			song_breakdown_check_if_challenge_applicable {
				challenge = <current_challenge>
				player = <player>
			}
			challenge_meter_alpha = 1
			if (<challenge_applicable> = 1)
				challenge_na_text_alpha = 0
			else
				challenge_na_text_alpha = 1
			endif
		endif
		getplayerinfo <player> part
		getplayerinfo <player> difficulty
		getplayerinfo <player> double_kick_drum
		ui_song_breakdown_get_player_difficulty_texture {
			part = <part>
			difficulty = <difficulty>
			double_kick_drum = <double_kick_drum>
		}
		switch <part>
			case guitar
			icon_fill = icon_guitar_fill
			icon_out = icon_guitar_out
			case bass
			icon_fill = icon_bass_fill
			icon_out = icon_bass_out
			case drum
			icon_fill = icon_drum_fill
			icon_out = icon_drum_out
			case vocals
			icon_fill = icon_vocals_fill
			icon_out = icon_vocals_out
			default
			icon_fill = icon_guitar_fill
			icon_out = icon_guitar_out
		endswitch
		createscreenelement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			type = descinterface
			desc = 'song_summary_single'
			band_name_text = <band_name>
			song_title_text = <song_title>
			hud_meter_challenge_alpha = <challenge_meter_alpha>
			challenge_na_text_alpha = <challenge_na_text_alpha>
			diff_icon_texture = <diff_texture>
			inst_icon_fill_texture = <icon_fill>
			inst_icon_out_texture = <icon_out>
			tags = {
				display_stats_index = <display_stats_index>
				transition_param = none
				num_stars = -1
				stats_finished_animating = 1
			}
		}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :obj_spawnscript ui_frazzmatazz
		else
			scriptassert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :obj_spawnscript ui_shakey
		else
			scriptassert \{'dschorn1'}
		endif
	else
		right_column_pos = (1018.0, -653.0)
		center_column_pos = (110.0, -420.0)
		if ($ui_song_breakdown_already_animated_stats = 1)
			<center_column_pos> = (110.0, 59.0)
			<right_column_pos> = (1022.0, 0.0)
		endif
		stats_finished_animating = 0
		if ($ui_song_breakdown_already_animated_stats = 1)
			stats_finished_animating = 1
		endif
		createscreenelement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			type = descinterface
			desc = 'song_summary_multi'
			band_name_text = <band_name>
			song_title_text = <song_title>
			center_column_pos = <center_column_pos>
			right_column_pos = <right_column_pos>
			tags = {
				display_stats_index = <display_stats_index>
				transition_param = none
				num_stars = -1
				stats_finished_animating = <stats_finished_animating>
			}
		}
		ui_song_breakdown_hide_player_data
		song_breakdown_assign_strips_data stats_index = <display_stats_index>
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :obj_spawnscript ui_frazzmatazz
		else
			scriptassert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :obj_spawnscript ui_shakey
		else
			scriptassert \{'dschorn1'}
		endif
	endif
	if ($ui_song_breakdown_already_animated_stats = 1)
		if issingleplayergame
			if (<type> = freeplay)
				freeplay_get_first_active_player
			else
				getfirstplayer
			endif
			getstarsfromdetailedstats player = <player>
		else
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			if (<player_num> != -1)
				getplayerinfo <player_num> band
			else
				getfirstplayer \{on_screen
					local}
				getplayerinfo <player> band
				printf \{qs(0xac40001b)}
			endif
			stars = ($song_stats_backup_band [(<band> - 1)].stars)
			song_breakdown_noncompetitive_id :obj_spawnscriptnow \{ui_song_breakdown_pulse_stats_arrows_spawned}
		endif
		formattext textname = stars_text qs(0x73307931) s = <stars>
		song_breakdown_noncompetitive_id :se_setprops stars_number_text = <stars_text>
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{anim_star_wiggle_loop
			params = {
			}}
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{song_summary_jiggle_kingwing
			params = {
				screen_id = song_breakdown_noncompetitive_id
			}}
		song_breakdown_noncompetitive_id :settags num_stars = <stars>
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	song_breakdown_assign_band_data song_name = <song_title>
	ui_song_breakdown_setup_handler_scripts <...>
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_add_page_counters
		if ($is_network_game = 1)
		endif
	endif
	if (<achieved_gold_stars> = 1)
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_diamondbling
					param = diamondbling_id}
				<diamondbling_id> :obj_spawnscript anim_bling params = {maxradius = 60 minradius = 20 maxtime = 0.8}
			else
				scriptassert \{'UI_art'}
			endif
			if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_diamondbling2
					param = diamondbling_id2}
				<diamondbling_id2> :obj_spawnscript anim_bling params = {maxradius = 60 minradius = 20 maxtime = 0.8}
			else
				scriptassert \{'UI_art'}
			endif
		endif
	endif
endscript

script ui_song_breakdown_normal_animate_stats 
	requireparams \{[
			num_stars
		]
		all}
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{song_summary_animate_kingwing
			params = {
				screen_id = song_breakdown_noncompetitive_id
			}}
		if (<num_stars> > 0)
			i = 1
			outro_stars num_stars = <num_stars>
			printf \{channel = sfx
				qs(0x0087a25e)}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 10
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			spawnscriptnow \{crowd_swells_during_stats_screen}
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 15) pitch = 0.0} time = 7}
			begin
			r = RandomInteger (90.0, 360.0)
			song_breakdown_noncompetitive_id :se_setprops {
				flying_star_pos = (0.0, 0.0)
				flying_star_rot_angle = <r>
				motion = ease_in
				time = 0.2
			}
			song_breakdown_noncompetitive_id :se_waitprops
			formattext textname = stars_text qs(0xfd68af01) i = <i>
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
			song_breakdown_noncompetitive_id :se_setprops \{stars_number_scale = 1.0
				song_summary_star_scale = 0.8
				song_summary_star2_scale = 1.0
				star_glow_alpha = 0
				star_glow_scale = 0.25
				motion = ease_out
				time = 0.2}
			song_breakdown_noncompetitive_id :se_waitprops
			song_breakdown_noncompetitive_id :se_setprops \{flying_star_pos = (363.0, -521.0)}
			song_breakdown_noncompetitive_id :se_waitprops
			<i> = (<i> + 1)
			repeat <num_stars>
			song_breakdown_noncompetitive_id :obj_spawnscriptnow \{create_ui_star_particles
				params = {
					pos = (360.0, 245.0)
				}}
			song_breakdown_noncompetitive_id :obj_spawnscriptnow \{anim_star_wiggle_loop
				params = {
				}}
		else
			formattext textname = stars_text qs(0xfd68af01) i = <num_stars>
			song_breakdown_noncompetitive_id :se_setprops {
				stars_number_text = <stars_text>
			}
		endif
		spawnscriptnow \{kill_only_oneshots}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (110.0, 55.0)
			time = 0.3
			motion = ease_in}
		wait \{0.3
			seconds}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (110.0, 65.0)
			time = 0.2
			motion = ease_out}
		wait \{0.2
			seconds}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (110.0, 59.0)
			time = 0.2
			motion = ease_in}
		wait \{0.2
			seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1022.0, -5.0)
			time = 0.3
			motion = ease_in}
		wait \{0.3
			seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1022.0, 5.0)
			time = 0.2
			motion = ease_out}
		wait \{0.2
			seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1022.0, 0.0)
			time = 0.2
			motion = ease_in}
		wait \{0.2
			seconds}
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{ui_song_breakdown_pulse_stats_arrows_spawned}
		song_breakdown_noncompetitive_id :settags \{stats_finished_animating = 1}
	endif
endscript

script song_breakdown_add_page_counters 
	gamemode_gettype
	i = 0
	getarraysize ($g_song_breakdown_noncompetitive_stats_order)
	stats_count = <array_size>
	if (<type> = quickplay || <type> = freeplay)
		stats_count = 0
		begin
		if (($g_song_breakdown_noncompetitive_stats_order [<i>].career_only) = 0)
			<stats_count> = (<stats_count> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_page_counter}
			getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			if (<array_size> < <stats_count>)
				begin
				createscreenelement {
					parent = <resolved_id>
					type = spriteelement
					texture = dot_64
					rgba = gh5_blue_xdk
					alpha = 0.4
					dims = (15.0, 15.0)
					just = [center , center]
					pos_anchor = [left , top]
					z_priority = 4
				}
				repeat (<stats_count> - <array_size>)
			endif
		endif
	endif
endscript

script song_breakdown_assign_strips_data 
	requireparams \{[
			stats_index
		]
		all}
	gamemode_gettype
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :getsingletag \{display_stats_index}
		song_breakdown_noncompetitive_id :se_setprops {
			stat_title_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].title_text)
		}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_page_counter}
			getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			if (<array_size> > 0)
				i = 0
				begin
				if (<i> = <display_stats_index>)
					dot_alpha = 1
				else
					dot_alpha = 0.4
				endif
				(<children> [<i>]) :se_setprops alpha = <dot_alpha>
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
		if (<type> = freeplay)
			freeplay_get_num_active_players
			num_players_shown = <num_active_players>
		else
			getnumplayersingame \{on_screen}
			if (<type> = career)
				gman_challengemanagerfunc \{goal = career
					tool = challenges
					func = get_current_challenge}
			endif
		endif
		if (<num_players_shown> > 0)
			if (<type> = freeplay)
				freeplay_get_first_active_player
			else
				getfirstplayer \{on_screen}
			endif
			<i> = 1
			begin
			formattext checksumname = player_stats_bg_panel 'alias_song_summary_playerStats_BG_%i' i = <i>
			if song_breakdown_noncompetitive_id :desc_resolvealias name = <player_stats_bg_panel>
				destroyscreenelement id = <resolved_id> preserve_parent
				song_breakdown_get_stat_value_and_instrument player_num = <player> stat_index = <display_stats_index>
				accuracy_caption_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].caption_text)
				percent_symbol_alpha = (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].use_unit_text) * 0.3)
				if (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].name) = score)
					stat_desc_name = 'song_summary_player_score'
				elseif (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].name) = challenge)
					stat_desc_name = 'song_summary_player_challenge'
				else
					stat_desc_name = 'song_summary_player_accuracy'
					getplayerinfo <player> part
					if (<part> = vocals)
						if (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].name) = streak)
							<accuracy_caption_text> = qs(0xb37e4ad9)
						elseif (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].name) = accuracy)
							if (<use_percent_symbol> = 0)
								<percent_symbol_alpha> = 0
							endif
						endif
					endif
				endif
				formattext checksumname = strip_rgba 'p%i_lt' i = <i>
				createscreenelement {
					parent = <resolved_id>
					type = descinterface
					desc = <stat_desc_name>
					pos_anchor = [left , top]
					just = [left , top]
					pos = (5.0, -47.0)
					icon_instrument_texture = <instrument_icon>
					icon_instrument_rgba = <instrument_rgba>
					accuracy_text = <stat_text>
					strip_rgba = <strip_rgba>
					accuracy_caption_text = <accuracy_caption_text>
					percent_symbol_alpha = <percent_symbol_alpha>
					percent_symbol_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].unit_text)
					z_priority = 3
					autosizedims = true
				}
				if (<stat_desc_name> = 'song_summary_player_challenge')
					<strip_id> = <id>
					<strip_id> :se_getprops
					if <strip_id> :desc_resolvealias name = alias_hud_meter_challenge param = challenge_meter_id
						if NOT <challenge_meter_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
							scriptassert \{'Assert'}
						endif
						<dx> = (360.0 / ($challange_meter_num_ticks))
						<degree> = 0
						<cnt> = 0
						begin
						createscreenelement {
							type = spriteelement
							parent = <led_container>
							alpha = 0.0
							pos_anchor = [center center]
							rot_angle = <degree>
							pos = (0.0, 0.0)
							texture = meter_challenge_led
						}
						<degree> = (<degree> + <dx>)
						<cnt> = (<cnt> + 1)
						repeat ($challange_meter_num_ticks)
						if ($end_credits > 0)
							challenge_applicable = 0
						else
							song_breakdown_check_if_challenge_applicable {
								challenge = <current_challenge>
								player = <player>
							}
						endif
						if (<challenge_applicable> = 1)
							if (<is_band_challenge> = 1)
								current_player = <player>
								if (<type> = freeplay)
									freeplay_get_first_active_player
								else
									getfirstplayer \{on_screen}
								endif
								first_player = <player>
								<player> = <current_player>
								gman_getdata goal = <current_challenge> player = <first_player> name = meter_high
							else
								gman_getdata goal = <current_challenge> player = <player> name = meter_high
							endif
							song_breakdown_get_highest_completed_challenge_level current_challenge = <current_challenge> meter_high = <meter_high>
							fill_challenge_meter_to percent = <percent_to_next> player = <player> level = <highest_completed> challenge_meter_id = <challenge_meter_id>
							<strip_id> :se_setprops challenge_na_text_alpha = 0
						else
							<strip_id> :se_setprops challenge_na_text_alpha = 1
						endif
					endif
				endif
				ui_song_breakdown_get_player_display_name player_index = <player>
				formattext checksumname = player_name_checksum 'p%i_name_text' i = <i>
				addparam structure_name = player_name name = <player_name_checksum> value = <player_name_text>
				formattext checksumname = player_name_rgba_checksum 'p%i_name_rgba' i = <i>
				addparam structure_name = player_name name = <player_name_rgba_checksum> value = <strip_rgba>
				formattext checksumname = player_name_bg_rgba 'p%i_name_BG_rgba' i = <i>
				formattext checksumname = player_name_bg_rgba_val 'p%i_md' i = <i>
				addparam structure_name = player_name name = <player_name_bg_rgba> value = <player_name_bg_rgba_val>
				song_breakdown_noncompetitive_id :se_setprops {
					<player_name>
				}
				leader_icon_alpha = 0
				getplayerinfo <player> controller
				if innetgame
					player_controller = <controller>
					getplayerinfo ($g_net_leader_player_num) controller
					if (<player_controller> = <controller>)
						<leader_icon_alpha> = 1
						<controller> = <player_controller>
					endif
				else
					if (<controller> = ($primary_controller))
						leader_icon_alpha = 1
					endif
				endif
				formattext checksumname = leader_icon_alpha_checksum 'leader_icon_p%i_alpha' i = <i>
				addparam structure_name = leader_icon name = <leader_icon_alpha_checksum> value = <leader_icon_alpha>
				if (<leader_icon_alpha> = 0)
					formattext checksumname = leader_icon_dims_checksum 'leader_icon_p%i_dims' i = <i>
					addparam structure_name = leader_icon name = <leader_icon_dims_checksum> value = (0.0, 0.0)
				endif
				song_breakdown_noncompetitive_id :se_setprops {
					<leader_icon>
				}
			endif
			if (<type> = freeplay)
				freeplay_get_next_active_player player = <player>
			else
				getnextplayer on_screen player = <player>
			endif
			<i> = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script song_breakdown_get_stat_value_and_instrument 
	requireparams \{[
			player_num
			stat_index
		]
		all}
	use_percent_symbol = 1
	ui_song_breakdown_get_basic_player_data player_index = <player_num> no_units
	switch ($g_song_breakdown_noncompetitive_stats_order [<stat_index>].name)
		case accuracy
		stat_text = <percent_text>
		case score
		stat_text = <score_text>
		case streak
		stat_text = <streak_text>
		case multiplier
		getplayerinfo <player_num> highest_multiplier
		formattext textname = stat_text qs(0x99046a05) m = <highest_multiplier>
		case challenge
		stat_text = qs(0x7d85a5c3)
		default
		scriptassert \{'could not find stat to display'}
	endswitch
	getplayerinfo <player_num> part
	if (<part> = vocals)
		if (<vocal_phrase_max_qual> <= 0)
			<use_percent_symbol> = 0
		endif
	endif
	return stat_text = <stat_text> instrument_icon = <icon_texture> use_percent_symbol = <use_percent_symbol>
endscript

script song_breakdown_scroll_stats 
	requireparams \{[
			direction
			device_num
		]
		all}
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :getsingletag \{stats_finished_animating}
		if (<stats_finished_animating> = 1)
			if (<device_num> = ($primary_controller))
				gamemode_gettype
				song_breakdown_noncompetitive_id :getsingletag \{display_stats_index}
				new_stat_index_found = 0
				getarraysize ($g_song_breakdown_noncompetitive_stats_order)
				if ((<direction> = left) || (<direction> = up))
					unit_to_add = -1
				else
					unit_to_add = 1
				endif
				new_display_stats_index = (<display_stats_index> + <unit_to_add>)
				begin
				if (<new_display_stats_index> < 0)
					<new_display_stats_index> = (<array_size> - 1)
				elseif (<new_display_stats_index> >= <array_size>)
					<new_display_stats_index> = 0
				endif
				if (<type> = quickplay || <type> = freeplay || $end_credits > 0)
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
				repeat <array_size>
				if (<new_stat_index_found> = 1)
					song_breakdown_noncompetitive_id :settags display_stats_index = <new_display_stats_index>
					song_breakdown_assign_strips_data stats_index = <new_display_stats_index>
				endif
				switch (<direction>)
					case up
					case right
					generic_menu_up_or_down_sound \{up}
					case down
					case left
					generic_menu_up_or_down_sound \{down}
				endswitch
			endif
		endif
	endif
endscript

script song_breakdown_strips_focus 
	requireparams \{[
			strip_id
		]
		all}
	<strip_id> :se_setprops character_name_rgba = blue2_md
endscript

script song_breakdown_strips_unfocus 
	requireparams \{[
			strip_id
		]
		all}
	<strip_id> :se_setprops character_name_rgba = [220 122 5 255]
endscript
song_breakdown_countdown_time = -1
song_breakdown_countdown_time_added = 0

script net_ui_song_breakdown_wait_for_timer \{timer_text = qs(0xea4574ef)}
	requireparams \{[
			screen_id
		]
		all}
	if ($song_breakdown_countdown_time = -1)
		change song_breakdown_countdown_time = ($net_song_breakdown_countdown_time)
	endif
	<screen_id> :se_setprops {
		net_timer_text_alpha = 0
	}
	formattext textname = timer_msg qs(0x7ec60bb6) t = <timer_text> d = ($song_breakdown_countdown_time)
	add_user_control_helper text = <timer_msg> button = none z = 100000
	<requested_count> = 0
	begin
	if ($song_breakdown_countdown_time < 0)
		change \{song_breakdown_countdown_time = 0}
	endif
	formattext textname = timer_msg qs(0x7ec60bb6) t = <timer_text> d = ($song_breakdown_countdown_time)
	if screenelementexists id = <helper_pill_id>
		<helper_pill_id> :se_setprops {
			helper_description_text = <timer_msg>
		}
	else
		add_user_control_helper text = <timer_msg> button = none z = 100000
	endif
	if (($song_breakdown_countdown_time) <= 0 && ($song_breakdown_countdown_time_added = 1 || $song_breakdown_countdown_time_added = 0))
		break
	elseif ($song_breakdown_countdown_time_added = 2)
		<requested_count> = (<requested_count> + 1)
		if (<requested_count> >= 3)
			break
		endif
	endif
	change song_breakdown_countdown_time = (($song_breakdown_countdown_time) - 1)
	wait \{1
		second}
	repeat
	launchevent type = unfocus target = <screen_id>
	wait \{1
		second}
	user_control_destroy_helper \{button = none}
	change \{song_breakdown_countdown_time = -2}
	<screen_id> :se_setprops {
		net_timer_text_alpha = 0
	}
endscript

script net_ui_song_breakdown_start_timer_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	obj_getid
	screen_id = <objid>
	gamemode_gettype
	if ($is_network_game = 1)
		if NOT (<type> = career && (($game_mode) = fest_mode) || (($game_mode) = fest_mode_team))
			change \{net_ready_to_start = 0}
		endif
	endif
	net_ui_song_breakdown_wait_for_timer screen_id = <screen_id>
	launchevent type = unfocus target = <screen_id>
	if ($is_network_game = 1)
		if gotparam \{continue_to_next_song}
			if (<type> = career)
				change \{songtime_paused = 0}
				generic_event_back \{nosound
					state = uistate_gameplay}
			elseif ($game_mode = fest_mode || $game_mode = fest_mode_team)
				display_competitive_rules_voting \{voting_callback = song_breakdown_back_to_gameplay}
			elseif (<type> = pro_faceoff || <type> = competitive)
				song_breakdown_back_to_gameplay
			else
				generic_net_sync \{callback = net_song_breakdown_timer_complete_callback}
			endif
		elseif (<type> = career)
			if ishost
				getplayerinfo ($g_net_leader_player_num) controller
				net_ui_song_breakdown_continue_to_next_screen_gig_complete device_num = <controller>
			endif
		else
			net_ui_song_breakdown_go_to_setlist device_num = ($primary_controller)
		endif
	else
		if ((<type> = career) || (<type> = quickplay))
			net_song_breakdown_end_of_timer_transition_local <...>
		else
			net_song_breakdown_competitive_end_of_timer_transition_local <...>
		endif
	endif
endscript

script net_song_breakdown_timer_complete_callback 
	change \{songtime_paused = 0}
	resetyieldinfo \{yield = false}
	stoprendering
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script net_song_breakdown_add_to_timer 
	if ($song_breakdown_countdown_time_added = 0 || $song_breakdown_countdown_time_added = 2)
		change \{song_breakdown_countdown_time_added = 1}
		if ishost
			change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
			sendstructure \{callback = net_song_breakdown_add_to_timer
				data_to_send = {
					none
				}}
		else
			change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
		endif
	endif
endscript

script net_song_breakdown_end_of_timer_transition_local 
	if gotparam \{end_of_setlist_transition}
		ui_song_breakdown_continue_to_next_screen_gig_complete
	elseif gotparam \{encore_transition}
		ui_song_breakdown_continue_to_next_screen_encore
	elseif (gotparam add_setlist_continue_handlers)
		if ((($sb_trans_flag) = 1) || (gotparam add_setlist_continue_handlers))
			ui_song_breakdown_continue_to_next_screen_song_transition
		endif
	endif
endscript

script song_breakdown_assign_band_data 
	requireparams \{[
			song_name
		]
		all}
	challenge_text = qs(0x03ac90f0)
	band_challenge_alpha = 0
	gamemode_gettype
	if (<type> = career)
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if song_breakdown_is_single_player_game
		if (<type> = freeplay)
			freeplay_get_first_active_player
		else
			getfirstplayer
		endif
		ui_song_breakdown_get_basic_player_data player_index = <player>
		streak_caption_text = qs(0x9a210119)
		getplayerinfo <player> part
		if (<part> = vocals)
			streak_caption_text = qs(0xb37e4ad9)
		endif
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_name>
			score_main_text = <score_text>
			accuracy_main_text = <percent_text>
			streak_main_text = <streak_text>
			streak_caption_text = <streak_caption_text>
		}
		if (<type> = career)
			if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_hud_meter_challenge
					param = challenge_meter_id}
				if NOT <challenge_meter_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
					scriptassert \{'Assert'}
				endif
				<dx> = (360.0 / ($challange_meter_num_ticks))
				<degree> = 0
				<cnt> = 0
				begin
				createscreenelement {
					type = spriteelement
					parent = <led_container>
					alpha = 0.0
					pos_anchor = [center center]
					rot_angle = <degree>
					pos = (0.0, 0.0)
					texture = meter_challenge_led
				}
				<degree> = (<degree> + <dx>)
				<cnt> = (<cnt> + 1)
				repeat ($challange_meter_num_ticks)
				if ($end_credits = 0)
					song_breakdown_check_if_challenge_applicable {
						challenge = <current_challenge>
						player = <player>
					}
					if (<challenge_applicable> = 1)
						gman_getdata goal = <current_challenge> player = <player> name = meter_high
						song_breakdown_get_highest_completed_challenge_level current_challenge = <current_challenge> meter_high = <meter_high>
						fill_challenge_meter_to percent = <percent_to_next> player = <player> level = <highest_completed> challenge_meter_id = <challenge_meter_id>
					endif
				endif
			endif
		else
			song_breakdown_noncompetitive_id :se_setprops \{hud_meter_challenge_alpha = 0}
		endif
	else
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		if (<player_num> != -1)
			getplayerinfo <player_num> band
		else
			getfirstplayer \{on_screen
				local}
			getplayerinfo <player> band
			printf \{qs(0xac40001b)}
		endif
		b_note_streak = ($song_stats_backup_band [(<band> - 1)].high_1p_streak)
		if (($song_stats_backup_band [(<band> - 1)].high_2p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<band> - 1)].high_2p_streak)
		endif
		if (($song_stats_backup_band [(<band> - 1)].high_3p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<band> - 1)].high_3p_streak)
		endif
		if (($song_stats_backup_band [(<band> - 1)].high_4p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<band> - 1)].high_4p_streak)
		endif
		score = ($song_stats_backup_band [(<band> - 1)].score)
		b_high_mult = ($song_stats_backup_band [(<band> - 1)].high_mult)
		casttointeger \{b_high_mult}
		casttointeger \{score}
		formattext textname = song_text qs(0x4d4555da) s = <song_name>
		formattext textname = band_score_text qs(0xb22939c6) n = <score> decimalplaces = 0 usecommas
		formattext textname = band_high_mult_text qs(0x2543b917) n = <b_high_mult>
		formattext textname = band_high_note_streak qs(0xb22939c6) n = <b_note_streak>
		stars = ($song_stats_backup_band [(<band> - 1)].stars)
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_text>
			score_main_text = <band_score_text>
			accuracy_main_text = <band_high_mult_text>
			accuracy_caption_text = qs(0xb823b02f)
			streak_main_text = <band_high_note_streak>
			streak_caption_text = qs(0xf475f778)
		}
	endif
	if ($ui_song_breakdown_already_animated_stats = 0)
		song_breakdown_noncompetitive_id :se_setprops \{stars_number_text = qs(0x03ac90f0)}
		song_breakdown_noncompetitive_id :settags num_stars = <stars>
		song_breakdown_noncompetitive_id :obj_spawnscriptnow ui_song_breakdown_normal_animate_stats params = {num_stars = <stars>}
		change \{ui_song_breakdown_already_animated_stats = 1}
	endif
endscript

script song_breakdown_get_highest_completed_challenge_level 
	requireparams \{[
			current_challenge
			meter_high
		]
		all}
	highest_completed = 0
	if (<meter_high> >= ($<current_challenge>.gold_descrip))
		highest_completed = 1
	endif
	if (<meter_high> >= ($<current_challenge>.platinum_descrip))
		highest_completed = 2
	endif
	if (<meter_high> >= ($<current_challenge>.diamond_descrip))
		highest_completed = 3
	endif
	switch <highest_completed>
		case 3
		percent_to_next = 0
		case 2
		percent_to_next = (((<meter_high> - ($<current_challenge>.platinum_descrip)) * 1.0) / ((($<current_challenge>.diamond_descrip) - ($<current_challenge>.platinum_descrip)) * 1.0))
		case 1
		percent_to_next = (((<meter_high> - ($<current_challenge>.gold_descrip)) * 1.0) / ((($<current_challenge>.platinum_descrip) - ($<current_challenge>.gold_descrip)) * 1.0))
		case 0
		default
		percent_to_next = ((<meter_high> * 1.0) / (($<current_challenge>.gold_descrip) * 1.0))
	endswitch
	return highest_completed = <highest_completed> percent_to_next = <percent_to_next>
endscript

script song_breakdown_check_if_challenge_applicable 
	requireparams \{[
			challenge
			player
		]
		all}
	challenge_applicable = 0
	getplayerinfo <player> part
	required_band = (($<challenge>).required_band)
	getarraysize <required_band>
	if (<array_size> > 0)
		if (<array_size> = 1)
			switch (<required_band> [0])
				case lead
				if (<part> = guitar)
					challenge_applicable = 1
				endif
				case bass
				if (<part> = bass)
					challenge_applicable = 1
				endif
				case drum
				if (<part> = drum)
					challenge_applicable = 1
				endif
				case vocal
				if (<part> = vocals)
					challenge_applicable = 1
				endif
				default
				song_breakdown_check_if_band_challenge_applicable challenge = <challenge>
				challenge_applicable = <band_challenge_applicable>
			endswitch
			is_band_challenge = 0
		else
			song_breakdown_check_if_band_challenge_applicable challenge = <challenge>
			challenge_applicable = <band_challenge_applicable>
			is_band_challenge = 1
		endif
	endif
	return {
		challenge_applicable = <challenge_applicable>
		is_band_challenge = <is_band_challenge>
	}
endscript

script song_breakdown_check_if_band_challenge_applicable 
	requireparams \{[
			challenge
		]
		all}
	band_challenge = 0
	getnumplayersingame
	getarraysize (($<challenge>).required_band)
	if (<num_players> >= <array_size>)
		<band_challenge> = 1
	endif
	return band_challenge_applicable = <band_challenge>
endscript

script ui_song_breakdown_setup_handler_scripts 
	continue_script = nullscript
	back_script = nullscript
	option_script = nullscript
	option2_script = nullscript
	continue_text = qs(0x182f0173)
	back_text = qs(0x03ac90f0)
	option_text = qs(0x3f11367e)
	option2_text = qs(0x88572463)
	back_params = {}
	option_params = {}
	option2_params = {}
	transition_param = none
	can_scroll_stats = 1
	gamemode_gettype
	if gotparam \{end_of_setlist_transition}
		transition_param = end_of_setlist_transition
		if ($is_network_game = 1)
			getnumplayers
			get_local_players_in_game
			if NOT (<num_local_players> >= <num_players>)
				continue_script = net_ui_song_breakdown_continue_to_next_screen_gig_complete
			endif
			back_script = postgame_lobby_quit
			back_params = {id = song_breakdown_noncompetitive_id}
			back_text = qs(0x67d9c56d)
			if NOT (<num_local_players> >= <num_players>)
				option_script = song_breakdown_go_to_stats_from_transition
				option_params = {transition_param = <transition_param>}
			endif
			option2_script = net_ui_song_breakdown_show_players_list
			option2_text = qs(0xd16792bf)
			option2_params = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 0)
				continue_text = qs(0x03ac90f0)
			endif
		elseif is_current_song_a_jam_session
			continue_script = ui_song_breakdown_continue_to_next_screen_gig_complete
		else
			continue_script = ui_song_breakdown_continue_to_next_screen_gig_complete
			option_script = song_breakdown_go_to_stats_from_transition
			option_params = {transition_param = <transition_param>}
			if (<type> = quickplay)
				option2_script = song_breakdown_run_top_rockers_from_transition
			endif
		endif
		transition_param = end_of_setlist_transition
	elseif gotparam \{encore_transition}
		continue_script = ui_song_breakdown_continue_to_next_screen_encore
		if ($is_network_game = 0)
			option_script = song_breakdown_go_to_stats_from_transition
		else
			option2_script = net_ui_song_breakdown_show_players_list
			option2_text = qs(0xd16792bf)
			option2_params = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 0)
				continue_text = qs(0x03ac90f0)
			endif
		endif
		transition_param = encore_transition
	elseif ((gotparam continue_setlist_transition) || (gotparam add_setlist_continue_handlers))
		if gotparam \{continue_setlist_transition}
			transition_param = continue_setlist_transition
			<can_scroll_stats> = 0
		else
			transition_param = add_setlist_continue_handlers
		endif
		if ((($sb_trans_flag) = 1) || (gotparam add_setlist_continue_handlers))
			transition_param = add_setlist_continue_handlers
			<can_scroll_stats> = 1
			if NOT innetgame
				continue_script = ui_song_breakdown_continue_to_next_screen_song_transition
			endif
			if ($last_song_played != jamsession)
				if innetgame
					getnumplayers
					get_local_players_in_game
					if NOT (<num_local_players> >= <num_players>)
						option_script = song_breakdown_go_to_stats_from_transition
						option_params = {transition_param = <transition_param>}
					endif
				else
					option_script = song_breakdown_go_to_stats_from_transition
					option_params = {transition_param = <transition_param>}
				endif
				if NOT innetgame
					if (<type> = quickplay)
						option2_script = song_breakdown_run_top_rockers_from_transition
					endif
				endif
			endif
			if ($is_network_game = 1)
				option2_script = net_ui_song_breakdown_show_players_list
				option2_text = qs(0xd16792bf)
				option2_params = {
					screen_id = song_breakdown_noncompetitive_id
					destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
				}
				getnumplayers
				get_local_players_in_game
				if (<num_local_players> >= <num_players>)
					back_script = postgame_lobby_quit
					back_params = {id = song_breakdown_noncompetitive_id}
					back_text = qs(0x67d9c56d)
				else
					if NOT (gotparam no_timer)
						song_breakdown_noncompetitive_id :obj_spawnscriptnow net_ui_song_breakdown_start_timer_spawned params = {<...> continue_to_next_song}
					endif
				endif
			endif
		endif
	elseif (gotparam net_transition_not_career)
		transition_param = net_transition_not_career
		if ($is_network_game = 1)
			getnumplayers
			get_local_players_in_game
			if NOT (<num_local_players> >= <num_players>)
				continue_script = net_ui_song_breakdown_go_to_setlist
				continue_text = qs(0xd31dcde6)
				option_script = song_breakdown_go_to_stats_from_transition
				option_text = qs(0x3f11367e)
				option_params = {transition_param = <transition_param>}
			endif
			option2_script = net_ui_song_breakdown_show_players_list
			option2_text = qs(0xd16792bf)
			option2_params = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			back_script = postgame_lobby_quit
			back_params = {id = song_breakdown_noncompetitive_id}
			back_text = qs(0x67d9c56d)
		endif
	else
		scriptassert \{'Invalid transition from song breakdown'}
	endif
	if (gotparam no_wait)
		spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
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
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			can_scroll_stats = <can_scroll_stats>
			no_wait
		}
	else
		spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
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
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			can_scroll_stats = <can_scroll_stats>
		}
	endif
endscript

script net_ui_song_breakdown_focus_player_strips_menu_for_rocker_record 
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if isscreenelementinfocus \{id = song_breakdown_noncompetitive_id}
			launchevent \{type = unfocus
				target = song_breakdown_noncompetitive_id}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_player_stats_element}
			launchevent type = focus target = <resolved_id> data = {child_index = 0}
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		else
			scriptassert \{'could not find player strips menu to focus'}
		endif
	endif
endscript

script net_ui_song_breakdown_unfocus_player_strips_menu 
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_player_stats_element}
			if isscreenelementinfocus id = <resolved_id>
				launchevent type = unfocus target = <resolved_id>
			endif
		endif
		clean_up_user_control_helpers
		ui_song_breakdown_setup_handler_scripts \{net_transition_not_career
			no_wait}
	endif
endscript

script net_ui_song_breakdown_launch_rock_record 
	requireparams \{[
			parent_id
			player
			unfocus_id
		]
		all}
	getplayerinfo <player> gamertag
	xuid = [0 0]
	getplayerinfo <player> net_id_first
	getplayerinfo <player> net_id_second
	setarrayelement arrayname = xuid index = 0 newvalue = <net_id_first>
	setarrayelement arrayname = xuid index = 1 newvalue = <net_id_second>
	name = $<gamertag>
	clean_up_user_control_helpers
	display_rock_record {
		device_num = <device_num>
		net_id = <xuid>
		player_name = <name>
		unfocus_id = <unfocus_id>
		parent = <parent_id>
	}
endscript

script net_ui_song_breakdown_show_players_list 
	requireparams \{[
			device_num
			screen_id
			destroy_players_list_script
		]
		all}
	if (<device_num> = ($primary_controller))
		launchevent type = unfocus target = <screen_id>
		band_lobby_create_popup_menu_players_list \{list_type = matchmaking_done}
		assignalias \{id = current_menu
			alias = band_lobby_popup_menu}
		if current_menu :getsingletag \{desc_id}
			<screen_id> :settags players_list_id = <desc_id>
			current_menu :se_setprops {
				event_handlers = [
					{
						pad_back
						<destroy_players_list_script>
						params = {
							players_list_id = <desc_id>
						}
					}
				]
			}
			launchevent \{type = focus
				target = current_menu}
			add_user_control_helper controller = ($primary_controller) text = qs(0xaf4d5dd2) button = red z = 100000
		endif
	endif
endscript

script net_ui_song_breakdown_destroy_players_list 
	requireparams \{[
			players_list_id
		]
		all}
	destroyscreenelement id = <players_list_id>
	launchevent \{type = focus
		target = song_breakdown_noncompetitive_id}
	clean_up_user_control_helpers
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :getsingletag \{transition_param}
			ui_song_breakdown_setup_handler_scripts <transition_param> no_wait no_timer
		endif
	endif
endscript

script ui_return_song_breakdown 
	clean_up_user_control_helpers
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if NOT screenelementexists \{id = band_lobby_popup_menu}
			if song_breakdown_noncompetitive_id :getsingletag \{transition_param}
				ui_song_breakdown_setup_handler_scripts <transition_param> no_wait
			endif
		else
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
		endif
	endif
endscript

script ui_song_breakdown_hide_player_data 
	gamemode_gettype
	if (<type> != freeplay)
		getnumplayersingame
	else
		freeplay_get_num_active_players
		num_players = <num_active_players>
	endif
	if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_player_stat_list}
		num_data_strips_to_hide = (4 - <num_players>)
		if (<num_data_strips_to_hide> > 0)
			getscreenelementchildren id = <resolved_id>
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
	getscorefromdetailedstats player = <player_index>
	getbestrunfromdetailedstats player = <player_index>
	getmaxnotesfromdetailedstats player = <player_index>
	getnoteshitfromdetailedstats player = <player_index>
	getstarsfromdetailedstats player = <player_index>
	getvocalstreakphrasesfromdetailedstats player = <player_index>
	getvocalphrasequalityfromdetailedstats player = <player_index>
	getvocalphrasemaxqualfromdetailedstats player = <player_index>
	gettotalnotesfromdetailedstats player = <player_index>
	getplayerinfo <player_index> part
	getplayerinfo <player_index> difficulty
	if (<max_notes> = 0)
		max_notes = 1
	endif
	getplayerinfo <player_index> difficulty
	get_difficulty_text difficulty = <difficulty>
	casttointeger \{score}
	formattext textname = score_text qs(0x73307931) s = <score> usecommas
	ui_song_breakdown_get_player_display_name player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			<percent_notes_hit> = 1
		endif
		if gotparam \{no_units}
			formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		else
			formattext textname = percent_text qs(0xea41c83d) p = <percent_notes_hit>
		endif
		formattext textname = streak_text qs(0x8c5c152d) n = <best_run> decimalplaces = 0
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			mathfloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
			if gotparam \{no_units}
				formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit> decimalplaces = 0
			else
				formattext textname = percent_text qs(0xea41c83d) p = <percent_notes_hit> decimalplaces = 0
			endif
		else
			<percent_text> = qs(0x6a5cf46c)
		endif
		formattext textname = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> decimalplaces = 0
	endif
	formattext \{textname = cash_text
		qs(0x03ac90f0)}
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
	requireparams \{[
			player_index
		]
		all}
	<name> = qs(0x00000000)
	if (($is_network_game = 1) || isps3)
		getplayerinfo <player_index> gamertag
		name = ($<gamertag>)
	else
		getplayerinfo <player_index> controller
		if isxenonorwindx
			if NOT ((<controller> < 0) || (<controller> > 3))
				if getlocalgamertag controller = <controller>
					<name> = <gamertag>
				endif
			endif
		endif
	endif
	if (<name> = qs(0x00000000))
		formattext textname = player_name_text qs(0x5c5cedaa) p = <player_index>
	else
		<player_name_text> = <name>
	endif
	return player_name_text = <player_name_text>
endscript

script ui_song_breakdown_get_player_instrument_texture 
	requireparams \{[
			part
		]
		all}
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case vocals
		icon_texture = mixer_icon_vox
	endswitch
	return icon_texture = <icon_texture>
endscript

script ui_song_breakdown_get_player_difficulty_texture 
	requireparams \{[
			part
			difficulty
			double_kick_drum
		]
		all}
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
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script ui_song_breakdown_add_handlers_for_next_transition_spawned 
	requireparams \{[
			screen_element_id
			continue_script
			back_script
			option_script
			option2_script
			continue_text
			back_text
			option_text
			option2_text
			transition_param
			can_scroll_stats
		]
		all}
	finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned'}
	if issingleplayergame
		array = []
	else
		if (<can_scroll_stats> = 1)
			array = [
				{pad_up song_breakdown_scroll_stats params = {direction = up}}
				{pad_down song_breakdown_scroll_stats params = {direction = down}}
				{pad_left song_breakdown_scroll_stats params = {direction = left}}
				{pad_right song_breakdown_scroll_stats params = {direction = right}}
			]
		else
			array = []
		endif
	endif
	if NOT (<continue_script> = nullscript)
		if gotparam \{continue_params}
			addarrayelement array = <array> element = {pad_choose <continue_script> params = <continue_params>}
		else
			addarrayelement array = <array> element = {pad_choose <continue_script>}
		endif
		if (<continue_text> != qs(0x03ac90f0))
			add_user_control_helper ($ui_song_breakdown_helper_params) text = <continue_text> button = green z = 100000
		endif
	endif
	if NOT (<back_script> = nullscript)
		if gotparam \{back_params}
			addarrayelement array = <array> element = {pad_back <back_script> params = <back_params>}
		else
			addarrayelement array = <array> element = {pad_back <back_script>}
		endif
		if (<back_text> != qs(0x03ac90f0))
			add_user_control_helper ($ui_song_breakdown_helper_params) text = <back_text> button = red z = 100000
		endif
	endif
	if NOT (<option2_script> = nullscript)
		if gotparam \{option2_params}
			addarrayelement array = <array> element = {pad_option2 <option2_script> params = <option2_params>}
		else
			addarrayelement array = <array> element = {pad_option2 <option2_script>}
		endif
		if (<option2_text> != qs(0x03ac90f0))
			add_user_control_helper ($ui_song_breakdown_helper_params) text = <option2_text> button = yellow z = 100000
		endif
		if NOT innetgame
			if (($ui_song_breakdown_pulsate_helper_pill) = 1)
				spawnscriptlater pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5}
			endif
		endif
	endif
	if NOT (<option_script> = nullscript)
		if gotparam \{option_params}
			addarrayelement array = <array> element = {pad_option <option_script> params = <option_params>}
		else
			addarrayelement array = <array> element = {pad_option <option_script>}
		endif
		if (<option_text> != qs(0x03ac90f0))
			add_user_control_helper ($ui_song_breakdown_helper_params) text = <option_text> button = blue z = 100000
		endif
	endif
	<screen_element_id> :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
	<screen_element_id> :settags transition_param = <transition_param>
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - Not bot play'}
		song_breakdown_get_exclusive_devices
		if screenelementexists id = <screen_element_id>
			<screen_element_id> :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if (($sb_trans_flag) = 1)
		finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - ( ($sb_trans_flag) = 1 )'}
		change \{sb_trans_flag = 0}
	else
		finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - ( ($sb_trans_flag) != 1 )'}
		if NOT (gotparam no_wait)
			finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - Waiting 10 gameframes'}
			wait \{10
				gameframes}
		else
			finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - no_wait'}
		endif
	endif
	finalprintf \{'ui_song_breakdown_add_handlers_for_next_transition_spawned - Done with any waiting'}
	if screenelementexists id = <screen_element_id>
		if NOT isscreenelementinfocus id = <screen_element_id>
			finalprintf 'ui_song_breakdown_add_handlers_for_next_transition_spawned - Setting focus on %a' a = <screen_element_id>
			launchevent type = focus target = <screen_element_id>
		else
			finalprintf 'ui_song_breakdown_add_handlers_for_next_transition_spawned - %a already has focus' a = <screen_element_id>
		endif
	else
		finalprintf 'ui_song_breakdown_add_handlers_for_next_transition_spawned - %a does not exist' a = <screen_element_id>
	endif
endscript

script song_breakdown_run_top_rockers_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	launchevent \{type = unfocus
		target = song_breakdown_noncompetitive_id}
	change \{sb_trans_flag = 1}
	change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	song_breakdown_run_top_rockers
endscript

script song_breakdown_run_top_rockers 
	printf \{channel = zdebug
		qs(0xbe7fb27a)}
	killspawnedscript \{name = net_ui_song_breakdown_start_timer_spawned}
	change \{song_breakdown_countdown_time = -1}
	if (($ui_song_breakdown_wrote_tr) = 0)
		change \{ui_song_breakdown_wrote_tr = 1}
		change \{ui_song_breakdown_pulsate_helper_pill = 0}
		generic_event_choose \{state = uistate_top_rockers
			data = {
				write_scores = 1
			}}
	else
		generic_event_choose \{state = uistate_top_rockers}
	endif
endscript

script song_breakdown_auto_write_top_rockers 
	if ($last_song_played = jamsession)
		return
	endif
	gamemode_gettype
	if (<type> = quickplay)
		if (($ui_song_breakdown_wrote_tr) = 0)
			change \{ui_song_breakdown_wrote_tr = 1}
			change \{ui_song_breakdown_pulsate_helper_pill = 0}
			menu_top_rockers_check_for_new_top_score \{write_scores = 1
				auto_write_name = 1}
			printf \{channel = zdebug
				qs(0x3e3214ee)}
		endif
	endif
endscript

script song_breakdown_anim_band_banner_up 
	setscreenelementprops \{id = song_breakdown_noncompetitive_id
		band_header_container_pos = {
			(0.0, -30.0)
			relative
		}
		time = 0.08
		anim = gentle}
endscript

script ui_song_breakdown_continue_to_next_screen_gig_complete 
	requireparams \{[
			device_num
		]
		all}
	if (<device_num> = ($primary_controller))
		launchevent \{type = unfocus
			target = song_breakdown_noncompetitive_id}
		printf \{channel = sfx
			qs(0x911e2573)}
		printf \{channel = zdebug
			'continue on from song breakdown after gig complete'}
		getpakmancurrent \{map = zones}
		if (<pak> != z_studio)
			gamemode_gettype
			if (<type> != career)
				if issoundeventplaying \{surge_during_stats_screen}
					stopsoundevent \{surge_during_stats_screen
						fade_time = 1.5
						fade_type = linear}
				endif
				if scriptexists \{crowd_swells_during_stats_screen}
					killspawnedscript \{name = crowd_swells_during_stats_screen}
				endif
				spawnscriptnow \{skate8_sfx_backgrounds_new_area
					params = {
						bg_sfx_area = frontend_menu_music
						fadeouttime = 5
						fadeouttype = linear
					}}
				soundevent \{event = $current_crowd_swell_short_soundevent}
				stopsoundevent \{$current_crowd_swell_short_soundevent
					fade_time = 5
					fade_type = linear}
			endif
		endif
		printf \{qs(0x2bd3b055)}
		change \{songtime_paused = 0}
		soundevent \{event = menu_song_complete_out}
		getpakmancurrent \{map = zones}
		ui_win_song_continue_next_menu
	endif
endscript

script net_ui_song_breakdown_continue_to_next_screen_gig_complete 
	requireparams \{[
			device_num
		]
		all}
	if ($ui_song_breakdown_continuing_from_sb = 0)
		getplayerinfo ($g_net_leader_player_num) controller
		getplayerinfo ($g_net_leader_player_num) bot_play
		getplayerinfo ($g_net_leader_player_num) is_local_client
		if (<bot_play> = 1)
			getplayerinfo ($g_net_leader_player_num) bot_original_controller
			<controller> = <bot_original_controller>
		endif
		if ((<device_num> = <controller>) && (<is_local_client> = 1))
			if screenelementexists \{id = song_breakdown_noncompetitive_id}
				launchevent \{type = unfocus
					target = song_breakdown_noncompetitive_id}
			elseif screenelementexists \{id = song_complete_shreddfest_id}
				launchevent \{type = unfocus
					target = song_complete_shreddfest_id}
			endif
			change \{ui_song_breakdown_continuing_from_sb = 1}
			soundevent \{event = menu_song_complete_out}
			printf \{channel = sfx
				qs(0x7751fe7c)}
			getpakmancurrent \{map = zones}
			if (<pak> != z_studio)
				gamemode_gettype
				if (<type> != career)
					spawnscriptnow \{skate8_sfx_backgrounds_new_area
						params = {
							bg_sfx_area = frontend_menu_music
							fadeouttime = 5
							fadeouttype = linear
						}}
					soundevent \{event = $current_crowd_swell_short_soundevent}
					stopsoundevent \{$current_crowd_swell_short_soundevent
						fade_time = 5
						fade_type = linear}
				endif
			endif
			if ishost
				if ($net_breakdown_continue_msg_sent = 0)
					change \{net_breakdown_continue_msg_sent = 1}
				else
					return
				endif
			else
				sendstructure \{callback = net_ui_song_breakdown_continue_to_next_screen_gig_complete
					data_to_send = {
						none
					}}
				return
			endif
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script ui_win_song_continue 
	spawnscriptnow ui_win_song_continue_spawned params = <...>
endscript

script ui_win_song_continue_spawned 
	if NOT cd
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'debug')
			generic_event_back state = uistate_debug player = <player>
			return
		endif
		i = (<i> + 1)
		repeat <stack_size>
	endif
	ui_win_song_continue_next_menu
endscript

script ui_win_song_continue_next_menu 
	song_breakdown_auto_write_top_rockers
	switch ($game_mode)
		case p1_quickplay
		case p2_quickplay
		case p3_quickplay
		case p4_quickplay
		if ($last_song_played = jamsession)
			jam_ratesong_check_for_rating
		else
			if NOT gotparam \{no_sound}
				generic_menu_pad_choose_sound
			endif
			event = menu_back
			state = uistate_songlist
			if NOT ui_event_exists_in_stack \{name = 'songlist'}
				state = uistate_mainmenu
			endif
			ui_memcard_autosave_all_players event = <event> state = <state>
		endif
		case career
		case gh4_p1_career
		case gh4_p2_career
		case gh4_p3_career
		case gh4_p4_career
		ui_win_song_career_continue
		case p2_pro_faceoff
		case p2_coop
		generic_event_back \{state = uistate_songlist
			data = {
				no_jamsession
			}}
		case practice
		ui_destroy_song_breakdown
		end_practice_song
		if ($practice_return_state = uistate_gameplay)
			reset_practice_mode
		endif
		if ($came_to_practice_from = main_menu)
			generic_event_back \{state = uistate_select_song_section}
		else
			change game_mode = ($came_to_practice_from)
			return_to_quickplay_from_practice
		endif
		case competitive
		persistent_band_stop_and_unload_anims
		kill_gem_scroller
		gman_shutdowngamemodegoal
		generic_event_back \{state = uistate_mainmenu}
		default
		scriptassert \{'Current game_mode not supported in ui_win_song_continue_next_menu'}
	endswitch
endscript

script ui_win_song_career_continue 
	spawnscriptnow \{ui_win_song_career_continue_spawned}
endscript

script ui_win_song_career_continue_spawned 
	printf \{qs(0xe4fd1933)}
	if ($is_network_game = 1)
		gamemode_gettype
		if (<type> = career)
			net_ui_song_breakdown_go_to_gig_summary
		else
			printf \{qs(0xf471f46b)}
			scriptassert \{'Deprecated Flow'}
			return
		endif
	else
		ui_event_wait_for_safe
		generic_event_choose \{state = uistate_gig_complete_noncompetitive}
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_encore 
	requireparams \{[
			device_num
		]
		all}
	if ($is_network_game = 1)
		getplayerinfo ($g_net_leader_player_num) controller
		if (<device_num> != <controller>)
			return
		endif
		if ishost
			if ($net_encore_msg_start_sent = 0)
				change \{net_encore_msg_start_sent = 1}
				sendstructure \{callback = encore_play
					data_to_send = {
						none
					}}
			else
				return
			endif
		else
			sendstructure \{callback = ui_song_breakdown_continue_to_next_screen_encore
				data_to_send = {
					none
				}}
			soundevent \{event = menu_song_complete_out}
			return
		endif
	else
		if (<device_num> != ($primary_controller))
			return
		endif
	endif
	launchevent \{type = unfocus
		target = song_breakdown_noncompetitive_id}
	printf \{channel = zdebug
		'continue on to encore after song complete'}
	soundevent \{event = menu_song_complete_out}
	encore_play
endscript

script encore_play 
	printf \{qs(0x045d21cc)}
	start_encore
	change \{gameplay_loading_transition = 1}
	change \{gameplay_restart_song = 1}
	generic_menu_pad_choose_sound
	ui_event_wait_for_safe
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script ui_song_breakdown_pause_between_songs 
	ui_song_breakdown_add_components_for_transitions <...>
endscript

script net_ui_song_breakdown_go_to_setlist 
	getpakmancurrent \{map = zones}
	if (<pak> != z_studio)
		gamemode_gettype
		if (<type> != career)
			spawnscriptnow \{skate8_sfx_backgrounds_new_area
				params = {
					bg_sfx_area = frontend_menu_music
					fadeouttime = 5
					fadeouttype = linear
				}}
			soundevent \{event = $current_crowd_swell_short_soundevent}
			stopsoundevent \{$current_crowd_swell_short_soundevent
				fade_time = 5
				fade_type = linear}
		endif
	endif
	if NOT gotparam \{device_num}
		<device_num> = ($primary_controller)
	endif
	if (<device_num> = ($primary_controller))
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			launchevent \{type = unfocus
				target = song_breakdown_noncompetitive_id}
		elseif screenelementexists \{id = song_complete_shreddfest_id}
			launchevent \{type = unfocus
				target = song_complete_shreddfest_id}
		endif
		if ishost
			sendstructure \{callback = net_ui_song_breakdown_goto_setlist
				data_to_send = {
					none
				}}
			if ($ui_song_breakdown_continuing_from_sb = 0)
				change \{ui_song_breakdown_continuing_from_sb = 1}
				ui_event_wait_for_safe
				generic_event_back \{state = uistate_songlist}
			endif
		else
			sendstructure \{callback = net_ui_song_breakdown_go_to_setlist
				data_to_send = {
					none
				}}
		endif
	endif
endscript

script net_ui_song_breakdown_goto_setlist 
	if ($ui_song_breakdown_continuing_from_sb = 0)
		change \{ui_song_breakdown_continuing_from_sb = 1}
		if ishost
			sendstructure \{callback = net_ui_song_breakdown_goto_setlist
				data_to_send = {
					none
				}}
		endif
		ui_event_wait_for_safe
		generic_event_back \{state = uistate_songlist}
	endif
endscript

script net_ui_song_breakdown_go_to_gig_summary 
	if ishost
		sendstructure \{callback = net_ui_song_breakdown_go_to_gig_summary
			data_to_send = {
				none
			}}
	endif
	if ui_event_is_top_popup
		generic_event_replace \{state = uistate_gig_complete_noncompetitive}
	else
		generic_event_choose \{state = uistate_gig_complete_noncompetitive}
	endif
endscript
sb_trans_flag = 0
song_breakdown_busy_flag = 0

script song_breakdown_go_to_stats_from_transition 
	requireparams \{[
			device_num
			transition_param
		]
		all}
	if (<device_num> = ($primary_controller))
		if NOT (($song_breakdown_busy_flag) = 0)
			return
		endif
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			launchevent \{type = unfocus
				target = song_breakdown_noncompetitive_id}
		elseif screenelementexists \{id = song_breakdown_competitive_id}
			launchevent \{type = unfocus
				target = song_breakdown_competitive_id}
		endif
		if ($is_network_game = 1)
			gamemode_gettype
			if ((<type> = career) || (<type> = quickplay))
				if (<transition_param> != end_of_setlist_transition)
					if ($song_breakdown_countdown_time_added = 0)
						if ishost
							net_song_breakdown_add_to_timer
						else
							change \{song_breakdown_countdown_time_added = 2}
							sendstructure \{callback = net_song_breakdown_add_to_timer
								data_to_send = {
									none
								}}
						endif
					endif
				endif
			else
				if ($song_breakdown_countdown_time_added = 0)
					if ishost
						net_song_breakdown_add_to_timer
					else
						change \{song_breakdown_countdown_time_added = 2}
						sendstructure \{callback = net_song_breakdown_add_to_timer
							data_to_send = {
								none
							}}
					endif
				endif
			endif
		else
			killspawnedscript \{name = net_ui_song_breakdown_start_timer_spawned}
			change \{song_breakdown_countdown_time = -1}
		endif
		change \{song_breakdown_busy_flag = 1}
		ui_event_wait_for_safe
		change \{sb_trans_flag = 1}
		soundevent \{event = ui_sfx_select}
		generic_event_choose state = uistate_song_summary_details data = {transition_param = <transition_param>}
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition 
	requireparams \{[
			device_num
		]
		all}
	printscriptinfo \{'ui_song_breakdown_continue_to_next_screen_song_transition'}
	printf \{'ui_song_breakdown_continue_to_next_screen_song_transition'}
	if (<device_num> = ($primary_controller))
		printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - (<device_num> = ($primary_controller))'}
		if NOT (($song_breakdown_busy_flag) = 0)
			printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - ($song_breakdown_busy_flag) != 0'}
			return
		endif
		launchevent \{type = unfocus
			target = song_breakdown_noncompetitive_id}
		change \{song_breakdown_busy_flag = 1}
		generic_menu_pad_choose_sound
		gamemode_gettype
		if (<type> != career)
			soundevent \{event = $current_crowd_swell_short_soundevent}
			soundevent \{event = $current_crowd_swell_med_soundevent}
		endif
		soundevent \{event = menu_song_complete_out}
		if ($last_song_played != jamsession)
			change \{songtime_paused = 0}
		endif
		resetyieldinfo \{yield = false}
		stoprendering
		if ($last_song_played = jamsession)
			printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - jam_ratesong_check_for_rating'}
			jam_ratesong_check_for_rating \{is_definitely_last_song = 0}
		else
			gamemode_gettype
			if is_current_song_a_jam_session
				printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - jam_quickplay_get_and_start_song'}
				jam_quickplay_get_and_start_song
			else
				printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - before ui_event_wait_for_safe'}
				ui_event_wait_for_safe
				printf \{'ui_song_breakdown_continue_to_next_screen_song_transition - after ui_event_wait_for_safe'}
				generic_event_back \{nosound
					state = uistate_gameplay}
			endif
		endif
	endif
endscript

script song_breakdown_check_bot_play 
	bot_play_is_enabled = 0
	getnumplayersingame \{on_screen
		local}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen
			local}
		begin
		getplayerinfo <player> bot_play
		if (<bot_play> = 1)
			bot_play_is_enabled = 1
			break
		endif
		getnextplayer on_screen local player = <player>
		repeat <num_players_shown>
	endif
	return bot_play = <bot_play_is_enabled>
endscript

script song_breakdown_get_exclusive_devices 
	exclusive_devices = []
	if gotparam \{band_leader_only}
		addarrayelement array = <exclusive_devices> element = ($primary_controller)
		<exclusive_devices> = <array>
	else
		getnumplayersingame \{on_screen
			local}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen
				local}
			begin
			getplayerinfo <player> controller
			addarrayelement array = <exclusive_devices> element = <controller>
			<exclusive_devices> = <array>
			getnextplayer on_screen local player = <player>
			repeat <num_players_shown>
		endif
	endif
	return exclusive_devices = <exclusive_devices>
endscript

script ui_song_breakdown_should_allow_transition_to_leaderboards 
	gamemode_gettype
	if (<type> = freeplay)
		return \{false}
	endif
	if ui_song_breakdown_someone_signed_in
		return \{true}
	endif
	return \{false}
endscript

script ui_song_breakdown_someone_signed_in 
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> controller
		if checkforsignin <signin_params> controller_index = <controller>
			return \{true}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{false}
endscript

script ui_song_breakdown_clean_up_highest_multipliers 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		setplayerinfo <player> highest_multiplier = 1
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script ui_song_breakdown_clear_ready_up_book_keeping 
	change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script ui_song_breakdown_set_player_ready 
	if song_breakdown_noncompetitive_id :desc_resolvealias \{name = alias_player_stats_element}
		getscreenelementchildren id = <resolved_id>
		getscreenelementprops id = (<children> [<dev_num>])
		if (<check_mark_alpha> = 0)
			if (($game_mode = gh4_p1_career) || ($game_mode = practice) || ($game_mode = tutorial) || ($game_mode = p1_quickplay))
				generic_menu_pad_choose_sound
			else
				soundevent \{event = box_check_sfx}
			endif
		endif
		(<children> [<dev_num>]) :se_setprops {
			check_mark_alpha = 1
		}
	endif
endscript

script getscorefromdetailedstats \{player = 1}
	score = ($song_stats_backup [(<player> - 1)].score)
	return score = <score>
endscript

script getbestrunfromdetailedstats \{player = 1}
	best_run = ($song_stats_backup [(<player> - 1)].best_run)
	return best_run = <best_run>
endscript

script getstarsfromdetailedstats \{player = 1}
	stars = ($song_stats_backup [(<player> - 1)].stars)
	return stars = <stars>
endscript

script getnoteshitfromdetailedstats \{player = 1}
	notes_hit = ($song_stats_backup [(<player> - 1)].notes_hit)
	return notes_hit = <notes_hit>
endscript

script getmaxnotesfromdetailedstats \{player = 1}
	max_notes = ($song_stats_backup [(<player> - 1)].max_notes)
	return max_notes = <max_notes>
endscript

script gettotalnotesfromdetailedstats \{player = 1}
	total_notes = ($song_stats_backup [(<player> - 1)].total_notes)
	return total_notes = <total_notes>
endscript

script getspphraseshitfromdetailedstats \{player = 1}
	sp_phrases_hit = ($song_stats_backup [(<player> - 1)].sp_phrases_hit)
	return sp_phrases_hit = <sp_phrases_hit>
endscript

script getspphrasestotalfromdetailedstats \{player = 1}
	sp_phrases_total = ($song_stats_backup [(<player> - 1)].sp_phrases_total)
	return sp_phrases_total = <sp_phrases_total>
endscript

script getavgmultiplierfromdetailedstats \{player = 1}
	avg_multiplier = ($song_stats_backup [(<player> - 1)].avg_multiplier)
	return avg_multiplier = <avg_multiplier>
endscript

script getvocalstreakphrasesfromdetailedstats \{player = 1}
	vocal_streak_phrases = ($song_stats_backup [(<player> - 1)].vocal_streak_phrases)
	return vocal_streak_phrases = <vocal_streak_phrases>
endscript

script getvocalphrasequalityfromdetailedstats \{player = 1}
	vocal_phrase_quality = ($song_stats_backup [(<player> - 1)].vocal_phrase_quality)
	return vocal_phrase_quality = <vocal_phrase_quality>
endscript

script getvocalphrasemaxqualfromdetailedstats \{player = 1}
	vocal_phrase_max_qual = ($song_stats_backup [(<player> - 1)].vocal_phrase_max_qual)
	return vocal_phrase_max_qual = <vocal_phrase_max_qual>
endscript

script song_breakdown_drop_player 
	printf \{qs(0xe0296c2b)}
	printstruct <...>
	if (<is_game_over> = 0)
		wait_for_safe_shutdown
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			screen_id = song_breakdown_noncompetitive_id
		elseif screenelementexists \{id = song_breakdown_competitive_id}
			screen_id = song_breakdown_competitive_id
		elseif screenelementexists \{id = song_complete_shreddfest_id}
			screen_id = song_complete_shreddfest_id
		elseif screenelementexists \{id = stats_summary_id}
			screen_id = stats_summary_id
		elseif screenelementexists \{id = gig_complete_noncompetitive_id}
			screen_id = gig_complete_noncompetitive_id
		elseif screenelementexists \{id = rewards_unlocked_screen_id}
			screen_id = rewards_unlocked_screen_id
		elseif screenelementexists \{id = unlock_venue_screen_id}
			screen_id = unlock_venue_screen_id
		endif
		getplayerinfo <dropped_player_num> band
		removeplayerfromband player = <dropped_player_num> band = <band>
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> band = 1
		setplayerinfo <dropped_player_num> party_id = -1
		setplayerinfo <dropped_player_num> in_game = 0
		if playerinfoequals <dropped_player_num> is_onscreen = 1
			launchgemevent event = kill_objects_and_switch_player_non_interactive player = <dropped_player_num>
		endif
		getplayerinfo <dropped_player_num> gamertag
		if gotparam \{screen_id}
			switch <drop_reason>
				case net_message_player_quit
				formattext textname = drop_msg qs(0x567f10d8) s = <name_string>
				case net_message_player_dropped
				case net_message_player_timed_out
				formattext textname = drop_msg qs(0xd4b272d7) s = <name_string>
				default
				drop_msg = qs(0x00000000)
			endswitch
			change globalname = <gamertag> newvalue = <drop_msg>
			add_dropped_player_to_dialog_box parent = <screen_id> msg_text = <drop_msg>
		endif
	endif
endscript

script sb_kill_timer_remove_handlers 
	killspawnedscript \{name = net_ui_song_breakdown_start_timer_spawned}
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		screen_id = song_breakdown_noncompetitive_id
	elseif screenelementexists \{id = song_breakdown_competitive_id}
		screen_id = song_breakdown_competitive_id
	elseif screenelementexists \{id = song_complete_shreddfest_id}
		screen_id = song_complete_shreddfest_id
	elseif screenelementexists \{id = stats_summary_id}
		screen_id = stats_summary_id
	elseif screenelementexists \{id = gig_complete_noncompetitive_id}
		screen_id = gig_complete_noncompetitive_id
	elseif screenelementexists \{id = rewards_unlocked_screen_id}
		screen_id = rewards_unlocked_screen_id
	elseif screenelementexists \{id = unlock_venue_screen_id}
		screen_id = unlock_venue_screen_id
	endif
	if gotparam \{screen_id}
		launchevent type = unfocus target = <screen_id>
		<screen_id> :se_setprops {
			net_timer_text_alpha = 0
			event_handlers = [
				{pad_choose nullscript}
				{pad_option nullscript}
				{pad_l1 nullscript}
				{pad_start nullscript}
				{pad_back postgame_lobby_quit params = {id = <screen_id>}}
			]
			replace_handlers
		}
	endif
	if screenelementexists \{id = rockrecordinterface}
		launchevent \{type = unfocus
			target = rockrecordinterface}
	elseif screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if screenelementexists \{id = band_lobby_manage_player}
		if band_lobby_manage_player :desc_resolvealias \{name = alias_game_rules_vmenu
				param = menu_id}
			launchevent type = unfocus target = <menu_id>
		endif
	endif
endscript

script song_breakdown_end_game 
	printf \{qs(0x47ac8b43)}
	destroy_dialog_box
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		sb_kill_timer_remove_handlers
		ui_event_wait_for_safe
		ui_event_get_top
		printstruct <...>
		if (<base_name> = 'online_quit_warning')
			generic_event_back
			ui_event_wait_for_safe
		endif
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formattext textname = msg qs(0x78bb855f) s = <first_msg>
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if screenelementexists \{id = dialog_box_container}
			dialog_box_container :se_setprops \{z_priority = 1500.2}
		endif
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :obj_spawnscriptnow song_breakdown_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
		endif
	endif
endscript

script song_breakdown_end_game_spawned 
	change \{net_ready_to_start = 1}
	printf \{qs(0x60090de2)}
	wait \{3
		seconds}
	printf \{qs(0xa43fad2b)}
	destroy_net_popup
	<add_quit_prompt> = 1
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		screen_id = song_breakdown_noncompetitive_id
	elseif screenelementexists \{id = song_breakdown_competitive_id}
		screen_id = song_breakdown_competitive_id
	elseif screenelementexists \{id = song_complete_shreddfest_id}
		screen_id = song_complete_shreddfest_id
	elseif screenelementexists \{id = stats_summary_id}
		screen_id = stats_summary_id
	elseif screenelementexists \{id = gig_complete_noncompetitive_id}
		screen_id = gig_complete_noncompetitive_id
	elseif screenelementexists \{id = rewards_unlocked_screen_id}
		screen_id = rewards_unlocked_screen_id
	elseif screenelementexists \{id = unlock_venue_screen_id}
		screen_id = unlock_venue_screen_id
	endif
	if screenelementexists \{id = rockrecordinterface}
		screen_id = rockrecordinterface
		<add_quit_prompt> = 0
	elseif screenelementexists \{id = band_lobby_manage_player}
		if band_lobby_manage_player :desc_resolvealias \{name = alias_game_rules_vmenu
				param = menu_id}
			<add_quit_prompt> = 0
			screen_id = <menu_id>
		endif
	elseif screenelementexists \{id = current_menu}
		<add_quit_prompt> = 0
		screen_id = current_menu
	endif
	gamemode_gettype
	if (<type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		quit_network_game_early
		band_lobby_restore_prematchmaking_settings
		ui_memcard_autosave_all_players \{memcard_event = menu_replace
			event = menu_back
			state = uistate_band_lobby_setup}
	elseif gotparam \{screen_id}
		launchevent type = focus target = <screen_id>
		if (<add_quit_prompt> = 1)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xd16792bf) button = yellow z = 100000
		endif
		if checksumequals a = <screen_id> b = rockrecordinterface
			rockrecordinterface :se_getprops
			add_gamertag_helper exclusive_device = <exclusive_device>
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			if isxenonorwindx
				add_user_control_helper \{text = qs(0xfcc51f45)
					button = yellow
					z = 100000}
			endif
		endif
	endif
endscript

script create_ui_star_particles \{parent = root_window
		pos = (0.0, 0.0)
		z = 1.5}
	obj_getid
	<parent> = <objid>
	destroy2dparticlesystem \{id = ui_star_particles}
	if screenelementexists \{id = ui_screen_flash}
		destroyscreenelement \{id = ui_screen_flash}
	endif
	createscreenelement {
		type = spriteelement
		id = ui_screen_flash
		parent = <parent>
		z_priority = 1000
		texture = white
		blend = add
		rgba = [255 255 255 200]
		alpha = 1
		dims = (1280.0, 720.0)
		pos = (640.0, 360.0)
	}
	wait \{1
		gameframe}
	ui_screen_flash :setprops \{alpha = 0
		time = 0.2
		motion = ease_out}
	create2dparticlesystem {
		id = ui_star_particles
		pos = <pos>
		parent = <parent>
		z_priority = <z>
		texture = song_summary_score_star2
		blend = add
		start_color = [255 255 255 255]
		end_color = [100 25 0 50]
		start_scale = (0.3, 0.3)
		end_scale = (0.1, 0.1)
		start_angle_spread = 360.0
		min_rotation = -500
		max_rotation = 500
		emit_start_radius = 100.0
		emit_radius = 130.0
		emit_rate = 0.00032000002
		emit_dir = 0
		emit_spread = 360.0
		velocity = 15.0
		friction = (0.1, 0.01)
		time = 0.8
	}
	wait \{1
		gameframe}
	destroy2dparticlesystem \{id = ui_star_particles
		kill_when_empty}
	ui_screen_flash :se_waitprops
	if screenelementexists \{id = ui_screen_flash}
		destroyscreenelement \{id = ui_screen_flash}
	endif
	return
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

script song_summary_animate_kingwing 
	requireparams \{[
			screen_id
		]
		all}
	if screenelementexists id = <screen_id>
		if <screen_id> :desc_resolvealias name = alias_illo_kingwing
			assignalias id = <resolved_id> alias = illo_kingwing
			illo_kingwing :se_getprops
			finalpos = <illo_kingwing_master_pos>
			startpos = (<finalpos> + (0.0, -200.0))
			illo_kingwing :se_setprops illo_kingwing_master_pos = <startpos> alpha = 1
			illo_kingwing :se_setprops {
				illo_kingwing_master_pos = (<finalpos> + (0.0, 100.0))
				kingwing_bone_r1_rot = 50
				kingwing_feather_r1_rot = -60
				kingwing_feather_r2_rot = -60
				kingwing_feather_r3_rot = -70
				kingwing_bone_r2_rot = 30
				kingwing_feather_r4_rot = -90
				kingwing_feather_r5_rot = -110
				kingwing_feather_r6_rot = -100
				kingwing_bone_l1_rot = -50
				kingwing_feather_l1_rot = 60
				kingwing_feather_l2_rot = 60
				kingwing_feather_l3_rot = 70
				kingwing_bone_l2_rot = -30
				kingwing_feather_l4_rot = 90
				kingwing_feather_l5_rot = 110
				kingwing_feather_l6_rot = 100
				kingwing_bone_1_rot = -50
				kingwing_bone_2_rot = 50
				motion = ease_out
				time = 0.2
			}
			illo_kingwing :se_waitprops
			illo_kingwing :se_setprops {
				illo_kingwing_master_pos = (<finalpos> + (0.0, -50.0))
				kingwing_bone_r1_rot = -5
				kingwing_feather_r1_rot = 6
				kingwing_feather_r2_rot = 6
				kingwing_feather_r3_rot = 7
				kingwing_bone_r2_rot = -3
				kingwing_feather_r4_rot = 9
				kingwing_feather_r5_rot = 11
				kingwing_feather_r6_rot = 10
				kingwing_bone_l1_rot = 5
				kingwing_feather_l1_rot = -6
				kingwing_feather_l2_rot = -6
				kingwing_feather_l3_rot = -7
				kingwing_bone_l2_rot = 3
				kingwing_feather_l4_rot = -9
				kingwing_feather_l5_rot = -11
				kingwing_feather_l6_rot = -10
				kingwing_bone_1_rot = 5
				kingwing_bone_2_rot = -5
				motion = smooth
				time = 0.5
			}
			illo_kingwing :se_waitprops
			illo_kingwing :se_setprops {
				illo_kingwing_master_pos = <finalpos>
				kingwing_bone_r1_rot = 0
				kingwing_feather_r1_rot = 0
				kingwing_feather_r2_rot = 0
				kingwing_feather_r3_rot = 0
				kingwing_bone_r2_rot = 0
				kingwing_feather_r4_rot = 0
				kingwing_feather_r5_rot = 0
				kingwing_feather_r6_rot = 0
				kingwing_bone_l1_rot = 0
				kingwing_feather_l1_rot = 0
				kingwing_feather_l2_rot = 0
				kingwing_feather_l3_rot = 0
				kingwing_bone_l2_rot = 0
				kingwing_feather_l4_rot = 0
				kingwing_feather_l5_rot = 0
				kingwing_feather_l6_rot = 0
				kingwing_bone_1_rot = 0
				kingwing_bone_2_rot = 0
				motion = smooth
				time = 0.7
			}
			illo_kingwing :se_waitprops
			<screen_id> :obj_spawnscriptnow {
				song_summary_jiggle_kingwing
				params = {
					screen_id = <screen_id>
				}
			}
		endif
	endif
endscript

script song_summary_jiggle_kingwing 
	requireparams \{[
			screen_id
		]
		all}
	if <screen_id> :desc_resolvealias name = alias_illo_kingwing param = illo_kingwing
		<illo_kingwing> :se_getprops
		finalpos = <illo_kingwing_master_pos>
		begin
		a = Random (@ 0.7 @ 0.6 @ 0.5 )
		t = Random (@ 0.2 @ 0.1 @ 0.0 )
		p = Random (@ (<finalpos> + (0.0, 1.0)) @ (<finalpos> + (1.0, 0.0)) @ (<finalpos> + (1.0, 1.0)) @ (<finalpos> + (0.0, -1.0)) @ (<finalpos> + (-1.0, 0.0)) @ (<finalpos> + (-1.0, -1.0)) @*8 <finalpos> )
		<illo_kingwing> :se_setprops {
			illo_kingwing_master_alpha = <a>
			illo_kingwing_master_pos = <p>
			Random (@ kingwing_feather_l4_rot = -1 @ kingwing_feather_l4_rot = 0 @ kingwing_bone_r1_rot = -1 @ kingwing_bone_r1_rot = 0 @ kingwing_bone_r2_rot = -1 @ kingwing_bone_r2_rot = 0 @ kingwing_feather_r6_rot = 1 @ kingwing_feather_r6_rot = 0 @ kingwing_bone_1_rot = 1 @ kingwing_bone_1_rot = 0 )
			time = <t>
			motion = smooth
		}
		<illo_kingwing> :se_waitprops
		repeat
	endif
endscript

script anim_bling \{minradius = 20
		maxradius = 50
		maxtime = 0.5}
	begin
	getrandomvalue name = blingx integer a = <minradius> b = <maxradius>
	getrandomvalue name = blingy integer a = <minradius> b = <maxradius>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 2
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 3
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
		default
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
	endswitch
	randrota = RandomInteger (0.0, 180.0)
	randrotc = (<randrota> + (RandomInteger (0.0, 179.0)))
	randrotb = ((<randrotc> / 2) + (<randrota> / 2))
	getrandomvalue name = randtime a = 0.2 b = <maxtime>
	se_setprops alpha = 0 scale = 0 pos = <blingpos> rot_angle = <randrota> time = 0
	se_waitprops
	se_setprops alpha = 0.6 scale = 1.5 rot_angle = <randrotb> time = <randtime> motion = ease_in
	se_waitprops
	se_setprops alpha = 0 scale = 0 rot_angle = <randrotc> time = <randtime> motion = ease_out
	se_waitprops
	repeat
endscript

script ui_song_breakdown_pulse_stats_arrows_spawned 
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{ui_song_breakdown_pulse_scroll_left_arrow_spawned}
		wait \{0.2
			seconds}
		song_breakdown_noncompetitive_id :obj_spawnscriptnow \{ui_song_breakdown_pulse_scroll_right_arrow_spawned}
	endif
endscript

script ui_song_breakdown_pulse_scroll_left_arrow_spawned 
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if NOT issingleplayergame
			begin
			song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_left_arrow_scale = 1.5
				time = 0.3
				relative_scale
				motion = ease_in}
			song_breakdown_noncompetitive_id :se_waitprops
			wait \{0.3
				seconds}
			song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_left_arrow_scale = 0.7
				time = 0.1
				relative_scale
				motion = ease_out}
			wait \{5.0
				seconds}
			repeat
		endif
	endif
endscript

script ui_song_breakdown_pulse_scroll_right_arrow_spawned 
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		if NOT issingleplayergame
			begin
			song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_right_arrow_scale = 1.5
				time = 0.3
				relative_scale
				motion = ease_in}
			song_breakdown_noncompetitive_id :se_waitprops
			wait \{0.3
				seconds}
			song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_right_arrow_scale = 0.7
				time = 0.1
				relative_scale
				motion = ease_out}
			wait \{5.0
				seconds}
			repeat
		endif
	endif
endscript
