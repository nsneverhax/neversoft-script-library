
script songlist_create \{pad_back_script = songlist_back
		locked = FALSE
		exclusive_device = -1}
	RequireParams \{[
			list_name
			mode
		]
		all}
	Change g_songlist_sort_index = ($g_songlist_sort_indexes.<mode>)
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	if (<mode> = music_store || <mode> = import || <mode> = archive_entry)
		<desc> = 'music_store'
	else
		<desc> = 'songlist'
	endif
	if NOT (<mode> = archive)
		formatText checksumName = songlist_id 'SongList_%d' d = <desc>
		CreateScreenElement {
			Type = descinterface
			desc = <desc>
			id = <songlist_id>
			parent = root_window
		}
		if (<mode> = archive_entry)
			<id> :se_setprops alpha = 0.0
		endif
		<id> :se_setprops wiipoints_text = qs(0x00000000)
	else
		if (<archive_source> = wii)
			<songlist_name> = alias_songlist_wii
			<songlist_alias> = songlist_wii
		else
			<songlist_name> = alias_songlist_sd
			<songlist_alias> = songlist_sd
		endif
		if <parent> :desc_resolvealias Name = <songlist_name> param = id
			AssignAlias id = <id> alias = <songlist_alias>
		else
			ScriptAssert \{'Doh!'}
		endif
	endif
	AssignAlias id = <id> alias = SongList
	if NOT (<mode> = archive)
		if (<mode> = music_store || <mode> = import || <mode> = archive_entry)
			SongList :se_setprops \{songlist_subheader_cont_alpha = 0.0}
		else
			<id> :obj_spawnscript songlist_do_physics_spawned
		endif
		if ScriptExists \{crowd_swells_during_stats_screen}
			KillSpawnedScript \{Name = crowd_swells_during_stats_screen}
		endif
		if IsSoundEventPlaying \{surge_during_stats_screen}
			StopSoundEvent \{surge_during_stats_screen
				fade_time = 1.5
				fade_type = linear}
		endif
		SpawnScriptNow \{BG_Crowd_Front_End_Silence}
	endif
	if (<mode> = import)
		getterritory
		if (<territory> != territory_us)
			SongList :se_setprops \{esrb_notice_alpha = 0.0}
		endif
	endif
	if ScreenElementExists \{id = SongList}
		if SongList :desc_resolvealias \{Name = alias_bkg_anim}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :obj_spawnscript ui_alphablast
			endif
		else
		endif
	endif
	if ScreenElementExists \{id = SongList}
		if SongList :desc_resolvealias \{Name = 0x1c92d292}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
			endif
		else
		endif
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
		controller = ($primary_controller)
		if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
			controller = <device_num>
		endif
		if (<controller> = -1)
			if GotParam \{device_num}
				controller = <device_num>
			else
				controller = ($primary_controller)
			endif
		endif
		song_breakdown_check_bot_play
		if NOT (<bot_play> = 0)
			controller = ($primary_controller)
		endif
		if (<controller> = -1)
			ScriptAssert \{qs(0x6c9db444)}
		endif
		if (<exclusive_device> = -1)
			exclusive_device = <controller>
		endif
		<resolved_id> :se_setprops exclusive_device = <exclusive_device>
		SongList :SetTags savegame_device = <controller> exclusive_device = <exclusive_device>
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> songlist_options params = {show_more_info show_ghtunes}
		if (<mode> = sing_a_long)
			show_ghtunes = 0
		endif
		Change g_songlist_show_more_info = <show_more_info>
		Change g_songlist_show_ghtunes = <show_ghtunes>
		if allow_show_ghtunes_toggle mode = <mode>
			if (<show_ghtunes> = 0)
				filterspec = [
					{
						key = song_source
						union_list = [jam]
						comparator = not_equal
					}
				]
				songlist_change_filterspec filterspec = <filterspec>
			endif
		endif
	else
		ScriptAssert \{qs(0xd78eb9f9)}
	endif
	if NOT (<mode> = music_store || <mode> = import || <mode> = archive || <mode> = archive_entry)
		if SongList :desc_resolvealias \{Name = alias_songlist_detail_cont}
			AssignAlias id = <resolved_id> alias = songlist_detail_cont
		else
			ScriptAssert \{qs(0xf7d498a7)}
		endif
		if SongList :desc_resolvealias \{Name = alias_songlist_slider_nub_cont}
			AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			ScriptAssert \{qs(0x9a95e5a9)}
		endif
	elseif (<mode> = archive)
		if SongList :desc_resolvealias \{Name = alias_music_store_slider_nub_cont}
			AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			ScriptAssert \{qs(0x47ccdd2f)}
		endif
	else
		if SongList :desc_resolvealias \{Name = alias_music_store_detail_cont}
			AssignAlias id = <resolved_id> alias = songlist_detail_cont
		else
			ScriptAssert \{qs(0x646b49e3)}
		endif
		if SongList :desc_resolvealias \{Name = alias_music_store_slider_nub_cont}
			AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			ScriptAssert \{qs(0x47ccdd2f)}
		endif
		if (<mode> = import || <mode> = archive_entry)
			if SongList :desc_resolvealias \{Name = alias_music_store_ticker_window}
				<resolved_id> :se_setprops alpha = 0.0
			endif
		endif
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_hilight_bar_cont}
		AssignAlias id = <resolved_id> alias = songlist_hilight_bar_cont
		<resolved_id> :obj_spawnscript 0x0542334f params = {Pos = (320.0, 0.0) z = 26 parent = <0xfccfea50>}
	else
		ScriptAssert \{qs(0xe42c78fa)}
	endif
	if NOT (<mode> = music_store || <mode> = import || <mode> = archive || <mode> = archive_entry)
		if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
			player_num = 1
		else
			get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
		endif
		if isSinglePlayerGame
			getplayerinfo <player_num> part
			getplayerinfo <player_num> difficulty
		else
			<part> = Band
			get_highest_difficulty
			<difficulty> = <highest_difficulty>
		endif
		get_difficulty_text_nl difficulty = <difficulty>
		formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
		formatText checksumName = instrument_out 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
		formatText checksumName = instrument_fill 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
		out_icon_alpha = 1
		band_icon_alpha = 0
		difficulty_alpha = 1
		SongList :GetSingleTag \{mode}
		if (<mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
			instrument_text_nl = ($current_leaderboard_instrument)
			if (<instrument_text_nl> = 'band' || <instrument_text_nl> = 'altband')
				out_icon_alpha = 0
				band_icon_alpha = 1
			else
				if (<instrument_text_nl> = 'backup')
					instrument_text_nl = 'bass'
				elseif (<instrument_text_nl> = 'drums')
					instrument_text_nl = 'drum'
				elseif (<instrument_text_nl> = 'mic')
					instrument_text_nl = 'vocals'
				endif
				formatText checksumName = instrument_out 'icon_%i_out' i = <instrument_text_nl>
				formatText checksumName = instrument_fill 'icon_%i_fill' i = <instrument_text_nl>
			endif
			if (<mode> = leaderboard || <mode> = sing_a_long)
				difficulty_alpha = 0
			endif
		endif
	endif
	if NOT (<mode> = archive)
		if (<mode> = music_store || <mode> = import || <mode> = archive_entry)
			CreateScreenElement \{Type = descinterface
				desc = 'songlist_detail_music_store'
				id = songlist_detail
				parent = songlist_detail_cont
				alpha = 0.0
				Pos = (5.0, 40.0)}
			songlist_music_store_assign_text_aliases
		else
			if NOT isSinglePlayerGame
				out_icon_alpha = 0
				band_icon_alpha = 1
			endif
			CreateScreenElement {
				Type = descinterface
				desc = 'songlist_detail'
				id = songlist_detail
				parent = songlist_detail_cont
				alpha = 0.0
				songlist_detail_difficulty_icon_texture = <difficulty_icon>
				songlist_detail_instrument_icon_out_texture = <instrument_out>
				songlist_detail_instrument_icon_fill_texture = <instrument_fill>
				songlist_detail_instrument_icon_out_alpha = <out_icon_alpha>
				songlist_detail_instrument_icon_band_alpha = <band_icon_alpha>
			}
			if (<mode> = playlist)
				<id> :se_setprops alpha = 1.0
				<id> :se_setprops songlist_detail_mini_playlistt_text_alpha = 1.0
			endif
			if ($g_songlist_show_more_info = 1)
				gamemode_gettype
				if NOT (<Type> = competitive)
					songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
						songlist_detail_frame_2_cont_alpha = 1.0}
				endif
			endif
			if ScreenElementExists \{id = songlist_detail}
				if songlist_detail :desc_resolvealias \{Name = 0xb71351e9}
					if ScreenElementExists id = <resolved_id>
						<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [171 14 152 200]}
					endif
				else
					ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
				endif
			endif
			if ScreenElementExists \{id = songlist_detail}
				if songlist_detail :desc_resolvealias \{Name = 0x2e1a0053}
					if ScreenElementExists id = <resolved_id>
						<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [171 14 152 200]}
					endif
				else
					ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
				endif
			endif
			if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_stars_full_vmenu}
				AssignAlias id = <resolved_id> alias = songlist_detail_stars_full_vmenu
			else
				ScriptAssert \{qs(0x8030f42e)}
			endif
			if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_stars_empty_vmenu}
				AssignAlias id = <resolved_id> alias = songlist_detail_stars_empty_vmenu
			else
				ScriptAssert \{qs(0xc21dd60f)}
			endif
			if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_diff_inst_cont}
				AssignAlias id = <resolved_id> alias = songlist_detail_diff_inst_cont
			else
				ScriptAssert \{qs(0xa4036096)}
			endif
			if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_mini_playlist_vmenu}
				AssignAlias id = <resolved_id> alias = songlist_detail_mini_playlist_vmenu
			else
				ScriptAssert \{qs(0xbd105ffe)}
			endif
			if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_more_info_rows}
				AssignAlias id = <resolved_id> alias = songlist_detail_more_info_rows
			else
				ScriptAssert \{qs(0x17e03108)}
			endif
			CreateScreenElement \{Type = descinterface
				desc = 'songlist_detail_playlist'
				id = songlist_detail_playlist
				parent = songlist_detail_cont
				alpha = 0.0}
			if songlist_detail_playlist :desc_resolvealias \{Name = alias_songlist_detail_playlist_vmenu}
				AssignAlias id = <resolved_id> alias = songlist_detail_playlist_vmenu
			else
				ScriptAssert \{qs(0x09d998d8)}
			endif
			if ScreenElementExists \{id = songlist_detail_playlist}
				songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
			endif
		endif
		songlist_detail :SetTags \{prev_guitar_diff_rate = 0
			prev_bass_diff_rate = 0
			prev_drums_diff_rate = 0
			prev_vocals_diff_rate = 0
			prev_stars = 0}
		if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_difficulty_guitar_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_guitar_vmenu
		else
			ScriptAssert \{qs(0xd483e01c)}
		endif
		if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_difficulty_bass_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_bass_vmenu
		else
			ScriptAssert \{qs(0xab2daa8c)}
		endif
		if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_difficulty_drums_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_drums_vmenu
		else
			ScriptAssert \{qs(0x3bfbfa01)}
		endif
		if songlist_detail :desc_resolvealias \{Name = alias_songlist_detail_difficulty_vocals_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_vocals_vmenu
		else
			ScriptAssert \{qs(0xb86d4f96)}
		endif
	endif
	<event_handlers> = [
		{pad_back generic_menu_pad_back_sound params = {mode = <mode>}}
		{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
		{sdcard_event wii_sdcard_event_songlist params = {songlist_id = <songlist_id>}}
	]
	if (<mode> = music_store || <mode> = import)
		<content_source> = marketplace
		<slider_pos> = (-14.0, 60.0)
		hilight_bar_res = 74
		SongList :SetTags \{music_store_mode = hub
			music_store_seek_override = true}
	elseif (<mode> = archive)
		<sort_option> = {pad_L1 songlist_sort_toggle}
		AddArrayElement array = <event_handlers> element = <sort_option>
		<event_handlers> = <array>
		<content_source> = local_song_list
		<slider_pos> = (-14.0, 60.0)
		hilight_bar_res = 74
		songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
		SongList :SetTags {
			archive_source = <archive_source>
		}
	else
		<sort_option> = {pad_L1 songlist_sort_toggle}
		AddArrayElement array = <event_handlers> element = <sort_option>
		<event_handlers> = <array>
		<content_source> = local_song_list
		<slider_pos> = (0.0, 16.0)
		hilight_bar_res = 71
	endif
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
	current_menu :se_setprops \{block_events}
	getterritory
	SongList :SetTags {
		mode = <mode>
		list_name = <list_name>
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_page_size = 0
		slider_nub_res = 0
		hilight_bar_res = <hilight_bar_res>
		hilight_bar_index = 0
		cs_registered = FALSE
		list_dirty = FALSE
		initial_built = FALSE
		non_song_item_focused = FALSE
		locked = <locked>
		content_source = <content_source>
		territory = <territory>
		controller = <controller>
	}
	gamemode_gettype
	if NOT (<mode> = music_store || <mode> = import || <mode> = freeplay)
		if (<mode> = leaderboard || <mode> = toprockers)
			songlist_determine_leaderboard_instrument_setup
		else
			songlist_determine_band_instrument_setup
		endif
		SongList :SetTags band_instrument_setup = <band_instrument_setup>
	endif
	songlist_update_ui
	songlist_slider_nub_cont :se_setprops Pos = <slider_pos>
	if ininternetmode
		SongList :se_setprops \{songlist_net_cont_alpha = 1.0}
		net_songlist_leader_text
	endif
	if (<mode> = playlist)
		songlist_remove_unavailable_songs_from_playlist
	endif
endscript

script songlist_music_store_assign_text_aliases \{desc = songlist_detail}
	if ScreenElementExists id = <desc>
		if <desc> :desc_resolvealias Name = alias_songlist_detail_album_text
			AssignAlias id = <resolved_id> alias = songlist_detail_album_text
		else
			ScriptAssert qs(0x9d4d64f5) d = <desc>
		endif
		if <desc> :desc_resolvealias Name = alias_songlist_detail_genre_text
			AssignAlias id = <resolved_id> alias = songlist_detail_genre_text
		else
			ScriptAssert qs(0xae6b0c76) d = <desc>
		endif
		if <desc> :desc_resolvealias Name = alias_songlist_detail_duration_text
			AssignAlias id = <resolved_id> alias = songlist_detail_duration_text
		else
			ScriptAssert qs(0x89329df5) d = <desc>
		endif
		if (<desc> = songlist_detail)
			if <desc> :desc_resolvealias Name = alias_songlist_detail_songs_album_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_album_text
			else
				ScriptAssert qs(0xe320c1cf) d = <desc>
			endif
			if <desc> :desc_resolvealias Name = alias_songlist_detail_songs_genre_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_genre_text
			else
				ScriptAssert qs(0x9f269a27) d = <desc>
			endif
			if <desc> :desc_resolvealias Name = alias_songlist_detail_songs_duration_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_duration_text
			else
				ScriptAssert qs(0x5c719b50) d = <desc>
			endif
		endif
	endif
endscript

script songlist_remove_unavailable_songs_from_playlist 
	songlist_manage_playlist_check_relevance
	if (<list_relevant> = FALSE)
		Change current_playlist = <override_array>
		Change \{g_songlist_warning_active = 1}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			current_menu :se_setprops \{block_events}
		endif
		getnumplayersingame
		if (<num_players> > 1)
			formatText \{TextName = body_text
				qs(0x44218325)}
		else
			formatText \{TextName = body_text
				qs(0xfbc789d4)}
		endif
		SongList :GetSingleTag \{exclusive_device}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = <body_text>
			player_device = <exclusive_device>
			options = [
				{
					func = songlist_destroy_dialog_box
					text = qs(0x0e41fe46)
				}
			]
		}
	endif
endscript

script songlist_destroy_dialog_box 
	printscriptinfo \{'songlist_destroy_dialog_box'}
	destroy_dialog_box
	clean_up_user_control_helpers
	SongList :GetSingleTag \{mode}
	songlist_create_default_user_control_helpers mode = <mode>
	Change \{g_songlist_warning_active = 0}
	if does_custom_playlist_exist
		if NOT ininternetmode
			songlist_allow_continue
		endif
	endif
	if ScreenElementExists \{id = current_menu}
		SongList :GetSingleTag \{initial_built}
		if (<initial_built> = FALSE)
			return
		endif
		SongList :GetSingleTag \{hilight_bar_index}
		current_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent Type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
endscript

script songlist_calculate_playlist_duration 
	GetArraySize \{$current_playlist}
	if (<array_Size> > 0)
		<i> = 0
		<total_seconds> = 0
		begin
		<song_not_found> = FALSE
		get_ui_song_struct_items song = (($current_playlist) [<i>])
		if (<song_not_found> = FALSE)
			<total_seconds> = (<total_seconds> + (<ui_struct>.song_duration))
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		<time_array> = []
		AddArrayElement array = <time_array> element = <total_seconds>
		rr_get_time_string data = <array>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_duration_text = <data_text>
		}
	else
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_duration_text = qs(0x369c70d7)}
	endif
endscript

