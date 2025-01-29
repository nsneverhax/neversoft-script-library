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
	freestyle_postgame_tree :desc_resolvealias \{Name = 0x8db0944c}
	<resolved_id> :desc_resolvealias Name = 0x220750d1
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	freestyle_postgame_tree :desc_resolvealias \{Name = 0xf2356b56}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
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
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_transfer_to_menu params = {to = stats from = main}}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_watch}
	<resolved_id> :se_setprops {event_handlers = [
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_watch}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
	if issavecorrupt \{filetype = freestyle}
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_save}
		<resolved_id> :se_setprops {event_handlers = [
				{focus freestyle_menu_option_focus_disabled}
				{unfocus freestyle_menu_option_unfocus}
			]
		}
	else
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_save}
		<resolved_id> :se_setprops {event_handlers = [
				{focus generic_barrel_menu_item_focus}
				{unfocus generic_barrel_menu_item_unfocus}
				{pad_choose freestyle_postgame_save}
			]
		}
	endif
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_discard}
	<resolved_id> :se_setprops {event_handlers = [
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_discard}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_rerecord}
	<resolved_id> :se_setprops {event_handlers = [
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_rerecord}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_new}
	<resolved_id> :se_setprops {event_handlers = [
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_new_song}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_option_quit}
	<resolved_id> :se_setprops {event_handlers = [
			{focus generic_barrel_menu_item_focus}
			{unfocus generic_barrel_menu_item_unfocus}
			{pad_choose freestyle_postgame_quit}
		]
	}
	LaunchEvent Type = unfocus target = <resolved_id>
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
	freestyle_retrieve_stats_from_stone
	time_ms = ($freestyle_mode_stats.song_length)
	format_time ms = <time_ms>
	freestyle_postgame_tree :se_setprops {
		stats_alpha = 1
		genre = ($freestyle_current_style_settings.visible_name)
		song_length = <formatted_time>
	}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_scrollable_stats_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = postgame stats}}
			{pad_choose freestyle_postgame_transfer_to_menu params = {to = main from = stats}}
		]
	}
	LaunchEvent Type = focus target = <resolved_id>
	freestyle_postgame_initialize_stats
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
	generic_event_replace \{data = {
			state = uistate_freestyle_game
			clear_previous_stack
		}}
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
			freestyle_postgame_tree :se_setprops \{main_alpha = 1}
		endif
	elseif (<from> = main)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		freestyle_postgame_tree :se_setprops \{main_alpha = 0}
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
			freestyle_postgame_tree :se_setprops \{main_alpha = 1}
			freestyle_postgame_tree :desc_resolvealias \{Name = alias_postgame_menu}
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endif
endscript

