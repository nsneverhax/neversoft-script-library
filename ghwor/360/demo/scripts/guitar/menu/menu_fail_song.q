is_guitar_controller = 0

script menu_replace_to_fail_song 
	spawnscriptnow \{ui_event
		params = {
			event = menu_replace
			data = {
				state = uistate_fail_song
			}
		}}
endscript

script create_fail_song_menu 
	change \{last_start_pressed_device = $primary_controller}
	menu_font = fontgrid_title_a1
	<menu_pos> = (640.0, 420.0)
	audio_crowd_silence_front_end
	playlist_getcurrentsong
	completion = 0
	songfilemanager func = get_song_end_time song_name = <current_song>
	finished_song = 0
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
			finished_song = 1
		endif
	endif
	casttointeger \{completion}
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	getnumplayersingame
	highest_difficulty_index = 0
	playing_expert_plus = 0
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> difficulty
		if (($difficulty_list_props.<difficulty>.index) >= <highest_difficulty_index>)
			<highest_difficulty_index> = ($difficulty_list_props.<difficulty>.index)
			if (<difficulty> = expert)
				getplayerinfo <player> part
				if (<part> = drum)
					getplayerinfo <player> double_kick_drum
					if (<double_kick_drum> = 1)
						<playing_expert_plus> = 1
					endif
				endif
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	get_difficulty_text_upper difficulty = ($difficulty_list [<highest_difficulty_index>])
	if (<playing_expert_plus>)
		formattext textname = new_diff_text qs(0xdb6857e4) d = <difficulty_text>
		<difficulty_text> = <new_diff_text>
	endif
	get_song_title song = <current_song>
	if is_current_song_a_jam_session
		get_jam_filename \{type = current}
		<song_title> = <jam_display_name>
	endif
	formattext textname = completion_text qs(0x76b3fda7) d = <completion>
	z = 100.0
	createscreenelement \{type = containerelement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		pos = (0.0, 0.0)
		z_priority = 2}
	title = qs(0x5c9b76c1)
	if NOT ininternetmode
		popup_options = [
			{
				func = fail_song_menu_select_retry_song
				text = qs(0x647b5a84)
			}
		]
	else
		<popup_options> = []
		if ($g_net_leader_player_num != -1)
			if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
				<popup_options> = [
					{
						func = fail_song_menu_select_retry_song
						text = qs(0x647b5a84)
					}
				]
			endif
		endif
	endif
	<song_title_scale> = 1.65
	set_focus_color \{color = menu_focus_color}
	set_unfocus_color \{color = black}
	text_scale = (0.9, 0.95)
	if NOT english
		text_scale = (0.9, 0.85)
	endif
	if NOT gotparam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	gamemode_gettype
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			playlist_getsize
			playlist_getcurrentsongindex
			<display_next_song> = 0
			if (<type> = quickplay)
				if gman_goalisactive \{goal = quickplay}
					gman_getdata \{goal = quickplay
						name = targeted_challenge}
					if (<targeted_challenge> != null)
						<display_next_song> = 1
					endif
				endif
			endif
			if ((((<playlist_size> > 1) && (<current_song_index> < <playlist_size>)) || ($g_songlist_infinite_playlist = 1)) && (<display_next_song> = 0))
				<quickplay_skip_song_option> = {
					func = quickplay_skip_song
					func_params = {failed_song}
					text = qs(0xea4574ef)
				}
				addarrayelement array = <popup_options> element = <quickplay_skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	if (<type> = career)
		if quest_progression_is_chapter_finale
			playlist_getsize
			playlist_getcurrentsongindex
			if (<current_song_index> < (<playlist_size> -1))
				if NOT console_is_net_career_client
					<arrange_band_option> = {
						func = fail_song_menu_select_arrange_band
						text = qs(0x2edf107a)
					}
					addarrayelement array = <popup_options> element = <arrange_band_option>
					<popup_options> = <array>
				endif
			endif
		endif
	endif
	if NOT ((<current_song> = jamsession) || ($is_network_game = 1))
		if NOT gamemode_isbandscoring
			<change_diff_option> = {
				func = fail_song_menu_select_change_diff
				text = qs(0x9f281c76)
			}
			addarrayelement array = <popup_options> element = <change_diff_option>
			<popup_options> = <array>
		endif
	endif
	if (($is_network_game = 0) || (<type> = career))
		<quit_option> = {
			func = fail_song_menu_select_quit
			text = qs(0x67d9c56d)
		}
	else
		<quit_option> = {
			func = select_quit_network_game
			func_params = {from_fail_menu = 1}
			text = qs(0x67d9c56d)
		}
	endif
	addarrayelement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		change \{is_guitar_controller = 1}
	endif
	gamemode_gettype
	if NOT demobuild
		if NOT (<current_song> = jamsession)
			if issingleplayergame
				if NOT ininternetmode
					if (<type> = career || <type> = quickplay)
						getplayerinfo (<player_device> + 1) difficulty
						if (<difficulty> != beginner)
							<practice_option> = {
								func = fail_song_menu_select_practice
								text = qs(0x3ea7dec9)
							}
							addarrayelement array = <popup_options> element = <practice_option>
							<popup_options> = <array>
						endif
					endif
				endif
			endif
		endif
	endif
	if gotparam \{new_song_option}
		addarrayelement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		time_offset = 0
		time_offset = ($default_songlost_transition.time * -1)
		getnumplayersingame
		<part> = guitar
		if (<num_players> = 1)
			getfirstplayer
			getplayerinfo <player> part
			if (<part> != vocals)
				<part> = guitar
			endif
		endif
		<section_name_text> = qs(0xeb538e01)
		if initpracticecurrentsection songname = <current_song> time_offset = <time_offset> part = <part>
			shortenuistring {
				ui_string = <section_name_text>
				max_len = 35
			}
			if NOT (<short_ui_string> = qs(0x00167369) || <short_ui_string> = qs(0xed5ba677))
				<section_name_text> = <short_ui_string>
			else
				<section_name_text> = qs(0x03ac90f0)
			endif
		endif
		use_stars_fail_info = 0
		num_stars_fail_info = qs(0x00000000)
		max_stars_fail_info = qs(0x00000000)
		if is_final_battle_star_songs
			if (<finished_song> = 1)
				use_stars_fail_info = 1
				quest_progression_get_current_song_num
				formattext checksumname = stars_for_song 'stars_for_song%d' d = <song_num>
				num_max_stars_fail_info = ($quest_chapter_finale.<stars_for_song>)
				formattext textname = max_stars_fail_info qs(0x48c6d14c) d = <num_max_stars_fail_info>
				getfirstplayer \{local}
				getnumplayersingame
				if (<num_players> > 1)
					getplayerinfo <player> band
					getbandinfo <band> projected_song_stars
				else
					getplayerinfo <player> projected_song_stars
				endif
				mathfloor <projected_song_stars>
				formattext textname = num_stars_fail_info qs(0x48c6d14c) d = <floor> decimalplaces = 0
				if (<floor> >= <num_max_stars_fail_info>)
					<use_stars_fail_info> = 0
				endif
			endif
		endif
		if console_is_net_career_client
			net_host_wait_text_alpha = 1.0
		else
			net_host_wait_text_alpha = 0.0
		endif
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <song_title>
				section_name_text = <section_name_text>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
				use_stars_fail_info = <use_stars_fail_info>
				num_stars_fail_info = <num_stars_fail_info>
				max_stars_fail_info = <max_stars_fail_info>
				host_text_alpha = <net_host_wait_text_alpha>
			}
		}
		getarraysize <popup_options>
		if (<array_size> <= 2)
			if screenelementexists id = <menu_id>
				if innetgame
					getscreenelementchildren id = <menu_id>
					getarraysize <children>
					printf \{qs(0x1b806245)}
					if (<array_size> >= 2)
						if screenelementexists \{id = dialog_box_desc_id}
							if dialog_box_desc_id :desc_resolvealias \{name = alias_highlight_btn
									param = highlight_btn}
								<highlight_btn> :obj_spawnscriptnow update_hightlight_bar_pos params = {focus_id = (<children> [1])}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	pausegame
	disable_pause
