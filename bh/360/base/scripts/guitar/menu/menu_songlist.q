
script songlist_create \{pad_back_script = songlist_back
		locked = false
		exclusive_device = -1}
	RequireParams \{[
			list_name
			mode
		]
		all}
	Change g_songlist_sort_index = ($g_songlist_sort_indexes.<mode>)
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	if (<mode> = music_store || <mode> = import)
		<desc> = 'music_store'
	else
		<desc> = 'songlist'
	endif
	CreateScreenElement {
		type = DescInterface
		desc = <desc>
		id = songlist
		parent = root_window
	}
	if (<mode> = music_store)
		if IsPS3
			GetDisplaySettings
			if (<height> >= 720)
				songlist :SE_SetProps \{music_store_Playstation_Logo_texture = Playstation_Logo_HD720
					music_store_Playstation_Logo_scale = 1.0
					music_store_Playstation_Logo_dims = (180.0, 40.0)}
			else
				songlist :SE_SetProps \{music_store_Playstation_Logo_texture = Playstation_Logo_SD
					music_store_Playstation_Logo_scale = 1.5
					music_store_Playstation_Logo_dims = (136.0, 32.0)}
			endif
		endif
	endif
	if (<mode> = music_store || <mode> = import)
		songlist :SE_SetProps \{songlist_subheader_cont_alpha = 0.0}
	else
		<id> :Obj_SpawnScript songlist_do_physics_spawned
	endif
	if (<mode> = import)
		GetTerritory
		if (<territory> != TERRITORY_US)
			songlist :SE_SetProps \{esrb_notice_alpha = 0.0}
		endif
	endif
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	spawnscriptnow \{BG_Crowd_Front_End_Silence}
	if ScreenElementExists \{id = songlist}
		if songlist :Desc_ResolveAlias \{name = alias_bkg_anim}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :Obj_SpawnScript ui_alphablast
			endif
		else
		endif
	endif
	if ScreenElementExists \{id = songlist}
		if songlist :Desc_ResolveAlias \{name = alias_headline_magic}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.3 Color = [61 218 250 200]}
			endif
		else
		endif
	endif
	if songlist :Desc_ResolveAlias \{name = alias_songlist_vmenu}
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
		<resolved_id> :SE_SetProps exclusive_device = <exclusive_device>
		songlist :SetTags savegame_device = <controller> exclusive_device = <exclusive_device>
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> songlist_options params = {show_more_info show_GHTunes}
		if (<mode> = sing_a_long)
			show_GHTunes = 0
		endif
		Change g_songlist_show_more_info = <show_more_info>
		Change g_songlist_show_GHTunes = <show_GHTunes>
		if NOT (<mode> = music_store)
			if allow_show_ghtunes_toggle
				if (<show_GHTunes> = 0)
					filterspec = [
						{
							key = song_source
							union_list = [Jam]
							comparator = not_equal
						}
					]
					songlist_change_filterspec filterspec = <filterspec>
				endif
			endif
		endif
	else
		ScriptAssert \{qs(0xd78eb9f9)}
	endif
	if NOT (<mode> = music_store || <mode> = import)
		if songlist :Desc_ResolveAlias \{name = alias_songlist_detail_cont}
			AssignAlias id = <resolved_id> alias = songlist_detail_cont
		else
			ScriptAssert \{qs(0xf7d498a7)}
		endif
		if songlist :Desc_ResolveAlias \{name = alias_songlist_slider_nub_cont}
			AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			ScriptAssert \{qs(0x9a95e5a9)}
		endif
	else
		if songlist :Desc_ResolveAlias \{name = alias_music_store_detail_cont}
			AssignAlias id = <resolved_id> alias = songlist_detail_cont
		else
			ScriptAssert \{qs(0x646b49e3)}
		endif
		if songlist :Desc_ResolveAlias \{name = alias_music_store_slider_nub_cont}
			AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			ScriptAssert \{qs(0x47ccdd2f)}
		endif
		if (<mode> = import)
			if songlist :Desc_ResolveAlias \{name = alias_music_store_ticker_window}
				<resolved_id> :SE_SetProps alpha = 0.0
			endif
		endif
	endif
	if songlist :Desc_ResolveAlias \{name = alias_songlist_hilight_bar_cont}
		AssignAlias id = <resolved_id> alias = songlist_hilight_bar_cont
		<resolved_id> :Obj_SpawnScript create_ui_highlight_particles params = {Pos = (320.0, 0.0) z = 26 parent = <hilightbar_id>}
	else
		ScriptAssert \{qs(0xe42c78fa)}
	endif
	if NOT (<mode> = music_store || <mode> = import)
		if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
			player_num = 1
		else
			get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
		endif
		if isSinglePlayerGame
			GetPlayerInfo <player_num> part
			GetPlayerInfo <player_num> difficulty
		else
			<part> = Band
			get_highest_difficulty
			<difficulty> = <highest_difficulty>
		endif
		get_difficulty_text_nl difficulty = <difficulty>
		FormatText checksumname = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
		FormatText checksumname = instrument_out 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
		FormatText checksumname = instrument_fill 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
		out_icon_alpha = 1
		band_icon_alpha = 0
		DIFFICULTY_alpha = 1
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
				FormatText checksumname = instrument_out 'icon_%i_out' i = <instrument_text_nl>
				FormatText checksumname = instrument_fill 'icon_%i_fill' i = <instrument_text_nl>
			endif
			if (<mode> = leaderboard || <mode> = sing_a_long)
				DIFFICULTY_alpha = 0
			endif
		endif
	endif
	if (<mode> = music_store || <mode> = import)
		CreateScreenElement \{type = DescInterface
			desc = 'songlist_detail_music_store'
			id = Songlist_detail
			parent = songlist_detail_cont
			alpha = 0.0}
		Songlist_detail :SE_SetProps {
			patch_req_message_text = ($g_music_store_patch_req_message)
		}
		songlist_music_store_assign_text_aliases
	else
		if NOT isSinglePlayerGame
			out_icon_alpha = 0
			band_icon_alpha = 1
		endif
		CreateScreenElement {
			type = DescInterface
			desc = 'songlist_detail'
			id = Songlist_detail
			parent = songlist_detail_cont
			alpha = 0.0
			songlist_detail_difficulty_icon_texture = <difficulty_icon>
			songlist_detail_difficulty_icon_alpha = <DIFFICULTY_alpha>
			songlist_detail_instrument_icon_out_texture = <instrument_out>
			songlist_detail_instrument_icon_fill_texture = <instrument_fill>
			songlist_detail_instrument_icon_out_alpha = <out_icon_alpha>
			songlist_detail_instrument_icon_fill_alpha = <out_icon_alpha>
			songlist_detail_instrument_icon_band_alpha = <band_icon_alpha>
		}
		if (<mode> = playlist)
			<id> :SE_SetProps alpha = 1.0
			<id> :SE_SetProps songlist_detail_mini_playlistt_text_alpha = 1.0
		endif
		if ($g_songlist_show_more_info = 1)
			Songlist_detail :SE_SetProps \{songlist_detail_frame_1_cont_alpha = 0.0
				songlist_detail_frame_2_cont_alpha = 1.0}
		endif
		if ScreenElementExists \{id = Songlist_detail}
			if Songlist_detail :Desc_ResolveAlias \{name = alias_glitter_head_1}
				if ScreenElementExists id = <resolved_id>
					<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.5 Color = [171 14 152 200]}
				endif
			else
				ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
			endif
		endif
		if ScreenElementExists \{id = Songlist_detail}
			if Songlist_detail :Desc_ResolveAlias \{name = alias_glitter_head_2}
				if ScreenElementExists id = <resolved_id>
					<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.5 Color = [171 14 152 200]}
				endif
			else
				ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
			endif
		endif
		if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_stars_full_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_stars_full_vmenu
		else
			ScriptAssert \{qs(0x8030f42e)}
		endif
		if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_stars_empty_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_stars_empty_vmenu
		else
			ScriptAssert \{qs(0xc21dd60f)}
		endif
		if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_diff_inst_cont}
			AssignAlias id = <resolved_id> alias = songlist_detail_diff_inst_cont
		else
			ScriptAssert \{qs(0xa4036096)}
		endif
		if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_mini_playlist_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_mini_playlist_vmenu
		else
			ScriptAssert \{qs(0xbd105ffe)}
		endif
		if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_more_info_rows}
			AssignAlias id = <resolved_id> alias = songlist_detail_more_info_rows
		else
			ScriptAssert \{qs(0x17e03108)}
		endif
		CreateScreenElement \{type = DescInterface
			desc = 'songlist_detail_playlist'
			id = songlist_detail_playlist
			parent = songlist_detail_cont
			alpha = 0.0}
		if songlist_detail_playlist :Desc_ResolveAlias \{name = alias_songlist_detail_playlist_vmenu}
			AssignAlias id = <resolved_id> alias = songlist_detail_playlist_vmenu
		else
			ScriptAssert \{qs(0x09d998d8)}
		endif
		if ScreenElementExists \{id = songlist_detail_playlist}
			songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
		endif
	endif
	Songlist_detail :SetTags \{prev_guitar_diff_rate = 0
		prev_bass_diff_rate = 0
		prev_drums_diff_rate = 0
		prev_vocals_diff_rate = 0
		prev_stars = 0}
	if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_difficulty_guitar_vmenu}
		AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_guitar_vmenu
	else
		ScriptAssert \{qs(0xd483e01c)}
	endif
	if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_difficulty_bass_vmenu}
		AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_bass_vmenu
	else
		ScriptAssert \{qs(0xab2daa8c)}
	endif
	if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_difficulty_drums_vmenu}
		AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_drums_vmenu
	else
		ScriptAssert \{qs(0x3bfbfa01)}
	endif
	if Songlist_detail :Desc_ResolveAlias \{name = alias_songlist_detail_difficulty_vocals_vmenu}
		AssignAlias id = <resolved_id> alias = songlist_detail_difficulty_vocals_vmenu
	else
		ScriptAssert \{qs(0xb86d4f96)}
	endif
	<event_handlers> = [
		{pad_back generic_menu_pad_back_sound params = {mode = <mode>}}
		{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
	]
	if (<mode> = music_store || <mode> = import)
		<content_source> = marketplace
		<slider_pos> = (-14.0, 60.0)
		hilight_bar_res = 74
		songlist :SetTags \{music_store_mode = hub
			music_store_seek_override = true}
	else
		<sort_option> = {pad_L1 songlist_sort_toggle}
		AddArrayElement array = <event_handlers> element = <sort_option>
		<event_handlers> = <array>
		<content_source> = local_song_list
		<slider_pos> = (0.0, 16.0)
		hilight_bar_res = 71
	endif
	current_menu :SE_SetProps {
		event_handlers = <event_handlers>
		replace_handlers
	}
	current_menu :SE_SetProps \{block_events}
	GetTerritory
	songlist :SetTags {
		mode = <mode>
		list_name = <list_name>
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_page_size = 0
		slider_nub_res = 0
		hilight_bar_res = <hilight_bar_res>
		hilight_bar_index = 0
		cs_registered = false
		list_dirty = false
		initial_built = false
		non_song_item_focused = false
		locked = <locked>
		content_source = <content_source>
		territory = <territory>
		controller = <controller>
	}
	GameMode_GetType
	if NOT (<mode> = music_store || <mode> = import || <type> = freeplay)
		if (<mode> = leaderboard || <mode> = toprockers)
			songlist_determine_leaderboard_instrument_setup
		else
			songlist_determine_band_instrument_setup
		endif
		songlist :SetTags band_instrument_setup = <band_instrument_setup>
	endif
	songlist_update_ui
	songlist_slider_nub_cont :SE_SetProps Pos = <slider_pos>
	if InInternetMode
		songlist :SE_SetProps \{songlist_net_cont_alpha = 1.0}
		net_songlist_leader_text
	endif
	if (<mode> = playlist)
		songlist_remove_unavailable_songs_from_playlist
	endif
endscript

script songlist_music_store_assign_text_aliases \{desc = Songlist_detail}
	if ScreenElementExists id = <desc>
		if <desc> :Desc_ResolveAlias name = alias_songlist_detail_album_text
			AssignAlias id = <resolved_id> alias = songlist_detail_album_text
		else
			ScriptAssert qs(0x9d4d64f5) d = <desc>
		endif
		if <desc> :Desc_ResolveAlias name = alias_songlist_detail_genre_text
			AssignAlias id = <resolved_id> alias = songlist_detail_genre_text
		else
			ScriptAssert qs(0xae6b0c76) d = <desc>
		endif
		if <desc> :Desc_ResolveAlias name = alias_songlist_detail_duration_text
			AssignAlias id = <resolved_id> alias = songlist_detail_duration_text
		else
			ScriptAssert qs(0x89329df5) d = <desc>
		endif
		if (<desc> = Songlist_detail)
			if <desc> :Desc_ResolveAlias name = alias_songlist_detail_songs_album_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_album_text
			else
				ScriptAssert qs(0xe320c1cf) d = <desc>
			endif
			if <desc> :Desc_ResolveAlias name = alias_songlist_detail_songs_genre_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_genre_text
			else
				ScriptAssert qs(0x9f269a27) d = <desc>
			endif
			if <desc> :Desc_ResolveAlias name = alias_songlist_detail_songs_duration_text
				AssignAlias id = <resolved_id> alias = songlist_detail_songs_duration_text
			else
				ScriptAssert qs(0x5c719b50) d = <desc>
			endif
		endif
	endif
endscript

script songlist_remove_unavailable_songs_from_playlist 
	songlist_manage_playlist_check_relevance
	if (<list_relevant> = false)
		Change current_playlist = <override_array>
		Change \{g_songlist_warning_active = 1}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{type = unfocus
				target = current_menu}
			current_menu :SE_SetProps \{block_events}
		endif
		GetNumPlayersInGame
		if (<num_players> > 1)
			FormatText \{TextName = body_text
				qs(0x44218325)}
		else
			FormatText \{TextName = body_text
				qs(0xfbc789d4)}
		endif
		songlist :GetSingleTag \{exclusive_device}
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
	destroy_dialog_box
	clean_up_user_control_helpers
	songlist :GetSingleTag \{mode}
	songlist_create_default_user_control_helpers mode = <mode>
	Change \{g_songlist_warning_active = 0}
	if NOT is_current_playlist_empty
		if NOT InInternetMode
			songlist_allow_continue
		endif
	endif
	if ScreenElementExists \{id = current_menu}
		songlist :GetSingleTag \{hilight_bar_index}
		current_menu :SE_SetProps \{unblock_events}
		LaunchEvent \{type = unfocus
			target = current_menu}
		LaunchEvent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
endscript

script songlist_calculate_playlist_duration 
	GetArraySize \{$current_playlist}
	if (<array_size> > 0)
		<i> = 0
		<total_seconds> = 0
		begin
		<song_not_found> = false
		get_ui_song_struct_items song = (($current_playlist) [<i>])
		if (<song_not_found> = false)
			<total_seconds> = (<total_seconds> + (<ui_struct>.song_duration))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		<time_array> = []
		AddArrayElement array = <time_array> element = <total_seconds>
		rr_get_time_string data = <array>
		songlist_detail_playlist :SE_SetProps {
			songlist_detail_playlist_duration_text = <data_text>
		}
	else
		songlist_detail_playlist :SE_SetProps \{songlist_detail_playlist_duration_text = qs(0x369c70d7)}
	endif
endscript

script songlist_update_ui 
	songlist :GetSingleTag \{mode}
	if (<mode> = music_store)
		<Title> = ($g_music_store_title)
	elseif (<mode> = import)
		offering = ($downloaded_offerings [($downloaded_offerings_index)])
		<Title> = (<offering>.display_name)
		IMPORT_ESRB_label_alpha = 0.0
		if NOT ((<offering>.rating) = None)
			IMPORT_ESRB_label_alpha = 1.0
		endif
		songlist :SE_SetProps {
			music_store_title_alpha = 0.0
			music_store_slider_cont_alpha = 1.0
			songlist_title_text_alpha = 1.0
			IMPORT_ESRB_label_alpha = <IMPORT_ESRB_label_alpha>
		}
	else
		<Title> = ($g_songlist_modes.<mode>.Title)
	endif
	songlist :SE_SetProps {
		songlist_title_text_text = <Title>
		songlist_sort_property_dims = (10.0, 32.0)
		songlist_sort_property_text = (($g_songlist_sort_array [($g_songlist_sort_index)]).text)
	}
	<event_handlers> = [
		{pad_up songlist_scroll_up}
		{pad_down songlist_scroll_down}
	]
	if NOT (<mode> = music_store || <mode> = import)
		if NOT InInternetMode
			GameMode_GetType
			if NOT ((<type> = career) || (<mode> = leaderboard) || (<mode> = toprockers) || (<mode> = practice) || (<mode> = sing_a_long))
				<mp_option> = {pad_btn_left SongList_manage_playlist}
				AddArrayElement array = <event_handlers> element = <mp_option>
				<event_handlers> = <array>
			else
				<mp_option> = {pad_btn_left songlist_toggle_more_info}
				AddArrayElement array = <event_handlers> element = <mp_option>
				<event_handlers> = <array>
			endif
		endif
	endif
	current_menu :SE_SetProps {
		event_handlers = <event_handlers>
		replace_handlers
	}
	if (<mode> = music_store)
		songlist :GetSingleTag \{visited_band_hub}
		if GotParam \{visited_band_hub}
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :SE_SetProps \{music_store_slider_cont_alpha = 1.0
				songlist_title_text_alpha = 1.0}
			if IsPS3
				songlist :SE_SetProps \{music_store_Playstation_Logo_alpha = 1.0}
			endif
		endif
	else
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers mode = <mode>
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
	Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = Songlist_detail
			force_transition
			fade_time = 0
		}}