script freestyle_postgame_init_save_process 
	Wait \{1
		gameframe}
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_band_name_container}
	freestyle_postgame_tree :se_setprops \{0xa0474fc1 = qs(0xeecb2665)
		0xe1db8c16 = qs(0xbda20555)}
	Change \{freestyle_save_process_stage = song_name}
	ui_create_edit_name {
		parent = <resolved_id>
		default_name = qs(0x00000000)
		char_limit = 20
		title = qs(0x03ac90f0)
		device_num = ($primary_controller)
		cancel_script = freestyle_cancel_save_ui
		Pos = (-50.0, -110.0)
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
				add_user_control_helper \{text = qs(0xaf4d5dd2)
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
			if ($freestyle_save_process_stage = band_name)
				add_user_control_helper \{text = qs(0xaf4d5dd2)
					button = red
					z = 100000}
			else
				add_user_control_helper \{text = qs(0xf7723015)
					button = red
					z = 100000}
			endif
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
		freestyle_postgame_tree :se_setprops \{0xa0474fc1 = qs(0x2b4fcbf7)
			0xe1db8c16 = qs(0x7826e8c7)}
		if NOT GotParam \{song}
			song = qs(0x00000000)
		endif
		DestroyScreenElement \{id = edit_name_screen_id}
		Change \{freestyle_save_process_stage = band_name}
		ui_create_edit_name {
			parent = <resolved_id>
			default_name = <song>
			char_limit = 20
			title = qs(0x03ac90f0)
			device_num = ($primary_controller)
			cancel_script = freestyle_save_song_revert_to_artist_input
			Pos = (-50.0, -110.0)
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

script 0x2c247558 
	edit_name_screen_id :se_getprops \{name_text}
	printf qs(0x76b3fda7) d = <name_text>
endscript

script freestyle_save_song_revert_to_artist_input 
	if ScreenElementExists \{id = edit_name_screen_id}
		edit_name_screen_id :GetTags \{artist}
		edit_name_screen_id :se_getprops \{name_text}
	else
		ScriptAssert \{qs(0xc2dbaae5)}
	endif
	freestyle_postgame_tree :desc_resolvealias \{Name = alias_band_name_container}
	if NOT GotParam \{artist}
		artist = qs(0x00000000)
	endif
	freestyle_postgame_tree :se_setprops \{0xa0474fc1 = qs(0xeecb2665)
		0xe1db8c16 = qs(0xbda20555)}
	Change \{freestyle_save_process_stage = song_name}
	DestroyScreenElement \{id = edit_name_screen_id}
	ui_create_edit_name {
		parent = <resolved_id>
		default_name = <artist>
		char_limit = 20
		title = qs(0x03ac90f0)
		device_num = ($primary_controller)
		cancel_script = freestyle_cancel_save_ui
		Pos = (-50.0, -110.0)
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

script 0x1c29b0f1 
	0x21974170 = []
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = mii_database
	freestyle_get_player_param Player = <Player> param = mii_index
	if (<mii_database> = FrontEnd)
		if getmiiname database = <mii_database> index = <mii_index>
			AddArrayElement array = <0x21974170> element = <mii_name>
			<0x21974170> = <array>
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	GetArraySize <0x21974170>
	0x567d4c52 = <array_Size>
	switch (<0x567d4c52>)
		case 0
		artist_name = qs(0x3777ad0b)
		case 1
		artist_name = (<0x21974170> [0])
		case 2
		formatText TextName = artist_name qs(0x94e66451) a = (<0x21974170> [0]) b = (<0x21974170> [1])
		case 3
		formatText TextName = artist_name qs(0x77fab693) a = (<0x21974170> [0]) b = (<0x21974170> [1]) c = (<0x21974170> [2])
		default
		ScriptAssert 'unable to handle %a miis!' a = <0x567d4c52>
	endswitch
	return artist_name = <artist_name>
endscript

script 0x3d53b027 
	Obj_GetID
	freestyle_postgame_tree :desc_resolvealias \{Name = highlight_bar}
	<resolved_id> :se_setprops {
		Pos = (0.0, 0.0)
		parent = <objID>
	}
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
	GetArraySize ($freestyle_player_data)
	players = <array_Size>
	i = 0
	begin
	formatText checksumName = 0xbfc619af 'alias_mii_head_container_%j' j = <i>
	freestyle_postgame_tree :desc_resolvealias Name = <0xbfc619af>
	mii_container = <resolved_id>
	mii_index = ($freestyle_player_data [<i>].mii_index)
	mii_database = ($freestyle_player_data [<i>].mii_database)
	if ((($freestyle_player_data [<i>].auto_play_enabled) = true) || (($freestyle_player_data [<i>].player_type) = human))
		CreateScreenElement {
			Type = miiiconelement
			parent = <mii_container>
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
	instrument = ($freestyle_player_data [<i>].instrument)
	auto_play_enabled = ($freestyle_player_data [<i>].auto_play_enabled)
	player_type = ($freestyle_player_data [<i>].player_type)
	if (($freestyle_recording_mode = overdub) && (<player_type> = ai))
		<player_type> = ($freestyle_player_data [<i>].author_type)
	endif
	0xa10cd104 {
		mii_index = <mii_index>
		mii_database = <mii_database>
		auto_play_enabled = <auto_play_enabled>
		player_type = <player_type>
		instrument = <instrument>
	}
	formatText checksumName = 0x0e788720 'alias_mii_name_%j' j = <i>
	freestyle_postgame_tree :desc_resolvealias Name = <0x0e788720>
	<resolved_id> :se_setprops {
		text = <player_name>
	}
	formatText checksumName = 0xe98ba279 'play_style_%j' j = <i>
	if NOT (($freestyle_player_data [<i>].auto_play_enabled) = true)
		if (($freestyle_player_data [<i>].player_type) = human)
			freestyle_postgame_tree :desc_resolvealias Name = <0xe98ba279>
			<resolved_id> :se_setprops text = ($freestyle_stats [<i>].play_style)
		else
			freestyle_postgame_tree :desc_resolvealias Name = <0xe98ba279>
			<resolved_id> :se_setprops text = qs(0x03ac90f0)
		endif
	else
		freestyle_postgame_tree :desc_resolvealias Name = <0xe98ba279>
		<resolved_id> :se_setprops text = qs(0xc4992bba)
	endif
	i = (<i> + 1)
	repeat <players>
	i = 0
	array = [qs(0xc4992bba) qs(0xc4992bba) qs(0xc4992bba)]
	begin
	if NOT (($freestyle_player_data [<i>].auto_play_enabled) = true)
		if (($freestyle_player_data [<i>].player_type) = human)
			if (($freestyle_player_data [<i>].instrument) = drums)
				text = ($freestyle_mode_stats.favorite_drum_text)
			else
				text = qs(0xc4992bba)
			endif
		else
			text = qs(0x03ac90f0)
		endif
		SetArrayElement ArrayName = array index = <i> NewValue = <text>
	endif
	i = (<i> + 1)
	repeat <players>
	0x1761ebcf = <array>
	i = 0
	array = [qs(0xc4992bba) qs(0xc4992bba) qs(0xc4992bba)]
	begin
	if NOT (($freestyle_player_data [<i>].auto_play_enabled) = true)
		if (($freestyle_player_data [<i>].player_type) = human)
			if (($freestyle_player_data [<i>].instrument) = drums)
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
				formatText TextName = text qs(0xd1066115) d = <avg_percent>
			else
				text = qs(0xc4992bba)
			endif
		else
			text = qs(0x03ac90f0)
		endif
		SetArrayElement ArrayName = array index = <i> NewValue = <text>
	endif
	i = (<i> + 1)
	repeat <players>
	0x20b49150 = <array>
	i = 0
	array = [qs(0xc4992bba) qs(0xc4992bba) qs(0xc4992bba)]
	begin
	if NOT (($freestyle_player_data [<i>].auto_play_enabled) = true)
		if (($freestyle_player_data [<i>].player_type) = human)
			if ((($freestyle_player_data [<i>].instrument) = guitar) || (($freestyle_player_data [<i>].instrument) = bass))
				if (($freestyle_stats [<i>].notes_tilt0 > $freestyle_stats [<i>].notes_tilt1) && ($freestyle_stats [<i>].notes_tilt0 > $freestyle_stats [<i>].notes_tilt2))
					formatText \{TextName = text
						qs(0x48c6d14c)
						d = qs(0x9d2506af)}
				elseif (($freestyle_stats [<i>].notes_tilt1 > $freestyle_stats [<i>].notes_tilt0) && ($freestyle_stats [<i>].notes_tilt1 > $freestyle_stats [<i>].notes_tilt2))
					formatText \{TextName = text
						qs(0x48c6d14c)
						d = qs(0x30dde4ec)}
				elseif (($freestyle_stats [<i>].notes_tilt2 > $freestyle_stats [<i>].notes_tilt0) && ($freestyle_stats [<i>].notes_tilt2 > $freestyle_stats [<i>].notes_tilt1))
					formatText \{TextName = text
						qs(0x48c6d14c)
						d = qs(0x9bea960b)}
				else
					formatText TextName = text qs(0x48c6d14c) d = Random (@ qs(0x9d2506af) @ qs(0x30dde4ec) @ qs(0x9bea960b) )
				endif
			else
				text = qs(0xc4992bba)
			endif
		else
			text = qs(0x03ac90f0)
		endif
		SetArrayElement ArrayName = array index = <i> NewValue = <text>
	endif
	i = (<i> + 1)
	repeat <players>
	0xfe020c30 = <array>
	0xd30ee499 \{title = qs(0xc14449d6)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = total_notes_played}
	0xd30ee499 \{title = qs(0xc01babc5)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_per_sec}
	0xd30ee499 \{title = qs(0xd6f3170c)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_solo}
	0xd30ee499 {
		title = qs(0xd0e7adfd)
		stats = <0x1761ebcf>
	}
	0xd30ee499 {
		title = qs(0xf6bf5fd0)
		stats = <0x20b49150>
	}
	0xd30ee499 {
		title = qs(0xd8a9b4ad)
		stats = <0xfe020c30>
	}
	0xd30ee499 \{title = qs(0x1ef910d1)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_single
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0xfe904ca8)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_chord
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0xaac214c1)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_riff
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0xe022d934)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_star
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0xece26330)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_whammy
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0x3102ecf4)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_lick
		0x48bbb600 = [
			guitar
			bass
		]}
	0xd30ee499 \{title = qs(0x9d30f128)
		0x5d673b96 = freestyle_stats
		0x15ba4fe9 = notes_epic
		0x48bbb600 = [
			guitar
		]}