script songlist_update_ui 
	SongList :GetSingleTag \{mode}
	if (<mode> = music_store)
		<title> = ($g_music_store_title)
	elseif (<mode> = import)
		offering = ($downloaded_offerings [($downloaded_offerings_index)])
		<title> = (<offering>.display_name)
		import_esrb_label_alpha = 0.0
		if NOT ((<offering>.rating) = None)
			import_esrb_label_alpha = 1.0
		endif
		SongList :se_setprops {
			music_store_title_alpha = 0.0
			music_store_slider_cont_alpha = 1.0
			songlist_title_text_alpha = 1.0
			import_esrb_label_alpha = <import_esrb_label_alpha>
		}
	elseif (<mode> = archive)
		SongList :GetSingleTag \{archive_source}
		if (<archive_source> = wii)
			<title> = qs(0x221e6727)
		else
			<title> = qs(0xad0b3864)
		endif
	else
		<title> = ($g_songlist_modes.<mode>.title)
	endif
	SongList :se_setprops {
		songlist_title_text_text = <title>
		songlist_sort_property_dims = (10.0, 32.0)
		songlist_sort_property_text = (($g_songlist_sort_array [($g_songlist_sort_index)]).text)
	}
	<event_handlers> = [
		{pad_up songlist_scroll_up}
		{pad_down songlist_scroll_down}
	]
	if NOT (<mode> = music_store || <mode> = import || <mode> = archive)
		if NOT ininternetmode
			gamemode_gettype
			if NOT ((<Type> = career) || (<mode> = leaderboard) || (<mode> = toprockers) || (<mode> = practice) || (<mode> = sing_a_long))
				<mp_option> = {pad_btn_left songlist_manage_playlist}
				AddArrayElement array = <event_handlers> element = <mp_option>
				<event_handlers> = <array>
			else
				<mp_option> = {pad_btn_left songlist_toggle_more_info}
				AddArrayElement array = <event_handlers> element = <mp_option>
				<event_handlers> = <array>
			endif
		endif
	elseif (<mode> = archive)
		SongList :GetSingleTag \{archive_source}
		<mp_option> = {pad_btn_left archive_toggle_songlist}
		AddArrayElement array = <event_handlers> element = <mp_option>
		<event_handlers> = <array>
	endif
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
	if (<mode> = music_store)
		SongList :GetSingleTag \{visited_band_hub}
		if GotParam \{visited_band_hub}
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			SongList :se_setprops \{music_store_slider_cont_alpha = 1.0
				songlist_title_text_alpha = 1.0}
		endif
	else
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers mode = <mode>
	endif
	songlist_filter_jam mode = <mode>
endscript

script songlist_filter_jam 
	RequireParams \{[
			mode
		]
		all}
	if (<mode> != playlist)
		return
	endif
	gamemode_gettype
	if (<Type> = quickplay)
		filterspec = [
			{
				key = song_source
				union_list = [jam]
				comparator = not_equal
			}
		]
		songlist_change_filterspec filterspec = <filterspec>
	endif
endscript

script songlist_toggle_more_info 
	if ($g_songlist_show_more_info = 0)
		generic_menu_pad_choose_sound
		Change \{g_songlist_show_more_info = 1}
		user_control_helper_change_text \{button = blue
			text = qs(0x0d424947)}
	else
		generic_menu_pad_choose_sound
		Change \{g_songlist_show_more_info = 0}
		user_control_helper_change_text \{button = blue
			text = qs(0x6644ffc7)}
	endif
	songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail
			force_transition
		}}
endscript

script songlist_create_playlist 
	current_menu :se_setprops \{block_events}
	SongList :Obj_SpawnScriptNow songlist_create_playlist_spawned params = {<...>}
endscript

script songlist_create_playlist_spawned 
	songlist_playlist_switch_sfx
	SongList :SetTags \{mode = playlist}
	if NOT GotParam \{no_detail_transition}
		songlist_detail_transition \{desc = songlist_detail}
	endif
	menu_music_off
	Change \{g_songlist_create_playlist_menu_item_present = 0}
	if NOT GotParam \{no_refresh}
		if GotParam \{no_focus}
			songlist_refresh_menus \{no_focus = 1}
		else
			songlist_refresh_menus
		endif
	endif
	current_menu :se_setprops \{unblock_events}
endscript

script songlist_create_play_song 
	printf \{qs(0xa7101acc)}
	songlist_playlist_switch_sfx
	SongList :SetTags \{mode = play_song}
	if NOT GotParam \{no_detail_transition}
		songlist_detail_transition \{desc = songlist_detail}
	endif
	Change \{g_songlist_create_playlist_menu_item_present = 0}
	if NOT GotParam \{no_refresh}
		if GotParam \{no_focus}
			songlist_refresh_menus \{no_focus = 1}
		else
			songlist_refresh_menus
		endif
	endif
endscript

script songlist_manage_playlist 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	if ScriptIsRunning \{songlist_continue}
		return
	endif
	Wait \{1
		gameframe}
	songlist_update_song_preview \{song = None}
	SongList :GetSingleTag \{exclusive_device}
	SongList :GetSingleTag \{savegame_device}
	if GotParam \{exclusive_device}
		generic_event_choose state = uistate_songlist_manage_playlist data = {is_popup exclusive_device = <exclusive_device> savegame_device = <savegame_device>}
	else
		ScriptAssert \{qs(0x098ea72c)}
	endif
endscript

script songlist_music_store_go_to_hub 
	SpawnScriptNow songlist_music_store_go_to_hub_spawned params = <...>
endscript

script 0xfe77c973 
	RequireParams \{[
			exclusive_device
		]
		all}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				nullscript
			}
		]
		replace_handlers}
	generic_event_choose no_sound state = uistate_music_store_purchase data = {is_popup exclusive_device = <exclusive_device> purchase_struct = <purchase_struct> go_to_confirm}
endscript

script songlist_music_store_go_to_hub_spawned 
	0x5e32f57d
	ui_event_wait_for_safe
	current_menu :se_setprops \{alpha = 0.0}
	SongList :GetSingleTag \{territory}
	if (<territory> != territory_us)
		<esrb_notice_alpha> = 0.0
	else
		<esrb_notice_alpha> = 1.0
	endif
	SongList :se_setprops {
		alpha = 1.0
		music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0
		songlist_title_text_alpha = 0.0
		pa_esrb_label_alpha = 0.0
		esrb_notice_alpha = <esrb_notice_alpha>
	}
	SongList :GetSingleTag \{exclusive_device}
	generic_event_choose no_sound state = uistate_music_store_hub data = {is_popup exclusive_device = <exclusive_device>}
	ui_event_wait_for_safe
	0x84307d1f
endscript

script songlist_music_store_go_to_terms 
	RequireParams \{[
			purchase_struct
		]
		all}
	current_menu :se_setprops \{alpha = 0.0}
	SongList :se_setprops \{music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0}
	SongList :GetSingleTag \{exclusive_device}
	songlist_slider_nub_cont :se_getprops \{Pos}
	generic_event_choose no_sound state = uistate_music_store_terms data = {
		is_popup
		exclusive_device = <exclusive_device>
		purchase_struct = <purchase_struct>
		slider_pos = <Pos>
	}
endscript

script songlist_go_to_rock_archive 
	music_store_start_saving_net_error
	SpawnScriptNow songlist_go_to_rock_archive_spawned params = <...>
endscript

script songlist_go_to_rock_archive_spawned 
	ui_event_wait_for_safe
	current_menu :se_setprops \{alpha = 0.0}
	SongList :se_setprops \{alpha = 0.0
		music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0
		songlist_title_text_alpha = 0.0
		pa_esrb_label_alpha = 0.0
		esrb_notice_alpha = 0.0}
	SongList :GetSingleTag \{exclusive_device}
	generic_event_choose state = uistate_rock_archive data = {is_popup exclusive_device = <exclusive_device>}
endscript

script songlist_do_physics_spawned 
	create_2d_spring_system \{desc_id = SongList
		num_springs = 2
		stiffness = 50
		rest_length = 1}
endscript

script songlist_pre_build 
	0x5e32f57d
	SongList :GetTags
	if (<cs_registered> = FALSE)
		if (<mode> = import)
			import_create_details_content_source list_name = <list_name>
			contentmanfunc \{func = debug_print}
		else
			if (<mode> != archive && <mode> != music_store && <mode> != archive_entry)
				get_savegame_from_controller controller = ($primary_controller)
				GetGlobalTags user_options savegame = <savegame> param = disable_dlc
			endif
			contentmanfunc func = register_content_source Name = <list_name> Type = <content_source> disable_dlc = <disable_dlc>
		endif
		SongList :SetTags \{cs_registered = true}
	endif
	SongList :SetTags \{list_dirty = true}
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<mode> = archive_entry)
		0x84307d1f
		return
	endif
	SongList :Obj_SpawnScriptNow songlist_request_page_when_ready params = {cs_registered = <cs_registered> list_name = <list_name> sortspec = <sortspec>}
endscript

script songlist_request_page_when_ready 
	OnExitRun \{0x84307d1f}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest
		only_for_same_object}
	Change \{dlc_timeout_counter = 0}
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		SongList :GetSingleTag \{mode}
		if (<mode> = music_store || <mode> = import)
			destroy_dialog_box
			songlist_create_default_user_control_helpers mode = <mode>
			SongList :GetSingleTag \{music_store_mode}
			if GotParam \{music_store_mode}
				if (<music_store_mode> = songs)
					songlist_music_store_allow_sorting
				endif
			endif
		endif
		if NOT GotParam \{seek_index}
			seek_index = 0
		endif
		if ($g_songlist_ignore_pivot_hack = 1)
			Change \{g_songlist_ignore_pivot_hack = 0}
			Change \{g_songlist_current_pivot = 0}
			Change \{g_songlist_pivot_hilight_index = 0}
			RemoveParameter \{seek_index}
		endif
		if (($g_songlist_current_pivot) > 0)
			seek_index = (($g_songlist_current_pivot) - ($g_songlist_create_playlist_menu_item_present))
		endif
		if NOT (($g_music_store_current_pack_checksum) = NULL)
			<seek_index> = ($g_music_store_current_pack_checksum)
		endif
		if (<mode> = music_store)
			if ScriptIsRunning \{music_store_entry_dialog_script}
				KillSpawnedScript \{Name = music_store_entry_dialog_script}
			endif
			SongList :GetSingleTag \{music_store_mode}
			if ((<music_store_mode> = special_offers) && (($0x6a97a08a) = 1))
				SetButtonEventMappings \{block_menu_input}
				if NOT setup_special_offers
					return \{FALSE}
				endif
			endif
		endif
		0x5e32f57d
		contentmanfunc {
			func = request_page
			Name = <list_name>
			current_page
			Seek = <seek_index>
			callback = songlist_build_request_data_callback
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
		}
		return
	endif
	Change dlc_timeout_counter = ($dlc_timeout_counter + 1)
	if ($dlc_timeout_counter > $dlc_timeout_time)
		break
	endif
	Wait \{3
		gameframes}
	repeat
	SongList :GetSingleTag \{mode}
	if (<mode> = music_store || <mode> = import)
		if ScriptIsRunning \{music_store_entry_dialog_script}
			KillSpawnedScript \{Name = music_store_entry_dialog_script}
		endif
		destroy_dialog_box
	endif
	contentmanfunc func = cancel_request Name = <list_name>
	music_store_start_saving_net_error
	create_dialog_box \{no_background
		heading_text = qs(0xaa163738)
		body_text = qs(0xa47088ec)
		options = [
			{
				func = songlist_marketplace_timed_out_go_back_check_demonware_error
				text = qs(0x0e41fe46)
			}
		]}
endscript

script songlist_marketplace_timed_out_go_back_check_demonware_error 
	if music_store_have_saved_error
		Change \{generic_menu_block_input = 0}
		music_store_stop_saving_net_error
		return
	endif
	destroy_dialog_box
	getngcneterrors \{reset = 1}
	if (<dwc_error_code> > 0)
		printf \{'handling ngc error'}
		formatText TextName = error_msg qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
		create_dialog_box {
			heading_text = qs(0x79597197)
			body_text = <error_msg>
			options = [
				{
					func = songlist_marketplace_timed_out_go_back
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		printf \{'not handling ngc error'}
		songlist_marketplace_timed_out_go_back
	endif
endscript

script songlist_marketplace_timed_out_go_back 
	destroy_dialog_box
	wii_music_store_back
endscript

script songlist_build_request_data_callback 
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	SongList :GetTags
	<current_page> = (<seek_global_index> / ($g_songlist_page_size))
	CastToInteger \{current_page}
	Change g_songlist_current_page = <current_page>
	<slider_count> = <seek_index>
	if (<non_song_item_focused> = true)
		seek_index = 0
		<slider_count> = 0
	endif
	if (<mode> = music_store)
		if (<music_store_seek_override> = true)
			seek_index = 0
			<slider_count> = 0
			SongList :SetTags \{music_store_seek_override = FALSE}
		endif
	endif
	songlist_calculate_slider_nub_res page_size = <content_size>
	<passed_in_seek_index> = <seek_index>
	if (<seek_index> > 0)
		if (<seek_index> > $g_songlist_pivot_hilight_index)
			<seek_index> = (<seek_index> - $g_songlist_pivot_hilight_index)
			if (<seek_index> >= (<content_size> - $g_songlist_last_visible_index))
				Change g_songlist_pivot_hilight_index = ($g_songlist_last_visible_index - ((<page_size> - 1) - <passed_in_seek_index>))
			endif
		else
			Change g_songlist_pivot_hilight_index = <seek_index>
			<seek_index> = 0
		endif
		SongList :GetSingleTag \{mode}
		if (<mode> = play_song)
			gamemode_gettype
			if NOT (<Type> = career)
				<slider_count> = (<slider_count> + 1)
			endif
		endif
		<callback> = songlist_pivot_data_request_callback
	else
		Change \{g_songlist_pivot_hilight_index = 0}
		<callback> = songlist_data_request_callback
	endif
	SongList :SetTags {
		list_page_size = <page_size>
		slider_nub_res = <slider_nub_res>
		list_index = <passed_in_seek_index>
		list_dirty = FALSE
	}
	songlist_update_slider_nub_pos Dir = down count = <slider_count>
	if ($g_songlist_pivot_hilight_index = 0)
		<count> = 0
	else
		<count> = ($g_songlist_pivot_hilight_index)
	endif
	songlist_update_hilight_bar_pos Dir = down count = <count>
	if ((<mode> = music_store) || (<mode> = import))
		songlist_hilight_bar_cont :se_setprops \{alpha = 0.5}
	else
		songlist_hilight_bar_cont :se_setprops \{alpha = 1.0}
	endif
	songlist_slider_nub_cont :se_setprops \{alpha = 1.0}
	Change \{g_songlist_current_pivot = 0}
	Change \{g_songlist_pivot_hilight_index = 0}
	if (<page_size> <= ($g_songlist_last_visible_index + 1))
		user_control_destroy_helper \{button = yellow}
	endif
	formatText TextName = num_songs qs(0xc31d83ea) i = <content_size>
	SongList :se_setprops songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = download_list)
				SongList :se_setprops \{songlist_songs_available_num_text = qs(0x03ac90f0)}
				SongList :se_setprops \{songlist_songs_available_text_text = qs(0x78068ef9)}
			else
				SongList :se_setprops \{songlist_songs_available_text_text = qs(0xd20d2af6)}
			endif
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = download_list)
				SongList :se_setprops \{songlist_songs_available_num_text = qs(0x03ac90f0)}
				SongList :se_setprops \{songlist_songs_available_text_text = qs(0x78068ef9)}
			else
				SongList :se_setprops \{songlist_songs_available_text_text = qs(0x08cb5377)}
			endif
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	<start_index> = <seek_index>
	printstruct channel = wtf <...>
	if (<page_size> = 0)
		songlist_detail :se_setprops \{alpha = 0.0}
		songlist_disallow_continue
		if (<mode> = archive)
			songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
			SongList :SetTags \{initial_built = true}
		endif
		<start_index> = 0
		<end_index> = 0
		if (<mode> = music_store)
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = special_offers)
				SetButtonEventMappings \{unblock_menu_input}
				import_setup_failed \{fail_text = qs(0xca70d008)
					heading_text = qs(0x03ac90f0)}
			endif
			if ($g_songlist_warning_active = 0)
				if (<mode> != archive || $g_songlist_archive_setup_complete = 1)
					current_menu :se_setprops \{unblock_events}
					LaunchEvent \{Type = unfocus
						target = current_menu}
					LaunchEvent Type = focus target = current_menu data = {child_index = <hilight_bar_index>}
				endif
			endif
		endif
		0x84307d1f
		return
	elseif (<page_size> <= ($g_songlist_last_visible_index))
		if ((<mode> = archive) || (<mode> = music_store))
			<end_index> = ((<page_size> - 1))
			<start_index> = 0
			songlist_reset_hilight_bar_pos
			songlist_update_hilight_bar_pos Dir = down count = <passed_in_seek_index>
		else
			<end_index> = ((<page_size> - 1) + <seek_index>)
		endif
		Change g_songlist_last_visible_index = (<page_size> - 1)
	else
		<end_index> = (($g_songlist_last_visible_index) + <start_index>)
		if (<end_index> >= <page_size>)
			<end_index> = (<page_size> - 1)
			<start_index> = (<end_index> - ($g_songlist_last_visible_index))
		endif
	endif
	SongList :SetTags {
		list_top = <start_index>
		list_bottom = <end_index>
	}
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <start_index>
		end_index = <end_index>
		callback = <callback>
	}
endscript

script songlist_pivot_data_request_callback 
	songlist_data_request_callback <...> dont_add_non_song_item
endscript