endscript

script songlist_create_playlist 
	current_menu :SE_SetProps \{block_events}
	songlist :Obj_SpawnScriptNow songlist_create_playlist_spawned params = {<...>}
endscript

script songlist_create_playlist_spawned 
	songlist_playlist_switch_sfx
	songlist :SetTags \{mode = playlist
		non_song_item_focused = false}
	if NOT GotParam \{no_detail_transition}
		songlist_detail_transition \{desc = Songlist_detail}
	endif
	Menu_Music_Off
	Change \{g_songlist_create_playlist_menu_item_present = 0}
	if NOT GotParam \{no_refresh}
		if GotParam \{no_focus}
			songlist_refresh_menus \{no_focus = 1}
		else
			songlist_refresh_menus
		endif
	endif
	current_menu :SE_SetProps \{unblock_events}
endscript

script songlist_create_play_song 
	printf \{qs(0xa7101acc)}
	songlist_playlist_switch_sfx
	songlist :SetTags \{mode = play_song}
	if NOT GotParam \{no_detail_transition}
		songlist_detail_transition \{desc = Songlist_detail}
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

script SongList_manage_playlist 
	LaunchEvent \{type = unfocus
		target = current_menu}
	current_menu :SE_SetProps \{block_events}
	if ScriptIsRunning \{songlist_continue}
		return
	endif
	wait \{1
		gameframe}
	songlist_update_song_preview \{song = None}
	songlist :GetSingleTag \{exclusive_device}
	songlist :GetSingleTag \{savegame_device}
	if GotParam \{exclusive_device}
		generic_event_choose state = UIstate_songlist_manage_playlist data = {is_popup exclusive_device = <exclusive_device> savegame_device = <savegame_device>}
	else
		ScriptAssert \{qs(0x098ea72c)}
	endif
endscript

script songlist_music_store_go_to_hub 
	current_menu :SE_SetProps \{alpha = 0.0}
	songlist :GetSingleTag \{territory}
	if (<territory> != TERRITORY_US)
		<esrb_notice_alpha> = 0.0
	else
		<esrb_notice_alpha> = 1.0
	endif
	songlist :SE_SetProps {
		music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0
		songlist_title_text_alpha = 0.0
		music_store_Playstation_Logo_alpha = 0.0
		PA_ESRB_label_alpha = 0.0
		esrb_notice_alpha = <esrb_notice_alpha>
	}
	songlist :GetSingleTag \{exclusive_device}
	generic_event_choose no_sound state = UIstate_music_store_hub data = {is_popup exclusive_device = <exclusive_device>}
endscript

script songlist_music_store_go_to_terms 
	RequireParams \{[
			purchase_struct
		]
		all}
	current_menu :SE_SetProps \{alpha = 0.0}
	songlist :SE_SetProps \{music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0}
	songlist :GetSingleTag \{exclusive_device}
	songlist_slider_nub_cont :SE_GetProps \{Pos}
	ui_event_wait event = menu_change data = {
		no_sound
		state = UIstate_music_store_terms
		is_popup
		exclusive_device = <exclusive_device>
		purchase_struct = <purchase_struct>
		slider_pos = <Pos>
	}
endscript

script songlist_do_physics_spawned 
	create_2D_spring_system \{desc_id = songlist
		num_springs = 2
		stiffness = 50
		rest_length = 1}
endscript

script songlist_pre_build 
	songlist :GetTags
	if (<cs_registered> = false)
		if (<mode> = import)
			if NOT import_create_details_content_source list_name = <list_name>
				return
			endif
			ContentManFunc \{func = debug_print}
		else
			ContentManFunc func = register_content_source name = <list_name> type = <content_source>
		endif
		songlist :SetTags \{cs_registered = true}
	endif
	songlist :SetTags \{list_dirty = true}
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	songlist :Obj_SpawnScriptNow songlist_request_page_when_ready params = {cs_registered = <cs_registered> list_name = <list_name> sortspec = <sortspec>}
endscript

script songlist_request_page_when_ready 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	begin
	if ContentManFunc func = is_ready name = <list_name>
		songlist :GetSingleTag \{mode}
		if (<mode> = music_store || <mode> = import)
			destroy_dialog_box
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :GetSingleTag \{music_store_mode}
			if GotParam \{music_store_mode}
				if ($g_music_store_current_pack_checksum = null)
					if (<music_store_mode> = songs)
						songlist_music_store_allow_sorting
					endif
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
		ContentManFunc {
			func = request_page
			name = <list_name>
			current_page
			seek = <seek_index>
			callback = songlist_build_request_data_callback
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
		}
		return
	endif
	wait \{0.1
		seconds}
	repeat 200
	songlist :GetSingleTag \{mode}
	if (<mode> = music_store || <mode> = import)
		destroy_dialog_box
	endif
	if (<mode> != music_store)
		ScriptAssert \{qs(0x161ded6e)}
	endif
	create_dialog_box \{no_background
		heading_text = qs(0xaa163738)
		body_text = qs(0xa47088ec)
		options = [
			{
				func = songlist_marketplace_timed_out_go_back
				text = qs(0x0e41fe46)
			}
		]}
endscript

script songlist_marketplace_timed_out_go_back 
	destroy_dialog_box
	Change \{g_marketplace_responding_to_error = 0}
	ui_event \{event = menu_back
		data = {
			state = uistate_mainmenu
		}}
endscript