endscript

script 0xd30ee499 
	RequireParams \{[
			title
		]
		all}
	if NOT GotParam \{stats}
		if GotParam \{0x5d673b96}
			if GotParam \{0x15ba4fe9}
				GetArraySize ($<0x5d673b96>)
				data_size = <array_Size>
				if (<data_size> > 0)
					stats = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
					i = 0
					begin
					if NOT (($freestyle_player_data [<i>].auto_play_enabled) = true)
						if (($freestyle_player_data [<i>].player_type) = human)
							if GotParam \{0x48bbb600}
								GetArraySize <0x48bbb600>
								if (<array_Size> > 0)
									j = 0
									valid = FALSE
									begin
									if ((<0x48bbb600> [<j>]) = ($freestyle_player_data [<i>].instrument))
										valid = true
									endif
									j = (<j> + 1)
									repeat <array_Size>
									if (<valid> = true)
										formatText TextName = text qs(0x73307931) s = ($<0x5d673b96> [<i>].<0x15ba4fe9>)
									else
										text = qs(0xc4992bba)
									endif
								else
									ScriptAssert \{'Bad data constraints provided'}
								endif
							else
								formatText TextName = text qs(0x73307931) s = ($<0x5d673b96> [<i>].<0x15ba4fe9>)
							endif
						else
							text = qs(0x03ac90f0)
						endif
					else
						text = qs(0xc4992bba)
					endif
					SetArrayElement ArrayName = stats index = <i> NewValue = <text>
					i = (<i> + 1)
					repeat <data_size>
				else
					0x60cfa7ec \{'Invalid data set provided. Need an array of data to represent players.'}
				endif
			else
				ScriptAssert \{'Missing param for data set.'}
			endif
		else
			ScriptAssert \{'Missing params stats and data_set at the same time. Need one or the other.'}
		endif
	endif
	GetArraySize <stats>
	0xc56ddbd1 = 3
	if (<array_Size> = <0xc56ddbd1>)
		freestyle_postgame_tree :desc_resolvealias \{Name = alias_stats_menu}
		CreateScreenElement {
			Type = descinterface
			desc = 'freestyle_postgame_stat_row'
			dims = (1024.0, 45.0)
			parent = <resolved_id>
			z_priority = 19
			event_handlers = [
				{focus freestyle_postgame_update_scrollbar}
			]
		}
		ResolveScreenElementID id = {<id> child = 0}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> = (<0xc56ddbd1> + 1))
				(<children> [0]) :se_setprops text = <title>
				i = 0
				begin
				(<children> [(<i> + 1)]) :se_setprops text = (<stats> [<i>])
				i = (<i> + 1)
				repeat <0xc56ddbd1>
			else
				ScriptAssert \{'Not enough children to fit all stats. Please check desc file freestyle_postgame_stat_row'}
			endif
		else
			ScriptAssert \{'No children to fit stats in. Please check desc file freestyle_postgame_stat_row'}
		endif
	else
		ScriptAssert \{'Invalid size given to create stat row with. Must be given a stat array of 4 elements'}
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
