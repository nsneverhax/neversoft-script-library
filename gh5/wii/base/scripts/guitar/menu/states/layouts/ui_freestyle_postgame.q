freestyle_postgame_is_saved = -1
freestyle_postgame_viewed = 0
freestyle_save_process_stage = song_name

script ui_create_freestyle_postgame 
	Change \{freestyle_styleselect_after_song = 1}
	Change \{freestyle_game_from_postgame = 1}
	CreateScreenElement \{parent = root_window
		id = freestyle_postgame_tree
		Type = descinterface
		desc = 'freestyle_end_song_menu'}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = postgame main}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_back NULL}
		]
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_stats}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_transfer_to_menu params = {to = stats from = main}}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_watch}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_watch}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	if issavecorrupt \{filetype = freestyle}
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_save}
		<resolved_id> :se_setprops {event_handlers = [
				{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
				{focus freestyle_menu_option_focus_disabled}
				{unfocus freestyle_menu_option_unfocus}
			]
			Scale = ($freestyle_unfocus_scale)
			rgba = ($freestyle_unfocus_rgba)
		}
	else
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_save}
		<resolved_id> :se_setprops {event_handlers = [
				{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
				{focus freestyle_menu_option_focus}
				{unfocus freestyle_menu_option_unfocus}
				{pad_choose freestyle_postgame_save}
			]
			Scale = ($freestyle_unfocus_scale)
			rgba = ($freestyle_unfocus_rgba)
		}
	endif
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_discard}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_discard}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_rerecord}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_rerecord}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_new}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_new_song}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_quit}
	<resolved_id> :se_setprops {event_handlers = [
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_postgame_tree}}
			{focus freestyle_menu_option_focus}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_postgame_quit}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	if (($freestyle_postgame_is_saved) = -1)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_rerecord}
		DestroyScreenElement id = <resolved_id>
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_new}
		DestroyScreenElement id = <resolved_id>
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_quit}
		DestroyScreenElement id = <resolved_id>
	else
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_save}
		DestroyScreenElement id = <resolved_id>
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_discard}
		DestroyScreenElement id = <resolved_id>
	endif
	create_2d_spring_system \{desc_id = freestyle_postgame_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_skull_add_container}
	<resolved_id> :obj_spawnscript ui_shakey
	<resolved_id> :obj_spawnscript ui_frazzmatazz
	freestyle_postgame_tree :desc_resolvealias \{Name = banner_main_animatable}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_postgame_tree :desc_resolvealias \{Name = banner_stats_animatable}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_postgame_tree :desc_resolvealias \{Name = banner_save_animatable}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_retrieve_stats_from_stone
	time_ms = ($freestyle_mode_stats.song_length)
	format_time ms = <time_ms>
	freestyle_postgame_tree :se_setprops {
		stats_alpha = 1
		genre = ($freestyle_current_style_settings.visible_name)
		song_length = <formatted_time>
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_stats_menu}
	GetScreenElementChildren id = <resolved_id>
	GetArraySize <children>
	if (<array_Size> > 0)
		counter = 0
		begin
		(<children> [<counter>]) :se_setprops {
			event_handlers = [
				{focus freestyle_postgame_update_scrollbar}
			]
		}
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_scrollable_stats_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = postgame stats}}
			{pad_choose freestyle_postgame_transfer_to_menu params = {to = main from = stats}}
		]
	}
	LaunchEvent Type = focus target = <resolved_id>
	SpawnScriptNow \{freestyle_postgame_initialize_stats
		params = {
			instrument = guitar
		}}
	SpawnScriptNow \{freestyle_postgame_initialize_stats
		params = {
			instrument = drums
		}}
	SpawnScriptNow \{freestyle_postgame_initialize_stats
		params = {
			instrument = bass
		}}
	if (($freestyle_game_mode) = watch || (($freestyle_postgame_is_saved) > -1) || (($freestyle_postgame_viewed) = 1))
		freestyle_postgame_transfer_to_menu \{to = main
			from = stats}
	else
		freestyle_postgame_transfer_to_menu \{to = stats
			from = main}
	endif
	Change \{freestyle_postgame_viewed = 1}
endscript

script freestyle_postgame_watch 
	Change \{freestyle_recording_mode = playback}
	Change \{freestyle_game_mode = watch}
	freestyle_restore_performance_data
	freestyle_setup_players_for_playback
	generic_event_choose \{state = uistate_freestyle_game}