script songlist_build_request_data_callback 
	if NOT ScreenElementExists \{id = songlist}
		return
	endif
	songlist :GetTags
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
			songlist :SetTags \{music_store_seek_override = false}
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
			Change \{g_songlist_pivot_hilight_index = 0}
		endif
		songlist :GetSingleTag \{mode}
		if (<mode> = play_song)
			GameMode_GetType
			if NOT (<type> = career)
				<slider_count> = (<slider_count> + 1)
			endif
		endif
		<callback> = songlist_pivot_data_request_callback
	else
		Change \{g_songlist_pivot_hilight_index = 0}
		<callback> = songlist_data_request_callback
	endif
	songlist :SetTags {
		list_page_size = <page_size>
		slider_nub_res = <slider_nub_res>
		list_index = <passed_in_seek_index>
		list_dirty = false
	}
	songlist_update_slider_nub_pos Dir = down count = <slider_count>
	if ($g_songlist_pivot_hilight_index = 0)
		<count> = 0
	else
		<count> = ($g_songlist_pivot_hilight_index)
	endif
	songlist_update_hilight_bar_pos Dir = down count = <count>
	if ((<mode> = music_store) || (<mode> = import))
		songlist_hilight_bar_cont :SE_SetProps \{alpha = 0.5}
	else
		songlist_hilight_bar_cont :SE_SetProps \{alpha = 1.0}
	endif
	songlist_slider_nub_cont :SE_SetProps \{alpha = 1.0}
	Change \{g_songlist_current_pivot = 0}
	Change \{g_songlist_pivot_hilight_index = 0}
	if (<page_size> <= ($g_songlist_last_visible_index + 1))
		user_control_destroy_helper \{button = yellow}
	endif
	FormatText TextName = num_songs qs(0xc31d83ea) i = <content_size>
	songlist :SE_SetProps songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0xd20d2af6)}
		else
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x08cb5377)}
		else
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	<start_index> = <seek_index>
	if (<page_size> = 0)
		Songlist_detail :SE_SetProps \{alpha = 0.0}
		songlist_disallow_continue
		if ($g_songlist_warning_active = 0)
			current_menu :SE_SetProps \{unblock_events}
			LaunchEvent \{type = unfocus
				target = current_menu}
			LaunchEvent \{type = focus
				target = current_menu}
		endif
		return
	elseif (<page_size> <= ($g_songlist_last_visible_index))
		<end_index> = ((<page_size> - 1) + <seek_index>)
		Change g_songlist_last_visible_index = (<page_size> - 1)
	else
		<end_index> = (($g_songlist_last_visible_index) + <seek_index>)
		if (<end_index> >= <page_size>)
			<end_index> = (<page_size> - 1)
			<start_index> = (<end_index> - ($g_songlist_last_visible_index))
		endif
	endif
	songlist :SetTags {
		list_top = <start_index>
		list_bottom = <end_index>
	}
	ContentManFunc {
		func = request_data
		name = <list_name>
		start_index = <start_index>
		end_index = <end_index>
		callback = <callback>
	}
endscript

script songlist_pivot_data_request_callback 
	songlist_data_request_callback <...> dont_add_non_song_item
endscript