endscript

script update_hightlight_bar_pos 
	wait \{5
		gameframes}
	getscreenelementposition id = <focus_id> absolute
	getscreenelementdims id = <focus_id>
	<screenelementpos> = (<screenelementpos> + ((<width> / 2.0) * (1.0, 0.0)))
	<screenelementpos> = (<screenelementpos> + ((<height> / 2.0) * (0.0, 1.0)))
	se_setprops pos = {<screenelementpos> absolute}
	se_setprops \{alpha = 1.0}
endscript

script destroy_fail_song_menu 
	change \{g_generic_barrel_menu_focus_scale = 1.5}
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_menu \{menu_id = fail_song_static_text_container}
	destroy_dialog_box
endscript

script fail_song_menu_select_practice 
	gamemode_gettype
	if (<type> = career)
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_choose \{state = uistate_practice_warning
			data = {
				warning_text = qs(0xd1969a61)
			}}
	else
		practice_warning_menu_select_practice_mode
	endif
endscript

script fail_song_menu_select_retry_song 
	fadetoblack on time = 0.0 alpha = 1.0 z_priority = ($sys_fade_overlay_z_priority) no_wait
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ($is_network_game = 1)
		change agora_failed_attempts = ($agora_failed_attempts + 1)
		if ishost
			host_retry_career_song
		else
			sendstructure \{callback = host_retry_career_song
				data_to_send = {
					none
				}}
		endif
	else
		if NOT ($game_mode = practice)
			change agora_failed_attempts = ($agora_failed_attempts + 1)
			change \{gameplay_restart_song = 1}
			xenon_singleplayer_session_init
		else
			practice_restart_song
		endif
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_back \{state = uistate_gameplay}
	endif
endscript