script songlist_data_request_callback \{add_non_song_item = 1}
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	SongList :GetTags
	if (<mode> = music_store)
		SongList :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			SetButtonEventMappings \{unblock_menu_input}
			songlist_destroy_dialog_box
		endif
		previewassetcache \{func = cancel_all_requests}
		music_store_preload_album_covers list = <Range>
		music_store_preload_preview_music list = <Range>
	endif
	if (<initial_built> = FALSE)
		if (<mode> = play_song)
			gamemode_gettype
			if (<Type> = career)
				dont_add_non_song_item = 1
			endif
			if ($g_songlist_current_page > 0)
				dont_add_non_song_item = 1
			endif
			if NOT GotParam \{dont_add_non_song_item}
				songlist_add_non_song_item \{focus_script = songlist_item_create_playlist_focus
					unfocus_script = songlist_item_create_playlist_unfocus
					choose_script = songlist_create_playlist}
			else
				menu_music_off
				Change \{g_songlist_create_playlist_menu_item_present = 0}
			endif
		else
			menu_music_off
		endif
		songlist_build <...>
		SongList :SetTags \{initial_built = true}
	else
		if (<mode> = music_store)
			if (<music_store_mode> = hub)
				0x84307d1f
				return
			endif
		endif
		if ($g_songlist_create_playlist_menu_item_present = 1)
			<list_index> = (<list_index> - 1)
			SongList :SetTags list_index = <list_index>
			Change \{g_songlist_create_playlist_menu_item_present = 0}
		endif
		if (<list_index> = <list_top>)
			songlist_insert_item_top <...>
		elseif (<list_index> = <list_bottom>)
			songlist_insert_item_bottom <...>
		endif
	endif
	0x84307d1f
	if SongList :GetSingleTag \{need_unavailable_dialog}
		if (<need_unavailable_dialog> = 1)
			SongList :SetTags \{need_unavailable_dialog = 0}
			generic_event_choose \{state = uistate_songlist_popup
				data = {
					is_popup
					exclusive_device = 0
				}}
		endif
	endif
endscript

script songlist_add_non_song_item 
	RequireParams \{[
			focus_script
			unfocus_script
			choose_script
		]
		all}
	CreateScreenElement {
		Type = descinterface
		desc = 'songlist_create_playlist_item'
		parent = current_menu
		autosizedims = true
		event_handlers = [
			{focus <focus_script>}
			{unfocus <unfocus_script>}
			{pad_choose <choose_script>}
		]
	}
	Change \{g_songlist_create_playlist_menu_item_present = 1}
endscript

script songlist_insert_item_top 
	<index> = 0
	SongList :GetTags
	GetScreenElementChildren \{id = current_menu}
	if GotParam \{children}
		GetArraySize <children>
		if (<array_Size> > ($g_songlist_last_visible_index))
			DestroyScreenElement id = (<children> [($g_songlist_last_visible_index)])
		endif
	endif
	if NOT GotParam \{non_song_item}
		songlist_add_item {
			ui_struct = (<Range> [<index>])
			index = 0
		}
		menu_music_off
	else
		songlist_add_non_song_item \{focus_script = songlist_item_create_playlist_focus
			unfocus_script = songlist_item_create_playlist_unfocus
			choose_script = songlist_create_playlist}
	endif
	current_menu :menu_setitemindex index = ($g_songlist_last_visible_index) newindex = 0
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script songlist_insert_item_bottom 
	SongList :GetTags
	if GotParam \{music_store_mode}
		if (<music_store_mode> = hub)
			return
		endif
	endif
	<index> = ($g_songlist_last_visible_index)
	GetScreenElementChildren \{id = current_menu}
	DestroyScreenElement id = (<children> [0])
	songlist_add_item {
		ui_struct = (<Range> [<index>])
		index = <index>
	}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent Type = focus target = current_menu data = {child_index = <index>}
endscript

script songlist_build 
	printf \{'songlist_build'}
	SongList :GetTags
	if (<mode> = music_store)
		if NOT GotParam \{visited_band_hub}
			SongList :SetTags \{visited_band_hub = true}
			songlist_music_store_go_to_hub
			return
		endif
		if (<music_store_mode> = hub)
			return
		endif
	endif
	GetArraySize <Range>
	if ((<array_Size> - ($g_songlist_create_playlist_menu_item_present)) > 0)
		<i> = 0
		begin
		songlist_add_item {
			ui_struct = (<Range> [<i>])
			index = <i>
		}
		<i> = (<i> + 1)
		repeat (<array_Size> - ($g_songlist_create_playlist_menu_item_present))
	endif
	if ($g_songlist_warning_active = 0)
		if (<mode> != archive || $g_songlist_archive_setup_complete = 1)
			current_menu :se_setprops \{unblock_events}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			LaunchEvent Type = focus target = current_menu data = {child_index = <hilight_bar_index>}
		endif
	endif
	if (<mode> = music_store)
		SongList :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = download_list)
			current_menu :se_setprops {
				event_handlers = [
					{pad_start 0xfe77c973 params = {exclusive_device = <exclusive_device> purchase_struct = <ui_struct>}}
				]
				replace_handlers
			}
			if NOT user_control_helper_exists \{button = start}
				add_user_control_helper \{text = qs(0x13a262e4)
					button = start
					z = 100000}
			endif
		else
			current_menu :se_setprops \{event_handlers = [
					{
						pad_start
						nullscript
					}
				]
				replace_handlers}
		endif
	endif
	if (<mode> = music_store || <mode> = import || <mode> = archive)
		printf \{qs(0xa5787671)}
		SongList :SetTags \{list_dirty = FALSE}
		return
	endif
	formatText TextName = songs_required qs(0xc31d83ea) i = ($g_songlist_force_num_songs_to_choose)
	songlist_detail_playlist :se_setprops {
		songlist_detail_playlist_num_songs_required_text = <songs_required>
	}
	if ($g_songlist_force_num_songs_to_choose > 0)
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_songs_added_alpha = 1.0
			songlist_detail_playlist_duration_alpha = 0.0}
	endif
	GetArraySize ($current_playlist)
	if (<array_Size> > 0)
		<i> = 0
		<iters> = <array_Size>
		if (<array_Size> > ($g_songlist_playlist_detail_items))
			<i> = (<array_Size> - ($g_songlist_playlist_detail_items))
			<iters> = ($g_songlist_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>])
		formatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
		CreateScreenElement {
			Type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <i>
		<i> = (<i> + 1)
		repeat <iters>
		<i> = 0
		<iters> = <array_Size>
		if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
			<i> = (<array_Size> - ($g_songlist_mini_playlist_detail_items))
			<iters> = ($g_songlist_mini_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>])
		formatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
		CreateScreenElement {
			Type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <i>
		<i> = (<i> + 1)
		repeat <iters>
		if ($g_songlist_force_num_songs_to_choose > 0)
			formatText TextName = songs_added qs(0xc31d83ea) i = <array_Size>
			songlist_detail_playlist :se_setprops {
				songlist_detail_playlist_num_songs_added_text = <songs_added>
			}
			if (<array_Size> = $g_songlist_force_num_songs_to_choose)
				songlist_allow_continue
			endif
		elseif NOT ininternetmode
			songlist_allow_continue
		endif
	else
		songlist_disallow_continue
	endif
	SongList :SetTags \{list_dirty = FALSE}
endscript

script songlist_add_item 
	RequireParams \{[
			ui_struct
		]
		all}
	SongList :GetSingleTag \{mode}
	if (<mode> = import)
		formatText checksumName = song '%a' a = (<ui_struct>.song_title)
	elseif song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song '%i' i = <text>
	else
		song = (<ui_struct>.song_checksum)
	endif
	if (<mode> = music_store || <mode> = import)
		SongList :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = download_list)
			<desc> = 'music_store_download_list_item'
		else
			<desc> = 'music_store_item'
		endif
	elseif (<mode> = archive)
		<desc> = 'archive_item'
	else
		<desc> = 'songlist_item'
	endif
	ExtendCrc <song> '_sl_item' out = item_id
	if (<mode> = archive)
		SongList :GetSingleTag \{archive_source}
		if (<archive_source> = wii)
			ExtendCrc <item_id> '_Wii' out = item_id
		else
			ExtendCrc <item_id> '_SD' out = item_id
		endif
	endif
	if NOT StructureContains structure = <ui_struct> song_original_artist
		<sub_text> = (<ui_struct>.song_artist)
	else
		if (<ui_struct>.song_original_artist = 1)
			<sub_text> = (<ui_struct>.song_artist)
		else
			<sub_text> = qs(0x13c0666a)
		endif
	endif
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
	<sd_alpha> = 0.0
	if ((<ui_struct>.song_on_sd = 1) && (<ui_struct>.song_on_wii = 0))
		<sd_alpha> = 1.0
	endif
	CreateScreenElement {
		Type = descinterface
		id = <item_id>
		desc = <desc>
		parent = current_menu
		songlist_item_text_text = (<ui_struct>.song_title)
		songlist_item_sub_text_text = <sub_text>
		autosizedims = true
		sd_card_alpha = <sd_alpha>
	}
	if NOT ((<mode> = import) || (<mode> = music_store) || <mode> = archive)
		if NOT issongselectable song = (<ui_struct>.song_checksum)
			<id> :se_setprops {
				songlist_item_text_rgba = $g_songlist_invalid_item_unfocus_rgba
				songlist_item_sub_text_rgba = $g_songlist_invalid_sub_item_unfocus_rgba
			}
		endif
	endif
	if (<mode> = import)
		<id> :se_setprops {
			music_store_song_price_rgba = [0 0 0 0]
			music_store_money_icon_rgba = [0 0 0 0]
			music_store_money_text_rgba = [0 0 0 0]
		}
	endif
	if (<mode> = music_store)
		if StructureContains \{structure = ui_struct
				album_pack_only}
			songlist_music_store_add_item {
				id = <item_id>
				purchased = (<ui_struct>.purchased)
				price = (<ui_struct>.price)
				song_on_wii = (<ui_struct>.song_on_wii)
				song_on_sd = (<ui_struct>.song_on_sd)
				code = <song>
				album_pack_only
			}
		else
			songlist_music_store_add_item {
				id = <item_id>
				purchased = (<ui_struct>.purchased)
				price = (<ui_struct>.price)
				song_on_wii = (<ui_struct>.song_on_wii)
				song_on_sd = (<ui_struct>.song_on_sd)
				code = <song>
			}
		endif
	endif
	if songlist_is_song_in_playlist song = <song>
		SongList :GetSingleTag \{locked}
		if (<locked> = FALSE)
			if InNetGame
				gamemode_gettype
				if (<Type> = career)
					<pad_choose_script> = songlist_item_remove_from_playlist
					<pad_choose_params> = {ui_struct = <ui_struct>}
				else
					<pad_choose_script> = songlist_item_add_to_playlist
					<pad_choose_params> = {ui_struct = <ui_struct>}
				endif
			else
				<pad_choose_script> = songlist_item_remove_from_playlist
				<pad_choose_params> = {ui_struct = <ui_struct>}
			endif
		else
			<pad_choose_script> = nullscript
			<pad_choose_params> = {}
		endif
		<show_playlist_number> = 0
		if InNetGame
			gamemode_gettype
			if (<Type> = career || ($net_song_countdown = 1))
				<show_playlist_number> = 1
			endif
		else
			<show_playlist_number> = 1
		endif
		if (<show_playlist_number> = 1)
			formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<id> :se_setprops {
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
				sd_card_scale = (0.6, 0.6)
				sd_card_pos = (29.0, 0.0)
			}
		endif
		<id> :SetTags playlist_index = <playlist_index>
	else
		if (<mode> = import)
			<pad_choose_script> = nullscript
		elseif (<mode> = music_store)
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = special_offers)
				<index> = (<ui_struct>.offer_index)
				<code> = (<ui_struct>.song_checksum)
				if ((<ui_struct>.Type) = import)
					<pad_choose_script> = import_choose
					<pad_choose_params> = {code = <code> content_keys = ($g_music_store_global_content_keys) offeringid = (($downloaded_offerings [<index>]).offeringid) display_name = (($downloaded_offerings [<index>]).display_name) title_name = (($downloaded_offerings [<index>]).title_name) ui_struct = <ui_struct>}
				elseif ((<ui_struct>.Type) = patch)
					<pad_choose_script> = songlist_music_store_proceed_to_pre_purchase
					<pad_choose_params> = {ui_struct = <ui_struct>}
				else
					<pad_choose_script> = nullscript
				endif
			elseif (<music_store_mode> = download_list)
				<pad_choose_script> = music_store_mark_item_to_download
				<pad_choose_params> = {ui_struct = <ui_struct>}
			else
				marketplacefunc \{func = clear_cart}
				printf \{'clearing cart from song select before pre_purchase'}
				<pad_choose_script> = songlist_music_store_proceed_to_pre_purchase
				<pad_choose_params> = {ui_struct = <ui_struct>}
			endif
		elseif (<mode> = archive)
			SongList :GetSingleTag \{archive_source}
			<pad_choose_script> = archive_select_song
			<pad_choose_params> = {ui_struct = <ui_struct>}
		else
			<pad_choose_script> = songlist_item_add_to_playlist
			<pad_choose_params> = {ui_struct = <ui_struct>}
		endif
	endif
	event_handlers = [
		{focus songlist_item_focus params = {ui_struct = <ui_struct>}}
		{unfocus songlist_item_unfocus params = {ui_struct = <ui_struct>}}
		{pad_choose <pad_choose_script> params = <pad_choose_params>}
	]
	if (<mode> = music_store)
		SongList :GetSingleTag \{music_store_mode}
		if NOT ((<music_store_mode> = special_offers) || (<music_store_mode> = download_list))
			<option> = {pad_btn_left songlist_music_store_preview_song params = {song_preview_asset_name = (<ui_struct>.song_preview_asset_name) ui_struct = <ui_struct>}}
			AddArrayElement array = <event_handlers> element = <option>
		endif
		<event_handlers> = <array>
	endif
	<id> :se_setprops event_handlers = <event_handlers>
	return id = <id>
endscript

script songlist_music_store_add_item \{song_on_wii = 0
		song_on_sd = 0}
	RequireParams \{[
			id
			purchased
			price
		]
		all}
	if isps3
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 1.0
		music_store_determine_currency
	elseif isngc
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 1.0
		music_store_determine_currency
		<wii_icon_alpha> = 0.0
		<sd_card_icon_alpha> = 0.0
		<update_icon_alpha> = 0.0
		<download_arrow_alpha> = 1.0
		<wii_icon_texture> = wii_icon
		if (<song_on_wii> = 1)
			<wii_icon_alpha> = 1.0
			<download_arrow_alpha> = 0.0
		endif
		if ((<song_on_wii> = 0) && (<song_on_sd> = 1))
			<wii_icon_alpha> = 1.0
			<wii_icon_texture> = sd_card_icon
			<download_arrow_alpha> = 0.0
		elseif (<song_on_sd> = 1)
			<sd_card_icon_alpha> = 1.0
			<download_arrow_alpha> = 0.0
		endif
	endif
	if GotParam \{price}
		musicstore_format_price_text price = <price> currency_decimals = <currency_decimals>
	endif
	SongList :GetSingleTag \{music_store_mode}
	if (<music_store_mode> = download_list)
		<purchased> = 0
		<money_text_alpha> = 0.0
		RemoveParameter \{album_pack_only}
		dlcmanagerfunc func = get_content_flags content_name = <code>
		if (<content_flags>.in_cart = 0)
			<download_arrow_alpha> = 0.0
		endif
		marketplacefunc func = get_cart_content_blocks content_name = <code>
		if (<song_on_wii> = 1 || <song_on_sd> = 1)
			formatText \{TextName = price_text
				qs(0x03ac90f0)}
		else
			formatText TextName = price_text qs(0x20e95a21) b = <blocks>
		endif
	endif
	if (<purchased> = 1)
		<money_icon_alpha> = 1.0
		<money_text_alpha> = 0.0
		<money_texture> = purchased_check_icon
		<price_text> = qs(0x03ac90f0)
		<money_rgba> = (($g_menu_colors).pure_white)
	elseif GotParam \{album_pack_only}
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 0.0
		<price_text> = qs(0x03ac90f0)
	endif
	<id> :se_setprops {
		music_store_song_price_text = <price_text>
		music_store_money_icon_texture = <money_texture>
		music_store_money_icon_alpha = <money_icon_alpha>
		music_store_money_icon_rgba = <money_rgba>
		music_store_money_text_alpha = <money_text_alpha>
		music_store_money_text_text = <currency>
		music_store_money_text_rgba = <money_rgba>
		music_store_wii_icon_texture = <wii_icon_texture>
		music_store_wii_icon_alpha = <wii_icon_alpha>
		music_store_sd_card_icon_alpha = <sd_card_icon_alpha>
		music_store_update_icon_alpha = <update_icon_alpha>
		music_store_download_arrow_alpha = <download_arrow_alpha>
	}
endscript

script songlist_music_store_proceed_to_pre_purchase 
	current_menu :se_setprops \{block_events}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	SongList :GetSingleTag \{exclusive_device}
	if ((<ui_struct>.Type) = song)
		if ((<ui_struct>.song_on_wii) = 1)
			songlist_music_store_display_already_owned_dialog ui_struct = <ui_struct> song_on_wii = 1
			return
		elseif ((<ui_struct>.song_on_sd) = 1)
			songlist_music_store_display_already_owned_dialog ui_struct = <ui_struct> song_on_sd = 1
			return
		endif
	endif
	if isXenon
		generic_event_choose no_sound state = uistate_music_store_purchase data = {is_popup exclusive_device = <exclusive_device> purchase_struct = <ui_struct>}
	elseif isngc
		generic_event_choose no_sound state = uistate_music_store_purchase data = {is_popup exclusive_device = <exclusive_device> purchase_struct = <ui_struct>}
	else
		songlist_music_store_go_to_terms purchase_struct = <ui_struct>
	endif