endscript

script freestyle_postgame_save 
	freestyle_postgame_transfer_to_menu from = main to = save device_num = <device_num>
endscript

script freestyle_postgame_discard 
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
	LaunchEvent Type = unfocus target = <resolved_id>
	create_dialog_box {
		use_all_controllers
		heading_text = qs(0xaa163738)
		body_text = qs(0xf4ad8535)
		options = [
			{
				func = destroy_dialog_box
				func_params = {dont_remove_helpers}
				text = qs(0xf7723015)
			}
			{
				func = freestyle_postgame_confirm_delete
				text = qs(0x1fbf1f17)
			}
		]
		dlog_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		on_destroy_script = LaunchEvent
		on_destroy_script_params = {Type = focus target = <resolved_id>}
	}
endscript

script freestyle_postgame_confirm_delete 
	Change \{freestyle_recording_mode = record}
	destroy_dialog_box
	generic_event_choose \{state = uistate_band_lobby
		data = {
			after_game = 1
		}}
endscript

script freestyle_postgame_rerecord 
	freestyleselectviewslot viewslot = ($freestyle_postgame_is_saved)
	Change \{freestyle_recording_mode = overdub}
	Change \{freestyle_game_mode = standard}
	freestyle_restore_performance_data
	freestyle_setup_players_for_playback
	Change freestyle_band_lobby_original_rerecording_data = ($freestyle_player_data)
	Change \{freestyle_game_from_postgame = 0}
	generic_event_choose \{state = uistate_band_lobby}
endscript

script freestyle_postgame_new_song 
	Change \{freestyle_recording_mode = record}
	Change \{freestyle_postgame_is_saved = -1}
	generic_event_choose \{state = uistate_band_lobby
		data = {
			clear_previous_stack
		}}
endscript

script freestyle_postgame_quit 
	Change \{freestyle_postgame_is_saved = -1}
	generic_event_choose \{state = uistate_freestyle_mainmenu
		data = {
			clear_previous_stack
		}}
endscript

script freestyle_postgame_transfer_to_menu 
	RequireParams \{[
			to
			from
		]
		all}
	if (<from> = stats)
		KillSpawnedScript \{Name = freestyle_stat_management_loop}
		freestyle_postgame_tree :se_setprops \{stats_alpha = 0}
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_scrollable_stats_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		if (<to> = main)
			freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
			LaunchEvent Type = focus target = <resolved_id>
		endif
	elseif (<from> = main)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		if (<to> = stats)
			freestyle_postgame_tree :desc_resolvealias \{Name = alias_scrollable_stats_menu}
			LaunchEvent Type = focus target = <resolved_id>
			SpawnScriptNow \{freestyle_stat_management_loop}
			freestyle_postgame_tree :se_setprops \{stats_alpha = 1}
		elseif (<to> = save)
			Change primary_controller = <device_num>
			Change last_start_pressed_device = <device_num>
			freestyle_postgame_tree :se_setprops \{save_song_alpha = 1}
			freestyle_postgame_init_save_process
		endif
	elseif (<from> = save)
		freestyle_postgame_tree :se_setprops \{save_song_alpha = 0}
		freestyle_postgame_tree :se_setprops \{final_song = qs(0x03ac90f0)}
		freestyle_postgame_tree :se_setprops \{final_artist = qs(0x03ac90f0)}
		freestyle_textbox_cleanup
		if (<to> = main)
			freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endif
endscript

script freestyle_postgame_init_save_process 
	Wait \{1
		gameframe}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_band_name_container}
	freestyle_postgame_tree :se_setprops \{song_name_alpha = 0
		band_name_alpha = 1}
	Change \{freestyle_save_process_stage = song_name}
	ui_create_edit_name {
		parent = <resolved_id>
		default_name = qs(0x00000000)
		char_limit = 20
		title = qs(0xeecb2665)
		device_num = ($primary_controller)
		cancel_script = freestyle_cancel_save_ui
		Pos = (-78.0, -125.0)
		accept_script = freestyle_save_artist_name
		accept_params = {}
	}
endscript

script freestyle_cancel_save_ui 
	DestroyScreenElement \{id = edit_name_screen_id}
	freestyle_postgame_transfer_to_menu \{to = main
		from = save}
endscript