script fail_song_menu_select_new_song 
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if NOT cd
		if ($is_in_debug = 1)
			ui_sfx \{menustate = generic
				uitype = select}
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{name = 'jam'}
			ui_sfx \{menustate = generic
				uitype = select}
			generic_event_back state = uistate_jam player = <player> data = {show_popup = 0 return_from_song = 1}
		elseif ui_event_exists_in_stack \{name = 'songlist'}
			ui_sfx \{menustate = generic
				uitype = select}
			pushdisablerendering \{context = going_into_songlist
				type = unchecked}
			generic_event_back state = uistate_songlist player = <player>
		endif
	else
		songlist_clear_playlist
		gamemode_gettype
		if (<type> = career)
			if ($is_network_game = 1)
				sendstructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						none
					}}
				net_career_goto_band_lobby
			else
				<quit_type> = newgig
				if gotparam \{back_to_giglist}
					<quit_type> = newsong
				endif
				career_pause_quit quit_type = <quit_type>
			endif
		else
			if (<type> = quickplay)
				quickplay_unload_challenges
			endif
			ui_sfx \{menustate = generic
				uitype = select}
			pushdisablerendering \{context = going_into_songlist
				type = unchecked}
			generic_event_back state = uistate_songlist player = <player>
		endif
	endif
endscript

script fail_song_menu_select_quit 
	ui_sfx \{menustate = generic
		uitype = select}
	gamemode_gettype
	if (<type> = career)
		if console_is_net_career_client
			<quit_data> = {
				options = ($g_net_career_client_quit_options.options)
				quit_text = ($g_net_career_client_quit_options.quit_text)
			}
		elseif quest_progression_is_chapter_rush
			<quit_data> = {
				options = ($g_career_quit_struct_no_chapter.options)
				quit_text = ($g_career_quit_struct_no_chapter.quit_text)
			}
		elseif quest_progression_is_chapter_finale
			<quit_data> = {
				options = ($g_career_quit_struct_no_chapter.options)
				quit_text = ($g_career_quit_struct_no_chapter.quit_text)
			}
		else
			<quit_data> = {
				options = ($g_career_quit_struct.options)
				quit_text = ($g_career_quit_struct.quit_text)
			}
		endif
	elseif (<type> = quickplay)
		if musicstudio_mainobj :musicstudio_isinmusicstudio
			<quit_data> = {
				option2_func = song_ended_menu_select_quit
				option2_text = qs(0x67d9c56d)
				option2_func_params = {quit_career_confirm}
				has_third_choice = <has_third_choice>
				<third_choice_params>
			}
		else
			if ui_event_exists_in_stack \{name = 'songlist'}
				<quit_data> = {
					options = ($g_quickplay_quit_struct.options)
					quit_text = ($g_quickplay_quit_struct.quit_text)
				}
			else
				<quit_data> = {
					options = ($g_quickplay_quit_struct_alt.options)
					quit_text = ($g_quickplay_quit_struct_alt.quit_text)
				}
			endif
		endif
	else
		<has_third_choice> = 0
		<third_choice_params> = {}
		<option2_text> = qs(0x67d9c56d)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			<option2_text> = qs(0xffb8a3dc)
			<has_third_choice> = 1
			<third_choice_params> = {
				option3_text = qs(0xb5196a13)
				option3_func_params = {
					quit_type = bandlobby
				}
			}
		endif
		<quit_data> = {
			option2_func = song_ended_menu_select_quit
			option2_text = <option2_text>
			option2_func_params = {quit_career_confirm}
			has_third_choice = <has_third_choice>
			<third_choice_params>
		}
	endif
	generic_event_choose {
		state = uistate_pausemenu_quit_warning
		data = {
			<quit_data>
		}
	}
endscript

script fail_song_menu_select_change_diff 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose state = uistate_pausemenu_change_difficulty data = {<...> no_warning enable_pause = 0 failed_song = 1}
endscript

script fail_song_menu_select_arrange_band 
	if ($is_network_game = 1)
		if ishost
			sendstructure \{callback = fail_song_menu_select_arrange_band
				data_to_send = {
					none
				}}
		else
			change \{suppress_finalbattle_from_band_select = 1}
		endif
	endif
	ui_sfx \{menustate = generic
		uitype = select}
	hide_glitch \{num_frames = 40}
	generic_event_back \{state = uistate_quest_band_select
		data = {
			from_fail_song = 1
		}}
endscript

script quickplay_skip_song 
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	songlist_remove_first_song_in_playlist
	if quickplay_set_new_song_in_gig_list
		create_loading_screen
		addhistoryforcurrentsong \{add_empty}
		playlist_getcurrentsong
		change \{gameplay_restart_song = 1}
		change \{agora_failed_attempts = 0}
		xenon_singleplayer_session_init
		generic_event_back \{nosound
			state = uistate_gameplay}
	else
		pushdisablerendering \{context = going_into_songlist
			type = unchecked}
		generic_event_back \{nosound
			state = uistate_songlist}
	endif
endscript

script host_retry_career_song 
	sendstructure \{callback = net_career_retry_song
		data_to_send = {
			none
		}}
	net_career_retry_song
endscript

script net_career_retry_song 
	change \{gameplay_restart_song = 1}
	change \{net_ready_to_start = 0}
	($default_loading_screen.create)
	xenon_singleplayer_session_init
	ui_event_wait_for_safe
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
endscript