endscript

script songlist_music_store_display_already_owned_dialog 
	printf \{'songlist_music_store_display_already_owned_dialog - enter'}
	SongList :GetSingleTag \{exclusive_device}
	<options> = []
	<element> = {
		func = songlist_destroy_dialog_box
		text = qs(0xf7723015)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	if GotParam \{song_on_wii}
		formatText TextName = body_text qs(0xea6c4129) s = (<ui_struct>.song_title)
		<element> = {
			func = songlist_music_store_delete_content
			func_params = {song_checksum = (<ui_struct>.song_checksum)}
			text = qs(0x271a1633)
		}
		AddArrayElement array = <options> element = <element>
		<options> = <array>
	elseif GotParam \{song_on_sd}
		formatText TextName = body_text qs(0xaa25e23e) s = (<ui_struct>.song_title)
	endif
	<title> = qs(0xaa163738)
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = <title>
		body_text = <body_text>
		player_device = <exclusive_device>
		back_button_script = songlist_destroy_dialog_box
		options = <options>
	}
endscript

script songlist_music_store_delete_content 
	RequireParams \{[
			song_checksum
		]
		all}
	printf 'songlist_music_store_delete_content - about to delete %s' s = <song_checksum>
	dlcmanagerfunc func = delete content_name = <song_checksum>
	SongList :GetSingleTag \{list_name}
	contentmanfunc func = refresh Name = <list_name> no_enum
	songlist_destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	songlist_refresh_menus
endscript

script songlist_music_store_preview_song 
	music_store_request_preview_music music_name = <song_preview_asset_name>
endscript

script songlist_music_store_view_pack_songs 
	RequireParams \{[
			ui_struct
		]
		all}
	if GotParam \{play_sfx}
		music_store_select_sfx
	endif
	if GotParam \{previous}
		Change g_music_store_previous_menu = <previous>
	endif
	SongList :GetSingleTag \{music_store_mode}
	if GotParam \{Type}
		if (<Type> = album)
			filterspec = [
				{
					key = Type
					value = album
					comparator = equal
				}
			]
			SongList :SetTags \{music_store_mode = albums}
			<title> = qs(0xe04818ae)
			songlist_change_sort_index \{index = 1}
			songlist_change_filterspec filterspec = <filterspec>
			Change g_music_store_title = <title>
		elseif (<Type> = pack)
			filterspec = [
				{
					key = Type
					value = pack
					comparator = equal
				}
			]
			SongList :SetTags \{music_store_mode = track_packs}
			<title> = qs(0x6d06b07b)
			songlist_change_sort_index \{index = 0}
			songlist_change_filterspec filterspec = <filterspec>
			Change g_music_store_title = <title>
		else
			array = (<ui_struct>.pack_contents)
			Change \{g_music_store_songlist_real = 0}
			if NOT (((<ui_struct>.Type) = import) || (<music_store_mode> = download_list))
				AddArrayElement array = <array> element = (<ui_struct>.song_checksum)
				SongList :SetTags \{music_store_mode = songs}
			endif
			filterspec = [
				{
					key = song_checksum
					union_list = (<array>)
					comparator = equal
				}
			]
			songlist_change_sort_index \{index = 0}
			SongList :SetTags \{music_store_seek_override = true}
			if (<music_store_mode> = download_list)
				printf \{'showing download list titles'}
				formatText \{TextName = title
					qs(0xfcda249e)}
			elseif ((<ui_struct>.Type) = pack)
				formatText TextName = title qs(0xf987cdb7) t = (<ui_struct>.song_title)
			elseif ((<ui_struct>.Type) = import)
				formatText TextName = title qs(0x478a2386) t = (($downloaded_offerings [(<ui_struct>.offer_index)]).display_name)
			else
				formatText TextName = title qs(0x690533a1) t = (<ui_struct>.song_title)
			endif
			songlist_change_filterspec filterspec = <filterspec>
			Change g_music_store_title = <title>
		endif
	endif
	Change \{g_songlist_last_visible_index = 4}
	Change g_music_store_current_pack_checksum = (<ui_struct>.song_checksum)
	if GotParam \{no_pivot}
		songlist_refresh_menus \{no_pivot = 1
			no_focus = 1}
	else
		songlist_refresh_menus \{no_focus = 1}
	endif
endscript

script songlist_music_store_disallow_sorting 
	if user_control_helper_exists \{button = orange}
		user_control_destroy_helper \{button = orange}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_L1
				nullscript
			}
		]
		replace_handlers}
endscript

script songlist_music_store_allow_sorting 
	if NOT user_control_helper_exists \{button = orange}
		add_user_control_helper \{text = qs(0x00a93373)
			button = orange
			z = 100000}
	else
		user_control_helper_change_text \{button = orange
			text = qs(0x00a93373)}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_L1
				songlist_sort_toggle
			}
		]
		replace_handlers}
endscript

script songlist_is_song_in_playlist 
	RequireParams \{[
			song
		]
		all}
	GetArraySize ($current_playlist)
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (<song> = ($current_playlist [<i>]))
			return true playlist_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script songlist_get_song_playlist_detail_index 
	RequireParams \{[
			playlist_index
			vmenu_id
		]
		all}
	<my_playlist_index> = <playlist_index>
	if GetScreenElementChildren id = <vmenu_id>
		GetArraySize <children>
		<i> = 0
		begin
		(<children> [<i>]) :GetSingleTag playlist_index
		if (<playlist_index> = <my_playlist_index>)
			return true playlist_detail_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script songlist_do_maintenance_on_list 
	RequireParams \{[
			playlist_index
			list
		]
		all}
	if GetScreenElementChildren id = <list>
		GetArraySize <children>
		<my_playlist_index> = <playlist_index>
		RemoveParameter \{playlist_index}
		<i> = 0
		begin
		(<children> [<i>]) :GetSingleTag playlist_index
		if GotParam \{playlist_index}
			if (<my_playlist_index> < <playlist_index>)
				<new_index> = <playlist_index>
				formatText TextName = pos_text qs(0xc31d83ea) i = <new_index>
				(<children> [<i>]) :se_setprops {
					in_playlist_pos_text = <pos_text>
				}
				(<children> [<i>]) :SetTags playlist_index = (<new_index> - 1)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script songlist_update_instrument_difficulty_rating \{time = 0.025}
	RequireParams \{[
			prev_diff_rate
		]
		all}
	if NOT GotParam \{diff_rate}
		diff_rate = 0
	endif
	SongList :GetSingleTag \{mode}
	if (<mode> = music_store || <mode> = import)
		<on_rgba> = [113 121 133 255]
		<off_rgba> = [113 121 133 255]
		<off_alpha> = 0.35000002
	else
		<on_rgba> = [45 100 110 255]
		<off_rgba> = [190 225 230 255]
		<off_alpha> = 0.15
	endif
	<difference> = (<diff_rate> - <prev_diff_rate>)
	formatText checksumName = songlist_detail_difficulty_vmenu 'songlist_detail_difficulty_%i_vmenu' i = <instrument>
	GetScreenElementChildren id = <songlist_detail_difficulty_vmenu>
	ResolveScreenElementID id = [
		{id = <songlist_detail_difficulty_vmenu>}
		{local_id = songlist_detail_difficulty_sprite}
		{local_id = songlist_detail_difficulty_invalid}
	]
	if GotParam \{resolved_id}
		if (<diff_rate> = 0)
			<resolved_id> :se_setprops alpha = 1 time = 0.2
		else
			<resolved_id> :se_setprops alpha = 0 time = 0.2
		endif
	endif
	if (<difference> > 0)
		<i> = (9 - <prev_diff_rate>)
		formatText checksumName = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
		begin
		(<children> [<i>]) :se_setprops rgba = <on_rgba> alpha = 1.0
		AddParam structure_name = my_diff_rate_struct Name = <prev_diff_rate> value = (10 - <i>)
		songlist_detail :SetTags {
			<my_diff_rate_struct>
		}
		Wait <time> Seconds
		<i> = (<i> - 1)
		repeat <difference>
	else
		<difference> = (<difference> * -1)
		<i> = (10 - <prev_diff_rate>)
		if (<difference> > 0)
			formatText checksumName = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
			begin
			(<children> [<i>]) :se_setprops rgba = <off_rgba> alpha = <off_alpha>
			AddParam structure_name = my_diff_rate_struct Name = <prev_diff_rate> value = (9 - <i>)
			songlist_detail :SetTags {
				<my_diff_rate_struct>
			}
			Wait <time> Seconds
			<i> = (<i> + 1)
			repeat <difference>
		endif
	endif
endscript

script songlist_update_stars \{time = 0.05}
	RequireParams \{[
			prev_stars
			gold_stars
		]
		all}
	if NOT GotParam \{stars}
		stars = 0
	endif
	<difference> = (<stars> - <prev_stars>)
	GetScreenElementChildren \{id = songlist_detail_stars_empty_vmenu}
	GetArraySize <children>
	if (<stars> = 6)
		<max_stars> = 6
		if (<array_Size> = 5)
			CreateScreenElement \{Type = SpriteElement
				parent = songlist_detail_stars_empty_vmenu
				texture = songlist_star_empty
				dims = (64.0, 64.0)
				just = [
					center
					center
				]
				alpha = 0.15
				z_priority = 21}
			songlist_detail_stars_empty_vmenu :menu_setitemindex \{index = 5
				newindex = 0}
			CreateScreenElement \{Type = SpriteElement
				parent = songlist_detail_stars_full_vmenu
				texture = songlist_star_full
				dims = (64.0, 64.0)
				just = [
					center
					center
				]
				alpha = 0
				z_priority = 22}
			songlist_detail_stars_full_vmenu :menu_setitemindex \{index = 5
				newindex = 0}
			GetScreenElementPosition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :se_setprops Pos = (<screenelementpos> + (0.0, 14.0))
		endif
	else
		<max_stars> = 5
		if (<array_Size> = 6)
			DestroyScreenElement id = (<children> [0])
			RemoveParameter \{children}
			GetScreenElementChildren \{id = songlist_detail_stars_full_vmenu}
			DestroyScreenElement id = (<children> [0])
			GetScreenElementPosition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :se_setprops Pos = (<screenelementpos> + (0.0, -14.0))
		endif
	endif
	GetScreenElementChildren \{id = songlist_detail_stars_full_vmenu}
	if (<difference> > 0)
		<i> = ((<max_stars> - 1) - <prev_stars>)
		begin
		(<children> [<i>]) :se_setprops alpha = 1.0
		songlist_detail :SetTags {
			prev_stars = (<max_stars> - <i>)
		}
		Wait <time> Seconds
		<i> = (<i> - 1)
		repeat <difference>
	else
		<difference> = (<difference> * -1)
		if (<difference> > 0)
			if (<prev_stars> = 6)
				<prev_stars> = 5
				songlist_detail :SetTags \{prev_stars = 5}
				<difference> = (<difference> - 1)
			endif
			if (<difference> > 0)
				<i> = (<max_stars> - <prev_stars>)
				begin
				(<children> [<i>]) :se_setprops alpha = 0.0
				songlist_detail :SetTags {
					prev_stars = ((<max_stars> - 1) - <i>)
				}
				Wait <time> Seconds
				<i> = (<i> + 1)
				repeat <difference>
			endif
		endif
	endif
	if (<gold_stars> = 0)
		<rgba> = (($g_menu_colors).pure_white)
	else
		<rgba> = (($g_menu_colors).gh5_gold_md)
	endif
	<star> = 0
	begin
	(<children> [<star>]) :se_setprops rgba = <rgba> time = 0.5
	<star> = (<star> + 1)
	repeat <max_stars>
endscript

