is_guitar_controller = 0

script menu_replace_to_fail_song 
	SpawnScriptNow \{ui_event
		params = {
			event = menu_replace
			data = {
				state = uistate_fail_song
			}
		}}
endscript

script create_fail_song_menu 
	Change \{last_start_pressed_device = $primary_controller}
	clear_input_block
	menu_font = fontgrid_title_a1
	<menu_pos> = (640.0, 420.0)
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
	CastToInteger \{completion}
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	getnumplayersingame
	highest_difficulty_index = 0
	playing_expert_plus = 0
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		if (($difficulty_list_props.<difficulty>.index) >= <highest_difficulty_index>)
			<highest_difficulty_index> = ($difficulty_list_props.<difficulty>.index)
			if (<difficulty> = expert)
				getplayerinfo <Player> part
				if (<part> = drum)
					getplayerinfo <Player> double_kick_drum
					if (<double_kick_drum> = 1)
						<playing_expert_plus> = 1
					endif
				endif
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	get_difficulty_text_upper difficulty = ($difficulty_list [<highest_difficulty_index>])
	if (<playing_expert_plus>)
		formatText TextName = new_diff_text qs(0xdb6857e4) d = <difficulty_text>
		<difficulty_text> = <new_diff_text>
	endif
	get_song_title song = <current_song>
	if is_current_song_a_jam_session
		get_jam_filename \{Type = current}
		<song_title> = <jam_display_name>
	endif
	formatText TextName = completion_text qs(0x76b3fda7) d = <completion>
	z = 100.0
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		Pos = (0.0, 0.0)
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
	set_focus_color \{Color = menu_focus_color}
	set_unfocus_color \{Color = black}
	text_scale = (0.9, 0.95)
	if NOT English
		text_scale = (0.9, 0.85)
	endif
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	gamemode_gettype
	if (<Type> = quickplay)
		if NOT ui_event_exists_in_stack \{Name = 'jam'}
			playlist_getsize
			playlist_getcurrentsongindex
			<display_next_song> = 0
			if (<Type> = quickplay)
				if GMan_GoalIsActive \{goal = quickplay}
					gman_getdata \{goal = quickplay
						Name = targeted_challenge}
					if (<targeted_challenge> != NULL)
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
				AddArrayElement array = <popup_options> element = <quickplay_skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			playlist_getsize
			playlist_getcurrentsongindex
			if (<current_song_index> < (<playlist_size> -1))
				if NOT console_is_net_career_client
					<arrange_band_option> = {
						func = fail_song_menu_select_arrange_band
						text = qs(0x2edf107a)
					}
					AddArrayElement array = <popup_options> element = <arrange_band_option>
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
			AddArrayElement array = <popup_options> element = <change_diff_option>
			<popup_options> = <array>
		endif
	endif
	if (($is_network_game = 0) || (<Type> = career))
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
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	Change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	gamemode_gettype
	if NOT demobuild
		if NOT (<current_song> = jamsession)
			if isSinglePlayerGame
				if NOT ininternetmode
					if (<Type> = career || <Type> = quickplay)
						getplayerinfo (<player_device> + 1) difficulty
						if (<difficulty> != beginner)
							<practice_option> = {
								func = fail_song_menu_select_practice
								text = qs(0x3ea7dec9)
							}
							AddArrayElement array = <popup_options> element = <practice_option>
							<popup_options> = <array>
						endif
					endif
				endif
			endif
		endif
	endif
	if GotParam \{new_song_option}
		AddArrayElement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		time_offset = 0
		time_offset = ($Default_SongLost_Transition.time * -1)
		getnumplayersingame
		<part> = guitar
		if (<num_players> = 1)
			getfirstplayer
			getplayerinfo <Player> part
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
				formatText checksumName = stars_for_song 'stars_for_song%d' d = <song_num>
				num_max_stars_fail_info = ($quest_chapter_finale.<stars_for_song>)
				formatText TextName = max_stars_fail_info qs(0x48c6d14c) d = <num_max_stars_fail_info>
				getfirstplayer \{local}
				getnumplayersingame
				if (<num_players> > 1)
					getplayerinfo <Player> Band
					getbandinfo <Band> projected_song_stars
				else
					getplayerinfo <Player> projected_song_stars
				endif
				MathFloor <projected_song_stars>
				formatText TextName = num_stars_fail_info qs(0x48c6d14c) d = <floor> DecimalPlaces = 0
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
		GetArraySize <popup_options>
		if (<array_Size> <= 2)
			if ScreenElementExists id = <menu_id>
				if InNetGame
					GetScreenElementChildren id = <menu_id>
					GetArraySize <children>
					printf \{qs(0x1b806245)}
					if (<array_Size> >= 2)
						if ScreenElementExists \{id = dialog_box_desc_id}
							if dialog_box_desc_id :desc_resolvealias \{Name = alias_highlight_btn
									param = highlight_btn}
								<highlight_btn> :Obj_SpawnScriptNow update_hightlight_bar_pos params = {focus_id = (<children> [1])}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	disable_pause
