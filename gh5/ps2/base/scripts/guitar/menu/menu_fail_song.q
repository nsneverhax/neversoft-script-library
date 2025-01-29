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
	SoundEvent \{event = fail_screen_sfx}
	SoundEvent \{event = menu_warning_sfx_softer}
	Change \{last_start_pressed_device = $primary_controller}
	menu_font = fontgrid_title_a1
	<menu_pos> = (640.0, 420.0)
	gman_songtool_getcurrentsong
	completion = 0
	get_song_end_time song = <current_song>
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
		endif
	endif
	CastToInteger \{completion}
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		min = ($difficulty_list_props.<difficulty1>.index)
		MathMin a = <min> b = ($difficulty_list_props.<difficulty2>.index)
		CastToInteger \{min}
		difficulty_index = <min>
		get_difficulty_text_upper difficulty = ($difficulty_list [<difficulty_index>])
	else
		if (($player1_status.double_kick_drum) = 1)
			if StructureContains structure = ($permanent_songlist_props.($current_song)) double_kick
				if ($permanent_songlist_props.($current_song).double_kick = 1)
					difficulty_text = qs(0x7a19b5f7)
				else
					difficulty_text = qs(0x334908ac)
				endif
			endif
		else
			getplayerinfo \{1
				difficulty
				out = difficulty1}
			get_difficulty_text_upper difficulty = <difficulty1>
		endif
	endif
	get_song_title song = <current_song>
	GetUpperCaseString <song_title>
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
	endif
	<song_title_scale> = 1.65
	set_focus_color \{Color = reddish_grey}
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
			if (($num_quickplay_song_list > 1) || ($0xc7e670d7 = 1))
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
		if NOT gamemode_isbandscoring
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
	if IsGuitarController controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	gamemode_gettype
	if NOT (<current_song> = jamsession)
		if (<Type> = career || <Type> = quickplay)
			if ($current_num_players = 1)
				<practice_option> = {
					func = fail_song_menu_select_practice
					text = qs(0x3ea7dec9)
				}
				AddArrayElement array = <popup_options> element = <practice_option>
				<popup_options> = <array>
			endif
		endif
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($is_network_game = 1)
			if IsHost
				<new_song_option> = {
					func = fail_song_menu_select_new_song
					text = qs(0x79e7750b)
				}
			else
				<new_song_option> = {
					func = empty_script
					text = qs(0xf40ad470)
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
			text = qs(0x793e4d21)
		}
	endif
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		create_dialog_box {
			template = fail_song
			heading_text = <title>
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <UppercaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
	disable_pause
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
		kill_gem_scroller
		generic_event_choose \{state = uistate_select_practice_mode}
	endif
endscript

script destroy_fail_song_menu 
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_menu \{menu_id = fail_song_static_text_container}
	destroy_dialog_box
endscript

script fail_song_menu_select_practice 
	generic_event_choose \{state = uistate_practice_warning}
endscript

script fail_song_menu_select_retry_song 
	0xe9384b7a \{full}
	Change \{ps2_gameplay_restart_song = 1}
	GH3_SFX_fail_song_stop_sounds
	if ($is_network_game = 1)
		SendStructure \{callback = net_career_retry_song
			data_to_send = {
				None
			}}
		net_career_retry_song
	else
		if NOT ($game_mode = practice)
			Change \{gameplay_restart_song = 1}
		else
			practice_restart_song
		endif
		generic_event_back \{state = Uistate_gameplay}
	endif
endscript

script fail_song_menu_select_new_song 
	GH3_SFX_fail_song_stop_sounds
	if NOT CD
		if ($is_in_debug = 1)
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		if ui_event_exists_in_stack \{Name = 'jam'}
			if NOT ($jam_view_cam_created = 1)
				destroy_bg_viewport
				setup_bg_viewport
				PlayIGCCam \{Name = jam_view_cam
					viewport = bg_viewport
					controlscript = jam_camera_script
					params = {
						start_camera = jam_song_select
					}
					play_hold = 1}
				Change \{jam_view_cam_created = 1}
				Change \{target_jam_camera_prop = failed_song_cam}
			endif
			generic_event_back state = uistate_jam_select_song Player = <Player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{Name = 'setlist'}
			generic_event_back state = uistate_setlist Player = <Player>
		endif
	else
		gamemode_gettype
		if (<Type> = career)
			if ($is_network_game = 1)
				SendStructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						None
					}}
				net_career_goto_band_lobby
			else
				generic_event_back state = uistate_gig_posters Player = <Player>
			endif
		else
			generic_event_back state = uistate_setlist Player = <Player>
		endif
	endif
endscript

script fail_song_menu_select_quit 
	generic_event_choose \{state = uistate_pausemenu_quit_warning
		data = {
			option2_func = song_ended_menu_select_quit
			option2_func_params = {
				quit_career_confirm
			}
		}
		no_sound}
endscript

script fail_song_menu_select_change_diff 
	generic_event_choose state = uistate_pausemenu_change_difficulty data = {<...> no_warning}
endscript

script quickplay_skip_song 
	do_gh3_pause
	GH3_SFX_fail_song_stop_sounds
	if quickplay_set_new_song_in_gig_list
		if ($0xc7e670d7 = 1)
			<current_song> = $current_song
		else
			<current_song> = ($quickplay_song_list [($quickplay_song_list_current) -1])
		endif
		if (<current_song> = jamsession)
			jamsession_unload
		endif
		if ($0xc7e670d7 = 1)
			0x587a82d3
			<next_song> = <0x72fa1922>
		else
			<next_song> = ($quickplay_song_list [($quickplay_song_list_current)])
		endif
		if (<next_song> = jamsession)
			jam_quickplay_get_and_start_song
		else
			Change \{gameplay_restart_song = 1}
			ui_event_wait_for_safe
			ui_event_get_top
			if (<base_name> = 'gameplay')
				ui_event \{event = menu_refresh}
			else
				generic_event_back \{state = Uistate_gameplay}
			endif
		endif
	else
		generic_event_back \{state = uistate_setlist}
	endif
endscript

script net_career_retry_song 
	Change \{gameplay_restart_song = 1}
	Change \{net_ready_to_start = 0}
	($default_loading_screen.create)
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
endscript