script songlist_item_focus \{time = 0.0}
	RequireParams \{[
			ui_struct
		]
		all}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<rgba> = (($g_menu_colors).black)
	SongList :GetSingleTag \{mode}
	if (<mode> = import)
		<id> :se_setprops {
			songlist_item_text_rgba = ($g_music_store_item_focus_rgba)
			songlist_item_sub_text_rgba = ($g_music_store_sub_item_focus_rgba)
			music_store_song_price_rgba = [0 0 0 0]
			music_store_money_icon_rgba = [0 0 0 0]
			music_store_money_text_rgba = [0 0 0 0]
			time = <time>
		}
		return
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	SongList :GetSingleTag \{exclusive_device}
	if (<mode> = music_store)
		SongList :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = download_list)
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 0.0
				songlist_detail_albums_alpha = 1.0
				download_block_info_cont_alpha = 1.0}
		elseif (<ui_struct>.Type = song)
			if ($g_music_store_songlist_real = 1)
				Change g_music_store_current_pack_checksum = <song_checksum>
			endif
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 1.0
				songlist_detail_albums_alpha = 0.0
				download_block_info_cont_alpha = 0.0}
		else
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 0.0
				songlist_detail_albums_alpha = 1.0
				download_block_info_cont_alpha = 0.0}
		endif
		if NOT (<ui_struct>.song_rating = None)
			<pa_alpha> = 1.0
			<esrb_notice_alpha> = 0.0
		else
			<pa_alpha> = 0.0
			SongList :GetSingleTag \{territory}
			if (<territory> != territory_us)
				<esrb_notice_alpha> = 0.0
			else
				<esrb_notice_alpha> = 1.0
			endif
		endif
		SongList :se_setprops {
			pa_esrb_label_alpha = <pa_alpha>
			esrb_notice_alpha = <esrb_notice_alpha>
		}
	endif
	if songlist_is_song_in_playlist song = <song_checksum>
		<rgba> = (($g_menu_colors).songlist_focus_orangeish)
		gamemode_gettype
		if NOT ininternetmode
			user_control_helper_change_text \{button = green
				text = qs(0x34ff4910)}
		elseif (<Type> = career)
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
				endif
			endif
		endif
	else
		if (<mode> = playlist)
			user_control_helper_change_text \{button = green
				text = qs(0x562b9e24)}
		elseif (<mode> = music_store)
			if (<ui_struct>.purchased = 1)
				if isps3
					user_control_destroy_helper \{button = green}
				else
					if NOT user_control_helper_exists \{button = green}
						add_user_control_helper \{text = qs(0xc18d5e76)
							button = green
							z = 100000}
						user_control_helper_reorder \{button = green
							new_index = 0}
					else
						user_control_helper_change_text \{button = green
							text = qs(0xc18d5e76)}
					endif
				endif
			else
				if NOT user_control_helper_exists \{button = green}
					add_user_control_helper \{text = qs(0xc18d5e76)
						button = green
						z = 100000}
					user_control_helper_reorder \{button = green
						new_index = 0}
				else
					user_control_helper_change_text \{button = green
						text = qs(0xc18d5e76)}
				endif
			endif
		endif
	endif
	if NOT (<mode> = music_store || <mode> = archive)
		if issongselectable song = (<ui_struct>.song_checksum)
			<item_focus_rgba> = ($g_songlist_item_focus_rgba)
			<sub_item_focus_rgba> = ($g_songlist_sub_item_focus_rgba)
		else
			<item_focus_rgba> = ($g_songlist_invalid_item_focus_rgba)
			<sub_item_focus_rgba> = ($g_songlist_invalid_sub_item_focus_rgba)
		endif
	else
		<item_focus_rgba> = ($g_music_store_item_focus_rgba)
		<sub_item_focus_rgba> = ($g_music_store_sub_item_focus_rgba)
	endif
	<id> :se_setprops {
		songlist_item_text_rgba = <item_focus_rgba>
		songlist_item_sub_text_rgba = <sub_item_focus_rgba>
		time = <time>
	}
	if (<mode> = archive)
		return
	endif
	if (<mode> = music_store)
		if (<ui_struct>.purchased = 1)
			<money_icon_rgba> = (($g_menu_colors).pure_white)
		else
			<money_icon_rgba> = <sub_item_focus_rgba>
		endif
		<id> :se_setprops {
			music_store_song_price_rgba = <sub_item_focus_rgba>
			music_store_money_icon_rgba = <money_icon_rgba>
			music_store_money_text_rgba = <money_icon_rgba>
		}
	endif
	if NOT (<mode> = music_store)
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			get_genre_text genre = (<ui_struct>.song_genre) song = <song_checksum>
			formatText TextName = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
		else
			curr_musicstudio_genre = (<ui_struct>.musicstudio_genre)
			GetArraySize ($jam_genre_list) param = genre_list_size
			if ((<curr_musicstudio_genre> >= 0) && (<curr_musicstudio_genre> < <genre_list_size>))
				musicstudio_genre_text = ($jam_genre_list [<curr_musicstudio_genre>].name_text)
			else
				musicstudio_genre_text = qs(0xd0ef7f05)
			endif
			year = (<ui_struct>.song_year)
			if (<year> = 0)
				<year> = $memcard_jamsession_year
			endif
			formatText TextName = genre_year_text qs(0xf7e765ed) g = <musicstudio_genre_text> y = <year>
		endif
		<total_seconds> = 0
		if StructureContains structure = <ui_struct> song_duration
			<total_seconds> = (<ui_struct>.song_duration)
		endif
		if (<total_seconds> > 0)
			Seconds = 0
			minutes = 0
			Mod a = <total_seconds> b = 60
			<Seconds> = <Mod>
			<total_seconds> = (<total_seconds> - <Seconds>)
			if (<total_seconds> > 0)
				Mod a = <total_seconds> b = (60 * 60)
				<minutes> = (<Mod> / 60)
			endif
		else
			<Seconds> = 0
			<minutes> = 0
		endif
		formatText TextName = duration_text qs(0x81ca0519) m = <minutes> s = <Seconds>
		songlist_detail_transition \{desc = songlist_detail}
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
				player_num = 1
			else
				get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
			endif
			if isSinglePlayerGame
				getplayerinfo <player_num> part
				getplayerinfo <player_num> difficulty
			else
				<part> = Band
				get_highest_difficulty
				<difficulty> = <highest_difficulty>
			endif
			SongList :GetSingleTag \{mode}
			if (<mode> = toprockers)
				difficulty = ($current_leaderboard_difficulty)
			endif
			get_difficulty_text_nl difficulty = <difficulty>
			get_song_prefix song = <song_checksum>
			if (<mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
				switch ($current_leaderboard_instrument)
					case 'guitar'
					part = guitar
					case 'backup'
					part = bass
					case 'drums'
					part = drum
					case 'mic'
					part = vocals
					case 'band'
					case 'altband'
					part = Band
				endswitch
			endif
			setupdlcsongtag prefix = <song_prefix> savegame = 0
			if (<mode> = leaderboard || <mode> = sing_a_long)
				difficulty = beginner
				get_difficulty_text_nl difficulty = <difficulty>
				GetArraySize ($difficulty_list) param = diff_list_size
				diff_idx = (<diff_list_size> - 1)
				begin
				diff = ($difficulty_list [<diff_idx>])
				get_difficulty_text_nl difficulty = <diff>
				get_formatted_songname {
					song_prefix = <song_prefix>
					difficulty_text_nl = <difficulty_text_nl>
					part = ($instrument_list.<part>.text_nl)
				}
				GetGlobalTags <songname> param = setlist_beststars
				GetGlobalTags <songname> param = setlist_bestpercentage
				if (<setlist_beststars> > 0)
					difficulty = <diff>
					break
				endif
				diff_idx = (<diff_idx> - 1)
				repeat <diff_list_size>
			else
				get_formatted_songname {
					song_prefix = <song_prefix>
					difficulty_text_nl = <difficulty_text_nl>
					part = ($instrument_list.<part>.text_nl)
				}
				GetGlobalTags <songname> param = setlist_beststars
				GetGlobalTags <songname> param = setlist_bestpercentage
			endif
			songlist_update_more_info {
				part = <part>
				song_checksum = <song_checksum>
				mode = <mode>
			}
			formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
			songlist_detail :se_setprops {
				songlist_detail_difficulty_icon_texture = <difficulty_icon>
				songlist_detail_difficulty_icon_alpha = 1
				songlist_detail_intensity_cont_alpha = 1.0
				songlist_detail_jam_instruments_cont_alpha = 0.0
				intensity_text = qs(0x1e6a3a72)
			}
		else
			songlist_clear_more_info
			if (<ui_struct>.playback_track1 = -1)
				<guitar_alpha> = 0.2
			else
				<guitar_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track2 = -1)
				<bass_alpha> = 0.2
			else
				<bass_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track_drums = 0)
				<drum_alpha> = 0.2
			else
				<drum_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track_vocals = 0)
				<vocal_alpha> = 0.2
			else
				<vocal_alpha> = 1.0
			endif
			songlist_detail :se_setprops {
				songlist_detail_jam_guitar_square_alpha = <guitar_alpha>
				songlist_detail_jam_bass_square_alpha = <bass_alpha>
				songlist_detail_jam_drum_square_alpha = <drum_alpha>
				songlist_detail_jam_vocal_square_alpha = <vocal_alpha>
				songlist_detail_intensity_cont_alpha = 0.0
				songlist_detail_jam_instruments_cont_alpha = 1.0
				intensity_text = qs(0xb7ce658c)
			}
		endif
		<line0> = (<ui_struct>.song_album_title)
		<line1> = <genre_year_text>
		<line2> = <duration_text>
		<text_dims> = (360.0, 40.0)
		songlist_detail :se_setprops {
			songlist_detail_album_text_dims = <text_dims>
			songlist_detail_genre_text_dims = <text_dims>
			songlist_detail_duration_text_dims = <text_dims>
			songlist_detail_artist_text_text = (<ui_struct>.song_artist)
			songlist_detail_song_text_text = (<ui_struct>.song_title)
			songlist_detail_genre_text_text = <line1>
			songlist_detail_album_text_text = <line0>
			songlist_detail_duration_text_text = <line2>
			songlist_detail_source_text_text = (<ui_struct>.song_source_txt)
		}
	else
		songlist_music_store_item_focus {
			id = <id>
			ui_struct = <ui_struct>
		}
	endif
	<do_intensity> = 1
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		<do_intensity> = 0
	endif
	if (<mode> = music_store)
		if NOT (<ui_struct>.Type = song)
			<do_intensity> = 0
		endif
	endif
	songlist_detail :GetTags
	if (<do_intensity> = 1)
		songlist_detail :Obj_KillSpawnedScript \{Name = songlist_update_instrument_difficulty_rating}
		songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'guitar'
			diff_rate = (<ui_struct>.song_guitar_difficulty_rating)
			prev_diff_rate = <prev_guitar_diff_rate>
		}
		songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'bass'
			diff_rate = (<ui_struct>.song_bass_difficulty_rating)
			prev_diff_rate = <prev_bass_diff_rate>
		}
		songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'drums'
			diff_rate = (<ui_struct>.song_drums_difficulty_rating)
			prev_diff_rate = <prev_drums_diff_rate>
		}
		songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'vocals'
			diff_rate = (<ui_struct>.song_vocals_difficulty_rating)
			prev_diff_rate = <prev_vocals_diff_rate>
		}
	endif
	if NOT (<mode> = music_store)
		if song_is_jamsession song = (<ui_struct>.song_checksum)
			<setlist_beststars> = 0
		endif
		<gold_stars> = 0
		if GotParam \{setlist_bestpercentage}
			if (<setlist_bestpercentage> = 100)
				<gold_stars> = 1
			endif
		endif
		songlist_detail :Obj_KillSpawnedScript \{Name = songlist_update_stars}
		songlist_detail :Obj_SpawnScriptNow songlist_update_stars params = {
			stars = <setlist_beststars>
			prev_stars = <prev_stars>
			gold_stars = <gold_stars>
		}
		if NOT is_song_in_jammode_songlist song = <song_checksum>
			menu_music_off
			SongList :GetSingleTag \{mode}
			if NOT (<mode> = music_store)
				songlist_update_song_preview song = <song_checksum>
			endif
		else
			SpawnScriptNow \{menu_music_on}
			songlist_update_song_preview \{song = None}
		endif
		if (<ui_struct>.song_double_kick = 1)
			songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 1.0}
		else
			songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 0.0}
		endif
	else
		if (((<ui_struct>.patched) = 0) && ((<ui_struct>.purchased) = 1) && (((<ui_struct>.song_on_wii) = 1) || ((<ui_struct>.song_on_sd) = 1)))
			songlist_detail :se_setprops \{music_store_patch_popup_alpha = 1.0}
		else
			songlist_detail :se_setprops \{music_store_patch_popup_alpha = 0.0}
		endif
		if StructureContains structure = <ui_struct> song_double_kick
			if (<ui_struct>.song_double_kick = 1)
				songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 1.0}
			else
				songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 0.0}
			endif
		else
			songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 0.0}
		endif
	endif
	if (<mode> != playlist)
		songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x03ac90f0)}
	endif
	if ((<mode> != playlist) && (<mode> != music_store) && (<mode> != import))
		songlist_detail :se_setprops \{songlist_detail_mini_info_alpha = 0.0}
		if StructureContains structure = $gh_songlist_props (<ui_struct>.song_checksum)
			if StructureContains structure = ($gh_songlist_props.(<ui_struct>.song_checksum)) Name
				formatText checksumName = challenge_global 'c_%s' s = (($gh_songlist_props.(<ui_struct>.song_checksum)).Name)
				if GlobalExists Name = <challenge_global>
					if StructureContains structure = ($<challenge_global>) descrip
						songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x9adda19b)}
						songlist_detail :se_setprops songlist_detail_mini_info_text = (($<challenge_global>).descrip)
						songlist_detail :se_setprops \{songlist_detail_mini_info_alpha = 1.0}
					endif
				endif
			endif
		endif
	else
		songlist_detail :se_setprops \{songlist_detail_mini_info_alpha = 0.0
			time = 0.1}
		songlist_detail :se_waitprops
		songlist_detail :se_setprops \{songlist_detail_mini_info_text = qs(0x03ac90f0)}
		if NOT ininternetmode
			songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x0f9cf815)}
		endif
	endif
endscript

script songlist_music_store_item_focus \{hub_item_cycle = 0
		morph_time = 0.0}
	RequireParams \{[
			ui_struct
		]
		all}
	SongList :GetSingleTag \{mode}
	song_checksum = (<ui_struct>.song_checksum)
	get_genre_text genre = (<ui_struct>.song_genre) song = <song_checksum>
	formatText TextName = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
	<total_seconds> = 0
	if StructureContains structure = <ui_struct> song_duration
		<total_seconds> = (<ui_struct>.song_duration)
	endif
	if (<total_seconds> > 0)
		Seconds = 0
		minutes = 0
		Mod a = <total_seconds> b = 60
		<Seconds> = <Mod>
		<total_seconds> = (<total_seconds> - <Seconds>)
		if (<total_seconds> > 0)
			Mod a = <total_seconds> b = (60 * 60)
			<minutes> = (<Mod> / 60)
		endif
	else
		<Seconds> = 0
		<minutes> = 0
	endif
	formatText TextName = duration_text qs(0x81ca0519) m = <minutes> s = <Seconds>
	SongList :GetSingleTag \{music_store_mode}
	<line0> = (<ui_struct>.album)
	<line1> = <genre_year_text>
	<line2> = <duration_text>
	if (<music_store_mode> = download_list)
		<line0> = (<ui_struct>.song_title)
		if user_control_helper_exists \{button = blue}
			user_control_destroy_helper \{button = blue}
		endif
	elseif (<music_store_mode> = special_offers)
		if (<ui_struct>.Type = import)
			<line0> = qs(0x00000000)
			<line1> = qs(0x00000000)
			<line2> = qs(0x62c91ccb)
			<id> :se_setprops {
				event_handlers = [
					{pad_btn_left songlist_music_store_view_pack_songs params = {play_sfx = 1 ui_struct = <ui_struct> Type = import previous = special_offers}}
				]
				replace_handlers
			}
			if NOT user_control_helper_exists \{button = blue}
				add_user_control_helper \{text = qs(0xa62cd1de)
					button = blue
					z = 100000}
			endif
		elseif (<ui_struct>.Type = patch)
			<line0> = qs(0x00000000)
			<line1> = qs(0x00000000)
			<line2> = qs(0xbd654b83)
			if user_control_helper_exists \{button = blue}
				user_control_destroy_helper \{button = blue}
			endif
		else
			if NOT GotParam \{line0}
				<line0> = qs(0x03ac90f0)
			endif
			if user_control_helper_exists \{button = blue}
				user_control_destroy_helper \{button = blue}
			endif
			if user_control_helper_exists \{button = green}
				user_control_destroy_helper \{button = green}
			endif
		endif
	elseif (<ui_struct>.Type = song)
		if (<hub_item_cycle> = 1)
			<line0> = (<ui_struct>.song_title)
			<line1> = (<ui_struct>.song_artist)
			formatText TextName = album_year_text qs(0xfaf915aa) a = (<ui_struct>.album) y = (<ui_struct>.song_year)
			<line2> = <album_year_text>
		else
			if NOT GotParam \{line0}
				<line0> = qs(0x03ac90f0)
			endif
			<id> :se_setprops {
				event_handlers = [
					{pad_btn_left songlist_music_store_preview_song params = {song_preview_asset_name = (<ui_struct>.song_preview_asset_name)}}
				]
				replace_handlers
			}
			user_control_helper_change_text \{button = blue
				text = qs(0x43b287ab)}
		endif
	elseif (<ui_struct>.Type = pack)
		<array> = (<ui_struct>.contents_strings)
		GetArraySize <array>
		<iters> = <array_Size>
		<more_than_3> = 0
		if (<array_Size> > 3)
			<iters> = 2
			<more_than_3> = (<array_Size> - 2)
		endif
		<i> = 0
		begin
		formatText checksumName = line 'line%i' i = <i>
		AddParam Name = <line> value = (<array> [<i>])
		<i> = (<i> + 1)
		repeat <iters>
		if (<more_than_3> > 1)
			formatText TextName = more_songs qs(0x560b5eda) n = <more_than_3>
			AddParam Name = line2 value = <more_songs>
		endif
		<empty_iters> = (3 - <array_Size>)
		if (<empty_iters> > 0)
			<i> = <iters>
			begin
			formatText checksumName = line 'line%i' i = <i>
			AddParam Name = <line> value = qs(0x03ac90f0)
			<i> = (<i> + 1)
			repeat <empty_iters>
		endif
		if (<hub_item_cycle> = 0)
			<id> :se_setprops {
				event_handlers = [
					{pad_btn_left songlist_music_store_view_pack_songs params = {play_sfx = 1 ui_struct = <ui_struct> Type = SongList previous = pack}}
				]
				replace_handlers
			}
			user_control_helper_change_text \{button = blue
				text = qs(0xa62cd1de)}
		endif
	else
		<line0> = (<ui_struct>.song_title)
		<line1> = (<ui_struct>.song_artist)
		<line2> = qs(0x73ab05d2)
		if (<hub_item_cycle> = 0)
			<id> :se_setprops {
				event_handlers = [
					{pad_btn_left songlist_music_store_view_pack_songs params = {play_sfx = 1 ui_struct = <ui_struct> Type = SongList previous = album}}
				]
				replace_handlers
			}
			user_control_helper_change_text \{button = blue
				text = qs(0xa62cd1de)}
		endif
	endif
	<text_dims> = (330.0, 40.0)
	<desc> = songlist_detail
	if (<hub_item_cycle> = 1)
		<desc> = music_store_hub
		<text_dims> = (530.0, 40.0)
		music_store_hub :se_setprops songlist_detail_cont_alpha = 0.0 time = <morph_time>
		Wait <morph_time> Seconds
	endif
	<desc> :se_setprops {
		songlist_detail_album_text_dims = <text_dims>
		songlist_detail_genre_text_dims = <text_dims>
		songlist_detail_duration_text_dims = <text_dims>
		songlist_detail_artist_text_text = (<ui_struct>.song_artist)
		songlist_detail_song_text_text = (<ui_struct>.song_title)
		songlist_detail_genre_text_text = <line1>
		songlist_detail_album_text_text = <line0>
		songlist_detail_duration_text_text = <line2>
		songlist_detail_source_text_text = (<ui_struct>.song_source_txt)
	}
	songlist_music_store_check_scroll_text {
		desc = <desc>
		item_type = (<ui_struct>.Type)
		hub_item_cycle = <hub_item_cycle>
		text_dims = <text_dims>
		line0 = <line0>
		line1 = <line1>
		line2 = <line2>
	}
	if StructureContains structure = <ui_struct> song_preview_asset_name
		music_store_change_album_cover {
			texture_name = (<ui_struct>.song_preview_asset_name)
			desc = <desc>
		}
	else
		music_store_change_album_cover {
			texture_name = 'logo_GH5_256'
			local_texture = 1
			desc = <desc>
		}
	endif
	if (<hub_item_cycle> = 1)
		music_store_hub :se_setprops songlist_detail_cont_alpha = 1.0 time = <morph_time>
	endif
endscript

script songlist_music_store_check_scroll_text \{desc = songlist_detail}
	RequireParams \{[
			item_type
			hub_item_cycle
			text_dims
			line0
			line1
			line2
		]
		all}
	<desc> :se_getprops
	<max_x> = (<text_dims>.(1.0, 0.0))
	<i> = 0
	begin
	if (<i> = 0)
		<param> = 'album'
	elseif (<i> = 1)
		<param> = 'genre'
	else
		<param> = 'duration'
	endif
	formatText checksumName = songlist_detail_text_dims 'songlist_detail_%c_text_dims' c = <param>
	formatText checksumName = songlist_detail_text_text 'songlist_detail_%c_text_text' c = <param>
	formatText checksumName = songlist_detail_cont 'songlist_detail_%c_cont' c = <param>
	if ((<hub_item_cycle> = 1) || (<item_type> != song))
		formatText checksumName = songlist_detail_text 'songlist_detail_%c_text' c = <param>
	else
		formatText checksumName = songlist_detail_text 'songlist_detail_songs_%c_text' c = <param>
	endif
	formatText checksumName = line_text 'line%i' i = <i>
	if (((<...>.<songlist_detail_text_dims>).(1.0, 0.0)) > <max_x>)
		AddParam structure_name = my_blank_text Name = <songlist_detail_text_text> value = qs(0x03ac90f0)
		<desc> :se_setprops {
			<my_blank_text>
		}
		if ScreenElementExists id = <songlist_detail_cont>
			<songlist_detail_text> :Obj_KillSpawnedScript Name = scroll_ticker_text
			DestroyScreenElement id = <songlist_detail_cont>
		endif
		CreateScreenElement {
			Type = ContainerElement
			id = <songlist_detail_cont>
			parent = <songlist_detail_text>
		}
		<songlist_detail_cont> :Obj_SpawnScriptLater scroll_ticker_text params = {
			ticker_text = (<...>.<line_text>)
			ticker_space = qs(0x8b73fd0e)
			ticker_pos = (0.0, 0.0)
			ticker_just = [left top]
			ticker_parent = <songlist_detail_cont>
			ticker_font = fontgrid_text_a1
			ticker_x_scale = 0.5
			ticker_y_scale = 0.5
			ticker_rgba1 = [113 121 133 255]
			ticker_rgba2 = [113 121 133 255]
			ticker_alpha = 1.0
			ticker_z_priority = 53
			time = 16
			use_shadow = 1
		}
	else
		if ScreenElementExists id = <songlist_detail_cont>
			<songlist_detail_text> :Obj_KillSpawnedScript Name = scroll_ticker_text
			DestroyScreenElement id = <songlist_detail_cont>
		endif
	endif
	<i> = (<i> + 1)
	repeat 3