script freestyle_update_save_song_button_helpers 
	if ScreenElementExists \{id = edit_name_screen_id}
		edit_name_screen_id :se_getprops \{name_text}
		if freestyle_validate_song_name string = <name_text>
			if ($freestyle_save_process_stage = song_name)
				clean_up_user_control_helpers
				add_user_control_helper \{text = qs(0x43f2255e)
					button = green
					z = 100000}
				add_user_control_helper \{text = qs(0xf7723015)
					button = red
					z = 100000}
				add_user_control_helper \{text = qs(0xe3576d13)
					button = blue
					z = 100000}
				add_user_control_helper \{text = qs(0x71449adf)
					button = yellow
					z = 100000}
				add_user_control_helper \{text = qs(0x2931d48b)
					button = start
					z = 100000}
			elseif ($freestyle_save_process_stage = band_name)
				clean_up_user_control_helpers
				add_user_control_helper \{text = qs(0x43f2255e)
					button = green
					z = 100000}
				add_user_control_helper \{text = qs(0xf7723015)
					button = red
					z = 100000}
				add_user_control_helper \{text = qs(0xe3576d13)
					button = blue
					z = 100000}
				add_user_control_helper \{text = qs(0x71449adf)
					button = yellow
					z = 100000}
				add_user_control_helper \{text = qs(0xe0ca6171)
					button = start
					z = 100000}
			endif
		else
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0x43f2255e)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0xe3576d13)
				button = blue
				z = 100000}
			add_user_control_helper \{text = qs(0x71449adf)
				button = yellow
				z = 100000}
		endif
	endif
endscript

script freestyle_save_artist_name 
	RequireParams \{[
			text
		]
		all}
	if freestyle_validate_song_name string = <text>
		edit_name_screen_id :GetTags \{song}
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_song_name_container}
		freestyle_postgame_tree :se_setprops \{song_name_alpha = 1
			band_name_alpha = 0}
		if NOT GotParam \{song}
			song = qs(0x00000000)
		endif
		DestroyScreenElement \{id = edit_name_screen_id}
		Change \{freestyle_save_process_stage = band_name}
		ui_create_edit_name {
			parent = <resolved_id>
			default_name = <song>
			char_limit = 20
			title = qs(0x7826e8c7)
			device_num = ($primary_controller)
			cancel_script = freestyle_save_song_revert_to_artist_input
			Pos = (-78.0, -125.0)
			accept_script = freestyle_save_song_finish
			accept_params = {}
		}
		if ScreenElementExists \{id = edit_name_screen_id}
			edit_name_screen_id :SetTags artist = <text>
			freestyle_postgame_tree :se_setprops {
				final_artist = <text>
			}
			freestyle_postgame_tree :se_setprops \{final_song = qs(0x03ac90f0)}
		else
			ScriptAssert \{qs(0x43b41ac7)}
		endif
	endif
endscript

script freestyle_save_song_revert_to_artist_input 
	if ScreenElementExists \{id = edit_name_screen_id}
		edit_name_screen_id :GetTags \{artist}
		edit_name_screen_id :se_getprops \{name_text}
	else
		ScriptAssert \{'For some reason the texbox doesnt exist...we need it to get this tag...'}
	endif
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_band_name_container}
	if NOT GotParam \{artist}
		artist = qs(0x00000000)
	endif
	freestyle_postgame_tree :se_setprops \{song_name_alpha = 0
		band_name_alpha = 1}
	Change \{freestyle_save_process_stage = song_name}
	DestroyScreenElement \{id = edit_name_screen_id}
	ui_create_edit_name {
		parent = <resolved_id>
		default_name = <artist>
		char_limit = 20
		title = qs(0xeecb2665)
		device_num = ($primary_controller)
		cancel_script = freestyle_cancel_save_ui
		Pos = (-78.0, -125.0)
		accept_script = freestyle_save_artist_name
		accept_params = {}
	}
	freestyle_postgame_tree :se_setprops \{final_artist = qs(0x03ac90f0)}
	edit_name_screen_id :SetTags song = <name_text>
	freestyle_postgame_tree :se_setprops {
		final_song = <name_text>
	}
endscript