endscript

script update_hightlight_bar_pos 
	Wait \{5
		gameframes}
	GetScreenElementPosition id = <focus_id> absolute
	GetScreenElementDims id = <focus_id>
	<screenelementpos> = (<screenelementpos> + ((<width> / 2.0) * (1.0, 0.0)))
	<screenelementpos> = (<screenelementpos> + ((<height> / 2.0) * (0.0, 1.0)))
	se_setprops Pos = {<screenelementpos> absolute}
	se_setprops \{alpha = 1.0}
endscript

script destroy_fail_song_menu 
	Change \{g_generic_barrel_menu_focus_scale = 1.5}
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_menu \{menu_id = fail_song_static_text_container}
	destroy_dialog_box
endscript

script fail_song_menu_select_practice 
	gamemode_gettype
	if (<Type> = career)
		ui_sfx \{menustate = Generic
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
	fadetoblack \{On
		time = 0.0
		alpha = 1.0
		z_priority = 1000
		no_wait}
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ($is_network_game = 1)
		Change agora_failed_attempts = ($agora_failed_attempts + 1)
		if IsHost
			host_retry_career_song
		else
			SendStructure \{callback = host_retry_career_song
				data_to_send = {
					None
				}}
		endif
	else
		if NOT ($game_mode = practice)
			Change agora_failed_attempts = ($agora_failed_attempts + 1)
			Change \{gameplay_restart_song = 1}
			xenon_singleplayer_session_init
		else
			practice_restart_song
		endif
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_back \{state = Uistate_gameplay}
	endif
endscript

script fail_song_menu_select_quit 
	ui_sfx \{menustate = Generic
		uitype = select}
	gamemode_gettype
	if (<Type> = career)
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
	elseif (<Type> = quickplay)
		if musicstudio_mainobj :musicstudio_isinmusicstudio
			<quit_data> = {
				option2_func = song_ended_menu_select_quit
				option2_text = qs(0x67d9c56d)
				option2_func_params = {quit_career_confirm}
				has_third_choice = <has_third_choice>
				<third_choice_params>
			}
		else
			if ui_event_exists_in_stack \{Name = 'songlist'}
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
		if NOT ui_event_exists_in_stack \{Name = 'jam'}
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
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose state = uistate_pausemenu_change_difficulty data = {<...> no_warning enable_pause = 0 failed_song = 1}
endscript

script fail_song_menu_select_arrange_band 
	if ($is_network_game = 1)
		if IsHost
			SendStructure \{callback = fail_song_menu_select_arrange_band
				data_to_send = {
					None
				}}
		else
			Change \{suppress_finalbattle_from_band_select = 1}
		endif
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	hide_glitch \{num_frames = 40}
	generic_event_back \{state = uistate_quest_band_select
		data = {
			from_fail_song = 1
		}}
endscript

script quickplay_skip_song 
	sd_unload_song
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	songlist_remove_first_song_in_playlist
	if quickplay_set_new_song_in_gig_list
		create_loading_screen
		addhistoryforcurrentsong \{add_empty}
		playlist_getcurrentsong
		Change \{gameplay_restart_song = 1}
		Change \{agora_failed_attempts = 0}
		xenon_singleplayer_session_init
		generic_event_back \{nosound
			state = Uistate_gameplay}
	else
		pushdisablerendering \{context = going_into_songlist
			Type = unchecked}
		generic_event_back \{nosound
			state = uistate_songlist}
	endif
endscript

script host_retry_career_song 
	SendStructure \{callback = net_career_retry_song
		data_to_send = {
			None
		}}
	net_career_retry_song
endscript

script net_career_retry_song 
	Change \{gameplay_restart_song = 1}
	Change \{net_ready_to_start = 0}
	($default_loading_screen.create)
	xenon_singleplayer_session_init
	ui_event_wait_for_safe
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
endscript