endscript

script songlist_clear_more_info 
	GetScreenElementChildren \{id = songlist_detail_more_info_rows}
	<rows> = <children>
	RemoveParameter \{children}
	<i> = 0
	begin
	GetScreenElementChildren id = (<rows> [<i>])
	<stats> = <children>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [1])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [2])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [3])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	RemoveParameter \{children}
	<i> = (<i> + 1)
	repeat 5
endscript

script songlist_update_more_info 
	RequireParams \{[
			part
			song_checksum
		]
		all}
	GetScreenElementChildren \{id = songlist_detail_more_info_rows}
	<rows> = <children>
	RemoveParameter \{children}
	get_song_prefix song = <song_checksum>
	lockglobaltags \{OFF}
	setupdlcsongtag prefix = <song_prefix> savegame = 0
	lockglobaltags
	setupdlcsongtag prefix = <song_prefix> savegame = 0
	SongList :GetSingleTag \{mode}
	<i> = 0
	begin
	if (<mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
		switch ($current_leaderboard_instrument)
			case 'guitar'
			part = guitar
			case 'backup'
			part = bass
			case 'drums'
			part = drum
			case 'mic'
			part = vocals
			case 'band'
			case 'altband'
			part = Band
		endswitch
	endif
	get_difficulty_text_nl index = (4 - <i>)
	get_song_prefix song = <song_checksum>
	get_formatted_songname {
		song_prefix = <song_prefix>
		difficulty_text_nl = <difficulty_text_nl>
		part = ($instrument_list.<part>.text_nl)
	}
	GetGlobalTags <songname> param = setlist_beststars
	GetGlobalTags <songname> param = setlist_bestscore
	GetGlobalTags <songname> param = setlist_bestpercentage
	GetScreenElementChildren id = (<rows> [<i>])
	<stats> = <children>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [1])
	<id> = (<children> [0])
	if (<setlist_beststars> = 0)
		formatText \{TextName = stars_text
			qs(0x03ac90f0)}
	else
		formatText TextName = stars_text qs(0x73307931) s = <setlist_beststars>
	endif
	<id> :se_setprops text = <stars_text>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [2])
	<id> = (<children> [0])
	if (<setlist_bestscore> = 0)
		formatText \{TextName = score_text
			qs(0x03ac90f0)}
	else
		formatText TextName = score_text qs(0x73307931) s = <setlist_bestscore> usecommas
	endif
	<id> :se_setprops text = <score_text>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [3])
	<id> = (<children> [0])
	if (<setlist_bestpercentage> = 0)
		formatText \{TextName = notes_text
			qs(0x03ac90f0)}
	else
		formatText TextName = notes_text qs(0x6cd5ba93) s = <setlist_bestpercentage>
	endif
	<id> :se_setprops text = <notes_text>
	RemoveParameter \{children}
	<i> = (<i> + 1)
	repeat 5
endscript

script songlist_item_unfocus \{time = 0.0}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	SongList :GetSingleTag \{mode}
	if (<mode> = import)
		<id> :se_setprops {
			songlist_item_text_rgba = ($g_music_store_item_unfocus_rgba)
			songlist_item_sub_text_rgba = ($g_music_store_sub_item_unfocus_rgba)
			music_store_song_price_rgba = [0 0 0 0]
			music_store_money_icon_rgba = [0 0 0 0]
			music_store_money_text_rgba = [0 0 0 0]
			time = <time>
		}
		return
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	if NOT (<mode> = music_store || <mode> = archive)
		if issongselectable song = (<ui_struct>.song_checksum)
			<item_unfocus_rgba> = ($g_songlist_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_sub_item_unfocus_rgba)
		else
			<item_unfocus_rgba> = ($g_songlist_invalid_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_invalid_sub_item_unfocus_rgba)
		endif
	else
		if (<mode> = music_store)
			music_store_kill_preview_music
		endif
		<item_unfocus_rgba> = ($g_music_store_item_unfocus_rgba)
		<sub_item_unfocus_rgba> = ($g_music_store_sub_item_unfocus_rgba)
	endif
	<id> :se_setprops {
		songlist_item_text_rgba = <item_unfocus_rgba>
		songlist_item_sub_text_rgba = <sub_item_unfocus_rgba>
		time = <time>
	}
	if (<mode> = music_store)
		if (<ui_struct>.purchased = 1)
			<money_icon_rgba> = (($g_menu_colors).pure_white)
		else
			<money_icon_rgba> = <sub_item_unfocus_rgba>
		endif
		<id> :se_setprops {
			music_store_song_price_rgba = <sub_item_unfocus_rgba>
			music_store_money_icon_rgba = <money_icon_rgba>
			music_store_money_text_rgba = <money_icon_rgba>
		}
	endif
endscript

script songlist_item_create_playlist_focus fade_time = ($g_songlist_detail_fade_time)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	SongList :SetTags \{non_song_item_focused = true}
	<id> :se_setprops {
		songlist_create_playlist_text_rgba = ($g_songlist_item_focus_rgba)
	}
	songlist_detail :se_setprops alpha = 0.0 time = <fade_time>
	user_control_helper_change_text \{button = green
		text = qs(0x188ec849)}
	SpawnScriptNow \{menu_music_on}
	songlist_update_song_preview \{song = None}
endscript

script songlist_item_create_playlist_unfocus 
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	SongList :SetTags \{non_song_item_focused = FALSE}
	<id> :se_setprops {
		songlist_create_playlist_text_rgba = ($g_songlist_item_unfocus_rgba)
	}
	user_control_helper_change_text \{button = green
		text = qs(0x56fbf662)}
endscript

script songlist_clear_playlist 
	songlist_clear
	gman_songfunc \{func = clear_play_list}
endscript

script songlist_clear 
	Change \{current_playlist = [
		]}
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	Change \{g_current_loaded_custom_playlist_index = -1}
endscript

script songlist_remove_first_song_in_playlist 
	if is_a_playlist_loaded
		RemoveArrayElement array = ($current_playlist) index = 0
		Change current_playlist = <array>
		if ScreenElementExists \{id = songlist_detail_playlist}
			songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
		endif
	endif
endscript

script songlist_display_non_patched_dialog \{heading_text = qs(0xaa163738)
		error_text = qs(0xf88da43c)}
	Change \{g_songlist_warning_active = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	SongList :GetSingleTag \{exclusive_device}
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <error_text>
		template = large_body
		player_device = <exclusive_device>
		options = [
			{
				func = songlist_destroy_dialog_box
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script songlist_item_add_to_playlist 
	if ScriptIsRunning \{songlist_item_focus}
		return
	endif
	current_menu :se_setprops \{block_events}
	if NOT issongselectable song = (<ui_struct>.song_checksum) check_sd_card
		current_menu :se_setprops \{unblock_events}
		SoundEvent \{event = ui_sfx_negative_select}
		if GotParam \{song_not_patched}
			songlist_display_non_patched_dialog
		endif
		if GotParam \{sd_invalid}
			songlist_display_non_patched_dialog heading_text = ($wii_error_header) error_text = <error_text>
		endif
		return
	endif
	if ($is_network_game = 1)
		net_songlist_add_song song = (<ui_struct>.song_checksum)
		current_menu :se_setprops \{unblock_events}
		return
	endif
	GetArraySize ($current_playlist)
	if (<array_Size> >= $g_max_playlist_size)
		current_menu :se_setprops \{unblock_events}
		return
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		if (<array_Size> >= $g_songlist_force_num_songs_to_choose)
			current_menu :se_setprops \{unblock_events}
			return
		endif
	endif
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	AddArrayElement array = ($current_playlist) element = <song_checksum>
	Change current_playlist = <array>
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	printf \{channel = playlist
		qs(0xbe2ec1c9)}
	debug_songlist_print_playlist
	SongList :GetSingleTag \{mode}
	if (<mode> = sing_a_long)
		0x94393a3d song = <song_checksum>
		return
	endif
	if (<mode> = play_song || <mode> = leaderboard || <mode> = practice || <mode> = toprockers)
		songlist_continue device_num = <device_num>
		current_menu :se_setprops \{unblock_events}
		return
	endif
	SoundEvent \{event = quickplay_select_song}
	<id> :se_setprops {
		event_handlers = [
			{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
		]
		replace_handlers
	}
	songlist_is_song_in_playlist song = <song_checksum>
	formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
	<id> :se_setprops {
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
		sd_card_scale = (0.6, 0.6)
		sd_card_pos = (29.0, 0.0)
	}
	<id> :SetTags playlist_index = <playlist_index>
	gamemode_gettype
	if NOT ininternetmode
		user_control_helper_change_text \{button = green
			text = qs(0x34ff4910)}
	elseif (<Type> = career)
		if ($g_net_leader_player_num != -1)
			if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
				user_control_helper_change_text \{button = green
					text = qs(0x34ff4910)}
			endif
		endif
	endif
	GetArraySize \{$current_playlist}
	formatText TextName = pos_text qs(0xc31d83ea) i = (<array_Size>)
	if (<array_Size> > ($g_songlist_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autosizedims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :SetTags playlist_index = <playlist_index>
	CreateScreenElement {
		Type = descinterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_mini_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autosizedims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :SetTags playlist_index = <playlist_index>
	songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
		}}
	if ($g_songlist_force_num_songs_to_choose > 0)
		GetArraySize ($current_playlist)
		formatText TextName = songs_added qs(0xc31d83ea) i = <array_Size>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
		GetArraySize ($current_playlist)
		if (<array_Size> = $g_songlist_force_num_songs_to_choose)
			songlist_allow_continue
		endif
	else
		songlist_allow_continue
	endif
	current_menu :se_setprops \{unblock_events}
endscript

script songlist_allow_continue 
	if ($g_songlist_warning_active = 1)
		return
	endif
	SongList :GetSingleTag \{mode}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				songlist_continue
			}
		]
		replace_handlers}
	current_menu :SetTags \{allow_continue = 1}
	if NOT user_control_helper_exists \{button = start}
		add_user_control_helper \{text = qs(0x182f0173)
			button = start
			z = 100000}
	endif
endscript

script songlist_disallow_continue 
	SongList :GetSingleTag \{mode}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				nullscript
			}
			{
				pad_option
				nullscript
			}
		]
		replace_handlers}
	current_menu :SetTags \{allow_continue = 0}
	user_control_destroy_helper \{button = start}
endscript

script songlist_item_remove_from_playlist 
	if ScriptIsRunning \{songlist_item_focus}
		return
	endif
	if ScriptIsRunning \{songlist_continue}
		return
	endif
	if ($is_network_game = 1)
		gamemode_gettype
		if (<Type> = career)
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					net_songlist_remove_song song = (<ui_struct>.song_checksum)
				endif
			endif
		endif
		return
	endif
	songlist_item_remove_from_playlist_guts <...>
endscript

script songlist_item_remove_from_playlist_guts 
	SoundEvent \{event = quickplay_remove_song}
	if NOT GotParam \{id}
		Obj_GetID
		<my_id> = <objID>
	else
		<my_id> = <id>
	endif
	if ScreenElementExists id = <my_id>
		<my_id> :se_setprops {
			songlist_item_text_rgba = ($g_songlist_item_focus_rgba)
			in_playlist_pos_alpha = 0.0
			sd_card_scale = (0.8, 0.8)
			sd_card_pos = (29.0, -10.0)
			event_handlers = [
				{pad_choose songlist_item_add_to_playlist params = {ui_struct = <ui_struct>}}
			]
			replace_handlers
		}
		user_control_helper_change_text \{button = green
			text = qs(0x562b9e24)}
		<my_id> :GetSingleTag playlist_index
	endif
	songlist_get_song_playlist_detail_index playlist_index = <playlist_index> vmenu_id = songlist_detail_playlist_vmenu
	if GotParam \{playlist_detail_index}
		GetScreenElementChildren \{id = songlist_detail_playlist_vmenu}
		GetArraySize \{$current_playlist}
		if (<array_Size> > ($g_songlist_playlist_detail_items))
			formatText TextName = pos_text qs(0xc31d83ea) i = (<array_Size> - ($g_songlist_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_Size> - ($g_songlist_playlist_detail_items)) - 1)])
			CreateScreenElement {
				Type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_playlist_vmenu :menu_setitemindex index = ($g_songlist_playlist_detail_items) newindex = 0
			<id> :SetTags playlist_index = ((<array_Size> - ($g_songlist_playlist_detail_items)) - 1)
			<ui_struct> = <passed_in_ui_struct>
			RemoveParameter \{passed_in_ui_struct}
		endif
		DestroyScreenElement id = (<children> [<playlist_detail_index>])
	endif
	RemoveParameter \{playlist_detail_index}
	songlist_get_song_playlist_detail_index playlist_index = <playlist_index> vmenu_id = songlist_detail_mini_playlist_vmenu
	if GotParam \{playlist_detail_index}
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		GetArraySize \{$current_playlist}
		if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
			formatText TextName = pos_text qs(0xc31d83ea) i = (<array_Size> - ($g_songlist_mini_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_Size> - ($g_songlist_mini_playlist_detail_items)) - 1)])
			CreateScreenElement {
				Type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_mini_playlist_vmenu :menu_setitemindex index = ($g_songlist_mini_playlist_detail_items) newindex = 0
			<id> :SetTags playlist_index = ((<array_Size> - ($g_songlist_mini_playlist_detail_items)) - 1)
			<ui_struct> = <passed_in_ui_struct>
			RemoveParameter \{passed_in_ui_struct}
		endif
		DestroyScreenElement id = (<children> [<playlist_detail_index>])
	endif
	<my_id> :RemoveTags playlist_index
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_mini_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = current_menu
	songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
		}}
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	RemoveArrayElement array = ($current_playlist) element = <song_checksum>
	Change current_playlist = <array>
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	printf \{channel = playlist
		qs(0x6cdde419)}
	debug_songlist_print_playlist
	if NOT isscreenelementinfocus id = <my_id>
		<my_id> :Obj_SpawnScriptNow songlist_item_unfocus params = {ui_struct = <ui_struct>}
	endif
	GetArraySize ($current_playlist)
	if NOT (<array_Size> > 0)
		songlist_disallow_continue
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		GetArraySize ($current_playlist)
		formatText TextName = songs_added qs(0xc31d83ea) i = <array_Size>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
		if NOT (<array_Size> = $g_songlist_force_num_songs_to_choose)
			songlist_disallow_continue
		else
			songlist_allow_continue
		endif
	endif
endscript

script songlist_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_roadie_battle_mode
		Change \{roadie_battle_ds_disconnect_wait_hack = 1}
	endif
	ui_event_wait_for_safe
	songlist_update_song_preview \{song = None}
	current_menu :se_setprops \{block_events}
	generic_menu_pad_choose_sound
	if ininternetmode
		host_start_songlist_countdown
		return
	endif
	gman_songfunc \{func = clear_play_list}
	gman_songfunc func = add_song_array_to_play_list params = {
		song_array = ($current_playlist)
	}
	SongList :GetSingleTag \{mode}
	if (<mode> = leaderboard)
		song = ($current_playlist [0])
		songlist_clear
		menu_transition_stoprender
		ui_event event = menu_change state = uistate_leaderboard data = {song = <song> device_num = <device_num>}
		return
	elseif (<mode> = practice)
		songlist_clear
		practice_setup_part_and_continue device_num = <device_num>
		return
	elseif (<mode> = toprockers)
		song = ($current_playlist [0])
		songlist_clear
		menu_transition_stoprender
		ui_event event = menu_change state = uistate_top_rockers data = {for_options = 1 toprockerssong = <song>}
		return
	endif
	gamemode_gettype
	switch (<Type>)
		case career
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		gig_struct = ($<current_challenge>)
		venue = (<gig_struct>.venue)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_loading_screen is_bink bink = ($LevelZones.<venue>.loading_movie)
		else
			create_loading_screen \{is_bink}
		endif
		case quickplay
		Change current_level = ($g_band_lobby_current_level)
		fill_auto_save_playlist
		create_loading_screen
		case freeplay
		create_loading_screen
		Change \{pausegh3_called = 0}
		ui_event \{event = menu_back}
		case competitive
		if ($game_mode = fest_mode || $game_mode = fest_mode_team)
			display_competitive_rules_voting \{next_state = uistate_play_song
				voting_callback = songlist_voting_callback_continue}
			return
		else
			gman_startgamemodegoal
		endif
		Change current_level = ($g_band_lobby_current_level)
		venue = ($g_band_lobby_current_level)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_loading_screen is_bink bink = ($LevelZones.<venue>.loading_movie)
		else
			create_loading_screen
		endif
		case practice
		practice_setup_part_and_continue device_num = <device_num>
		return
	endswitch
	if is_roadie_battle_mode
		create_loading_screen
	endif
	ui_event \{event = menu_change
		state = uistate_play_song}