script freestyle_save_song_finish 
	if freestyle_validate_song_name string = <text>
		if ScreenElementExists \{id = edit_name_screen_id}
			edit_name_screen_id :GetTags \{artist}
		endif
		freestyle_get_available_save_slot
		if ($wii_memcard_status = load_no_save_ingame)
			get_string_wii \{message = insufficient_space}
			LaunchEvent \{Type = unfocus
				target = edit_name_screen_id}
			create_dialog_box {
				use_all_controllers
				heading_text = $wii_error_header
				body_text = <localized_string>
				options = [
					{
						func = destroy_dialog_box
						text = $wii_saveload_continuenosave
					}
					{
						func = ui_wii_trc_handle_action
						func_params = {action = wii_menu}
						text = $wii_saveload_wiimenu
					}
				]
				dlog_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				on_destroy_script = LaunchEvent
				on_destroy_script_params = {Type = focus target = edit_name_screen_id}
			}
		elseif (<saveslot> = -1)
			LaunchEvent \{Type = unfocus
				target = edit_name_screen_id}
			create_dialog_box {
				use_all_controllers
				heading_text = qs(0xaa163738)
				body_text = qs(0x3b41678a)
				options = [
					{
						func = destroy_dialog_box
						func_params = {dont_remove_helpers}
						text = qs(0xd2915c27)
					}
					{
						func = freestyle_confirm_overwrite_decision
						func_params = {song = <artist> artist = <text>}
						text = qs(0x58e0a1fb)
					}
				]
				dlog_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				on_destroy_script = LaunchEvent
				on_destroy_script_params = {Type = focus target = edit_name_screen_id}
			}
		else
			Change freestyle_postgame_is_saved = <saveslot>
			freestyleselectsaveslot saveslot = <saveslot>
			freestyle_tag_current_performance song_name = <artist> artist_name = <text>
			ui_memcard_save_freestyle_replace \{event = menu_replace
				state = uistate_freestyle_postgame}
		endif
	else
		printf \{'Not progressing as the user has not typed in a valid song name'}
	endif
endscript

script freestyle_confirm_overwrite_decision 
	destroy_dialog_box
	generic_event_choose state = uistate_freestyle_delete_song data = {song = <song> artist = <artist>}
endscript

script freestyle_get_available_save_slot 
	GetArraySize \{$freestyle_performance_data}
	if (<array_Size> > 0)
		counter = 0
		begin
		if NOT StructureContains structure = ($freestyle_performance_data [<counter>]) song_name
			return saveslot = <counter>
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
		return \{saveslot = -1}
	else
		return \{saveslot = -1}
	endif
endscript

script freestyle_validate_song_name 
	RequireParams \{[
			string
		]
		all}
	StringToCharArray string = <string>
	GetArraySize <char_array>
	if NOT (<array_Size> > 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script freestyle_postgame_update_scrollbar 
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_stats_menu}
	<resolved_id> :menu_getselectedindex
	countscreenelementchildren id = <resolved_id>
	selected_index = (<selected_index> - 1)
	if (<selected_index> >= 0)
		new_distance = (((<selected_index> * 1.0) / (<num_children> -3)) * 124)
		incremental_vector = ((0.0, 1.0) * <new_distance>)
		new_vector = (<incremental_vector> + (-4.0, -24.0))
		freestyle_postgame_tree :se_setprops {
			scrollbar_pos = <new_vector>
		}
	endif
endscript