script songlist_data_request_callback \{add_non_song_item = 1}
	if NOT ScreenElementExists \{id = songlist}
		return
	endif
	songlist :GetTags
	if (<mode> = music_store)
		PreviewAssetCache \{func = cancel_all_requests}
		music_store_preload_album_covers list = <Range>
		music_store_preload_preview_music list = <Range>
	endif
	if (<initial_built> = false)
		if (<mode> = play_song)
			GameMode_GetType
			if (<type> = career)
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
				Menu_Music_Off
				Change \{g_songlist_create_playlist_menu_item_present = 0}
			endif
		else
			if (Importing_Songlist = 1)
				Menu_Music_Off
				Change \{Importing_Songlist = 0}
			endif
		endif
		songlist_build <...>
		songlist :SetTags \{initial_built = true}
	else
		if ($g_songlist_create_playlist_menu_item_present = 1)
			<list_index> = (<list_index> - 1)
			songlist :SetTags list_index = <list_index>
			Change \{g_songlist_create_playlist_menu_item_present = 0}
		endif
		if (<list_index> = <list_top>)
			songlist_insert_item_top <...>
		elseif (<list_index> = <list_bottom>)
			songlist_insert_item_bottom <...>
		endif
	endif
	if songlist :GetSingleTag \{need_unavailable_dialog}
		if (<need_unavailable_dialog> = 1)
			songlist :SetTags \{need_unavailable_dialog = 0}
			generic_event_choose \{state = UIState_songlist_popup
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
		type = DescInterface
		desc = 'songlist_create_playlist_item'
		parent = current_menu
		autoSizeDims = true
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
	songlist :GetTags
	GetScreenElementChildren \{id = current_menu}
	if GotParam \{children}
		GetArraySize <children>
		if (<array_size> > ($g_songlist_last_visible_index))
			DestroyScreenElement id = (<children> [($g_songlist_last_visible_index)])
		endif
	endif
	if NOT GotParam \{non_song_item}
		songlist_add_item {
			ui_struct = (<Range> [<index>])
			index = 0
		}
		Menu_Music_Off
	else
		songlist_add_non_song_item \{focus_script = songlist_item_create_playlist_focus
			unfocus_script = songlist_item_create_playlist_unfocus
			choose_script = songlist_create_playlist}
	endif
	current_menu :Menu_SetItemIndex index = ($g_songlist_last_visible_index) newIndex = 0
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script songlist_insert_item_bottom 
	<index> = ($g_songlist_last_visible_index)
	songlist :GetTags
	GetScreenElementChildren \{id = current_menu}
	DestroyScreenElement id = (<children> [0])
	songlist_add_item {
		ui_struct = (<Range> [<index>])
		index = <index>
	}
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent type = focus target = current_menu data = {child_index = <index>}
endscript

script songlist_build 
	printf \{'songlist_build'}
	songlist :GetTags
	if (<mode> = music_store)
		if NOT GotParam \{visited_band_hub}
			songlist :SetTags \{visited_band_hub = true}
			songlist_music_store_go_to_hub
			return
		endif
	endif
	GetArraySize <Range>
	if ((<array_size> - ($g_songlist_create_playlist_menu_item_present)) > 0)
		<i> = 0
		begin
		songlist_add_item {
			ui_struct = (<Range> [<i>])
			index = <i>
		}
		<i> = (<i> + 1)
		repeat (<array_size> - ($g_songlist_create_playlist_menu_item_present))
	endif
	if ($g_songlist_warning_active = 0)
		current_menu :SE_SetProps \{unblock_events}
		LaunchEvent \{type = unfocus
			target = current_menu}
		LaunchEvent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
	if (<mode> = music_store || <mode> = import)
		songlist :SetTags \{list_dirty = false}
		return
	endif
	FormatText TextName = songs_required qs(0xc31d83ea) i = ($g_songlist_force_num_songs_to_choose)
	songlist_detail_playlist :SE_SetProps {
		songlist_detail_playlist_num_songs_required_text = <songs_required>
	}
	if ($g_songlist_force_num_songs_to_choose > 0)
		songlist_detail_playlist :SE_SetProps \{songlist_detail_playlist_songs_added_alpha = 1.0
			songlist_detail_playlist_duration_alpha = 0.0}
	endif
	GetArraySize ($current_playlist)
	if (<array_size> > 0)
		<i> = 0
		<iters> = <array_size>
		if (<array_size> > ($g_songlist_playlist_detail_items))
			<i> = (<array_size> - ($g_songlist_playlist_detail_items))
			<iters> = ($g_songlist_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>])
		FormatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
		CreateScreenElement {
			type = DescInterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autoSizeDims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <i>
		<i> = (<i> + 1)
		repeat <iters>
		<i> = 0
		<iters> = <array_size>
		if (<array_size> > ($g_songlist_mini_playlist_detail_items))
			<i> = (<array_size> - ($g_songlist_mini_playlist_detail_items))
			<iters> = ($g_songlist_mini_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>])
		FormatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
		CreateScreenElement {
			type = DescInterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autoSizeDims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <i>
		<i> = (<i> + 1)
		repeat <iters>
		if ($g_songlist_force_num_songs_to_choose > 0)
			FormatText TextName = songs_added qs(0xc31d83ea) i = <array_size>
			songlist_detail_playlist :SE_SetProps {
				songlist_detail_playlist_num_songs_added_text = <songs_added>
			}
			if (<array_size> = $g_songlist_force_num_songs_to_choose)
				songlist_allow_continue
			endif
		elseif NOT InInternetMode
			songlist_allow_continue
		endif
	else
		songlist_disallow_continue
	endif
	songlist :SetTags \{list_dirty = false}
endscript

script songlist_add_item 
	RequireParams \{[
			ui_struct
		]
		all}
	songlist :GetSingleTag \{mode}
	if (<mode> = import)
		FormatText checksumname = song '%a' a = (<ui_struct>.song_title)
	elseif song_is_jamsession song = (<ui_struct>.song_checksum)
		FormatText TextName = text '%a' a = (<ui_struct>.FileName)
		FormatText checksumname = song '%i' i = <text>
	else
		song = (<ui_struct>.song_checksum)
	endif
	if (<mode> = music_store || <mode> = import)
		<desc> = 'music_store_item'
	else
		<desc> = 'songlist_item'
	endif
	ExtendCrc <song> '_sl_item' out = item_id
	if NOT StructureContains structure = <ui_struct> song_original_artist
		<sub_text> = (<ui_struct>.song_artist)
	else
		if (<ui_struct>.song_original_artist = 1)
			<sub_text> = (<ui_struct>.song_artist)
		else
			<sub_text> = $cover_artist_text
		endif
	endif
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
	CreateScreenElement {
		type = DescInterface
		id = <item_id>
		desc = <desc>
		parent = current_menu
		songlist_item_text_text = (<ui_struct>.song_title)
		songlist_item_sub_text_text = <sub_text>
		autoSizeDims = true
	}
	if NOT ((<mode> = import) || (<mode> = music_store))
		if NOT IsSongSelectable song = (<ui_struct>.song_checksum)
			<id> :SE_SetProps {
				songlist_item_text_rgba = $g_songlist_invalid_item_unfocus_rgba
				songlist_item_sub_text_rgba = $g_songlist_invalid_sub_item_unfocus_rgba
			}
		endif
	endif
	if (<mode> = import)
		<id> :SE_SetProps {
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
				album_pack_only
			}
		else
			songlist_music_store_add_item {
				id = <item_id>
				purchased = (<ui_struct>.purchased)
				price = (<ui_struct>.price)
			}
		endif
	endif
	if songlist_is_song_in_playlist song = <song>
		songlist :GetSingleTag \{locked}
		if (<locked> = false)
			if InNetGame
				GameMode_GetType
				if (<type> = career)
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
			GameMode_GetType
			if (<type> = career || ($net_song_countdown = 1))
				<show_playlist_number> = 1
			endif
		else
			<show_playlist_number> = 1
		endif
		if (<show_playlist_number> = 1)
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<id> :SE_SetProps {
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
		endif
		<id> :SetTags playlist_index = <playlist_index>
	else
		if (<mode> = import)
			<pad_choose_script> = nullscript
		elseif (<mode> = music_store)
			<pad_choose_script> = songlist_music_store_proceed_to_pre_purchase
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
		<option> = {pad_btn_left songlist_music_store_preview_song params = {song_preview_asset_name = (<ui_struct>.song_preview_asset_name)}}
		AddArrayElement array = <event_handlers> element = <option>
		<event_handlers> = <array>
	endif
	<id> :SE_SetProps event_handlers = <event_handlers>
	return id = <id>
endscript

script songlist_music_store_add_item 
	RequireParams \{[
			id
			purchased
			price
		]
		all}
	if IsPS3
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 1.0
		music_store_determine_currency
	endif
	if GotParam \{price}
		musicstore_format_price_text price = <price> currency_decimals = <currency_decimals>
	endif
	if (<purchased> = 1)
		<money_icon_alpha> = 1.0
		<money_text_alpha> = 0.0
		<money_texture> = checkmark
		<price_text> = qs(0x03ac90f0)
		<money_rgba> = (($g_menu_colors).pure_white)
	elseif GotParam \{album_pack_only}
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 0.0
		<price_text> = qs(0x03ac90f0)
	endif
	<id> :SE_SetProps {
		music_store_song_price_text = <price_text>
		music_store_money_icon_texture = <money_texture>
		music_store_money_icon_alpha = <money_icon_alpha>
		music_store_money_icon_rgba = <money_rgba>
		music_store_money_text_alpha = <money_text_alpha>
		music_store_money_text_text = <currency>
		music_store_money_text_rgba = <money_rgba>
	}
endscript

script songlist_music_store_proceed_to_pre_purchase 
	current_menu :SE_SetProps \{block_events}
	LaunchEvent \{type = unfocus
		target = current_menu}
	songlist :GetSingleTag \{exclusive_device}
	if isXenon
		generic_event_choose no_sound state = UIstate_music_store_purchase data = {is_popup exclusive_device = <exclusive_device> purchase_struct = <ui_struct>}
	else
		songlist_music_store_go_to_terms purchase_struct = <ui_struct>
	endif
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
	filterspec = [
		{
			key = song_checksum
			union_list = (<ui_struct>.pack_contents)
			comparator = equal
		}
	]
	songlist_change_filterspec filterspec = <filterspec>
	Change \{g_songlist_last_visible_index = 4}
	if ((<ui_struct>.type) = pack)
		FormatText TextName = Title qs(0xf987cdb7) t = (<ui_struct>.song_title)
		if ((<ui_struct>.purchased) = 1)
			<button_text> = qs(0xe8ec5f45)
		else
			<button_text> = qs(0x74fd0cf6)
		endif
	else
		FormatText TextName = Title qs(0x690533a1) t = (<ui_struct>.song_title)
		if ((<ui_struct>.purchased) = 1)
			<button_text> = qs(0xaa94b42c)
		else
			<button_text> = qs(0xec8c85c0)
		endif
	endif
	Change g_music_store_title = <Title>
	Change g_music_store_current_pack_checksum = (<ui_struct>.song_checksum)
	if GotParam \{no_pivot}
		songlist_refresh_menus \{no_pivot = 1}
	else
		songlist_refresh_menus
	endif
	if NOT user_control_helper_exists \{button = orange}
		add_user_control_helper text = <button_text> button = orange z = 100000
	else
		user_control_helper_change_text button = orange text = <button_text>
	endif
	current_menu :SE_SetProps {
		event_handlers = [
			{pad_L1 songlist_music_store_proceed_to_pre_purchase params = {ui_struct = <ui_struct>}}
		]
		replace_handlers
	}
endscript

script songlist_music_store_disallow_sorting 
	if user_control_helper_exists \{button = orange}
		user_control_destroy_helper \{button = orange}
	endif
	current_menu :SE_SetProps \{event_handlers = [
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
	current_menu :SE_SetProps \{event_handlers = [
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
	if (<array_size> > 0)
		<i> = 0
		begin
		if (<song> = ($current_playlist [<i>]))
			return true playlist_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
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
		repeat <array_size>
	endif
	return \{false}
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
				FormatText TextName = pos_text qs(0xc31d83ea) i = <new_index>
				(<children> [<i>]) :SE_SetProps {
					in_playlist_pos_text = <pos_text>
				}
				(<children> [<i>]) :SetTags playlist_index = (<new_index> - 1)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
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
	if (<diff_rate> = 11)
		<diff_rate> = 0
	endif
	songlist :GetSingleTag \{mode}
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
	FormatText checksumname = songlist_detail_difficulty_vmenu 'songlist_detail_difficulty_%i_vmenu' i = <instrument>
	GetScreenElementChildren id = <songlist_detail_difficulty_vmenu>
	ResolveScreenElementID id = [
		{id = <songlist_detail_difficulty_vmenu>}
		{local_id = songlist_detail_difficulty_sprite}
		{local_id = songlist_detail_difficulty_invalid}
	]
	if GotParam \{resolved_id}
		if (<diff_rate> = 0)
			<resolved_id> :SE_SetProps alpha = 1 time = 0.2
		else
			<resolved_id> :SE_SetProps alpha = 0 time = 0.2
		endif
	endif
	if (<difference> > 0)
		<i> = (9 - <prev_diff_rate>)
		FormatText checksumname = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
		begin
		(<children> [<i>]) :SE_SetProps rgba = <on_rgba> alpha = 1.0
		AddParam structure_name = my_diff_rate_struct name = <prev_diff_rate> value = (10 - <i>)
		Songlist_detail :SetTags {
			<my_diff_rate_struct>
		}
		wait <time> seconds
		<i> = (<i> - 1)
		repeat <difference>
	else
		<difference> = (<difference> * -1)
		<i> = (10 - <prev_diff_rate>)
		if (<difference> > 0)
			FormatText checksumname = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
			begin
			(<children> [<i>]) :SE_SetProps rgba = <off_rgba> alpha = <off_alpha>
			AddParam structure_name = my_diff_rate_struct name = <prev_diff_rate> value = (9 - <i>)
			Songlist_detail :SetTags {
				<my_diff_rate_struct>
			}
			wait <time> seconds
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
	if NOT GotParam \{STARS}
		STARS = 0
	endif
	<difference> = (<STARS> - <prev_stars>)
	GetScreenElementChildren \{id = songlist_detail_stars_empty_vmenu}
	GetArraySize <children>
	if (<STARS> = 6)
		<max_stars> = 6
		if (<array_size> = 5)
			CreateScreenElement \{type = SpriteElement
				parent = songlist_detail_stars_empty_vmenu
				texture = songlist_star_empty
				dims = (64.0, 64.0)
				just = [
					center
					center
				]
				alpha = 0.15
				z_priority = 21}
			songlist_detail_stars_empty_vmenu :Menu_SetItemIndex \{index = 5
				newIndex = 0}
			CreateScreenElement \{type = SpriteElement
				parent = songlist_detail_stars_full_vmenu
				texture = songlist_star_full
				dims = (64.0, 64.0)
				just = [
					center
					center
				]
				alpha = 0
				z_priority = 22}
			songlist_detail_stars_full_vmenu :Menu_SetItemIndex \{index = 5
				newIndex = 0}
			GetScreenElementPosition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :SE_SetProps Pos = (<ScreenElementPos> + (0.0, 14.0))
		endif
	else
		<max_stars> = 5
		if (<array_size> = 6)
			DestroyScreenElement id = (<children> [0])
			RemoveParameter \{children}
			GetScreenElementChildren \{id = songlist_detail_stars_full_vmenu}
			DestroyScreenElement id = (<children> [0])
			GetScreenElementPosition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :SE_SetProps Pos = (<ScreenElementPos> + (0.0, -14.0))
		endif
	endif
	GetScreenElementChildren \{id = songlist_detail_stars_full_vmenu}
	if (<difference> > 0)
		<i> = ((<max_stars> - 1) - <prev_stars>)
		begin
		(<children> [<i>]) :SE_SetProps alpha = 1.0
		Songlist_detail :SetTags {
			prev_stars = (<max_stars> - <i>)
		}
		wait <time> seconds
		<i> = (<i> - 1)
		repeat <difference>
	else
		<difference> = (<difference> * -1)
		if (<difference> > 0)
			if (<prev_stars> = 6)
				<prev_stars> = 5
				Songlist_detail :SetTags \{prev_stars = 5}
				<difference> = (<difference> - 1)
			endif
			if (<difference> > 0)
				<i> = (<max_stars> - <prev_stars>)
				begin
				(<children> [<i>]) :SE_SetProps alpha = 0.0
				Songlist_detail :SetTags {
					prev_stars = ((<max_stars> - 1) - <i>)
				}
				wait <time> seconds
				<i> = (<i> + 1)
				repeat <difference>
			endif
		endif
	endif
	if (<gold_stars> = 0)
		<rgba> = (($g_menu_colors).pure_white)
	else
		<rgba> = (($g_menu_colors).GH5_gold_md)
	endif
	<star> = 0
	begin
	(<children> [<star>]) :SE_SetProps rgba = <rgba> time = 0.5
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
	songlist :GetSingleTag \{mode}
	if (<mode> = import)
		<id> :SE_SetProps {
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
		FormatText TextName = text '%a' a = (<ui_struct>.FileName)
		FormatText checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	songlist :GetSingleTag \{exclusive_device}
	if (<mode> = music_store)
		if (<ui_struct>.type = song)
			Songlist_detail :SE_SetProps \{songlist_detail_songs_alpha = 1.0
				songlist_detail_albums_alpha = 0.0}
		else
			Songlist_detail :SE_SetProps \{songlist_detail_songs_alpha = 0.0
				songlist_detail_albums_alpha = 1.0}
		endif
		if NOT (<ui_struct>.song_rating = None)
			<PA_alpha> = 1.0
			<esrb_notice_alpha> = 0.0
		else
			<PA_alpha> = 0.0
			songlist :GetSingleTag \{territory}
			if (<territory> != TERRITORY_US)
				<esrb_notice_alpha> = 0.0
			else
				<esrb_notice_alpha> = 1.0
			endif
		endif
		songlist :SE_SetProps {
			PA_ESRB_label_alpha = <PA_alpha>
			esrb_notice_alpha = <esrb_notice_alpha>
		}
	endif
	if songlist_is_song_in_playlist song = <song_checksum>
		<rgba> = (($g_menu_colors).songlist_focus_orangeish)
		GameMode_GetType
		if NOT InInternetMode
			user_control_helper_change_text \{button = green
				text = qs(0x34ff4910)}
		elseif (<type> = career)
			if ($g_net_leader_player_num != -1)
				if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
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
				if NOT user_control_helper_exists \{button = green}
					add_user_control_helper \{text = qs(0x40886130)
						button = green
						z = 100000}
					user_control_helper_reorder \{button = green
						new_index = 0}
				else
					user_control_helper_change_text \{button = green
						text = qs(0x40886130)}
				endif
			else
				if NOT user_control_helper_exists \{button = green}
					add_user_control_helper \{text = qs(0xb7b2ba93)
						button = green
						z = 100000}
					user_control_helper_reorder \{button = green
						new_index = 0}
				else
					user_control_helper_change_text \{button = green
						text = qs(0xb7b2ba93)}
				endif
			endif
		endif
	endif
	if NOT (<mode> = music_store)
		if IsSongSelectable song = (<ui_struct>.song_checksum)
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
	<id> :SE_SetProps {
		songlist_item_text_rgba = <item_focus_rgba>
		songlist_item_sub_text_rgba = <sub_item_focus_rgba>
		time = <time>
	}
	if (<mode> = music_store)
		if (<ui_struct>.purchased = 1)
			<money_icon_rgba> = (($g_menu_colors).pure_white)
		else
			<money_icon_rgba> = <sub_item_focus_rgba>
		endif
		<id> :SE_SetProps {
			music_store_song_price_rgba = <sub_item_focus_rgba>
			music_store_money_icon_rgba = <money_icon_rgba>
			music_store_money_text_rgba = <money_icon_rgba>
		}
	endif
	if NOT (<mode> = music_store)
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			get_genre_text genre = (<ui_struct>.song_genre) song = <song_checksum>
			FormatText TextName = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
		else
			curr_musicstudio_genre = (<ui_struct>.musicstudio_genre)
			GetArraySize ($jam_genre_list) param = genre_list_size
			if ((<curr_musicstudio_genre> >= 0) && (<curr_musicstudio_genre> < <genre_list_size>))
				musicstudio_genre_text = ($jam_genre_list [<curr_musicstudio_genre>].name_text)
			else
				musicstudio_genre_text = qs(0xd0ef7f05)
			endif
			FormatText TextName = genre_year_text qs(0xf7e765ed) g = <musicstudio_genre_text> y = (<ui_struct>.song_year)
		endif
		<total_seconds> = 0
		if StructureContains structure = <ui_struct> song_duration
			<total_seconds> = (<ui_struct>.song_duration)
		endif
		if (<total_seconds> > 0)
			seconds = 0
			minutes = 0
			Mod a = <total_seconds> b = 60
			<seconds> = <Mod>
			<total_seconds> = (<total_seconds> - <seconds>)
			if (<total_seconds> > 0)
				Mod a = <total_seconds> b = (60 * 60)
				<minutes> = (<Mod> / 60)
			endif
		else
			<seconds> = 0
			<minutes> = 0
		endif
		FormatText TextName = duration_text qs(0x81ca0519) m = <minutes> s = <seconds>
		songlist_detail_transition \{desc = Songlist_detail
			fade_time = 0}
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
				player_num = 1
			else
				get_local_in_game_player_num_from_controller {controller_index = <exclusive_device> allow_dropped_player}
			endif
			if (<player_num> = -1)
				ScriptAssert \{'player_num = -1'}
			endif
			if isSinglePlayerGame
				GetPlayerInfo <player_num> part
				GetPlayerInfo <player_num> difficulty
			else
				<part> = Band
				get_highest_difficulty
				<difficulty> = <highest_difficulty>
			endif
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
					part = Drum
					case 'mic'
					part = vocals
					case 'band'
					case 'altband'
					part = Band
				endswitch
			endif
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
				if ($g_include_debug_songs = 0)
					GetGlobalTags <songname> param = setlist_beststars
					GetGlobalTags <songname> param = setlist_bestpercentage
				else
					<setlist_beststars> = 0
					<setlist_bestpercentage> = 0
				endif
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
				if ($g_include_debug_songs = 0)
					GetGlobalTags <songname> param = setlist_beststars
					GetGlobalTags <songname> param = setlist_bestpercentage
				else
					<setlist_beststars> = 0
					<setlist_bestpercentage> = 0
				endif
			endif
			songlist_update_more_info {
				part = <part>
				song_checksum = <song_checksum>
				mode = <mode>
			}
			FormatText checksumname = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
			Songlist_detail :SE_SetProps {
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
			Songlist_detail :SE_SetProps {
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
		Songlist_detail :SE_SetProps {
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
		if NOT (<ui_struct>.type = song)
			<do_intensity> = 0
		endif
	endif
	Songlist_detail :GetTags
	if (<do_intensity> = 1)
		Songlist_detail :Obj_KillSpawnedScript \{name = songlist_update_instrument_difficulty_rating}
		Songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'guitar'
			diff_rate = (<ui_struct>.song_guitar_difficulty_rating)
			prev_diff_rate = <prev_guitar_diff_rate>
		}
		Songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'bass'
			diff_rate = (<ui_struct>.song_bass_difficulty_rating)
			prev_diff_rate = <prev_bass_diff_rate>
		}
		Songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
			instrument = 'drums'
			diff_rate = (<ui_struct>.song_drums_difficulty_rating)
			prev_diff_rate = <prev_drums_diff_rate>
		}
		Songlist_detail :Obj_SpawnScriptNow songlist_update_instrument_difficulty_rating params = {
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
		Songlist_detail :Obj_KillSpawnedScript \{name = songlist_update_stars}
		Songlist_detail :Obj_SpawnScriptNow songlist_update_stars params = {
			STARS = <setlist_beststars>
			prev_stars = <prev_stars>
			gold_stars = <gold_stars>
		}
		if NOT is_song_in_jammode_songlist song = <song_checksum>
			Menu_Music_Off
			songlist :GetSingleTag \{mode}
			if NOT (<mode> = music_store)
				songlist_update_song_preview song = <song_checksum>
			endif
		else
			spawnscriptnow \{menu_music_on}
			songlist_update_song_preview \{song = None}
		endif
		if (<ui_struct>.song_double_kick = 1)
			Songlist_detail :SE_SetProps \{icon_difficulty_expert_plus_alpha = 1.0}
		else
			Songlist_detail :SE_SetProps \{icon_difficulty_expert_plus_alpha = 0.0}
		endif
	else
		if (<ui_struct>.patched = 0)
			Songlist_detail :SE_SetProps \{music_store_patch_popup_alpha = 1.0}
		else
			Songlist_detail :SE_SetProps \{music_store_patch_popup_alpha = 0.0}
		endif
		if StructureContains structure = <ui_struct> song_double_kick
			if (<ui_struct>.song_double_kick = 1)
				Songlist_detail :SE_SetProps \{icon_difficulty_expert_plus_alpha = 1.0}
			else
				Songlist_detail :SE_SetProps \{icon_difficulty_expert_plus_alpha = 0.0}
			endif
		else
			Songlist_detail :SE_SetProps \{icon_difficulty_expert_plus_alpha = 0.0}
		endif
	endif
	if (<mode> != playlist)
		Songlist_detail :SE_SetProps \{songlist_detail_mini_playlist_text = qs(0x03ac90f0)}
	endif
	if ((<mode> != playlist) && (<mode> != music_store) && (<mode> != import))
		Songlist_detail :SE_SetProps \{songlist_detail_mini_info_alpha = 0.0}
		if StructureContains structure = $gh_songlist_props (<ui_struct>.song_checksum)
			if StructureContains structure = ($gh_songlist_props.(<ui_struct>.song_checksum)) name
				FormatText checksumname = challenge_global 'c_%s' s = (($gh_songlist_props.(<ui_struct>.song_checksum)).name)
				if GlobalExists name = <challenge_global>
					if StructureContains structure = ($<challenge_global>) descrip
						Songlist_detail :SE_SetProps \{songlist_detail_mini_playlist_text = qs(0x9adda19b)}
						Songlist_detail :SE_SetProps songlist_detail_mini_info_text = (($<challenge_global>).descrip)
						Songlist_detail :SE_SetProps \{songlist_detail_mini_info_alpha = 1.0}
					endif
				endif
			endif
		endif
	else
		Songlist_detail :SE_SetProps \{songlist_detail_mini_info_alpha = 0.0
			time = 0.1}
		Songlist_detail :SE_WaitProps
		Songlist_detail :SE_SetProps \{songlist_detail_mini_info_text = qs(0x03ac90f0)}
		if NOT InInternetMode
			Songlist_detail :SE_SetProps \{songlist_detail_mini_playlist_text = qs(0x0f9cf815)}
		endif
	endif
endscript

script songlist_music_store_item_focus \{hub_item_cycle = 0
		morph_time = 0.0}
	RequireParams \{[
			ui_struct
		]
		all}
	songlist :GetSingleTag \{mode}
	song_checksum = (<ui_struct>.song_checksum)
	get_genre_text genre = (<ui_struct>.song_genre) song = <song_checksum>
	FormatText TextName = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
	<total_seconds> = 0
	if StructureContains structure = <ui_struct> song_duration
		<total_seconds> = (<ui_struct>.song_duration)
	endif
	if (<total_seconds> > 0)
		seconds = 0
		minutes = 0
		Mod a = <total_seconds> b = 60
		<seconds> = <Mod>
		<total_seconds> = (<total_seconds> - <seconds>)
		if (<total_seconds> > 0)
			Mod a = <total_seconds> b = (60 * 60)
			<minutes> = (<Mod> / 60)
		endif
	else
		<seconds> = 0
		<minutes> = 0
	endif
	FormatText TextName = duration_text qs(0x81ca0519) m = <minutes> s = <seconds>
	<line0> = (<ui_struct>.album)
	<line1> = <genre_year_text>
	<line2> = <duration_text>
	if (<ui_struct>.type = song)
		if (<hub_item_cycle> = 1)
			<line0> = (<ui_struct>.song_title)
			<line1> = (<ui_struct>.song_artist)
			FormatText TextName = album_year_text qs(0xfaf915aa) a = (<ui_struct>.album) y = (<ui_struct>.song_year)
			<line2> = <album_year_text>
		else
			<id> :SE_SetProps {
				event_handlers = [
					{pad_btn_left songlist_music_store_preview_song params = {song_preview_asset_name = (<ui_struct>.song_preview_asset_name)}}
				]
				replace_handlers
			}
			user_control_helper_change_text \{button = blue
				text = qs(0x43b287ab)}
		endif
	elseif (<ui_struct>.type = pack)
		<array> = (<ui_struct>.contents_strings)
		GetArraySize <array>
		<iters> = <array_size>
		<more_than_3> = 0
		if (<array_size> > 3)
			<iters> = 2
			<more_than_3> = (<array_size> - 2)
		endif
		<i> = 0
		begin
		FormatText checksumname = line 'line%i' i = <i>
		AddParam name = <line> value = (<array> [<i>])
		<i> = (<i> + 1)
		repeat <iters>
		if (<more_than_3> > 1)
			FormatText TextName = more_songs qs(0x560b5eda) n = <more_than_3>
			AddParam name = line2 value = <more_songs>
		endif
		<empty_iters> = (3 - <array_size>)
		if (<empty_iters> > 0)
			<i> = <iters>
			begin
			FormatText checksumname = line 'line%i' i = <i>
			AddParam name = <line> value = qs(0x03ac90f0)
			<i> = (<i> + 1)
			repeat <empty_iters>
		endif
		if (<hub_item_cycle> = 0)
			<id> :SE_SetProps {
				event_handlers = [
					{pad_btn_left songlist_music_store_view_pack_songs params = {play_sfx = 1 ui_struct = <ui_struct>}}
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
			<id> :SE_SetProps {
				event_handlers = [
					{pad_btn_left songlist_music_store_view_pack_songs params = {play_sfx = 1 ui_struct = <ui_struct>}}
				]
				replace_handlers
			}
			user_control_helper_change_text \{button = blue
				text = qs(0xa62cd1de)}
		endif
	endif
	<text_dims> = (330.0, 40.0)
	<desc> = Songlist_detail
	if (<hub_item_cycle> = 1)
		<desc> = music_store_hub
		<text_dims> = (530.0, 40.0)
		music_store_hub :SE_SetProps songlist_detail_cont_alpha = 0.0 time = <morph_time>
		wait <morph_time> seconds
	endif
	<desc> :SE_SetProps {
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
		item_type = (<ui_struct>.type)
		hub_item_cycle = <hub_item_cycle>
		text_dims = <text_dims>
		line0 = <line0>
		line1 = <line1>
		line2 = <line2>
	}
	if ((<ui_struct>.patched = 1) || (<hub_item_cycle> = 1))
		if StructureContains structure = <ui_struct> song_preview_asset_name
			music_store_change_album_cover {
				texture_name = (<ui_struct>.song_preview_asset_name)
				desc = <desc>
			}
		endif
	endif
	if (<hub_item_cycle> = 1)
		music_store_hub :SE_SetProps songlist_detail_cont_alpha = 1.0 time = <morph_time>
	endif
endscript

script songlist_music_store_check_scroll_text \{desc = Songlist_detail}
	RequireParams \{[
			item_type
			hub_item_cycle
			text_dims
			line0
			line1
			line2
		]
		all}
	<desc> :SE_GetProps
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
	FormatText checksumname = songlist_detail_text_dims 'songlist_detail_%c_text_dims' c = <param>
	FormatText checksumname = songlist_detail_text_text 'songlist_detail_%c_text_text' c = <param>
	FormatText checksumname = songlist_detail_cont 'songlist_detail_%c_cont' c = <param>
	if ((<hub_item_cycle> = 1) || (<item_type> != song))
		FormatText checksumname = songlist_detail_text 'songlist_detail_%c_text' c = <param>
	else
		FormatText checksumname = songlist_detail_text 'songlist_detail_songs_%c_text' c = <param>
	endif
	FormatText checksumname = line_text 'line%i' i = <i>
	if (((<...>.<songlist_detail_text_dims>).(1.0, 0.0)) > <max_x>)
		AddParam structure_name = my_blank_text name = <songlist_detail_text_text> value = qs(0x03ac90f0)
		<desc> :SE_SetProps {
			<my_blank_text>
		}
		if ScreenElementExists id = <songlist_detail_cont>
			<songlist_detail_text> :Obj_KillSpawnedScript name = scroll_ticker_text
			DestroyScreenElement id = <songlist_detail_cont>
		endif
		CreateScreenElement {
			type = ContainerElement
			id = <songlist_detail_cont>
			parent = <songlist_detail_text>
		}
		<songlist_detail_text> :Obj_SpawnScriptLater scroll_ticker_text params = {
			ticker_text = (<...>.<line_text>)
			ticker_space = qs(0x8b73fd0e)
			ticker_pos = (0.0, 0.0)
			ticker_just = [left top]
			ticker_parent = <songlist_detail_cont>
			ticker_font = fontgrid_text_A1
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
			<songlist_detail_text> :Obj_KillSpawnedScript name = scroll_ticker_text
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
	<id> :SE_SetProps text = qs(0x03ac90f0)
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [2])
	<id> = (<children> [0])
	<id> :SE_SetProps text = qs(0x03ac90f0)
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [3])
	<id> = (<children> [0])
	<id> :SE_SetProps text = qs(0x03ac90f0)
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
	<i> = 0
	begin
	if (<mode> = leaderboard || <mode> = toprockers || <mode> = sing_a_long)
		switch ($current_leaderboard_instrument)
			case 'guitar'
			part = guitar
			case 'backup'
			part = bass
			case 'drums'
			part = Drum
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
	if ($g_include_debug_songs = 0)
		GetGlobalTags <songname> param = setlist_beststars
		GetGlobalTags <songname> param = setlist_bestscore
		GetGlobalTags <songname> param = setlist_bestpercentage
	else
		<setlist_beststars> = 0
		<setlist_bestscore> = 0
		<setlist_bestpercentage> = 0
	endif
	GetScreenElementChildren id = (<rows> [<i>])
	<stats> = <children>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [1])
	<id> = (<children> [0])
	if (<setlist_beststars> = 0)
		FormatText \{TextName = stars_text
			qs(0x03ac90f0)}
	else
		FormatText TextName = stars_text qs(0x73307931) s = <setlist_beststars>
	endif
	<id> :SE_SetProps text = <stars_text>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [2])
	<id> = (<children> [0])
	if (<setlist_bestscore> = 0)
		FormatText \{TextName = score_text
			qs(0x03ac90f0)}
	else
		FormatText TextName = score_text qs(0x73307931) s = <setlist_bestscore> UseCommas
	endif
	<id> :SE_SetProps text = <score_text>
	RemoveParameter \{children}
	GetScreenElementChildren id = (<stats> [3])
	<id> = (<children> [0])
	if (<setlist_bestpercentage> = 0)
		FormatText \{TextName = notes_text
			qs(0x03ac90f0)}
	else
		FormatText TextName = notes_text qs(0x6cd5ba93) s = <setlist_bestpercentage>
	endif
	<id> :SE_SetProps text = <notes_text>
	RemoveParameter \{children}
	<i> = (<i> + 1)
	repeat 5
endscript

script songlist_item_unfocus \{time = 0.0}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	songlist :GetSingleTag \{mode}
	if (<mode> = import)
		<id> :SE_SetProps {
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
		FormatText TextName = text '%a' a = (<ui_struct>.FileName)
		FormatText checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	if NOT (<mode> = music_store)
		if IsSongSelectable song = (<ui_struct>.song_checksum)
			<item_unfocus_rgba> = ($g_songlist_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_sub_item_unfocus_rgba)
		else
			<item_unfocus_rgba> = ($g_songlist_invalid_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_invalid_sub_item_unfocus_rgba)
		endif
	else
		music_store_kill_preview_music
		<item_unfocus_rgba> = ($g_music_store_item_unfocus_rgba)
		<sub_item_unfocus_rgba> = ($g_music_store_sub_item_unfocus_rgba)
	endif
	<id> :SE_SetProps {
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
		<id> :SE_SetProps {
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
	songlist :SetTags \{non_song_item_focused = true}
	<id> :SE_SetProps {
		songlist_create_playlist_text_rgba = ($g_songlist_item_focus_rgba)
	}
	Songlist_detail :SE_SetProps alpha = 0.0 time = <fade_time>
	user_control_helper_change_text \{button = green
		text = qs(0x188ec849)}
	spawnscriptnow \{menu_music_on}
	songlist_update_song_preview \{song = None}
endscript

script songlist_item_create_playlist_unfocus 
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	songlist :SetTags \{non_song_item_focused = false}
	<id> :SE_SetProps {
		songlist_create_playlist_text_rgba = ($g_songlist_item_unfocus_rgba)
	}
	user_control_helper_change_text \{button = green
		text = qs(0x56fbf662)}
endscript

script songlist_clear_playlist 
	songlist_clear
	GMan_SongFunc \{func = clear_play_list}
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

script songlist_display_non_patched_dialog 
	Change \{g_songlist_warning_active = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	songlist :GetSingleTag \{exclusive_device}
	create_dialog_box {
		heading_text = qs(0x24c5d3a9)
		body_text = qs(0x11eb8dc1)
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
	current_menu :SE_SetProps \{block_events}
	if NOT IsSongSelectable song = (<ui_struct>.song_checksum)
		current_menu :SE_SetProps \{unblock_events}
		SoundEvent \{event = UI_SFX_Negative_Select}
		if GotParam \{song_not_patched}
			songlist_display_non_patched_dialog
		endif
		return
	endif
	if ($is_network_game = 1)
		net_songlist_add_song song = (<ui_struct>.song_checksum)
		current_menu :SE_SetProps \{unblock_events}
		return
	endif
	GetArraySize ($current_playlist)
	if (<array_size> >= $g_max_playlist_size)
		current_menu :SE_SetProps \{unblock_events}
		return
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		if (<array_size> >= $g_songlist_force_num_songs_to_choose)
			current_menu :SE_SetProps \{unblock_events}
			return
		endif
	endif
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		FormatText TextName = text '%a' a = (<ui_struct>.FileName)
		FormatText checksumname = song_checksum '%i' i = <text>
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
	songlist :GetSingleTag \{mode}
	if (<mode> = sing_a_long)
		songlist_go_to_sing_a_long song = <song_checksum>
		return
	endif
	if (<mode> = play_song || <mode> = leaderboard || <mode> = practice || <mode> = toprockers)
		songlist_continue device_num = <device_num>
		current_menu :SE_SetProps \{unblock_events}
		return
	endif
	SoundEvent \{event = QuickPlay_Select_Song}
	<id> :SE_SetProps {
		event_handlers = [
			{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
		]
		replace_handlers
	}
	songlist_is_song_in_playlist song = <song_checksum>
	FormatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
	<id> :SE_SetProps {
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :SetTags playlist_index = <playlist_index>
	GameMode_GetType
	if NOT InInternetMode
		user_control_helper_change_text \{button = green
			text = qs(0x34ff4910)}
	elseif (<type> = career)
		if ($g_net_leader_player_num != -1)
			if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
				user_control_helper_change_text \{button = green
					text = qs(0x34ff4910)}
			endif
		endif
	endif
	GetArraySize \{$current_playlist}
	FormatText TextName = pos_text qs(0xc31d83ea) i = (<array_size>)
	if (<array_size> > ($g_songlist_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	if (<array_size> > ($g_songlist_mini_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	CreateScreenElement {
		type = DescInterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autoSizeDims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :SetTags playlist_index = <playlist_index>
	CreateScreenElement {
		type = DescInterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_mini_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autoSizeDims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :SetTags playlist_index = <playlist_index>
	Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
			fade_time = 0
		}}
	if ($g_songlist_force_num_songs_to_choose > 0)
		GetArraySize ($current_playlist)
		FormatText TextName = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :SE_SetProps {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
		GetArraySize ($current_playlist)
		if (<array_size> = $g_songlist_force_num_songs_to_choose)
			songlist_allow_continue
		endif
	else
		songlist_allow_continue
	endif
	current_menu :SE_SetProps \{unblock_events}
endscript

script songlist_allow_continue 
	if ($g_songlist_warning_active = 1)
		return
	endif
	songlist :GetSingleTag \{mode}
	current_menu :SE_SetProps \{event_handlers = [
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
	songlist :GetSingleTag \{mode}
	current_menu :SE_SetProps \{event_handlers = [
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
		GameMode_GetType
		if (<type> = career)
			if ($g_net_leader_player_num != -1)
				if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
					net_songlist_remove_song song = (<ui_struct>.song_checksum)
				endif
			endif
		endif
		return
	endif
	songlist_item_remove_from_playlist_guts <...>
endscript

script songlist_item_remove_from_playlist_guts 
	SoundEvent \{event = QuickPlay_Remove_Song}
	if NOT GotParam \{id}
		Obj_GetID
		<my_id> = <objID>
	else
		<my_id> = <id>
	endif
	if ScreenElementExists id = <my_id>
		<my_id> :SE_SetProps {
			songlist_item_text_rgba = ($g_songlist_item_focus_rgba)
			in_playlist_pos_alpha = 0.0
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
		if (<array_size> > ($g_songlist_playlist_detail_items))
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<array_size> - ($g_songlist_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_size> - ($g_songlist_playlist_detail_items)) - 1)])
			CreateScreenElement {
				type = DescInterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autoSizeDims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_playlist_vmenu :Menu_SetItemIndex index = ($g_songlist_playlist_detail_items) newIndex = 0
			<id> :SetTags playlist_index = ((<array_size> - ($g_songlist_playlist_detail_items)) - 1)
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
		if (<array_size> > ($g_songlist_mini_playlist_detail_items))
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<array_size> - ($g_songlist_mini_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_size> - ($g_songlist_mini_playlist_detail_items)) - 1)])
			CreateScreenElement {
				type = DescInterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autoSizeDims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_mini_playlist_vmenu :Menu_SetItemIndex index = ($g_songlist_mini_playlist_detail_items) newIndex = 0
			<id> :SetTags playlist_index = ((<array_size> - ($g_songlist_mini_playlist_detail_items)) - 1)
			<ui_struct> = <passed_in_ui_struct>
			RemoveParameter \{passed_in_ui_struct}
		endif
		DestroyScreenElement id = (<children> [<playlist_detail_index>])
	endif
	if ScreenElementExists id = <my_id>
		<my_id> :RemoveTags playlist_index
	endif
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_mini_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = current_menu
	Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
		}}
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		FormatText TextName = text '%a' a = (<ui_struct>.FileName)
		FormatText checksumname = song_checksum '%i' i = <text>
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
	if ScreenElementExists id = <my_id>
		if NOT IsScreenElementInFocus id = <my_id>
			<my_id> :Obj_SpawnScriptNow songlist_item_unfocus params = {ui_struct = <ui_struct>}
		endif
	endif
	GetArraySize ($current_playlist)
	if NOT (<array_size> > 0)
		songlist_disallow_continue
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		GetArraySize ($current_playlist)
		FormatText TextName = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :SE_SetProps {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
		if NOT (<array_size> = $g_songlist_force_num_songs_to_choose)
			songlist_disallow_continue
		else
			songlist_allow_continue
		endif
	endif
endscript

script songlist_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event_wait_for_safe
	songlist_update_song_preview \{song = None}
	current_menu :SE_SetProps \{block_events}
	generic_menu_pad_choose_sound
	if InInternetMode
		host_start_songlist_countdown
		return
	endif
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = add_song_array_to_play_list params = {
		song_array = ($current_playlist)
	}
	songlist :GetSingleTag \{mode}
	if (<mode> = leaderboard)
		song = ($current_playlist [0])
		songlist_clear
		ui_event event = menu_change state = UIstate_leaderboard data = {song = <song> device_num = <device_num>}
		return
	elseif (<mode> = practice)
		songlist_clear
		practice_setup_part_and_continue device_num = <device_num>
		return
	elseif (<mode> = toprockers)
		song = ($current_playlist [0])
		songlist_clear
		ui_event event = menu_change state = UIstate_top_rockers data = {for_options = 1 toprockerssong = <song>}
		return
	endif
	GameMode_GetType
	switch (<type>)
		case career
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		gig_struct = ($<current_challenge>)
		venue = (<gig_struct>.venue)
		if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			printstruct <gig_struct>
			ScriptAssert \{qs(0x2f9dfa76)}
		endif
		case quickplay
		Change current_level = ($g_band_lobby_current_level)
		fill_auto_save_playlist
		venue = ($g_band_lobby_current_level)
		if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
		case freeplay
		ui_event \{event = menu_back}
		return
		case competitive
		if ($game_mode = fest_mode || $game_mode = fest_mode_team)
			display_competitive_rules_voting \{next_state = uistate_play_song
				voting_callback = songlist_voting_callback_continue}
			return
		else
			GMan_StartGameModeGoal
		endif
		Change current_level = ($g_band_lobby_current_level)
		venue = ($g_band_lobby_current_level)
		if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
		case practice
		practice_setup_part_and_continue device_num = <device_num>
		return
	endswitch
	ui_event \{event = menu_change
		state = uistate_play_song}
endscript

script songlist_voting_callback_continue 
	RequireParams \{[
			result
		]
		all}
	printf \{qs(0x7d7081f8)}
	Change competitive_rules = <result>
	GMan_ShutDownGameModeGoal
	GMan_StartGameModeGoal
endscript

script songlist_destroy 
	if ScreenElementExists \{id = songlist}
		songlist :GetTags
		songlist_set_mode_sort_index mode = <mode>
		if (<cs_registered> = true)
			ContentManFunc func = unregister_content_source name = <list_name>
		endif
		DestroyScreenElement \{id = songlist}
	endif
	if ScriptIsRunning \{songlist_request_page_when_ready}
		killspawnedscript \{name = songlist_request_page_when_ready}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
endscript

script songlist_scroll_down 
	if ScreenElementExists \{id = songlist}
		songlist :GetTags
		SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
		if (<list_dirty> = true)
			return
		endif
		<do_page_down_logic> = 0
		if (<list_page_size> > ($g_songlist_last_visible_index + 1))
			if NOT (<list_bottom> = (<list_page_size> - 1))
				<do_page_down_logic> = 1
			endif
		endif
		if (<do_page_down_logic> = 1)
			<button> = triangle
			if IsPS3
				<button> = square
			endif
			if ControllerPressed <button> <exclusive_device>
				SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
				songlist_page_down
				return
			endif
		endif
		if (<list_index> <= (<list_page_size> - 1))
			list_index = (<list_index> + 1)
			if (<list_index> > (<list_page_size> - 1))
				ContentManFunc {
					func = more_data
					name = <list_name>
					page_down
					callback = songlist_more_data_down_callback
				}
			else
				if (<mode> = play_song)
					songlist_scroll_sfx
				elseif (<mode> = playlist)
					playlist_scroll_sfx
				elseif (<mode> = music_store)
					Music_Store_Scroll_SFX
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
						ContentManFunc {
							func = request_data
							name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				songlist :SetTags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_down 
	songlist :GetTags
	if (<mode> = play_song)
		songlist_scroll_sfx
	elseif (<mode> = playlist)
		playlist_scroll_sfx
	elseif (<mode> = music_store)
		Music_Store_Scroll_SFX
	else
		songlist_scroll_sfx
	endif
	<page_size> = ($g_songlist_last_visible_index + 1)
	<jump> = (<page_size> - <hilight_bar_index>)
	<new_list_index> = (<list_index> + <jump> - $g_songlist_create_playlist_menu_item_present)
	<new_list_top> = (<list_top> + <page_size> - $g_songlist_create_playlist_menu_item_present)
	<new_list_bottom> = (<list_bottom> + <page_size> - $g_songlist_create_playlist_menu_item_present)
	if (<new_list_bottom> >= <list_page_size>)
		<new_list_bottom> = (<list_page_size> - 1)
		<new_list_top> = (<new_list_bottom> - $g_songlist_last_visible_index)
		<new_list_index> = <new_list_top>
		<jump> = (<new_list_index> - <list_index>)
	endif
	if ($g_songlist_create_playlist_menu_item_present = 1)
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	songlist_clear_menus
	songlist :SetTags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = false
		list_dirty = true
	}
	ContentManFunc {
		func = request_data
		name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = songlist_fast_page_data_request_callback
	}
	songlist_update_slider_nub_pos Dir = down count = (<jump>)
	songlist_reset_hilight_bar_pos
endscript

script songlist_fast_page_data_request_callback 
	songlist_data_request_callback <...> dont_add_non_song_item
endscript

script songlist_scroll_up 
	if ScreenElementExists \{id = songlist}
		songlist :GetTags
		if (<list_dirty> = true)
			return
		endif
		<do_page_up_logic> = 0
		if (<list_page_size> > ($g_songlist_last_visible_index + 1))
			if NOT (<list_top> = 0)
				<do_page_up_logic> = 1
			endif
		endif
		if (<do_page_up_logic> = 1)
			<button> = triangle
			if IsPS3
				<button> = square
			endif
			if ControllerPressed <button> <exclusive_device>
				SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
				songlist_page_up
				return
			endif
		endif
		if (<list_index> >= 0)
			list_index = (<list_index> - 1)
			if (<list_index> < 0)
				ContentManFunc {
					func = more_data
					name = <list_name>
					page_up
					callback = songlist_more_data_up_callback
				}
			else
				if (<mode> = play_song)
					songlist_scroll_sfx
				elseif (<mode> = playlist)
					playlist_scroll_sfx
				elseif (<mode> = music_store)
					Music_Store_Scroll_SFX
				else
					songlist_scroll_sfx
				endif
				songlist_update_slider_nub_pos \{Dir = up}
				songlist_update_hilight_bar_pos \{Dir = up}
				if (<list_index> < <list_top>)
					if (<list_top> > 0)
						list_top = (<list_top> - 1)
						list_bottom = (<list_bottom> - 1)
						ContentManFunc {
							func = request_data
							name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				songlist :SetTags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_up 
	songlist :GetTags
	if (<mode> = play_song)
		songlist_scroll_sfx
	elseif (<mode> = playlist)
		playlist_scroll_sfx
	elseif (<mode> = music_store)
		Music_Store_Scroll_SFX
	else
		songlist_scroll_sfx
	endif
	<page_size> = ($g_songlist_last_visible_index + 1)
	<jump> = (<hilight_bar_index> + 1)
	<new_list_index> = (<list_index> - <jump>)
	<new_list_top> = (<list_top> - <page_size>)
	<new_list_bottom> = (<list_bottom> - <page_size>)
	if (<new_list_top> < (0 - $g_songlist_create_playlist_menu_item_present))
		<new_list_bottom> = ($g_songlist_last_visible_index - $g_songlist_create_playlist_menu_item_present)
		<new_list_top> = 0
		<new_list_index> = ($g_songlist_last_visible_index - $g_songlist_create_playlist_menu_item_present)
		<jump> = (<list_index> - <new_list_index>)
		if (<mode> = play_song)
			GameMode_GetType
			if NOT (<type> = career)
				<jump> = (<jump> + 1)
			endif
		endif
		<callback> = songlist_data_request_callback
	else
		<callback> = songlist_fast_page_data_request_callback
	endif
	songlist_clear_menus
	songlist :SetTags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = false
		list_dirty = true
	}
	ContentManFunc {
		func = request_data
		name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = <callback>
	}
	songlist_update_slider_nub_pos Dir = up count = (<jump>)
	songlist_reset_hilight_bar_pos
	songlist_update_hilight_bar_pos Dir = down count = ($g_songlist_last_visible_index)
	begin
	songlist :GetSingleTag \{list_dirty}
	if (<list_dirty> = false)
		LaunchEvent \{type = unfocus
			target = current_menu}
		LaunchEvent type = focus target = current_menu data = {child_index = ($g_songlist_last_visible_index)}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script songlist_more_data_down_callback 
	if NOT ScreenElementExists \{id = songlist}
		return
	endif
	songlist :GetTags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		Change g_songlist_current_page = ($g_songlist_current_page + 1)
		ContentManFunc {
			func = request_page
			name = <list_name>
			page_down
			seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_down_callback
		}
		songlist :SetTags \{list_dirty = true}
	endif
endscript

script songlist_more_data_up_callback 
	if NOT ScreenElementExists \{id = songlist}
		return
	endif
	songlist :GetTags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		Change g_songlist_current_page = ($g_songlist_current_page - 1)
		ContentManFunc {
			func = request_page
			name = <list_name>
			page_up
			seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_up_callback
		}
		songlist :SetTags \{list_dirty = true}
	else
		if (<mode> = play_song)
			GameMode_GetType
			if (<type> = career)
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
	if NOT ScreenElementExists \{id = songlist}
		return
	endif
	songlist_page_request <...> Dir = up
	songlist_update_slider_nub_pos \{Dir = up}
endscript

script songlist_page_request_down_callback 
	if NOT ScreenElementExists \{id = songlist}
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
	songlist :GetTags
	songlist_calculate_slider_nub_res page_size = <content_size>
	FormatText TextName = num_songs qs(0xc31d83ea) i = <content_size>
	songlist :SE_SetProps songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0xd20d2af6)}
		else
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x08cb5377)}
		else
			songlist :SE_SetProps \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
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
		songlist :SetTags {
			list_page_size = <page_size>
			list_index = <seek_index>
			list_top = <list_top>
			list_bottom = <list_bottom>
			list_dirty = false
		}
		ContentManFunc {
			func = request_data
			name = <list_name>
			start_index = <list_top>
			end_index = <list_bottom>
			callback = songlist_data_request_callback
		}
	else
		ScriptAssert \{qs(0x869440a1)}
	endif
endscript

script songlist_calculate_slider_nub_res 
	songlist :GetSingleTag \{mode}
	if (<mode> = play_song)
		GameMode_GetType
		if NOT (<type> = career)
			<page_size> = (<page_size> + 1)
		endif
	endif
	if (<page_size> > 1)
		songlist :GetSingleTag \{mode}
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
	songlist :GetSingleTag \{slider_nub_res}
	songlist_slider_nub_cont :SE_GetProps \{Pos}
	if (<Dir> = down)
		songlist_slider_nub_cont :SE_SetProps Pos = (<Pos> + (<slider_nub_res> * (0.0, 1.0) * <count>))
	else
		songlist_slider_nub_cont :SE_SetProps Pos = (<Pos> - (<slider_nub_res> * (0.0, 1.0) * <count>))
	endif
endscript

script songlist_update_hilight_bar_pos \{Dir = down
		count = 1}
	songlist :GetSingleTag \{hilight_bar_res}
	songlist :GetSingleTag \{hilight_bar_index}
	songlist_hilight_bar_cont :SE_GetProps \{Pos}
	if (<Dir> = down)
		if (<hilight_bar_index> = $g_songlist_last_visible_index)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> + <count>)
			songlist :SetTags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :SE_SetProps Pos = (<Pos> + (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	else
		if (<hilight_bar_index> = 0)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> - <count>)
			songlist :SetTags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :SE_SetProps Pos = (<Pos> - (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	endif
endscript

script songlist_reset_hilight_bar_pos 
	songlist :SetTags \{hilight_bar_index = 0}
	songlist :GetSingleTag \{mode}
	if (<mode> = music_store || <mode> = import)
		songlist_hilight_bar_cont :SE_SetProps Pos = ($g_songlist_music_store_hilight_pos)
	else
		songlist_hilight_bar_cont :SE_SetProps \{Pos = (-641.0, -130.0)}
	endif
endscript

script songlist_slide_scroll 
	GetLogicFrame
	last_change = <LogicFrame>
	last_button = 0
	CreateScreenElement \{parent = root_window
		type = SpriteElement
		texture = white
		Pos = (550.0, 500.0)
		dims = (20.0, 50.0)
		just = [
			left
			center
		]}
	rate = 0.0
	damper = 0.8
	rate_scale = 100.0
	begin
	if GuitarGetTouchPattern \{player = 1}
		GetLogicFrame
		if (<touch_pattern> < <last_button>)
			last_button = <touch_pattern>
			if (<rate> >= 0)
				if NOT (<LogicFrame> = <last_change>)
					rate = ((<rate> + (<rate_scale> / (<LogicFrame> - <last_change>))) / 2)
				endif
			else
				rate = 0
			endif
			last_change = <LogicFrame>
			rot_angle = 0
		elseif (<touch_pattern> > <last_button>)
			last_button = <touch_pattern>
			if (<rate> <= 0)
				if NOT (<LogicFrame> = <last_change>)
					rate = ((<rate> + (<rate_scale> / (<last_change> - <LogicFrame>))) / 2)
				endif
			else
				rate = 0
			endif
			last_change = <LogicFrame>
			rot_angle = 180
		endif
	endif
	if ((<rate> > 0.1) || (<rate> < -0.1))
		rate = (<damper> * <rate>)
	else
		rate = 0
	endif
	mathFloor <rate>
	CastToInteger \{floor}
	SetScreenElementProps id = <id> scale = ((0.0, 1.0) + ((1.0, 0.0) * <floor>)) rot_angle = <rot_angle>
	wait \{5
		gameframes}
	repeat
endscript

script songlist_back 
	songlist :GetSingleTag \{mode}
	GameMode_GetType
	if (<mode> = music_store)
		songlist :GetSingleTag \{visited_band_hub}
		if GotParam \{visited_band_hub}
			Change \{g_music_store_current_pack_checksum = null}
			Change \{g_songlist_last_visible_index = 4}
			songlist :SetTags \{music_store_seek_override = true}
			songlist_music_store_disallow_sorting
			songlist_music_store_go_to_hub
		else
			destroy_dialog_box
			generic_event_back \{state = uistate_mainmenu}
		endif
	elseif (<mode> = import || <mode> = sing_a_long)
		ui_event \{event = menu_back}
	elseif (<mode> = leaderboard || <mode> = toprockers)
		songlist_leaderboard_back
	elseif (<type> = practice)
		ui_event \{event = menu_back
			data = {
				songlist_change_canceled = true
			}}
	elseif (<type> = freeplay)
		if (<mode> = playlist)
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{type = unfocus
					target = current_menu}
				current_menu :SE_SetProps \{block_events}
			endif
			songlist :GetSingleTag \{exclusive_device}
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
	elseif (<type> = career)
		if InNetGame
			if ($net_song_countdown = 0)
				if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
					net_career_songlist_back
				elseif ($primary_controller = <device_num>)
					if ScreenElementExists \{id = current_menu}
						LaunchEvent \{type = unfocus
							target = current_menu}
						current_menu :SE_SetProps \{block_events}
					endif
					generic_event_choose \{state = UIstate_online_quit_warning
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
	elseif PlayerInfoEquals ($g_net_leader_player_num) controller = <device_num>
		if ((($g_lobby_net_state = local) || ($g_lobby_net_state = net_private)) && ($net_song_countdown = 0))
			if ui_event_exists_in_stack \{name = 'team_select'}
				state = UIstate_team_select
			else
				if InInternetMode
					if IsHost
						quit_online_now
						return
					endif
				else
					state = UIstate_band_lobby_setup
				endif
			endif
			if InInternetMode
				SendStructure callback = ui_event data_to_send = {event = menu_back data = {state = <state>}}
			endif
			ui_event event = menu_back data = {state = <state>}
		elseif ($g_lobby_net_state = net_public && ($net_song_countdown = 0))
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{type = unfocus
					target = current_menu}
				current_menu :SE_SetProps \{block_events}
			endif
			generic_event_choose \{state = UIstate_online_quit_warning
				data = {
					is_popup
				}}
		endif
		hide_glitch \{num_frames = 10}
	elseif ($primary_controller = <device_num>)
		if InNetGame
			if ($net_song_countdown = 0)
				if ScreenElementExists \{id = current_menu}
					LaunchEvent \{type = unfocus
						target = current_menu}
					current_menu :SE_SetProps \{block_events}
				endif
				generic_event_choose \{state = UIstate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		else
			ui_event \{event = menu_back
				data = {
					state = UIstate_band_lobby_setup
				}}
		endif
	endif
endscript

script songlist_freeplay_revert_playlist 
	destroy_dialog_box
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
	if (<desc> = Songlist_detail)
		Songlist_detail :SE_GetProps
		<do_transition> = 0
		if GotParam \{force_transition}
			<do_transition> = 1
		endif
		if NOT (<alpha> = 1.0)
			<do_transition> = 1
		endif
		if (<do_transition> = 1)
			songlist :GetSingleTag \{mode}
			if NOT (<mode> = music_store)
				songlist_detail_playlist :SE_SetProps \{alpha = 0.0}
				if ($g_songlist_show_more_info = 1)
					Songlist_detail :SE_SetProps \{songlist_detail_frame_1_cont_alpha = 0.0
						songlist_detail_frame_2_cont_alpha = 1.0}
				else
					Songlist_detail :SE_SetProps \{songlist_detail_frame_1_cont_alpha = 1.0
						songlist_detail_frame_2_cont_alpha = 0.0}
				endif
			endif
			Songlist_detail :SE_SetProps alpha = 1.0 time = <fade_time>
			Songlist_detail :SE_WaitProps
		endif
	else
		songlist_detail_playlist :SE_GetProps
		<do_transition> = 0
		if GotParam \{force_transition}
			<do_transition> = 1
		endif
		if NOT (<alpha> = 1.0)
			<do_transition> = 1
		endif
		if (<do_transition> = 1)
			Songlist_detail :SE_SetProps \{alpha = 0.0}
			songlist_detail_playlist :SE_SetProps alpha = 1.0 time = <fade_time>
			songlist_detail_playlist :SE_WaitProps
		endif
	endif
endscript

script songlist_sort_toggle 
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	songlist :GetSingleTag \{mode}
	current_menu :GetSingleTag \{tag_selected_index}
	if NOT GotParam \{tag_selected_index}
		return
	endif
	if (<mode> = music_store)
		songlist :GetSingleTag \{visited_band_hub}
		if NOT GotParam \{visited_band_hub}
			return
		endif
	endif
	current_menu :SE_SetProps \{block_events}
	songlist_change_sort_index index = ($g_songlist_sort_index + 1)
	sort_songlist_sfx
	GetArraySize \{$g_songlist_sort_array}
	if ($g_songlist_sort_index = <array_size>)
		songlist_change_sort_index \{index = 0}
	endif
	songlist_update_song_preview \{song = None}
	songlist_hilight_bar_cont :SE_SetProps \{alpha = 0.0}
	songlist_slider_nub_cont :SE_SetProps \{alpha = 0.0}
	songlist_refresh_menus
	current_menu :SE_SetProps \{unblock_events}
endscript

script songlist_refresh_menus 
	songlist_clear_menus
	songlist :GetSingleTag \{mode}
	if NOT GotParam \{no_pivot}
		songlist :GetSingleTag \{list_index}
		songlist :GetSingleTag \{hilight_bar_index}
		Change g_songlist_current_pivot = <list_index>
		Change g_songlist_pivot_hilight_index = <hilight_bar_index>
	else
		Change \{g_songlist_current_pivot = 0}
		Change \{g_songlist_pivot_hilight_index = 0}
	endif
	songlist :SetTags {
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_page_size = 0
		slider_nub_res = 0
		list_dirty = false
		initial_built = false
	}
	if (<mode> = music_store)
		<slider_pos> = (-14.0, 60.0)
	else
		<slider_pos> = (0.0, 16.0)
	endif
	if (<mode> = playlist)
		Songlist_detail :SE_SetProps \{songlist_detail_mini_playlistt_text_alpha = 1.0}
	else
	endif
	songlist_slider_nub_cont :SE_SetProps Pos = <slider_pos>
	songlist_reset_hilight_bar_pos
	songlist_update_ui
	songlist_pre_build
	if NOT GotParam \{no_focus}
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script songlist_clear_menus 
	songlist :GetSingleTag \{mode}
	DestroyScreenElement \{id = current_menu
		preserve_parent}
	if NOT (<mode> = music_store)
		DestroyScreenElement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		DestroyScreenElement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
	endif
	SetScreenElementLock \{id = current_menu
		off}
	SetScreenElementLock \{id = current_menu
		on}
	if NOT (<mode> = music_store || <mode> = import)
		SetScreenElementLock \{id = songlist_detail_playlist_vmenu
			off}
		SetScreenElementLock \{id = songlist_detail_playlist_vmenu
			on}
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			off}
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			on}
	endif
endscript

script songlist_leaderboard_back 
	menu_music_on
	generic_event_back
endscript

script songlist_determine_leaderboard_instrument_setup 
	band_contains_guitar = false
	band_is_only_guitar = false
	band_contains_bass = false
	band_is_only_bass = false
	band_contains_vocals = false
	band_is_only_vocals = false
	band_contains_drum = false
	band_is_only_drum = false
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
		band_is_only_guitar = false
		band_is_only_bass = false
		band_is_only_drum = false
		band_is_only_vocals = false
	endswitch
	return band_instrument_setup = {
		guitar = {
			contains = <band_contains_guitar>
			only = <band_is_only_guitar>
		}
		bass = {
			contains = <band_contains_bass>
			only = <band_is_only_bass>
		}
		Drum = {
			contains = <band_contains_drum>
			only = <band_is_only_drum>
		}
		vocals = {
			contains = <band_contains_vocals>
			only = <band_is_only_vocals>
		}
	}
endscript

script songlist_determine_band_instrument_setup 
	band_contains_guitar = false
	band_is_only_guitar = true
	band_contains_bass = false
	band_is_only_bass = true
	band_contains_vocals = false
	band_is_only_vocals = true
	band_contains_drum = false
	band_is_only_drum = true
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		switch <part>
			case guitar
			band_contains_guitar = true
			band_is_only_bass = false
			band_is_only_vocals = false
			band_is_only_drum = false
			case bass
			band_contains_bass = true
			band_is_only_guitar = false
			band_is_only_vocals = false
			band_is_only_drum = false
			case vocals
			band_contains_vocals = true
			band_is_only_guitar = false
			band_is_only_bass = false
			band_is_only_drum = false
			case Drum
			band_contains_drum = true
			band_is_only_guitar = false
			band_is_only_bass = false
			band_is_only_vocals = false
		endswitch
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	songlist :GetSingleTag \{mode}
	if (<mode> = sing_a_long)
		band_contains_vocals = true
		band_is_only_vocals = true
		band_is_only_guitar = false
		band_is_only_bass = false
		band_is_only_drum = false
	endif
	return band_instrument_setup = {
		guitar = {
			contains = <band_contains_guitar>
			only = <band_is_only_guitar>
		}
		bass = {
			contains = <band_contains_bass>
			only = <band_is_only_bass>
		}
		Drum = {
			contains = <band_contains_drum>
			only = <band_is_only_drum>
		}
		vocals = {
			contains = <band_contains_vocals>
			only = <band_is_only_vocals>
		}
	}
endscript

script songlist_go_to_sing_a_long 
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	if InInternetMode
		return
	endif
	songlist_clear_playlist
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> = 0)
		if isXenon
			body_text = qs(0x78cea484)
		else
			body_text = qs(0x2330dbce)
		endif
		options = [
			{
				func = generic_event_back
				text = qs(0x0e41fe46)
			}
		]
		generic_event_choose state = UIstate_generic_dialog_box data = {back_button_script = generic_event_back template = cancel_confirm heading_text = qs(0xaa163738) body_text = <body_text> options = <options>}
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
	songlist :GetTags
	printstruct <...>
	printf \{qs(0xcb943ab3)}
endscript

script musicstore_format_price_text 
	if IsXenonOrWinDX
		FormatText TextName = price_text qs(0x581d2af2) p = <price>
	else
		FormatDecimals integer = <price> fractional = <price_fraction> num_decimals = <currency_decimals>
	endif
	return price_text = <price_text>
endscript

script Music_Store_Scroll_SFX 
	SoundEvent \{event = GHMix2_Scroll_Sound_01}
endscript

script music_store_select_sfx 
	SoundEvent \{event = GHMix2_Select_Sound}
endscript

script music_store_back_sfx 
	SoundEvent \{event = GHMix2_Back_Sound}
endscript

script music_store_determine_currency 
	if IsPS3
		if MarketplaceFunc \{func = get_currency_info}
			return true currency = <currency_code> currency_decimals = <currency_decimals>
		else
			ScriptAssert \{'Currency info fetch failed'}
		endif
	endif
	return \{false}
endscript

script create_ui_highlight_particles \{parent = root_window
		id = ui_star_particles
		Pos = (0.0, 0.0)
		z = 1
		start_scale = (0.05, 0.05)
		end_scale = (0.4, 0.4)
		emit_spread = 5.0
		velocity = 1.5}
	Obj_GetID
	<parent> = <objID>
	Destroy2DParticleSystem id = <id>
	Create2DParticleSystem {
		id = <id>
		Pos = <Pos>
		parent = <parent>
		z_priority = <z>
		texture = circle_gradient_64
		blend = add
		start_color = [230 160 255 190]
		end_color = [90 15 80 50]
		start_scale = <start_scale>
		end_scale = <end_scale>
		start_angle_spread = 360.0
		min_rotation = -500
		max_rotation = 500
		emit_start_radius = 700.0
		emit_radius = 700.0
		Emit_Rate = 0.08
		emit_dir = 270
		emit_spread = <emit_spread>
		velocity = <velocity>
		friction = (0.1, 0.01)
		time = 2.5
		update_when_game_paused
	}
	wait \{1
		gameframe}
endscript