endscript

script songlist_voting_callback_continue 
	RequireParams \{[
			Result
		]
		all}
	printf \{qs(0x7d7081f8)}
	Change competitive_rules = <Result>
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
endscript

script songlist_destroy 
	if ScreenElementExists \{id = SongList}
		SongList :GetTags
		songlist_set_mode_sort_index mode = <mode>
		if (<cs_registered> = true)
			contentmanfunc func = unregister_content_source Name = <list_name>
		endif
		DestroyScreenElement \{id = SongList}
	endif
	if ScriptIsRunning \{songlist_request_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_page_when_ready}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
endscript

script songlist_scroll_down 
	printf \{'songlist_scroll_down'}
	if ScreenElementExists \{id = SongList}
		SongList :GetTags
		SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
		if (<list_dirty> = true)
			printf \{'DIRTY!'}
			return
		endif
		if contentmanfunc Name = <list_name> func = is_page_dirty
			printf \{'PAGE DIRTY!'}
			return
		endif
		<do_page_down_logic> = 0
		if (<list_page_size> > ($g_songlist_last_visible_index + 1))
			if NOT (<list_bottom> = (<list_page_size> - 1))
				<do_page_down_logic> = 1
			endif
		endif
		if (<do_page_down_logic> = 1)
			if (<mode> = sing_a_long)
				<0x6cb65017> = 0
				begin
				if IsGuitarController controller = <0x6cb65017> use_raw_type
					<button> = Triangle
				else
					<button> = select
				endif
				if ControllerPressed <button> <0x6cb65017>
					if ControllerPressed down <0x6cb65017>
						SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
						0x5e32f57d
						songlist_page_down
						return
					endif
				endif
				<0x6cb65017> = (<0x6cb65017> + 1)
				repeat 4
			else
				if IsGuitarController controller = <exclusive_device> use_raw_type
					<button> = Triangle
				else
					<button> = select
				endif
				if ControllerPressed <button> <exclusive_device>
					SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
					0x5e32f57d
					songlist_page_down
					return
				endif
			endif
		endif
		if (<list_index> <= (<list_page_size> - 1))
			list_index = (<list_index> + 1)
			if (<list_index> > (<list_page_size> - 1))
				0x5e32f57d
				contentmanfunc {
					func = more_data
					Name = <list_name>
					page_down
					callback = songlist_more_data_down_callback
				}
			else
				if (<mode> = play_song)
					songlist_scroll_sfx
				elseif (<mode> = playlist)
					playlist_scroll_sfx
				elseif (<mode> = music_store)
					music_store_scroll_sfx
				elseif (<mode> = archive)
					if archive_came_from_music_store
						music_store_scroll_sfx
					else
						songlist_scroll_sfx
					endif
				else
					songlist_scroll_sfx
				endif
				songlist_update_slider_nub_pos \{Dir = down}
				songlist_update_hilight_bar_pos \{Dir = down}
				if (<list_index> > <list_bottom>)
					if (<list_bottom> < (<list_page_size> - 1))
						if ($g_songlist_create_playlist_menu_item_present = 0)
							list_top = (<list_top> + 1)
							list_bottom = (<list_bottom> + 1)
						endif
						0x5e32f57d
						contentmanfunc {
							func = request_data
							Name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				SongList :SetTags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_down 
	SongList :GetTags
	if (<mode> = play_song)
		songlist_scroll_sfx
	elseif (<mode> = playlist)
		playlist_scroll_sfx
	elseif (<mode> = music_store)
		music_store_scroll_sfx
	else
		songlist_scroll_sfx
	endif
	<page_size> = ($g_songlist_last_visible_index + 1)
	<Jump> = (<page_size> - <hilight_bar_index>)
	<new_list_index> = (<list_index> + <Jump> - $g_songlist_create_playlist_menu_item_present)
	<new_list_top> = (<list_top> + <page_size> - $g_songlist_create_playlist_menu_item_present)
	<new_list_bottom> = (<list_bottom> + <page_size> - $g_songlist_create_playlist_menu_item_present)
	if (<new_list_bottom> >= <list_page_size>)
		<new_list_bottom> = (<list_page_size> - 1)
		<new_list_top> = (<new_list_bottom> - $g_songlist_last_visible_index)
		<new_list_index> = <new_list_top>
		<Jump> = (<new_list_index> - <list_index>)
	endif
	if ($g_songlist_create_playlist_menu_item_present = 1)
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	songlist_clear_menus
	SongList :SetTags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = FALSE
		list_dirty = true
	}
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = songlist_fast_page_data_request_callback
	}
	songlist_update_slider_nub_pos Dir = down count = (<Jump>)
	songlist_reset_hilight_bar_pos
endscript

script songlist_fast_page_data_request_callback 
	songlist_data_request_callback <...> dont_add_non_song_item
endscript

script songlist_scroll_up 
	printf \{'songlist_scroll_up'}
	if ScreenElementExists \{id = SongList}
		SongList :GetTags
		if (<list_dirty> = true)
			printf \{'DIRTY!'}
			return
		endif
		if contentmanfunc Name = <list_name> func = is_page_dirty
			printf \{'PAGE DIRTY!'}
			return
		endif
		<do_page_up_logic> = 0
		if (<list_page_size> > ($g_songlist_last_visible_index + 1))
			if NOT (<list_top> = 0)
				<do_page_up_logic> = 1
			endif
		endif
		if (<do_page_up_logic> = 1)
			if (<mode> = sing_a_long)
				<0x6cb65017> = 0
				begin
				if IsGuitarController controller = <0x6cb65017> use_raw_type
					<button> = Triangle
				else
					<button> = select
				endif
				if ControllerPressed <button> <0x6cb65017>
					if ControllerPressed up <0x6cb65017>
						SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
						0x5e32f57d
						songlist_page_up
						return
					endif
				endif
				<0x6cb65017> = (<0x6cb65017> + 1)
				repeat 4
			else
				if IsGuitarController controller = <exclusive_device> use_raw_type
					<button> = Triangle
				else
					<button> = select
				endif
				if ControllerPressed <button> <exclusive_device>
					SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
					0x5e32f57d
					songlist_page_up
					return
				endif
			endif
		endif
		if (<list_index> >= 0)
			list_index = (<list_index> - 1)
			if (<list_index> < 0)
				0x5e32f57d
				contentmanfunc {
					func = more_data
					Name = <list_name>
					page_up
					callback = songlist_more_data_up_callback
				}
			else
				if (<mode> = play_song)
					songlist_scroll_sfx
				elseif (<mode> = playlist)
					playlist_scroll_sfx
				elseif (<mode> = music_store)
					music_store_scroll_sfx
				elseif (<mode> = archive)
					if archive_came_from_music_store
						music_store_scroll_sfx
					else
						songlist_scroll_sfx
					endif
				else
					songlist_scroll_sfx
				endif
				songlist_update_slider_nub_pos \{Dir = up}
				songlist_update_hilight_bar_pos \{Dir = up}
				if (<list_index> < <list_top>)
					if (<list_top> > 0)
						list_top = (<list_top> - 1)
						list_bottom = (<list_bottom> - 1)
						0x5e32f57d
						contentmanfunc {
							func = request_data
							Name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				SongList :SetTags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_up 
	SongList :GetTags
	if (<mode> = play_song)
		songlist_scroll_sfx
	elseif (<mode> = playlist)
		playlist_scroll_sfx
	elseif (<mode> = music_store)
		music_store_scroll_sfx
	else
		songlist_scroll_sfx
	endif
	<page_size> = ($g_songlist_last_visible_index + 1)
	<Jump> = (<hilight_bar_index> + 1)
	<new_list_index> = (<list_index> - <Jump>)
	<new_list_top> = (<list_top> - <page_size>)
	<new_list_bottom> = (<list_bottom> - <page_size>)
	if (<new_list_top> < (0 - $g_songlist_create_playlist_menu_item_present))
		<new_list_bottom> = ($g_songlist_last_visible_index - $g_songlist_create_playlist_menu_item_present)
		<new_list_top> = 0
		<new_list_index> = ($g_songlist_last_visible_index - $g_songlist_create_playlist_menu_item_present)
		<Jump> = (<list_index> - <new_list_index>)
		if (<mode> = play_song)
			gamemode_gettype
			if NOT (<Type> = career)
				<Jump> = (<Jump> + 1)
			endif
		endif
		<callback> = songlist_data_request_callback
	else
		<callback> = songlist_fast_page_data_request_callback
	endif
	songlist_clear_menus
	SongList :SetTags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = FALSE
		list_dirty = true
	}
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = <callback>
	}
	songlist_update_slider_nub_pos Dir = up count = (<Jump>)
	songlist_reset_hilight_bar_pos
	songlist_update_hilight_bar_pos Dir = down count = ($g_songlist_last_visible_index)
	begin
	SongList :GetSingleTag \{list_dirty}
	if (<list_dirty> = FALSE)
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent Type = focus target = current_menu data = {child_index = ($g_songlist_last_visible_index)}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script songlist_more_data_down_callback 
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	SongList :GetTags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		Change g_songlist_current_page = ($g_songlist_current_page + 1)
		contentmanfunc {
			func = request_page
			Name = <list_name>
			page_down
			Seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_down_callback
		}
		SongList :SetTags \{list_dirty = true}
	else
		0x84307d1f
	endif
endscript

script songlist_more_data_up_callback 
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	SongList :GetTags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		Change g_songlist_current_page = ($g_songlist_current_page - 1)
		contentmanfunc {
			func = request_page
			Name = <list_name>
			page_up
			Seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_up_callback
		}
		SongList :SetTags \{list_dirty = true}
	else
		0x84307d1f
		if (<mode> = play_song)
			gamemode_gettype
			if (<Type> = career)
				return
			endif
			if ($g_songlist_create_playlist_menu_item_present = 0)
				songlist_insert_item_top \{non_song_item = 1}
				songlist_update_slider_nub_pos \{Dir = up}
			endif
		endif
	endif
endscript

script songlist_page_request_up_callback 
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	songlist_page_request <...> Dir = up
	songlist_update_slider_nub_pos \{Dir = up}
endscript

script songlist_page_request_down_callback 
	if NOT ScreenElementExists \{id = SongList}
		0x84307d1f
		return
	endif
	songlist_page_request <...> Dir = down
	songlist_update_slider_nub_pos \{Dir = down}
endscript

script songlist_page_request 
	RequireParams \{[
			Dir
		]
		all}
	SongList :GetTags
	songlist_calculate_slider_nub_res page_size = <content_size>
	formatText TextName = num_songs qs(0xc31d83ea) i = <content_size>
	SongList :se_setprops songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0xd20d2af6)}
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x08cb5377)}
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	if (<Dir> = up)
		seek_index = (<seek_index> - 1)
	else
		seek_index = (<seek_index> + 1)
	endif
	seek_distance = (<list_index> - <list_top>)
	list_top = (<seek_index> - <seek_distance>)
	if (<list_top> < 0)
		list_top = 0
	endif
	list_bottom = (<list_top> + ($g_songlist_last_visible_index))
	if (<list_bottom> < <page_size>)
		SongList :SetTags {
			list_page_size = <page_size>
			list_index = <seek_index>
			list_top = <list_top>
			list_bottom = <list_bottom>
			list_dirty = FALSE
		}
		contentmanfunc {
			func = request_data
			Name = <list_name>
			start_index = <list_top>
			end_index = <list_bottom>
			callback = songlist_data_request_callback
		}
	else
		0x84307d1f
		ScriptAssert \{qs(0x869440a1)}
	endif
endscript

script songlist_calculate_slider_nub_res 
	SongList :GetSingleTag \{mode}
	if (<mode> = play_song)
		gamemode_gettype
		if NOT (<Type> = career)
			<page_size> = (<page_size> + 1)
		endif
	endif
	if (<page_size> > 1)
		SongList :GetSingleTag \{mode}
		if NOT (<mode> = music_store || <mode> = import)
			<slider_nub_res> = (355.0 / (<page_size> - 1))
		else
			<slider_nub_res> = (350.0 / (<page_size> - 1))
		endif
	else
		<slider_nub_res> = 0.0
	endif
	return slider_nub_res = <slider_nub_res>
endscript

script songlist_update_slider_nub_pos \{Dir = down
		count = 1}
	SongList :GetSingleTag \{slider_nub_res}
	songlist_slider_nub_cont :se_getprops \{Pos}
	if (<Dir> = down)
		songlist_slider_nub_cont :se_setprops Pos = (<Pos> + (<slider_nub_res> * (0.0, 1.0) * <count>))
	else
		songlist_slider_nub_cont :se_setprops Pos = (<Pos> - (<slider_nub_res> * (0.0, 1.0) * <count>))
	endif
endscript