script freestyle_postgame_initialize_stats 
	RequireParams \{[
			instrument
		]
		all}
	if (<instrument> = guitar)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_mii_head_container_0}
		mii_container = <resolved_id>
		mii_index = ($freestyle_player_data [0].mii_index)
		mii_database = ($freestyle_player_data [0].mii_database)
		if ScreenElementExists \{id = mii_face_0_reg}
			DestroyScreenElement \{id = mii_face_0_reg}
		endif
		if ((($freestyle_player_data [0].auto_play_enabled) = true) || (($freestyle_player_data [0].player_type) = human))
			CreateScreenElement {
				Type = miiiconelement
				parent = <mii_container>
				id = mii_face_0_reg
				pos_anchor = [center center]
				just = [center center]
				Pos = (0.0, 0.0)
				z_priority = 1001
				mii_expression = Normal
				mii_bgcolor = $freestyle_mii_on_bg
				mii_dims = (128.0, 128.0)
				mii_index = <mii_index>
				mii_database = <mii_database>
			}
		endif
		if (($freestyle_player_data [0].auto_play_enabled) = true)
			freestyle_postgame_tree :se_setprops \{mii_name_guitar = $wii_freestyle_cpu_text}
		elseif (($freestyle_player_data [0].player_type) = human)
			if (<mii_database> = randomdb)
				freestyle_postgame_tree :se_setprops \{mii_name_guitar = qs(0xaecdfaea)}
			else
				getmiiname index = <mii_index> database = <mii_database>
				freestyle_postgame_tree :se_setprops {
					mii_name_guitar = <mii_name>
				}
			endif
		else
			freestyle_postgame_tree :se_setprops \{mii_name_guitar = qs(0x03ac90f0)}
		endif
		if (($freestyle_player_data [0].auto_play_enabled) = true)
			play_style_guitar = qs(0xc4992bba)
			notes_played = qs(0xc4992bba)
			notes_per_second = qs(0xc4992bba)
			notes_star = qs(0xc4992bba)
			notes_chord = qs(0xc4992bba)
			notes_lick = qs(0xc4992bba)
			notes_whammy = qs(0xc4992bba)
			notes_riff = qs(0xc4992bba)
			notes_solo = qs(0xc4992bba)
			notes_epic = qs(0xc4992bba)
			favorite_tilt = qs(0xc4992bba)
			favorite_drum_text = qs(0xc4992bba)
			avg_intensity = qs(0xc4992bba)
			notes_single = qs(0xc4992bba)
		elseif (($freestyle_player_data [0].player_type) = human)
			play_style_guitar = ($freestyle_stats [0].play_style)
			formatText TextName = notes_played qs(0x48c6d14c) d = ($freestyle_stats [0].total_notes_played)
			formatText TextName = notes_per_second qs(0x48c6d14c) d = ($freestyle_stats [0].notes_per_sec)
			formatText TextName = notes_star qs(0x48c6d14c) d = ($freestyle_stats [0].notes_star)
			formatText TextName = notes_chord qs(0x48c6d14c) d = ($freestyle_stats [0].notes_chord)
			formatText TextName = notes_lick qs(0x48c6d14c) d = ($freestyle_stats [0].notes_lick)
			formatText TextName = notes_whammy qs(0x48c6d14c) d = ($freestyle_stats [0].notes_whammy)
			formatText TextName = notes_riff qs(0x48c6d14c) d = ($freestyle_stats [0].notes_riff)
			formatText TextName = notes_solo qs(0x48c6d14c) d = ($freestyle_stats [0].notes_solo)
			formatText TextName = notes_epic qs(0x48c6d14c) d = ($freestyle_stats [0].notes_epic)
			if (($freestyle_stats [0].notes_tilt0 > $freestyle_stats [0].notes_tilt1) && ($freestyle_stats [0].notes_tilt0 > $freestyle_stats [0].notes_tilt2))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x9d2506af)}
			elseif (($freestyle_stats [0].notes_tilt1 > $freestyle_stats [0].notes_tilt0) && ($freestyle_stats [0].notes_tilt1 > $freestyle_stats [0].notes_tilt2))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x30dde4ec)}
			elseif (($freestyle_stats [0].notes_tilt2 > $freestyle_stats [0].notes_tilt0) && ($freestyle_stats [0].notes_tilt2 > $freestyle_stats [0].notes_tilt1))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x9bea960b)}
			else
				formatText TextName = favorite_tilt qs(0x48c6d14c) d = Random (@ qs(0x9d2506af) @ qs(0x30dde4ec) @ qs(0x9bea960b) )
			endif
			formatText \{TextName = favorite_drum_text
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = avg_intensity
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText TextName = notes_single qs(0x48c6d14c) d = ($freestyle_stats [0].notes_single)
		else
			play_style_guitar = qs(0x03ac90f0)
			notes_played = qs(0x03ac90f0)
			notes_per_second = qs(0x03ac90f0)
			notes_star = qs(0x03ac90f0)
			notes_chord = qs(0x03ac90f0)
			notes_lick = qs(0x03ac90f0)
			notes_whammy = qs(0x03ac90f0)
			notes_riff = qs(0x03ac90f0)
			notes_solo = qs(0x03ac90f0)
			notes_epic = qs(0x03ac90f0)
			favorite_tilt = qs(0x03ac90f0)
			favorite_drum_text = qs(0x03ac90f0)
			avg_intensity = qs(0x03ac90f0)
			notes_single = qs(0x03ac90f0)
		endif
		freestyle_postgame_tree :se_setprops {
			play_style_guitar = <play_style_guitar>
			notes_played_guitar = <notes_played>
			notes_per_second_guitar = <notes_per_second>
			fav_tilt_guitar = <favorite_tilt>
			fav_drum_guitar = <favorite_drum_text>
			avg_inten_guitar = <avg_intensity>
			solo_notes_guitar = <notes_solo>
			single_notes_guitar = <notes_single>
			chords_guitar = <notes_chord>
			licks_guitar = <notes_lick>
			riffs_guitar = <notes_riff>
			star_notes_guitar = <notes_star>
			whammy_notes_guitar = <notes_whammy>
			epic_riffs_guitar = <notes_epic>
		}
	elseif (<instrument> = drums)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_mii_head_container_1}
		mii_container = <resolved_id>
		mii_index = ($freestyle_player_data [1].mii_index)
		mii_database = ($freestyle_player_data [1].mii_database)
		if ScreenElementExists \{id = mii_face_1_reg}
			DestroyScreenElement \{id = mii_face_1_reg}
		endif
		if ((($freestyle_player_data [1].auto_play_enabled) = true) || (($freestyle_player_data [1].player_type) = human))
			CreateScreenElement {
				Type = miiiconelement
				parent = <mii_container>
				id = mii_face_1_reg
				pos_anchor = [center center]
				just = [center center]
				Pos = (0.0, 0.0)
				z_priority = 1001
				mii_expression = Normal
				mii_bgcolor = $freestyle_mii_on_bg
				mii_dims = (128.0, 128.0)
				mii_index = <mii_index>
				mii_database = <mii_database>
			}
		endif
		if (($freestyle_player_data [1].auto_play_enabled) = true)
			freestyle_postgame_tree :se_setprops \{mii_name_drum = $wii_freestyle_cpu_text}
		elseif (($freestyle_player_data [1].player_type) = human)
			if (<mii_database> = randomdb)
				freestyle_postgame_tree :se_setprops \{mii_name_drum = qs(0x40351ace)}
			else
				getmiiname index = <mii_index> database = <mii_database>
				freestyle_postgame_tree :se_setprops {
					mii_name_drum = <mii_name>
				}
			endif
		else
			freestyle_postgame_tree :se_setprops \{mii_name_drum = qs(0x03ac90f0)}
		endif
		if (($freestyle_player_data [1].auto_play_enabled) = true)
			play_style_drum = qs(0xc4992bba)
			notes_played = qs(0xc4992bba)
			notes_per_second = qs(0xc4992bba)
			notes_star = qs(0xc4992bba)
			notes_chord = qs(0xc4992bba)
			notes_lick = qs(0xc4992bba)
			notes_whammy = qs(0xc4992bba)
			notes_riff = qs(0xc4992bba)
			notes_solo = qs(0xc4992bba)
			notes_epic = qs(0xc4992bba)
			favorite_tilt = qs(0xc4992bba)
			favorite_drum_text = qs(0xc4992bba)
			avg_intensity = qs(0xc4992bba)
			notes_single = qs(0xc4992bba)
		elseif (($freestyle_player_data [1].player_type) = human)
			play_style_drum = ($freestyle_stats [1].play_style)
			formatText TextName = notes_played qs(0x48c6d14c) d = ($freestyle_stats [1].total_notes_played)
			formatText TextName = notes_per_second qs(0x48c6d14c) d = ($freestyle_stats [1].notes_per_sec)
			formatText \{TextName = notes_star
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = notes_chord
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = notes_lick
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = notes_whammy
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = notes_riff
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText TextName = notes_solo qs(0x48c6d14c) d = ($freestyle_stats [1].notes_solo)
			formatText \{TextName = notes_epic
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = favorite_tilt
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			favorite_drum_text = ($freestyle_mode_stats.favorite_drum_text)
			most_hits = 0
			most_hits_index = -1
			index = 0
			average_inten = 0
			num_of_hit_pieces = 0
			total_average_intensity = 0
			begin
			num_hits = ($freestyle_drum_stats [<index>].num_hits)
			if (<num_hits> > 0)
				num_of_hit_pieces = (<num_of_hit_pieces> + 1)
				total_inten = ($freestyle_drum_stats [<index>].total_intensity)
				average_inten = (<total_inten> / <num_hits>)
				setstructureparam array_name = freestyle_drum_stats array_index = <index> param = avg_intensity value = <average_inten>
				total_average_intensity = (<total_average_intensity> + <average_inten>)
				if (<num_hits> > <most_hits>)
					most_hits = <num_hits>
					most_hits_index = <index>
				endif
			endif
			index = (<index> + 1)
			repeat 9
			avg_percent = ((<total_average_intensity> / <num_of_hit_pieces>) * 100)
			CastToInteger \{avg_percent}
			formatText TextName = avg_intensity qs(0xd1066115) d = <avg_percent>
			notes_single = qs(0xc4992bba)
		else
			play_style_drum = qs(0x03ac90f0)
			notes_played = qs(0x03ac90f0)
			notes_per_second = qs(0x03ac90f0)
			notes_star = qs(0x03ac90f0)
			notes_chord = qs(0x03ac90f0)
			notes_lick = qs(0x03ac90f0)
			notes_whammy = qs(0x03ac90f0)
			notes_riff = qs(0x03ac90f0)
			notes_solo = qs(0x03ac90f0)
			notes_epic = qs(0x03ac90f0)
			favorite_tilt = qs(0x03ac90f0)
			favorite_drum_text = qs(0x03ac90f0)
			avg_intensity = qs(0x03ac90f0)
			notes_single = qs(0x03ac90f0)
		endif
		freestyle_postgame_tree :se_setprops {
			play_style_drum = <play_style_drum>
			notes_played_drum = <notes_played>
			notes_per_second_drum = <notes_per_second>
			fav_tilt_drum = <favorite_tilt>
			fav_drum_drum = <favorite_drum_text>
			avg_inten_drum = <avg_intensity>
			solo_notes_drum = <notes_solo>
			single_notes_drum = <notes_single>
			chords_drum = <notes_chord>
			licks_drum = <notes_lick>
			riffs_drum = <notes_riff>
			star_notes_drum = <notes_star>
			whammy_notes_drum = <notes_whammy>
			epic_riffs_drum = <notes_epic>
		}
	elseif (<instrument> = bass)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_mii_head_container_2}
		mii_container = <resolved_id>
		mii_index = ($freestyle_player_data [2].mii_index)
		mii_database = ($freestyle_player_data [2].mii_database)
		if ScreenElementExists \{id = mii_face_2_reg}
			DestroyScreenElement \{id = mii_face_2_reg}
		endif
		if ((($freestyle_player_data [2].auto_play_enabled) = true) || (($freestyle_player_data [2].player_type) = human))
			CreateScreenElement {
				Type = miiiconelement
				parent = <mii_container>
				id = mii_face_2_reg
				pos_anchor = [center center]
				just = [center center]
				Pos = (0.0, 0.0)
				z_priority = 1001
				mii_expression = Normal
				mii_bgcolor = $freestyle_mii_on_bg
				mii_dims = (128.0, 128.0)
				mii_index = <mii_index>
				mii_database = <mii_database>
			}
		endif
		if (($freestyle_player_data [2].auto_play_enabled) = true)
			freestyle_postgame_tree :se_setprops \{mii_name_bass = $wii_freestyle_cpu_text}
		elseif (($freestyle_player_data [2].player_type) = human)
			if (<mii_database> = randomdb)
				freestyle_postgame_tree :se_setprops \{mii_name_bass = qs(0x1fe7d0f9)}
			else
				getmiiname index = <mii_index> database = <mii_database>
				freestyle_postgame_tree :se_setprops {
					mii_name_bass = <mii_name>
				}
			endif
		else
			freestyle_postgame_tree :se_setprops \{mii_name_bass = qs(0x03ac90f0)}
		endif
		if (($freestyle_player_data [2].auto_play_enabled) = true)
			play_style_bass = qs(0xc4992bba)
			notes_played = qs(0xc4992bba)
			notes_per_second = qs(0xc4992bba)
			notes_star = qs(0xc4992bba)
			notes_chord = qs(0xc4992bba)
			notes_lick = qs(0xc4992bba)
			notes_whammy = qs(0xc4992bba)
			notes_riff = qs(0xc4992bba)
			notes_solo = qs(0xc4992bba)
			notes_epic = qs(0xc4992bba)
			favorite_tilt = qs(0xc4992bba)
			favorite_drum_text = qs(0xc4992bba)
			avg_intensity = qs(0xc4992bba)
			notes_single = qs(0xc4992bba)
		elseif (($freestyle_player_data [2].player_type) = human)
			play_style_bass = ($freestyle_stats [2].play_style)
			formatText TextName = notes_played qs(0x48c6d14c) d = ($freestyle_stats [2].total_notes_played)
			formatText TextName = notes_per_second qs(0x48c6d14c) d = ($freestyle_stats [2].notes_per_sec)
			formatText TextName = notes_star qs(0x48c6d14c) d = ($freestyle_stats [2].notes_star)
			formatText TextName = notes_chord qs(0x48c6d14c) d = ($freestyle_stats [2].notes_chord)
			formatText TextName = notes_lick qs(0x48c6d14c) d = ($freestyle_stats [2].notes_lick)
			formatText TextName = notes_whammy qs(0x48c6d14c) d = ($freestyle_stats [2].notes_whammy)
			formatText TextName = notes_riff qs(0x48c6d14c) d = ($freestyle_stats [2].notes_riff)
			formatText TextName = notes_solo qs(0x48c6d14c) d = ($freestyle_stats [2].notes_solo)
			formatText \{TextName = notes_epic
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			if (($freestyle_stats [0].notes_tilt0 > $freestyle_stats [0].notes_tilt1) && ($freestyle_stats [0].notes_tilt0 > $freestyle_stats [0].notes_tilt2))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x9d2506af)}
			elseif (($freestyle_stats [0].notes_tilt1 > $freestyle_stats [0].notes_tilt0) && ($freestyle_stats [0].notes_tilt1 > $freestyle_stats [0].notes_tilt2))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x30dde4ec)}
			elseif (($freestyle_stats [0].notes_tilt2 > $freestyle_stats [0].notes_tilt0) && ($freestyle_stats [0].notes_tilt2 > $freestyle_stats [0].notes_tilt1))
				formatText \{TextName = favorite_tilt
					qs(0x48c6d14c)
					d = qs(0x9bea960b)}
			else
				formatText TextName = favorite_tilt qs(0x48c6d14c) d = Random (@ qs(0x9d2506af) @ qs(0x30dde4ec) @ qs(0x9bea960b) )
			endif
			formatText \{TextName = favorite_drum_text
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText \{TextName = avg_intensity
				qs(0x48c6d14c)
				d = qs(0xc4992bba)}
			formatText TextName = notes_single qs(0x48c6d14c) d = ($freestyle_stats [2].notes_single)
		else
			play_style_bass = qs(0x03ac90f0)
			notes_played = qs(0x03ac90f0)
			notes_per_second = qs(0x03ac90f0)
			notes_star = qs(0x03ac90f0)
			notes_chord = qs(0x03ac90f0)
			notes_lick = qs(0x03ac90f0)
			notes_whammy = qs(0x03ac90f0)
			notes_riff = qs(0x03ac90f0)
			notes_solo = qs(0x03ac90f0)
			notes_epic = qs(0x03ac90f0)
			favorite_tilt = qs(0x03ac90f0)
			favorite_drum_text = qs(0x03ac90f0)
			avg_intensity = qs(0x03ac90f0)
			notes_single = qs(0x03ac90f0)
		endif
		freestyle_postgame_tree :se_setprops {
			play_style_bass = <play_style_bass>
			notes_played_bass = <notes_played>
			notes_per_second_bass = <notes_per_second>
			fav_tilt_bass = <favorite_tilt>
			fav_drum_bass = <favorite_drum_text>
			avg_inten_bass = <avg_intensity>
			solo_notes_bass = <notes_solo>
			single_notes_bass = <notes_single>
			chords_bass = <notes_chord>
			licks_bass = <notes_lick>
			riffs_bass = <notes_riff>
			star_notes_bass = <notes_star>
			whammy_notes_bass = <notes_whammy>
			epic_riffs_bass = <notes_epic>
		}
	else
		ScriptAssert \{'Unhandled instrument type'}
	endif
endscript

script freestyle_postgame_stats_assist_scroll 
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_stats_menu}
	countscreenelementchildren id = <resolved_id>
	<resolved_id> :menu_getselectedindex
	if ((<selected_index> < 2) || (<selected_index> >= (<num_children> -2)))
		<resolved_id> :se_setprops {
			center_selection = FALSE
		}
	else
		<resolved_id> :se_setprops {
			center_selection = true
		}
	endif
endscript

script freestyle_stat_management_loop 
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_stats_menu}
	countscreenelementchildren id = <resolved_id>
	begin
	<resolved_id> :menu_getselectedindex
	if (<selected_index> <= 0)
		<resolved_id> :menu_changeselection
	elseif (<selected_index> >= (<num_children> -1))
		<resolved_id> :menu_changeselection up
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_destroy_freestyle_postgame 
	DestroyScreenElement \{id = freestyle_postgame_tree}
	generic_ui_destroy
endscript
