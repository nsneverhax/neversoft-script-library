is_guitar_controller = 0

script menu_replace_to_fail_song 
	spawnscriptnow \{ui_event
		params = {
			event = menu_replace
			data = {
				state = UIstate_fail_song
			}
		}}
endscript

script create_fail_song_menu 
	Change \{last_start_pressed_device = $primary_controller}
	menu_font = fontgrid_title_a1
	<menu_pos> = (640.0, 420.0)
	GMan_SongTool_GetCurrentSong
	completion = 0
	SongFileManager func = get_song_end_time song_name = <current_song>
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
		endif
	endif
	CastToInteger \{completion}
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	GetNumPlayersInGame
	highest_difficulty_index = 0
	playing_expert_plus = 0
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		if (($difficulty_list_props.<difficulty>.index) >= <highest_difficulty_index>)
			<highest_difficulty_index> = ($difficulty_list_props.<difficulty>.index)
			if (<difficulty> = expert)
				GetPlayerInfo <player> part
				if (<part> = Drum)
					GetPlayerInfo <player> double_kick_drum
					if (<double_kick_drum> = 1)
						<playing_expert_plus> = 1
					endif
				endif
			endif
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	get_difficulty_text_upper difficulty = ($difficulty_list [<highest_difficulty_index>])
	if (<playing_expert_plus>)
		FormatText TextName = new_diff_text qs(0xdb6857e4) d = <difficulty_text>
		<difficulty_text> = <new_diff_text>
	endif
	get_song_title song = <current_song>
	GetUpperCaseString <song_title>
	FormatText TextName = completion_text qs(0x720688b0) d = <completion>
	z = 100.0
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		Pos = (0.0, 0.0)
		z_priority = 2}
	Title = qs(0x5c9b76c1)
	if NOT InInternetMode
		popup_options = [
			{
				func = fail_song_menu_select_retry_song
				text = qs(0x647b5a84)
			}
		]
	else
		<popup_options> = []
		if ($g_net_leader_player_num != -1)
			if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
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
	text_scale = (0.9, 0.95)
	if NOT English
		text_scale = (0.9, 0.85)
	endif
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	GameMode_GetType
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			GetArraySize \{$current_playlist}
			if (<array_size> > 1)
				<quickplay_skip_song_option> = {
					func = quickplay_skip_song
					func_params = {failed_song}
					text = qs(0xef74f7d2)
				}
				AddArrayElement array = <popup_options> element = <quickplay_skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	if NOT ((<current_song> = jamsession) || ($is_network_game = 1))
		if NOT GameMode_IsBandScoring
			<change_diff_option> = {
				func = fail_song_menu_select_change_diff
				text = qs(0xa717ca5b)
			}
			AddArrayElement array = <popup_options> element = <change_diff_option>
			<popup_options> = <array>
		endif
	endif
	Change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	GameMode_GetType
	if NOT (<current_song> = jamsession)
		if isSinglePlayerGame
			if NOT InInternetMode
				if (<type> = career || <type> = quickplay)
					GetPlayerInfo (<player_device> + 1) difficulty
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
	GameMode_GetType
	if (<type> = career)
		if ($is_network_game = 1)
			if IsHost
				<new_song_option> = {
					func = fail_song_menu_select_new_song
					text = qs(0x79e7750b)
				}
			else
				<new_song_option> = {
					func = empty_script
					text = qs(0xdc6b5a57)
					not_focusable
				}
			endif
		else
			<new_song_option> = {
				func = fail_song_menu_select_new_song
				text = qs(0xe561ef6f)
			}
		endif
	else
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			<new_song_option> = {
				func = quickplay_select_edit_playlist
				text = qs(0xa8f207af)
			}
			AddArrayElement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		endif
		<new_song_option> = {
			func = fail_song_menu_select_new_song
			text = qs(0x3e482764)
		}
	endif
	if GotParam \{new_song_option}
		AddArrayElement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	if ($is_network_game = 1)
		<quit_option> = {
			func = select_quit_network_game
			func_params = {from_fail_menu = 1}
			text = qs(0x67d9c56d)
		}
	else
		<quit_option> = {
			func = fail_song_menu_select_quit
			text = qs(0x67d9c56d)
		}
	endif
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		time_offset = 0
		time_offset = ($Default_SongLost_Transition.time * -1)
		GetNumPlayersInGame
		<part> = guitar
		if (<num_players> = 1)
			GetFirstPlayer
			GetPlayerInfo <player> part
			if (<part> != vocals)
				<part> = guitar
			endif
		endif
		InitPracticeCurrentSection songname = <current_song> time_offset = <time_offset> part = <part>
		ShortenUIString {
			ui_string = <section_name_text>
			max_len = 35
		}
		<section_name_text> = <short_ui_string>
		create_dialog_box {
			template = fail_song
			heading_text = <Title>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <UpperCaseString>
				section_name_text = <section_name_text>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
	PauseGame
	disable_pause
endscript

script update_hightlight_bar_pos 
	wait \{5
		gameframes}
	GetScreenElementPosition id = <focus_id> absolute
	GetScreenElementDims id = <focus_id>
	<ScreenElementPos> = (<ScreenElementPos> + ((<width> / 2.0) * (1.0, 0.0)))
	<ScreenElementPos> = (<ScreenElementPos> + ((<height> / 2.0) * (0.0, 1.0)))
	SE_SetProps Pos = {<ScreenElementPos> absolute}
	SE_SetProps \{alpha = 1.0}
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		kill_gem_scroller
		generic_event_choose \{state = UIstate_select_practice_mode}
	endif
endscript

script destroy_fail_song_menu 
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_menu \{menu_id = fail_song_static_text_container}
	destroy_dialog_box
endscript

script fail_song_menu_select_practice 
	GameMode_GetType
	if (<type> = career)
		generic_event_choose \{state = UIstate_practice_warning
			data = {
				warning_text = qs(0xbeec1530)
			}}
	else
		practice_warning_menu_select_practice_mode
	endif
endscript

script fail_song_menu_select_retry_song 
	fadetoblack \{on
		time = 0.0
		alpha = 1.0
		z_priority = $ps3_fade_overlay_z
		no_wait}
	GH3_SFX_fail_song_stop_sounds
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
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
		generic_event_back \{state = uistate_gameplay}
	endif
endscript

script fail_song_menu_select_new_song 
	GH3_SFX_fail_song_stop_sounds
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if NOT CD
		if ($is_in_debug = 1)
			generic_event_back \{state = UIstate_debug}
			return
		endif
	endif
	if is_current_song_a_jam_session
		songlist_clear_playlist
		if ui_event_exists_in_stack \{name = 'jam'}
			generic_event_back state = uistate_jam player = <player> data = {show_popup = 0 return_from_song = 1}
		elseif ui_event_exists_in_stack \{name = 'songlist'}
			generic_event_back state = uistate_songlist player = <player>
		endif
	else
		songlist_clear_playlist
		GameMode_GetType
		if (<type> = career)
			if ($is_network_game = 1)
				SendStructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						None
					}}
				net_career_goto_band_lobby
			else
				career_pause_quit \{NewGig}
			endif
		else
			generic_event_back state = uistate_songlist player = <player>
		endif
	endif
endscript

script fail_song_menu_select_quit 
	generic_event_choose \{state = UIstate_pausemenu_quit_warning
		data = {
			option2_func = song_ended_menu_select_quit
			option2_func_params = {
				quit_career_confirm
			}
		}
		no_sound}
endscript

script fail_song_menu_select_change_diff 
	generic_event_choose state = UIstate_pausemenu_change_difficulty data = {<...> no_warning enable_pause = 0}
endscript

script quickplay_skip_song 
	reset_song_loading_hack_global
	GH3_SFX_fail_song_stop_sounds
	songlist_remove_first_song_in_playlist
	if quickplay_set_new_song_in_gig_list
		create_loading_screen
		AddHistoryForCurrentSong \{add_empty}
		GMan_SongTool_GetCurrentSong
		Change \{gameplay_restart_song = 1}
		Change \{agora_failed_attempts = 0}
		xenon_singleplayer_session_init
		generic_event_back \{nosound
			state = uistate_gameplay}
	else
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
			state = uistate_gameplay
		}}
endscript