script songlist_update_hilight_bar_pos \{Dir = down
		count = 1}
	SongList :GetSingleTag \{hilight_bar_res}
	SongList :GetSingleTag \{hilight_bar_index}
	songlist_hilight_bar_cont :se_getprops \{Pos}
	if (<Dir> = down)
		if (<hilight_bar_index> = $g_songlist_last_visible_index)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> + <count>)
			SongList :SetTags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :se_setprops Pos = (<Pos> + (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	else
		if (<hilight_bar_index> = 0)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> - <count>)
			SongList :SetTags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :se_setprops Pos = (<Pos> - (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	endif
endscript

script songlist_reset_hilight_bar_pos 
	SongList :SetTags \{hilight_bar_index = 0}
	SongList :GetSingleTag \{mode}
	if (<mode> = music_store || <mode> = import)
		songlist_hilight_bar_cont :se_setprops Pos = ($g_songlist_music_store_hilight_pos)
	elseif (<mode> = archive)
		SongList :GetSingleTag \{archive_source}
		songlist_hilight_bar_cont :se_setprops Pos = (($g_songlist_archive_hilight_pos).<archive_source>)
	else
		songlist_hilight_bar_cont :se_setprops \{Pos = (-641.0, -130.0)}
	endif
endscript

script songlist_slide_scroll 
	ScriptAssert \{'songlist_slide_scroll: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script 0x779a1e05 
	menu_transition_stoprender
	generic_event_back \{state = uistate_band_lobby_setup}
endscript

script songlist_back 
	Change \{g_music_store_songlist_real = 0}
	SongList :GetSingleTag \{mode}
	gamemode_gettype
	if (<mode> = archive)
		printf \{qs(0x08b695fe)}
		archive_songlist_back
	elseif (<mode> = music_store)
		printf \{qs(0xf2182bab)}
		SongList :GetSingleTag \{visited_band_hub}
		if GotParam \{visited_band_hub}
			printf \{qs(0x3b344ff8)}
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = download_list)
				marketplacefunc \{func = clear_cart}
				Change \{g_songlist_sd_card_required = 0}
				printf \{'clearing cart from download_list music_store_mode'}
			endif
			if ($g_music_store_previous_menu = album)
				new_filterspec = [
					{
						key = Type
						value = album
						comparator = equal
					}
				]
				songlist_change_filterspec filterspec = <new_filterspec>
				Change \{g_music_store_title = qs(0xe04818ae)}
				SongList :SetTags \{music_store_mode = albums}
				Change \{g_music_store_previous_menu = hub}
				Change \{g_songlist_last_visible_index = 4}
				printf \{qs(0x059df236)}
				songlist_refresh_menus
			elseif ($g_music_store_previous_menu = pack)
				new_filterspec = [
					{
						key = Type
						value = pack
						comparator = equal
					}
				]
				songlist_change_filterspec filterspec = <new_filterspec>
				Change \{g_music_store_title = qs(0x6d06b07b)}
				SongList :SetTags \{music_store_mode = track_packs}
				Change \{g_music_store_previous_menu = hub}
				Change \{g_songlist_last_visible_index = 4}
				printf \{qs(0x01ac4108)}
				songlist_refresh_menus
			elseif ($g_music_store_previous_menu = song)
				new_filterspec = [
					{
						key = Type
						value = song
						comparator = equal
					}
				]
				songlist_change_filterspec filterspec = <new_filterspec>
				Change \{g_music_store_title = qs(0xd7809370)}
				Change \{g_music_store_songlist_real = 1}
				SongList :SetTags \{music_store_mode = songs}
				Change \{g_music_store_previous_menu = hub}
				Change \{g_songlist_last_visible_index = 4}
				printf \{qs(0xb2ad7898)}
				songlist_refresh_menus
			elseif ($g_music_store_previous_menu = special_offers)
				new_filterspec = [
					{
						key = Type
						union_list = [import patch]
						comparator = equal
					}
				]
				songlist_change_filterspec filterspec = <new_filterspec>
				Change \{g_music_store_title = qs(0x381d1a36)}
				SongList :SetTags \{music_store_mode = special_offers}
				Change \{g_music_store_previous_menu = hub}
				Change \{g_songlist_last_visible_index = 4}
				printf \{qs(0x6df20ba3)}
				songlist_refresh_menus
			else
				printf \{qs(0xb4063838)}
				Change \{g_music_store_previous_menu = hub}
				Change \{g_songlist_last_visible_index = 4}
				Change \{g_music_store_current_pack_checksum = NULL}
				SongList :SetTags \{music_store_mode = hub
					music_store_seek_override = true}
				songlist_music_store_disallow_sorting
				songlist_music_store_go_to_hub
			endif
		else
			printf \{'back has been pressed.  Is anything happening?'}
			destroy_dialog_box
			wii_music_store_back
		endif
	elseif (<mode> = import || <mode> = sing_a_long)
		ui_event \{event = menu_back}
	elseif (<mode> = leaderboard || <mode> = toprockers)
		songlist_leaderboard_back
	elseif (<Type> = freeplay)
		if (<mode> = playlist)
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SongList :GetSingleTag \{exclusive_device}
			create_dialog_box {
				heading_text = qs(0xaa163738)
				body_text = qs(0xbdfb6886)
				player_device = <exclusive_device>
				options = [
					{
						func = songlist_destroy_dialog_box
						text = qs(0x363e1350)
					}
					{
						func = songlist_freeplay_revert_playlist
						text = qs(0x9894be22)
					}
				]
			}
		else
			songlist_freeplay_revert_playlist
		endif
	elseif (<Type> = practice)
		menu_transition_stoprender
		Change \{0x15f1ac2f = 1}
		ui_event \{event = menu_back
			data = {
				songlist_change_canceled = true
			}}
	elseif (<Type> = career)
		if InNetGame
			if ($net_song_countdown = 0)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					net_career_songlist_back
				elseif ($primary_controller = <device_num>)
					if ScreenElementExists \{id = current_menu}
						LaunchEvent \{Type = unfocus
							target = current_menu}
						current_menu :se_setprops \{block_events}
					endif
					generic_event_choose \{state = uistate_online_quit_warning
						data = {
							is_popup
						}}
				endif
			endif
		else
			ui_event \{event = menu_back
				data = {
					use_selected_index
				}}
		endif
	elseif playerinfoequals ($g_net_leader_player_num) controller = <device_num>
		if ((($g_lobby_net_state = local) || ($g_lobby_net_state = net_private)) && ($net_song_countdown = 0))
			if ui_event_exists_in_stack \{Name = 'team_select'}
				state = uistate_team_select
			else
				if ininternetmode
					if IsHost
						quit_online_now
						return
					endif
				else
					create_loading_screen
					state = uistate_band_lobby_setup
				endif
			endif
			if ininternetmode
				SendStructure callback = ui_event data_to_send = {event = menu_back data = {state = <state>}}
			endif
			ui_event event = menu_back data = {state = <state>}
		elseif ($g_lobby_net_state = net_public && ($net_song_countdown = 0))
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			generic_event_choose \{state = uistate_online_quit_warning
				data = {
					is_popup
				}}
		endif
	elseif ($primary_controller = <device_num>)
		if InNetGame
			if ($net_song_countdown = 0)
				if ScreenElementExists \{id = current_menu}
					LaunchEvent \{Type = unfocus
						target = current_menu}
					current_menu :se_setprops \{block_events}
				endif
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		else
			ui_event \{event = menu_back
				data = {
					state = uistate_band_lobby_setup
				}}
		endif
	endif
endscript

script songlist_freeplay_revert_playlist 
	destroy_dialog_box
	songlist_update_song_preview \{song = None}
	ui_event \{event = menu_back
		data = {
			songlist_change_canceled = true
		}}
endscript

script songlist_detail_transition fade_time = ($g_songlist_detail_fade_time)
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			desc
		]
		all}
	if (<desc> = songlist_detail)
		songlist_detail :se_getprops
		<do_transition> = 0
		if GotParam \{force_transition}
			<do_transition> = 1
		endif
		if NOT (<alpha> = 1.0)
			<do_transition> = 1
		endif
		if (<do_transition> = 1)
			SongList :GetSingleTag \{mode}
			if NOT (<mode> = music_store)
				songlist_detail_playlist :se_setprops \{alpha = 0.0}
				gamemode_gettype
				if NOT ($g_songlist_show_more_info = 0 || <Type> = competitive)
					songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
						songlist_detail_frame_2_cont_alpha = 1.0}
				else
					songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 1.0
						songlist_detail_frame_2_cont_alpha = 0.0}
				endif
			endif
			songlist_detail :se_setprops alpha = 1.0 time = <fade_time>
			songlist_detail :se_waitprops
		endif
	else
		songlist_detail_playlist :se_getprops
		<do_transition> = 0
		if GotParam \{force_transition}
			<do_transition> = 1
		endif
		if NOT (<alpha> = 1.0)
			<do_transition> = 1
		endif
		if (<do_transition> = 1)
			songlist_detail :se_setprops \{alpha = 0.0}
			songlist_detail_playlist :se_setprops alpha = 1.0 time = <fade_time>
			songlist_detail_playlist :se_waitprops
		endif
	endif
endscript

script songlist_sort_toggle 
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	SongList :GetSingleTag \{mode}
	current_menu :GetSingleTag \{tag_selected_index}
	if NOT GotParam \{tag_selected_index}
		return
	endif
	if (<mode> = music_store)
		SongList :GetSingleTag \{visited_band_hub}
		if NOT GotParam \{visited_band_hub}
			return
		endif
	endif
	sort_songlist_sfx
	if NOT (<mode> = archive)
		current_menu :se_setprops \{block_events}
	else
		SongList :GetSingleTag \{archive_source}
		if NOT archive_songlist_has_data list = <archive_source>
			return
		endif
	endif
	songlist_change_sort_index index = ($g_songlist_sort_index + 1)
	GetArraySize \{$g_songlist_sort_array}
	if ($g_songlist_sort_index = <array_Size>)
		songlist_change_sort_index \{index = 0}
	endif
	if NOT (<mode> = archive)
		songlist_update_song_preview \{song = None}
		songlist_refresh_menus
		current_menu :se_setprops \{unblock_events}
	else
		Change \{g_songlist_archive_setup_complete = 0}
		archive_refresh_menus
	endif
endscript

script songlist_refresh_menus 
	songlist_clear_menus
	SongList :GetSingleTag \{mode}
	if NOT GotParam \{no_pivot}
		SongList :GetSingleTag \{list_index}
		SongList :GetSingleTag \{hilight_bar_index}
		Change g_songlist_current_pivot = <list_index>
		Change g_songlist_pivot_hilight_index = <hilight_bar_index>
	else
		Change \{g_songlist_current_pivot = 0}
		Change \{g_songlist_pivot_hilight_index = 0}
	endif
	SongList :SetTags {
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_page_size = 0
		slider_nub_res = 0
		list_dirty = FALSE
		initial_built = FALSE
	}
	if (<mode> = music_store || <mode> = archive)
		<slider_pos> = (-14.0, 60.0)
	else
		<slider_pos> = (0.0, 16.0)
	endif
	if (<mode> = playlist)
		songlist_detail :se_setprops \{songlist_detail_mini_playlistt_text_alpha = 1.0}
	else
	endif
	songlist_slider_nub_cont :se_setprops Pos = <slider_pos> alpha = 0.0
	songlist_reset_hilight_bar_pos
	songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
	songlist_update_ui
	songlist_pre_build
	if (<mode> = archive)
	endif
	if NOT GotParam \{no_focus}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script songlist_clear_menus 
	SongList :GetSingleTag \{mode}
	DestroyScreenElement \{id = current_menu
		preserve_parent}
	if NOT (<mode> = music_store || <mode> = archive)
		DestroyScreenElement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		DestroyScreenElement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
	endif
	SetScreenElementLock \{id = current_menu
		OFF}
	SetScreenElementLock \{id = current_menu
		On}
	if NOT (<mode> = music_store || <mode> = import || <mode> = archive)
		SetScreenElementLock \{id = songlist_detail_playlist_vmenu
			OFF}
		SetScreenElementLock \{id = songlist_detail_playlist_vmenu
			On}
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			OFF}
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			On}
	endif
endscript

script songlist_leaderboard_back 
	menu_music_on
	menu_transition_stoprender
	generic_event_back
endscript

script songlist_determine_leaderboard_instrument_setup 
	band_contains_guitar = FALSE
	band_is_only_guitar = FALSE
	band_contains_bass = FALSE
	band_is_only_bass = FALSE
	band_contains_vocals = FALSE
	band_is_only_vocals = FALSE
	band_contains_drum = FALSE
	band_is_only_drum = FALSE
	switch ($current_leaderboard_instrument)
		case 'guitar'
		band_contains_guitar = true
		band_is_only_guitar = true
		case 'backup'
		band_contains_bass = true
		band_is_only_bass = true
		case 'drums'
		band_contains_drum = true
		band_is_only_drum = true
		case 'mic'
		band_contains_vocals = true
		band_is_only_vocals = true
		case 'band'
		case 'altband'
		band_contains_guitar = true
		band_contains_bass = true
		band_contains_drum = true
		band_contains_vocals = true
		band_is_only_guitar = FALSE
		band_is_only_bass = FALSE
		band_is_only_drum = FALSE
		band_is_only_vocals = FALSE
	endswitch
	return band_instrument_setup = {
		guitar = {
			contains = <band_contains_guitar>
			Only = <band_is_only_guitar>
		}
		bass = {
			contains = <band_contains_bass>
			Only = <band_is_only_bass>
		}
		drum = {
			contains = <band_contains_drum>
			Only = <band_is_only_drum>
		}
		vocals = {
			contains = <band_contains_vocals>
			Only = <band_is_only_vocals>
		}
	}
endscript

script songlist_determine_band_instrument_setup 
	band_contains_guitar = FALSE
	band_is_only_guitar = true
	band_contains_bass = FALSE
	band_is_only_bass = true
	band_contains_vocals = FALSE
	band_is_only_vocals = true
	band_contains_drum = FALSE
	band_is_only_drum = true
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		switch <part>
			case guitar
			band_contains_guitar = true
			band_is_only_bass = FALSE
			band_is_only_vocals = FALSE
			band_is_only_drum = FALSE
			case bass
			band_contains_bass = true
			band_is_only_guitar = FALSE
			band_is_only_vocals = FALSE
			band_is_only_drum = FALSE
			case vocals
			band_contains_vocals = true
			band_is_only_guitar = FALSE
			band_is_only_bass = FALSE
			band_is_only_drum = FALSE
			case drum
			band_contains_drum = true
			band_is_only_guitar = FALSE
			band_is_only_bass = FALSE
			band_is_only_vocals = FALSE
		endswitch
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	SongList :GetSingleTag \{mode}
	if (<mode> = sing_a_long)
		band_contains_vocals = true
		band_is_only_vocals = true
		band_is_only_guitar = FALSE
		band_is_only_bass = FALSE
		band_is_only_drum = FALSE
	endif
	return band_instrument_setup = {
		guitar = {
			contains = <band_contains_guitar>
			Only = <band_is_only_guitar>
		}
		bass = {
			contains = <band_contains_bass>
			Only = <band_is_only_bass>
		}
		drum = {
			contains = <band_contains_drum>
			Only = <band_is_only_drum>
		}
		vocals = {
			contains = <band_contains_vocals>
			Only = <band_is_only_vocals>
		}
	}
endscript

script 0x94393a3d 
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	if ininternetmode
		return
	endif
	songlist_clear_playlist
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> = 0)
		if isXenon
			body_text = qs(0x78cea484)
		else
			body_text = qs(0xa1fabafe)
		endif
		options = [
			{
				func = generic_event_back
				text = qs(0x0e41fe46)
			}
		]
		generic_event_choose state = uistate_generic_dialog_box data = {back_button_script = generic_event_back template = cancel_confirm heading_text = qs(0xaa163738) body_text = <body_text> options = <options>}
		return
	endif
	RequireParams \{[
			song
		]
		all}
	ui_sing_a_long_start song = <song>
endscript

script debug_songlist_print_playlist 
	printstruct channel = playlist ($current_playlist)
	printf \{channel = playlist
		qs(0xcb943ab3)}
endscript

script debug_songlist_print_tags 
	SongList :GetTags
	printstruct <...>
	printf \{qs(0xcb943ab3)}
endscript

script musicstore_format_price_text 
	if isxenonorwindx
		formatText TextName = price_text qs(0x581d2af2) p = <price>
	elseif isngc
		if (<price> = 0)
			formatText \{TextName = price_text
				qs(0xc63bbff1)}
		else
			formatText TextName = price_text qs(0x8d608bf7) p = <price> t = ($wii_dlc_wii_points)
		endif
	else
		formatdecimals integer = <price> fractional = <price_fraction> num_decimals = <currency_decimals>
	endif
	return price_text = <price_text>
endscript

script music_store_scroll_sfx 
	SoundEvent \{event = ghmix2_scroll_sound_01}
endscript

script music_store_select_sfx 
	SoundEvent \{event = ghmix2_select_sound}
endscript

script music_store_back_sfx 
	SoundEvent \{event = ghmix2_back_sound}
endscript

script music_store_determine_currency 
	if isps3
		if marketplacefunc \{func = get_currency_info}
			return true currency = <currency_code> currency_decimals = <currency_decimals>
		else
			ScriptAssert \{'Currency info fetch failed'}
		endif
	elseif isngc
		return \{true
			currency = qs(0xf3442f5b)}
	endif
	return \{FALSE}
endscript

script wii_sdcard_event_songlist \{refresh_archive = FALSE}
	printf \{qs(0x70971cbd)}
	if NOT ScreenElementExists id = <songlist_id>
		printf \{'getting kicked out early'}
		return
	endif
	<songlist_id> :GetSingleTag mode
	<songlist_id> :GetSingleTag list_name
	printstruct <...>
	ui_event_get_top
	if (<mode> = music_store)
		<songlist_id> :GetSingleTag music_store_mode
		if (<music_store_mode> = download_list)
			printf \{'SD Card State changed while checkout process, kicking the user to the special offers screen'}
			contentmanfunc func = refresh Name = <list_name> no_enum
			sdcardmanagerfunc \{func = force_hold_ejects}
			if (<base_name> = 'music_store_purchase')
				<func> = dlc_error_music_store_sdcard_purchase_error
			else
				<func> = dlc_error_music_store_sdcard_songlist_error
			endif
			music_store_handle_error error_crc = sd_card_state_change func = <func> params = {allow_ejects = 1}
			return
		endif
	endif
	if (<base_name> = 'Rock_Archive')
		if ($g_archive_sd_eject_is_bad = 1)
			archive_destroy_popup \{no_refocus}
			archive_create_eject_popup
		else
			archive_refresh_menus
		endif
	elseif (<mode> = music_store || <mode> = import)
		if ($g_songlist_sd_card_required = 1)
			if sdcardmanagerfunc \{func = get_card_error}
				printf \{'card removed onoes!'}
				contentmanfunc func = refresh Name = <list_name> no_enum
				if (<base_name> = 'music_store_purchase')
					music_store_handle_error <...> func = dlc_error_music_store_sdcard_purchase_error
				else
					music_store_handle_error <...> func = dlc_error_music_store_sdcard_songlist_error
				endif
			else
				printf \{'card inserted oyay!  But this should never happen!'}
			endif
		else
			if sdcardmanagerfunc \{func = get_card_error}
				printf \{'card removed onoes, but who cares?'}
				SongList :GetSingleTag \{list_name}
				contentmanfunc func = refresh Name = <list_name> no_enum
				if NOT ((<base_name> = 'music_store_purchase') || (<base_name> = 'music_store_hub') || (<base_name> = 'import_post_legal'))
					LaunchEvent \{Type = unfocus
						target = current_menu}
					songlist_refresh_menus \{no_focus = 1}
				endif
			else
				printf \{'card inserted oyay, but who cares?'}
				SongList :GetSingleTag \{list_name}
				contentmanfunc func = refresh Name = <list_name> no_enum
				if NOT ((<base_name> = 'music_store_purchase') || (<base_name> = 'music_store_hub') || (<base_name> = 'import_post_legal'))
					LaunchEvent \{Type = unfocus
						target = current_menu}
					songlist_refresh_menus \{no_focus = 1}
				endif
			endif
		endif
	else
		songlist_destroy_dialog_box
		songlist_update_song_preview
		if ObjectExists \{id = current_menu}
			<unfocused> = 1
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		if contentmanfunc func = refresh Name = <list_name>
			songlist_refresh_menus \{no_focus = 1}
		elseif GotParam \{unfocused}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
		SongList :Obj_SpawnScriptNow \{songlist_check_playlist_after_sd_settles}
	endif
endscript

script songlist_check_playlist_after_sd_settles 
	begin
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	Wait \{3
		gameframes}
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	repeat
	songlist_remove_unavailable_songs_from_playlist
endscript

script 0x7c713ff7 
endscript

script 0x0542334f \{parent = root_window
		id = ui_star_particles
		Pos = (0.0, 0.0)
		z = 1
		start_scale = (0.2, 0.2)
		end_scale = (0.7, 0.7)
		emit_spread = 5.0
		velocity = 0.5
		0x971c66e7 = 2.0
		0x3af134dc = 2.5
		start_dims = (20.0, 20.0)
		start_color = [
			230
			160
			255
			190
		]
		end_color = [
			90
			15
			80
			50
		]}
endscript

script 0x5e32f57d 
	printf \{'songlist_push_card_lock PUSH LOCK!'}
	sdcardmanagerfunc \{func = push_lock_card}
endscript

script 0x84307d1f 
	printf \{'songlist_push_card_lock POP LOCK!'}
	sdcardmanagerfunc \{func = pop_lock_card}
endscript
