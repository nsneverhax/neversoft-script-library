g_force_songlist_dlc_scan = 0

script songlist_create \{locked = FALSE
		exclusive_device = -1
		list_name = !q1768515945
		mode = !q1768515945}
	Change g_songlist_sort_index = ($g_songlist_sort_indexes.<mode>)
	SpawnScriptNow \{audio_gameplay_crowd_stop_all_paused_sounds}
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	uistack_createboundscreenelement \{parent = root_window
		id = SongList
		Type = descinterface
		desc = 'songlist'
		alpha = 0.0}
	if NOT is_current_playlist_empty
		SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	if (music_store != <mode>)
		SongList :Obj_SpawnScriptLater attempt_to_add_friend_feed params = {menu = SongList parent_id = SongList songlist_mode = <mode>}
	endif
	if (<mode> = music_store)
		if isps3
			music_store_set_playstation_logo
		endif
		SongList :se_setprops \{songlist_bg_illo_alpha = 0.0
			music_store_bg_illo_alpha = 1.0
			songlist_tab_in_focus_alpha = 0.0
			songlist_tab_out_focus_alpha = 0.0
			music_store_tab_in_focus_alpha = 1.0
			music_store_tab_out_focus_alpha = 0.0
			songlist_sticky_header_text = qs(0x03ac90f0)}
	endif
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	SpawnScriptNow \{audio_crowd_silence_front_end}
	if SongList :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = songlist_scrollbar_wgt
		generic_scrollbar_wgt_initialize \{id = songlist_scrollbar_wgt}
	else
		ScriptAssert \{qs(0x7631f46d)}
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		printf \{qs(0xc1a5acd2)}
		AssignAlias id = <resolved_id> alias = current_menu
		controller = ($primary_controller)
		if (<mode> = practice || <mode> = leaderboard)
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
		if (<exclusive_device> = -1 || <bot_play> > 0)
			exclusive_device = <controller>
		endif
		<resolved_id> :se_setprops exclusive_device = <exclusive_device>
		songlist_component :SetTags {
			savegame_device = <controller>
			exclusive_device = <exclusive_device>
		}
		if NOT (<mode> = music_store)
			if NOT InNetGame
				if SongList :desc_resolvealias \{Name = alias_rank_capsule}
					AssignAlias id = <resolved_id> alias = rank_capsule
				else
					ScriptAssert \{qs(0xa17b0513)}
				endif
				get_local_in_game_player_num_from_controller controller_index = <controller>
				quickplay_get_overall_awards_progress Player = <player_num>
				quickplay_get_recent_award_points Player = <player_num>
				rank_capsule :Obj_SpawnScriptNow qp_earned_stars_animate_rank_meter params = {
					total_time = 0.0
					Player = <player_num>
					desc_id = SongList
				}
				rank_capsule :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
					local_id = <controller>
					local_user_index = <controller>
					se_prop = gamerpic_texture
					failure_texture = icon_gh6
				}
			else
				SongList :se_setprops \{rank_capsule_alpha = 0.0}
			endif
		endif
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> songlist_options params = {show_more_info show_ghtunes}
		if demobuild
			<show_ghtunes> = 0
		endif
		Change g_songlist_show_more_info = <show_more_info>
		Change g_songlist_show_ghtunes = <show_ghtunes>
		if NOT (<mode> = music_store)
			if allow_show_ghtunes_toggle
				if (<show_ghtunes> = 0)
					filterspec = [
						{
							key = song_source
							union_list = [ghtunes]
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
	if SongList :desc_resolvealias \{Name = alias_songlist_smenu}
		AssignAlias id = <resolved_id> alias = songlist_smenu
	else
		ScriptAssert \{qs(0xe0d6cecf)}
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_detail_cont}
		AssignAlias id = <resolved_id> alias = songlist_detail_cont
	else
		ScriptAssert \{qs(0xf7d498a7)}
	endif
	songlist_create_detail_desc mode = <mode>
	<back_button> = pad_btn_right
	<event_handlers> = [
		{<back_button> songlist_back_sfx}
		{<back_button> generic_blocking_execute_script params = {pad_script = songlist_back}}
	]
	if (<mode> = music_store)
		<content_source> = marketplace
		<list_name> = marketplace
		songlist_component :SetTags \{music_store_mode = hub
			music_store_seek_override = true
			visited_hub = 0
			tab_enabled = 0}
	else
		if NOT demobuild
			<sort_option> = {pad_L1 songlist_go_to_options params = {Type = sort}}
			AddArrayElement array = <event_handlers> element = <sort_option>
			<event_handlers> = <array>
		endif
		<tab_enabled> = 0
		if songlist_allow_music_store_toggling controller = <controller>
			<tab_option> = {pad_select generic_blocking_execute_script params = {pad_script = songlist_go_to_music_store_tab}}
			AddArrayElement array = <event_handlers> element = <tab_option>
			<event_handlers> = <array>
			<tab_enabled> = 1
		else
			SongList :se_setprops \{songlist_tab_in_focus_alpha = 1.0
				songlist_tab_out_focus_alpha = 0.0
				music_store_tab_in_focus_alpha = 0.0
				music_store_tab_out_focus_alpha = 0.0}
		endif
		songlist_component :SetTags {
			tab_enabled = <tab_enabled>
		}
		<content_source> = local_song_list
	endif
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
	current_menu :se_setprops \{block_events}
	getterritory
	songlist_component :membfunc_songlist_uistack_initialize
	songlist_component :membfunc_songlist_uistack_setmode mode = <mode>
	songlist_component :membfunc_songlist_uistack_setlistname list_name = <list_name>
	songlist_component :SetTags {
		list_dirty = FALSE
		initial_built = FALSE
		requires_build = true
		locked = <locked>
		content_source = <content_source>
		territory = <territory>
		controller = <controller>
		jump_enabled = 1
	}
	songlist_init_music_store
	gamemode_gettype
	if NOT (<mode> = music_store || <Type> = freeplay)
		if (<mode> = leaderboard)
			songlist_determine_leaderboard_instrument_setup
		else
			songlist_determine_band_instrument_setup
		endif
		songlist_component :SetTags {
			band_instrument_setup = <band_instrument_setup>
		}
	endif
	songlist_update_ui
	songlist_scrollbar_wgt :se_setprops \{scroll_thumb_pos = (0.0, 0.0)}
	if ininternetmode
		net_songlist_leader_text
	endif
	if (<mode> = playlist)
		songlist_remove_unavailable_songs_from_playlist
	endif
endscript

script songlist_create_detail_desc \{mode = !q1768515945}
	if ScreenElementExists \{id = songlist_detail}
		DestroyScreenElement \{id = songlist_detail}
	endif
	if (<mode> = music_store)
		CreateScreenElement \{Type = descinterface
			desc = 'songlist_detail_music_store'
			id = songlist_detail
			parent = songlist_detail_cont
			alpha = 0.0
			Pos = (13.0, 15.0)}
		songlist_detail :se_setprops {
			patch_req_message_text = ($g_music_store_patch_req_message)
		}
		songlist_music_store_assign_text_aliases
	else
		if (<mode> = practice || <mode> = leaderboard)
			<player_num> = 1
		else
			songlist_component :obj_getintegertag \{tag_name = exclusive_device}
			get_local_in_game_player_num_from_controller controller_index = <integer_value>
		endif
		if isSinglePlayerGame
			getplayerinfo <player_num> part
			getplayerinfo <player_num> difficulty
			<out_icon_alpha> = 1
			<band_icon_alpha> = 0
		else
			<part> = Band
			get_highest_difficulty
			<difficulty> = <highest_difficulty>
			<out_icon_alpha> = 0
			<band_icon_alpha> = 1
		endif
		<difficulty_alpha> = 1
		get_difficulty_text_nl difficulty = <difficulty>
		formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
		formatText checksumName = instrument_out 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
		formatText checksumName = instrument_fill 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
		if (<mode> = leaderboard)
			instrument_text_nl = ($current_leaderboard_instrument)
			if (<instrument_text_nl> = 'band' || <instrument_text_nl> = 'altband')
				<out_icon_alpha> = 0
				<band_icon_alpha> = 1
			else
				if (<instrument_text_nl> = 'backup')
					<instrument_text_nl> = 'bass'
				elseif (<instrument_text_nl> = 'drums')
					<instrument_text_nl> = 'drum'
				elseif (<instrument_text_nl> = 'mic')
					<instrument_text_nl> = 'vocals'
				endif
				formatText checksumName = instrument_out 'icon_%i_out' i = <instrument_text_nl>
				formatText checksumName = instrument_fill 'icon_%i_fill' i = <instrument_text_nl>
			endif
			<difficulty_alpha> = 0
		endif
		CreateScreenElement {
			Type = descinterface
			desc = 'songlist_detail'
			id = songlist_detail
			parent = songlist_detail_cont
			alpha = 1.0
			songlist_detail_difficulty_icon_texture = <difficulty_icon>
			songlist_detail_difficulty_icon_alpha = <difficulty_alpha>
			songlist_detail_instrument_icon_out_texture = <instrument_out>
			songlist_detail_instrument_icon_fill_texture = <instrument_fill>
			songlist_detail_instrument_icon_out_alpha = <out_icon_alpha>
			songlist_detail_instrument_icon_fill_alpha = <out_icon_alpha>
			songlist_detail_instrument_icon_band_alpha = <band_icon_alpha>
		}
		if (<mode> = playlist)
			<id> :se_setprops alpha = 1.0
			<id> :se_setprops songlist_detail_mini_playlistt_text_alpha = 1.0
		endif
		if ($g_songlist_show_more_info = 1)
			if NOT (<mode> = leaderboard)
				if NOT ininternetmode
					songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
						songlist_detail_frame_2_cont_alpha = 1.0}
				endif
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
	endif
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
	songlist_detail :SetTags \{prev_guitar_diff_rate = 0
		prev_bass_diff_rate = 0
		prev_drums_diff_rate = 0
		prev_vocals_diff_rate = 0
		prev_stars = 0}
endscript

script songlist_music_store_assign_text_aliases \{desc = songlist_detail}
	if ScreenElementExists id = <desc>
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
endscript

script songlist_remove_unavailable_songs_from_playlist 
	songlist_options_check_relevance
	if (<list_relevant> = FALSE)
		Change current_playlist = <override_array>
		SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
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
		songlist_component :GetSingleTag \{exclusive_device}
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
	songlist_component :membfunc_songlist_uistack_getmode
	Change \{g_songlist_warning_active = 0}
	songlist_create_default_user_control_helpers mode = <mode>
	if NOT is_current_playlist_empty
		if NOT ininternetmode
			songlist_allow_continue
		endif
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{unblock_events}
		<tag_selected_index> = 0
		current_menu :GetSingleTag \{tag_selected_index}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent Type = focus target = current_menu data = {child_index = <tag_selected_index>}
	endif
endscript

script songlist_calculate_playlist_duration 
	songlist_component :membfunc_songlist_uistack_getmode
	if NOT (<mode> = leaderboard || <mode> = practice)
		GetArraySize \{$current_playlist}
		get_savegame_from_controller controller = ($primary_controller)
		if (<array_Size> > 0)
			<i> = 0
			<total_seconds> = 0
			begin
			<song_not_found> = FALSE
			get_ui_song_struct_items song = (($current_playlist) [<i>]) savegame = <savegame>
			if (<song_not_found> = FALSE)
				<total_seconds> = (<total_seconds> + (<ui_struct>.song_duration))
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			<time_array> = []
			AddArrayElement array = <time_array> element = <total_seconds>
			rr_get_time_string data = <array> new_format = 1
			SongList :se_setprops {
				playlist_duration_text = <data_text>
				playlist_duration_cont_alpha = 1.0
			}
		else
			SongList :se_setprops \{playlist_duration_text = qs(0x369c70d7)
				playlist_duration_cont_alpha = 0.0}
		endif
	endif
endscript

script songlist_update_ui 
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			import_esrb_label_alpha = 0.0
			SongList :se_setprops {
				import_esrb_label_alpha = <import_esrb_label_alpha>
			}
		endif
	else
		SongList :se_setprops {
			songlist_title_text_text = ($g_songlist_modes.<mode>.title)
		}
	endif
	<event_handlers> = [
		{pad_up generic_blocking_execute_script params = {pad_script = songlist_scroll_up}}
		{pad_down generic_blocking_execute_script params = {pad_script = songlist_scroll_down}}
	]
	if NOT (<mode> = music_store)
		if NOT ininternetmode
			if NOT demobuild
				gamemode_gettype
				if ((<Type> = career) || (<mode> = practice))
					<mp_option> = {pad_select songlist_toggle_more_info}
					AddArrayElement array = <event_handlers> element = <mp_option>
					<event_handlers> = <array>
				elseif (<mode> = leaderboard)
					<mp_option> = {pad_select nullscript}
					AddArrayElement array = <event_handlers> element = <mp_option>
					<event_handlers> = <array>
				endif
			endif
		endif
	endif
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{visited_hub}
		if (<visited_hub> = 1)
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			SongList :se_setprops \{songlist_sticky_header_alpha = 1.0}
			if isps3
				SongList :se_setprops \{music_store_playstation_logo_alpha = 1.0}
			endif
		endif
	endif
endscript

script songlist_toggle_more_info 
	if ($g_songlist_show_more_info = 0)
		Change \{g_songlist_show_more_info = 1}
		user_control_helper_change_text \{button = back
			text = qs(0x0d424947)}
		ui_sfx \{menustate = leaderboard
			uitype = stats_on}
		songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
			songlist_detail_frame_2_cont_alpha = 1.0}
	else
		Change \{g_songlist_show_more_info = 0}
		user_control_helper_change_text \{button = back
			text = qs(0x6644ffc7)}
		ui_sfx \{menustate = leaderboard
			uitype = stats_off}
		songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 1.0
			songlist_detail_frame_2_cont_alpha = 0.0}
	endif
endscript

script songlist_go_to_options \{Type = !q1768515945}
	current_menu :se_setprops \{block_events}
	Wait \{1
		gameframe}
	if ScreenElementExists \{id = songlist_options}
		return
	endif
	if ScriptIsRunning \{songlist_continue}
		return
	endif
	songlist_component :GetSingleTag \{exclusive_device}
	songlist_component :GetSingleTag \{savegame_device}
	if GotParam \{exclusive_device}
		ui_sfx \{menustate = setlist
			uitype = select}
		if (<Type> = main)
			generic_event_choose {
				state = uistate_songlist_options
				data = {
					is_popup
					Type = <Type>
					exclusive_device = <exclusive_device>
					savegame_device = <savegame_device>
					song_item_id = <song_item_id>
					song_options_struct = <song_options_struct>
				}
			}
		elseif (<Type> = music_store)
			generic_event_choose {
				state = uistate_songlist_options
				data = {
					is_popup
					Type = <Type>
					exclusive_device = <exclusive_device>
					savegame_device = <savegame_device>
					purchase_struct = <purchase_struct>
					song_item_id = <song_item_id>
				}
			}
		else
			generic_event_choose {
				state = uistate_songlist_options
				data = {
					is_popup
					Type = <Type>
					exclusive_device = <exclusive_device>
					savegame_device = <savegame_device>
				}
			}
		endif
	else
		ScriptAssert \{qs(0x098ea72c)}
	endif
endscript

script songlist_music_store_go_to_hub 
	songlist_component :membfunc_songlist_uistack_getlistname
	<i> = 0
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		break
	endif
	<i> = (<i> + 1)
	Wait \{0.1
		Seconds}
	repeat 200
	if NOT (<i> < 199)
		callback_marketplace_content_general_timedout
		return
	endif
	current_menu :se_setprops \{alpha = 0.0}
	if isps3
		SongList :se_setprops \{music_store_playstation_logo_alpha = 0.0}
	endif
	songlist_component :GetSingleTag \{territory}
	if (<territory> != territory_us)
		<esrb_notice_alpha> = 0.0
	else
		<esrb_notice_alpha> = 1.0
	endif
	SongList :se_setprops {
		songlist_sticky_header_alpha = 0.0
		music_store_tab_subheader_alpha = 0.0
		songlist_songs_available_text_text = qs(0x03ac90f0)
		songlist_songs_available_num_text = qs(0x03ac90f0)
		pa_esrb_label_alpha = 0.0
		esrb_notice_alpha = <esrb_notice_alpha>
	}
	songlist_component :membfunc_songlist_uistack_initialize
	Change \{g_music_store_viewing_pack_songs = 0}
	songlist_component :GetSingleTag \{exclusive_device}
	ui_event_wait_for_safe
	generic_event_choose no_sound state = uistate_music_store_hub data = {is_popup exclusive_device = <exclusive_device>}
endscript

script songlist_content_source_init 
	if NOT ininternetmode
		if NOT ui_event_exists_in_stack \{Name = 'freeplay'}
			marketplacepersistencefunc \{func = check_for_user_change}
			if NOT marketplacepersistencefunc \{func = is_initialized}
				marketplacepersistencefunc \{func = restart}
			endif
		endif
	endif
	songlist_component :GetSingleTag \{content_source}
	songlist_component :membfunc_songlist_uistack_getlistname
	songlist_component :membfunc_songlist_uistack_getlistregistered
	if (<list_registered> = 0)
		contentmanfunc func = register_content_source Name = <list_name> Type = <content_source>
		songlist_component :membfunc_songlist_uistack_getmode
		if (<mode> = music_store)
			songlist_component :Obj_SpawnScriptNow \{monitor_marketplace_persistence_for_error}
		endif
		songlist_component :membfunc_songlist_uistack_setlistregistered \{list_registered = 1}
	endif
endscript

script songlist_pre_build 
	songlist_content_source_init
	songlist_component :SetTags \{list_dirty = true}
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		(($g_songlist_sort_array [($g_songlist_sort_index)]).Progression)
	}
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_component :GetSingleTag \{visited_hub}
	if (<mode> = music_store)
		if (<visited_hub> = 0)
			songlist_component :SetTags \{visited_hub = 1}
			SongList :se_setprops \{alpha = 1.0}
			SongList :Obj_SpawnScriptNow \{songlist_music_store_go_to_hub}
			return
		endif
	endif
	SongList :Obj_SpawnScriptNow songlist_request_initial_page_when_ready params = {sortspec = <sortspec>}
endscript

script songlist_request_initial_page_when_ready 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_component :membfunc_songlist_uistack_getlistname
	get_savegame_from_controller controller = ($primary_controller)
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		if (<mode> = music_store)
			destroy_dialog_box
		endif
		songlist_component :membfunc_songlist_uistack_getfilterspec
		<content_man_params> = {
			func = request_page
			Name = <list_name>
			current_page
			callback = songlist_callback_have_page_find_data_range
			sortspec = <sortspec>
			filterspec = <filterspec>
			invert_filterspec = <invert_filterspec>
		}
		if NOT (<mode> = music_store)
			if NOT (($g_songlist_current_pivot) = NULL)
				if ($g_songlist_show_ghtunes = 0)
					get_ui_song_struct_items song = ($g_songlist_current_pivot) savegame = <savegame>
					if song_is_jamsession song = (<ui_struct>.song_checksum)
						Change \{g_songlist_current_pivot = NULL}
					endif
				endif
			endif
		endif
		if NOT (($g_songlist_current_pivot) = NULL)
			<content_man_params> = {
				<content_man_params>
				Seek = ($g_songlist_current_pivot)
			}
			Change \{g_songlist_requires_unblock = 1}
		elseif NOT (($g_songlist_seek_first) = NULL)
			<content_man_params> = {
				<content_man_params>
				seek_first = ($g_songlist_seek_first)
			}
		endif
		if ($g_songlist_debug_output = 1)
			printf \{channel = SongList
				qs(0x128a6a04)}
			printf \{channel = SongList
				qs(0xe76beaa4)}
			printstruct channel = SongList <...>
			printf \{channel = SongList
				qs(0xe76beaa4)}
		endif
		contentmanfunc {
			<content_man_params>
		}
		StartRendering
		return
	endif
	Wait \{0.1
		Seconds}
	repeat 200
	StartRendering
	if (<mode> = music_store)
		destroy_dialog_box
	endif
	if (<mode> != music_store)
		ScriptAssert \{qs(0x1bbd378e)}
	endif
	callback_marketplace_content_general_timedout
endscript
g_cached_content_size = 0

script songlist_callback_have_page_find_data_range 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_seek_override}
		if (<music_store_seek_override> = true)
			<seek_index> = 0
			<seek_checksum> = NULL
			songlist_component :SetTags \{music_store_seek_override = FALSE}
		endif
	endif
	if (<mode> = play_song || <mode> = playlist)
		Change g_cached_content_size = <content_size>
	endif
	generic_scrollbar_wgt_initialize \{id = songlist_scrollbar_wgt}
	generic_scrollbar_wgt_set_resolution id = songlist_scrollbar_wgt num_elements = <content_size>
	songlist_component :membfunc_songlist_uistack_setlistindex list_index = <seek_index> seek_checksum = <seek_checksum>
	songlist_component :membfunc_songlist_uistack_setlistcontentsize list_content_size = <content_size>
	songlist_component :membfunc_songlist_uistack_setlistpagesize list_page_size = <page_size>
	songlist_component :SetTags \{list_dirty = FALSE}
	generic_scrollbar_wgt_update_thumb_pos id = songlist_scrollbar_wgt Dir = down count = <seek_global_index> time = 0.0
	songlist_scrollbar_wgt :se_setprops \{alpha = 1.0}
	Change \{g_songlist_current_pivot = NULL}
	Change \{g_songlist_seek_first = NULL}
	formatText TextName = num_songs qs(0xc31d83ea) i = <content_size>
	SongList :se_setprops songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			SongList :se_setprops songlist_songs_available_text_text = ((($g_music_store_hub_options) [($g_music_store_hub_options_index)]).text)
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			SongList :se_setprops songlist_songs_available_text_text = ((($g_music_store_hub_options) [($g_music_store_hub_options_index)]).plural_text)
		else
			SongList :se_setprops \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	if demobuild
		formatText TextName = demo_songs qs(0x862202b8) a = <content_size> b = 85
		SongList :se_setprops songlist_songs_available_num_text = <demo_songs>
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_frame_tally_body}
		SongList :se_getprops \{songlist_songs_available_hmenu_dims}
		tallytext_width = (<songlist_songs_available_hmenu_dims>.(1.0, 0.0))
		<resolved_id> :se_setprops dims = ((<tallytext_width> * (1.0, 0.0)) + (131.0, 64.0))
	endif
	if SongList :desc_resolvealias \{Name = alias_store_frame_tally_body}
		SongList :se_getprops \{songlist_songs_available_hmenu_dims}
		tallytext_width = (<songlist_songs_available_hmenu_dims>.(1.0, 0.0))
		<resolved_id> :se_setprops dims = ((<tallytext_width> * (1.0, 0.0)) + (131.0, 64.0))
	endif
	<start_index> = <seek_index>
	songlist_component :membfunc_songlist_uistack_getmaxcontentsize
	if (<page_size> = 0)
		songlist_detail :se_setprops \{alpha = 0.0}
		songlist_disallow_continue
		if ($g_songlist_warning_active = 0)
			current_menu :se_setprops \{unblock_events}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
		songlist_component :membfunc_songlist_uistack_setrangearray \{range_array = [
			]
			offset = 0}
		songlist_create_default_user_control_helpers mode = <mode> no_options = 1
		return
	elseif (<page_size> <= <max_content_size>)
		<start_index> = 0
		<end_index> = (<page_size> - 1)
	else
		<end_index> = ((<max_content_size> - 1) + <seek_index>)
		if (<end_index> >= <page_size>)
			<end_index> = (<page_size> - 1)
			<start_index> = ((<end_index> - <max_content_size>) + 1)
		endif
	endif
	songlist_component :membfunc_songlist_uistack_setlisttop list_top = <start_index>
	songlist_component :membfunc_songlist_uistack_setlistbottom list_bottom = <end_index>
	songlist_component :membfunc_songlist_uistack_updateheaderarray
	songlist_component :membfunc_songlist_uistack_getlistname
	if ($g_songlist_debug_output = 1)
		printf \{channel = SongList
			qs(0xf2859875)}
		printf \{channel = SongList
			qs(0xe76beaa4)}
		printstruct channel = SongList <...>
		printf \{channel = SongList
			qs(0xe76beaa4)}
	endif
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <start_index>
		end_index = <end_index>
		callback = songlist_callback_data_range
	}
	if (<mode> = play_song || <mode> = playlist)
		test_songlist_based_achievements
	endif
endscript

script get_cached_content_size 
	return content_size = ($g_cached_content_size)
endscript

script songlist_callback_data_range 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	songlist_component :GetSingleTag \{requires_build}
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		previewassetcache \{func = cancel_all_requests}
		music_store_preload_album_covers list = <Range>
		music_store_preload_preview_music list = <Range>
	endif
	if (<requires_build> = true)
		songlist_component :membfunc_songlist_uistack_setrangearray range_array = <Range> update_sticky_header = 0 offset = 0
		if NOT (<mode> = play_song)
			audio_ui_menu_music_off
		endif
		songlist_build
		songlist_component :SetTags \{initial_built = true
			requires_build = FALSE}
	else
		songlist_component :membfunc_songlist_uistack_getscrollresult
		if (<scroll_result> = request_data_range_down)
			songlist_component :membfunc_songlist_uistack_setrangearray range_array = <Range> update_sticky_header = 0 offset = 1
			if songlist_component :membfunc_songlist_uistack_isitemanheader
				songlist_component :membfunc_songlist_uistack_decrementlistindex
				songlist_insert_item_bottom \{focus = 0}
				OnExitRun \{songlist_scroll_down
					params = {
						dont_update_slider = 1
					}}
			else
				songlist_insert_item_bottom
			endif
		elseif (<scroll_result> = request_data_range_up)
			songlist_component :membfunc_songlist_uistack_setrangearray range_array = <Range> update_sticky_header = 0 offset = -1
			if songlist_component :membfunc_songlist_uistack_isitemanheader
				songlist_component :membfunc_songlist_uistack_incrementlistindex
				songlist_component :GetSingleTag \{sticky_header_struct}
				songlist_component :membfunc_songlist_uistack_updatestickyheaderwithprevious curr_header_struct = <sticky_header_struct>
				songlist_insert_item_top \{focus = 0}
				OnExitRun \{songlist_scroll_up
					params = {
						dont_update_slider = 1
					}}
			else
				songlist_insert_item_top
			endif
		else
			songlist_component :membfunc_songlist_uistack_setrangearray range_array = <Range> update_sticky_header = 0 offset = 0
		endif
	endif
	if ($g_songlist_debug_output = 1)
		printf \{channel = SongList
			qs(0x70375fa7)}
		printf \{channel = SongList
			qs(0xe76beaa4)}
		printstruct channel = SongList <...>
		printf \{channel = SongList
			qs(0xe76beaa4)}
	endif
	if songlist_component :GetSingleTag \{need_unavailable_dialog}
		if (<need_unavailable_dialog> = 1)
			songlist_component :SetTags \{need_unavailable_dialog = 0}
			generic_event_choose \{state = uistate_songlist_popup
				data = {
					is_popup
					exclusive_device = 0
				}}
		endif
	endif
endscript

script songlist_insert_item_top \{focus = 1}
	<index> = 0
	songlist_component :membfunc_songlist_uistack_getrangestruct
	GetScreenElementChildren \{id = current_menu}
	if GotParam \{children}
		GetArraySize <children>
		<index> = (<array_Size> - 1)
		songlist_component :membfunc_songlist_uistack_getmaxmenuelements
		if (<array_Size> >= <max_menu_elements>)
			DestroyScreenElement id = (<children> [<index>])
		endif
	endif
	if StructureContains structure = <range_struct> header
		songlist_add_header {
			header_struct = <range_struct>
		}
	else
		songlist_add_item {
			ui_struct = <range_struct>
		}
	endif
	current_menu :menu_setitemindex index = <index> newindex = 0
	if (<focus> = 1)
		if ($g_songlist_requires_unblock = 1)
			Change \{g_songlist_requires_unblock = 0}
			current_menu :se_setprops \{unblock_events}
		endif
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu
			data = {
				child_index = 0
			}}
	endif
endscript

script songlist_insert_item_bottom \{focus = 1}
	songlist_component :membfunc_songlist_uistack_getrangestruct
	GetScreenElementChildren \{id = current_menu}
	DestroyScreenElement id = (<children> [0])
	if StructureContains structure = <range_struct> header
		songlist_add_header {
			header_struct = <range_struct>
		}
	else
		songlist_add_item {
			ui_struct = <range_struct>
		}
	endif
	if (<focus> = 1)
		if ($g_songlist_requires_unblock = 1)
			Change \{g_songlist_requires_unblock = 0}
			current_menu :se_setprops \{unblock_events}
		endif
		songlist_component :membfunc_songlist_uistack_getmaxmenuelements
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent Type = focus target = current_menu data = {child_index = (<max_menu_elements> - 1)}
	endif
endscript

script songlist_build 
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_component :membfunc_songlist_uistack_getmastervectorsize
	if (<master_vector_size> > 0)
		songlist_component :membfunc_songlist_uistack_getmaxmenuelements
		if (<master_vector_size> < <max_menu_elements>)
			<repeat_amt> = <master_vector_size>
		else
			<repeat_amt> = <max_menu_elements>
		endif
		<i> = 0
		begin
		songlist_component :membfunc_songlist_uistack_getrangestruct index = <i>
		if StructureContains structure = <range_struct> header
			songlist_add_header {
				header_struct = <range_struct>
			}
		else
			songlist_add_item {
				ui_struct = (<range_struct>)
			}
		endif
		<i> = (<i> + 1)
		repeat <repeat_amt>
	endif
	songlist_component :membfunc_songlist_uistack_postrefresh
	if ($g_songlist_warning_active = 0)
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers mode = <mode>
	endif
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_mode}
		if GotParam \{music_store_mode}
			if (<music_store_mode> = songs)
				songlist_music_store_allow_sorting
			endif
		endif
	endif
	SongList :se_setprops \{alpha = 1.0}
	if (<focus> = true)
		if ($g_songlist_warning_active = 0)
			if ininternetmode
				if ($net_popup_active = 0)
					songlist_component :GetSingleTag \{initial_built}
					if (<initial_built> = FALSE)
						songlist_disallow_continue
						if screenelementexistssimpleid \{id = SongList}
							current_menu :Obj_GetID
							SongList :Obj_SpawnScriptLater flowsync_sync_blockingforall params = {
								display_script = generic_event_choose
								display_params = {state = uistate_sync_spot_warning data = {is_popup}}
								callback = songlist_sync_spot_callback
								callback_params = {focus_index = <focus_index> menu = <objID>}
							}
						endif
						ui_event_add_params selected_index = <focus_index>
						songlist_component :Obj_SpawnScriptNow \{songlist_wait_and_update_sticky_header}
						SongList :SetTags \{list_dirty = FALSE}
						return
					endif
				endif
			endif
			current_menu :se_setprops \{unblock_events}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			LaunchEvent Type = focus target = current_menu data = {child_index = <focus_index>}
		endif
	endif
	songlist_component :Obj_SpawnScriptNow \{songlist_wait_and_update_sticky_header}
	if (<mode> = music_store)
		songlist_component :SetTags \{list_dirty = FALSE}
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	GetArraySize ($current_playlist)
	if (<array_Size> > 0)
		<i> = 0
		<iters> = <array_Size>
		if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
			<i> = (<array_Size> - ($g_songlist_mini_playlist_detail_items))
			<iters> = ($g_songlist_mini_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>]) savegame = <savegame>
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

script songlist_add_header \{header_struct = 0x69696969}
	<header_text> = (<header_struct>.header_text)
	if StructureContains \{structure = header_struct
			header_text_override}
		<header_text> = (<header_struct>.header_text_override)
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'songlist_header_desc'
		parent = current_menu
		autosizedims = true
		songlist_header_text_text = <header_text>
		not_focusable
	}
	<id> :SetTags {
		header = 1
		header_struct = <header_struct>
	}
endscript

script songlist_update_sticky_header \{header_struct = {
		}
		alpha = 1}
	if (<alpha> = 1)
		<header_text> = (<header_struct>.header_text)
		if StructureContains \{structure = header_struct
				header_text_override}
			<header_text> = (<header_struct>.header_text_override)
		endif
		formatText TextName = header_text qs(0x46bef454) h = <header_text> s = (($g_songlist_sort_array [($g_songlist_sort_index)]).text)
		SongList :se_setprops {
			songlist_sticky_header_alpha = 1.0
			songlist_sticky_header_text = <header_text>
		}
		songlist_component :SetTags sticky_header_struct = <header_struct>
	else
		SongList :se_setprops \{songlist_sticky_header_alpha = 0.0}
	endif
endscript

script songlist_wait_and_update_sticky_header 
	Wait \{3
		gameframes}
	songlist_component :membfunc_songlist_uistack_updatestickyheader
endscript

script songlist_disallow_jump 
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				nullscript
			}
		]
		replace_handlers}
	songlist_component :SetTags \{jump_enabled = 0}
endscript

script songlist_add_jump_handler 
	<add_handler> = 0
	if ininternetmode
		songlist_component :obj_getintegertag \{tag_name = jump_enabled}
		if (<integer_value> = 1)
			<add_handler> = 1
		endif
	else
		<add_handler> = 1
	endif
	if (<add_handler> = 1)
		if ScreenElementExists \{id = current_menu}
			current_menu :se_setprops \{event_handlers = [
					{
						pad_option2
						songlist_go_to_options
						params = {
							Type = Jump
						}
					}
				]
				replace_handlers}
			songlist_component :SetTags \{jump_enabled = 1}
		else
			return \{FALSE}
		endif
	elseif NOT ScreenElementExists \{id = current_menu}
		return \{FALSE}
	endif
	return \{true}
endscript

script songlist_disallow_sort 
	current_menu :se_setprops \{event_handlers = [
			{
				pad_L1
				nullscript
			}
		]
		replace_handlers}
endscript

script songlist_allow_sort 
	current_menu :se_setprops \{event_handlers = [
			{
				pad_L1
				songlist_go_to_options
				params = {
					Type = sort
				}
			}
		]
		replace_handlers}
endscript

script songlist_add_item \{ui_struct = 0x69696969}
	songlist_component :membfunc_songlist_uistack_getmode
	<title_text> = (<ui_struct>.song_title)
	<desc> = 'songlist_item'
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers || (<ui_struct>.Type = import) || (<ui_struct>.Type = patch))
			formatText checksumName = song '%a' a = (<ui_struct>.song_title)
			<desc> = 'special_offer_item'
		else
			song = (<ui_struct>.song_checksum)
			<desc> = 'music_store_item'
		endif
	elseif song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song '%i' i = <text>
	else
		song = (<ui_struct>.song_checksum)
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
	CreateScreenElement {
		Type = descinterface
		id = <item_id>
		desc = <desc>
		parent = current_menu
		songlist_item_text_text = <title_text>
		songlist_item_sub_text_text = <sub_text>
		autosizedims = true
	}
	<id> :SetTags {
		header = 0
		song_checksum = <song>
	}
	if NOT (<mode> = music_store)
		songlist_component :GetSingleTag \{savegame_device}
		get_savegame_from_controller controller = <savegame_device>
		if NOT issongselectable song = (<ui_struct>.song_checksum) savegame = <savegame>
			<id> :se_setprops {
				songlist_item_text_rgba = ($g_songlist_invalid_item_unfocus_rgba)
				songlist_item_sub_text_rgba = ($g_songlist_invalid_sub_item_unfocus_rgba)
			}
		endif
		if song_is_jamsession song = (<ui_struct>.song_checksum)
			<icon> = icon_ght
		elseif GotParam \{song_is_locked}
			<icon> = icon_lock
		else
			if ((<ui_struct>.song_source) = gh4_2)
				getterritory
				if (<territory> = territory_us)
					<icon> = icon_ghsh
				else
					<icon> = icon_ghgh
				endif
			else
				<icon> = NULL
				GetArraySize \{$gh_songlist}
				<i> = 0
				begin
				<gh_songlist_struct> = ($gh_songlist [<i>])
				if ((<ui_struct>.song_source) = (<gh_songlist_struct>.crc))
					<icon> = (<gh_songlist_struct>.icon)
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		if NOT (<icon> = NULL)
			<item_id> :se_setprops {
				songlist_source_icon_texture = <icon>
			}
		else
			ScriptAssert \{qs(0x514d09a5)}
		endif
	endif
	if songlist_is_song_in_playlist song = <song>
		songlist_component :GetSingleTag \{locked}
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
				<song_options_struct> = {
					add_song = 0
					remove_song = 1
				}
				<pad_choose_script> = songlist_go_to_options
				<pad_choose_params> = {Type = main song_item_id = <id> song_options_struct = <song_options_struct>}
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
			}
		endif
		<id> :SetTags playlist_index = <playlist_index>
	else
		if (<mode> = music_store)
			<pad_choose_script> = songlist_go_to_options
			<pad_choose_params> = {Type = music_store song_item_id = <item_id> purchase_struct = <ui_struct>}
		elseif ((<mode> = leaderboard) || (<mode> = practice) || (ininternetmode))
			<pad_choose_script> = songlist_item_add_to_playlist
			<pad_choose_params> = {ui_struct = <ui_struct>}
		else
			<song_options_struct> = {
				add_song = 1
				remove_song = 0
			}
			<pad_choose_script> = songlist_go_to_options
			<pad_choose_params> = {Type = main song_item_id = <id> song_options_struct = <song_options_struct>}
		endif
	endif
	event_handlers = [
		{focus songlist_item_focus params = {ui_struct = <ui_struct>}}
		{unfocus songlist_item_unfocus params = {ui_struct = <ui_struct>}}
		{pad_choose <pad_choose_script> params = <pad_choose_params>}
	]
	<id> :se_setprops event_handlers = <event_handlers>
	return id = <id>
endscript

script songlist_go_to_song_library_tab \{skip_scan = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	ui_sfx \{menustate = setlist
		uitype = switchtostore}
	music_store_kill_preview_music
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_set_mode_sort_index mode = <mode>
	songlist_component :GetSingleTag \{return_mode}
	Change g_songlist_sort_index = ($g_songlist_sort_indexes.<return_mode>)
	songlist_component :membfunc_songlist_uistack_setmode mode = <return_mode>
	songlist_component :membfunc_songlist_uistack_setlistname \{list_name = gh_songlist}
	songlist_component :SetTags \{content_source = local_song_list}
	ui_event_wait_for_safe
	hide_glitch \{num_frames = 4}
	if (<skip_scan> = 0)
		clean_up_user_control_helpers
		destroy_friend_feed
		SongList :se_setprops \{songlist_bg_illo_alpha = 1.0
			music_store_bg_illo_alpha = 0.0
			songlist_tab_in_focus_alpha = 0.0
			songlist_tab_out_focus_alpha = 1.0
			music_store_tab_in_focus_alpha = 0.0
			music_store_tab_out_focus_alpha = 0.0
			rank_capsule_alpha = 0.0}
		songlist_scrollbar_wgt :se_setprops \{alpha = 0.0}
		generic_event_choose {
			state = uistate_boot_download_scan
			data = {
				savegame = <savegame>
				controller = ($primary_controller)
				Force = ($g_force_songlist_dlc_scan)
				is_popup
				event_params = {
					event = menu_replace
					data = {is_popup state = uistate_music_store_scan_marketplace pre_refresh_script = songlist_post_dlc_scan_pre_refresh}
				}
			}
		}
	else
		generic_event_back \{state = uistate_songlist
			data = {
				pre_refresh_script = songlist_post_dlc_scan_pre_refresh
			}}
		if (music_store != <mode>)
			SongList :Obj_SpawnScriptLater attempt_to_add_friend_feed params = {menu = SongList parent_id = SongList songlist_mode = <return_mode>}
		endif
	endif
endscript

script songlist_post_dlc_scan_pre_refresh 
	songlist_create_detail_desc \{mode = play_song}
	SongList :se_setprops \{songlist_bg_illo_alpha = 1.0
		music_store_bg_illo_alpha = 0.0
		songlist_tab_in_focus_alpha = 1.0
		songlist_tab_out_focus_alpha = 0.0
		music_store_tab_in_focus_alpha = 0.0
		music_store_tab_out_focus_alpha = 1.0
		rank_capsule_alpha = 1.0}
	songlist_scrollbar_wgt :se_setprops \{alpha = 1.0}
	<back_button> = pad_btn_right
	current_menu :se_setprops {
		event_handlers = [
			{pad_L1 songlist_go_to_options params = {Type = sort}}
			{<back_button> songlist_back_sfx params = {menustate = Generic}}
			{<back_button> generic_blocking_execute_script params = {pad_script = songlist_back}}
		]
		replace_handlers
	}
	songlist_component :GetSingleTag \{controller}
	if songlist_allow_music_store_toggling controller = <controller>
		<tab_enabled> = 1
		current_menu :se_setprops \{event_handlers = [
				{
					pad_select
					generic_blocking_execute_script
					params = {
						pad_script = songlist_go_to_music_store_tab
					}
				}
			]
			replace_handlers}
	else
		<tab_enabled> = 0
		current_menu :se_setprops \{event_handlers = [
				{
					pad_select
					nullscript
				}
			]
			replace_handlers}
	endif
	songlist_component :SetTags {
		tab_enabled = <tab_enabled>
	}
endscript

script songlist_go_to_music_store_tab \{force_to_recommendations = 0}
	current_menu :se_setprops \{block_events}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				nullscript
			}
		]
		replace_handlers}
	ui_sfx \{menustate = setlist
		uitype = switchtostore}
	songlist_update_song_preview \{song = None}
	destroy_friend_feed
	net_counter_increment \{counter_name = globalcounter_music_store_songlist}
	songlist_component :membfunc_songlist_uistack_getcurrentchecksum
	Change g_songlist_current_pivot = <current_checksum>
	if isps3
		music_store_set_playstation_logo
	endif
	hide_glitch \{num_frames = 12}
	Change \{rich_presence_context = presence_music_store}
	create_dialog_box \{heading_text = qs(0x131b4d0f)
		body_text = qs(0xf29f90c7)}
	CreateScreenElement \{Type = descinterface
		desc = 'instrument_spinner'
		parent = dialog_box_container
		id = autosave_icon
		Pos = (640.0, 492.0)
		just = [
			center
			center
		]
		z_priority = 200001
		autosizedims = true}
	autosave_icon :Obj_SpawnScriptNow \{instrument_spinner_ui_icon_anim}
	songlist_component :membfunc_songlist_uistack_getmode
	if (<force_to_recommendations> = 1)
		songlist_component :SetTags {
			music_store_mode = recommendations
			music_store_seek_override = true
			visited_hub = 1
			return_mode = <mode>
		}
		songlist_set_mode_sort_index mode = <mode>
		<mode> = music_store
		songlist_component :membfunc_songlist_uistack_setmode mode = <mode>
		songlist_component :membfunc_songlist_uistack_setlistname \{list_name = marketplace}
		songlist_component :SetTags \{content_source = marketplace}
		songlist_content_source_init
		music_store_recommendations_process song_checksum = <song_checksum>
		begin
		if ($g_music_store_recommendations_complete = 1)
			GetArraySize \{$g_music_store_recommendations}
			if (<array_Size> > 0)
				<filterspec> = [
					{
						key = song_checksum
						union_list = ($g_music_store_recommendations)
						comparator = equal
					}
				]
				music_store_hub_get_index_by_mode \{mode = recommendations}
				Change g_music_store_hub_options_index = <index>
				songlist_change_sort_index index = ((($g_music_store_hub_options) [<index>]).sort_index)
			else
				music_store_hub_get_index_by_mode \{mode = new_arrivals}
				<array> = ((($g_music_store_hub_options) [<index>]).filterspec)
				<element> = {
					key = Type
					union_list = [pack album song]
					comparator = equal
				}
				AddArrayElement array = <array> element = <element>
				<filterspec> = <array>
				songlist_change_sort_index index = ((($g_music_store_hub_options) [<index>]).sort_index)
				music_store_hub_get_index_by_mode \{mode = recommendations}
				Change g_music_store_hub_options_index = <index>
			endif
			songlist_change_filterspec filterspec = <filterspec>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		songlist_create_detail_desc mode = <mode>
		songlist_detail :se_setprops \{alpha = 1.0
			songlist_detail_cont_alpha = 1.0}
	else
		songlist_component :SetTags {
			music_store_mode = hub
			music_store_seek_override = true
			visited_hub = 0
			return_mode = <mode>
		}
		songlist_set_mode_sort_index mode = <mode>
		<mode> = music_store
		songlist_component :membfunc_songlist_uistack_setmode mode = <mode>
		songlist_component :membfunc_songlist_uistack_setlistname \{list_name = marketplace}
		Change g_songlist_sort_index = ($g_songlist_sort_indexes.<mode>)
		songlist_clear_filterspec
		songlist_component :SetTags \{content_source = marketplace}
		songlist_create_detail_desc mode = <mode>
	endif
	SongList :se_setprops \{songlist_bg_illo_alpha = 0.0
		music_store_bg_illo_alpha = 1.0
		songlist_tab_in_focus_alpha = 0.0
		songlist_tab_out_focus_alpha = 1.0
		music_store_tab_in_focus_alpha = 1.0
		music_store_tab_out_focus_alpha = 0.0
		songlist_sticky_header_text = qs(0x03ac90f0)
		time = 0.1}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_select
				generic_blocking_execute_script
				params = {
					pad_script = songlist_go_to_song_library_tab
				}
			}
		]
		replace_handlers}
	songlist_refresh_menus \{no_pivot = 1}
	songlist_music_store_disallow_sorting
endscript

script songlist_music_store_view_pack_songs \{ui_struct = 0x69696969}
	Change \{g_music_store_viewing_pack_songs = 1}
	if GotParam \{play_sfx}
		ui_sfx \{menustate = setlist
			uitype = select}
	endif
	songlist_component :membfunc_songlist_uistack_getfilterspec
	if GotParam \{purchase_checksum}
		<pivot_checksum> = <purchase_checksum>
	else
		<pivot_checksum> = (<ui_struct>.song_checksum)
	endif
	songlist_component :GetSingleTag \{music_store_mode}
	<back_button> = pad_btn_right
	current_menu :se_setprops {
		event_handlers = [
			{<back_button> songlist_music_store_back_to_previous_filterspec params = {
					filterspec = <filterspec>
					sort_index = ($g_songlist_sort_index)
					index = ($g_music_store_hub_options_index)
					music_store_mode = <music_store_mode>
					pivot_checksum = <pivot_checksum>
				}
			}
		]
		replace_handlers
	}
	<pack_list> = (<ui_struct>.pack_list)
	AddArrayElement array = <pack_list> element = (<ui_struct>.song_checksum)
	filterspec = [
		{
			key = song_checksum
			union_list = <array>
			comparator = equal
		}
	]
	songlist_change_filterspec filterspec = <filterspec>
	songlist_change_sort_by_key \{key = type_string}
	songlist_music_store_disallow_sorting
	if ((<ui_struct>.Type) = pack)
		songlist_component :SetTags \{music_store_mode = track_packs}
	else
		songlist_component :SetTags \{music_store_mode = albums}
	endif
	music_store_hub_get_index_by_mode \{mode = items}
	Change g_music_store_hub_options_index = <index>
	if GotParam \{no_pivot}
		songlist_refresh_menus \{no_pivot = 1}
	else
		songlist_refresh_menus
	endif
endscript

script songlist_music_store_back_to_previous_filterspec \{filterspec = !a1768515945
		sort_index = !i1768515945
		pivot_checksum = !q1768515945
		music_store_mode = !q1768515945
		index = !i1768515945}
	ui_sfx \{menustate = setlist
		uitype = back}
	Change \{g_music_store_viewing_pack_songs = 0}
	<back_button> = pad_btn_right
	current_menu :se_setprops {
		event_handlers = [
			{<back_button> songlist_back_sfx}
			{<back_button> generic_blocking_execute_script params = {pad_script = songlist_back}}
		]
		replace_handlers
	}
	songlist_change_filterspec filterspec = <filterspec>
	songlist_change_sort_index index = <sort_index>
	songlist_component :SetTags {
		music_store_mode = <music_store_mode>
	}
	Change g_music_store_hub_options_index = <index>
	songlist_refresh_menus pivot_checksum = <pivot_checksum>
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
	current_menu :se_setprops \{event_handlers = [
			{
				pad_L1
				songlist_go_to_options
				params = {
					Type = sort
				}
			}
		]
		replace_handlers}
endscript

script songlist_is_song_in_playlist \{song = !q1768515945}
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

script songlist_is_song_in_menu \{song = !q1768515945}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	if (<array_Size> > 0)
		<i> = 0
		begin
		(<children> [<i>]) :GetSingleTag header
		if (<header> = 0)
			(<children> [<i>]) :GetSingleTag song_checksum
			if (<song> = <song_checksum>)
				return true menu_index = <i>
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script songlist_get_song_playlist_detail_index \{playlist_index = !i1768515945
		vmenu_id = !q1768515945}
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

script songlist_do_maintenance_on_list \{playlist_index = !i1768515945
		list = !q1768515945}
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

script songlist_update_instrument_difficulty_rating \{time = 0.025
		prev_diff_rate = !i1768515945}
	if GotParam \{diff_rate}
		if isfloat <diff_rate>
			ScriptAssert \{'Difficulty rating is a float! Please just use integers for difficulty ratings'}
			CastToInteger \{diff_rate}
		endif
	endif
	if NOT GotParam \{diff_rate}
		diff_rate = 0
	endif
	if (<diff_rate> = 11)
		<diff_rate> = 0
	endif
	songlist_component :membfunc_songlist_uistack_getmode
	<on_rgba> = [45 100 110 0]
	if (<mode> = music_store)
		<off_rgba> = [180 188 200 255]
	else
		<off_rgba> = [222 216 191 255]
	endif
	<off_alpha> = 1.0
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
			<resolved_id> :se_setprops alpha = 0
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

script songlist_update_stars \{time = 0.05
		prev_stars = !i1768515945
		gold_stars = !i1768515945}
	if NOT GotParam \{stars}
		stars = 0
	endif
	if (<stars> < 0)
		stars = 0
	endif
	<difference> = (<stars> - <prev_stars>)
	GetScreenElementChildren \{id = songlist_detail_stars_empty_vmenu}
	GetArraySize <children>
	GetScreenElementChildren \{id = songlist_detail_stars_full_vmenu}
	<max_stars> = 6
	if (<difference> > 0)
		<i> = ((<max_stars> - 1) - <prev_stars>)
		begin
		if (<i> < 0)
			break
		endif
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

script songlist_item_focus \{time = 0.0
		ui_struct = 0x69696969
		highlight_bar_alpha = 0.8}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<rgba> = (($g_menu_colors).black)
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers || (<ui_struct>.Type = import) || (<ui_struct>.Type = patch))
			<id> :se_setprops {
				songlist_item_text_rgba = ($g_music_store_item_focus_rgba)
				songlist_item_sub_text_rgba = ($g_music_store_sub_item_focus_rgba)
				songlist_item_highlight_bar_alpha = <highlight_bar_alpha>
				time = <time>
			}
			return
		endif
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	songlist_component :GetSingleTag \{exclusive_device}
	if (<mode> = music_store)
		if (<ui_struct>.Type = song)
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 1.0
				songlist_detail_albums_alpha = 0.0}
		else
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 0.0
				songlist_detail_albums_alpha = 1.0}
		endif
		if NOT (<ui_struct>.song_rating = None)
			<pa_alpha> = 1.0
			<esrb_notice_alpha> = 0.0
		else
			<pa_alpha> = 0.0
			songlist_component :GetSingleTag \{territory}
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
		elseif (<Type> = career)
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
				endif
			endif
		endif
	else
		if NOT (<mode> = music_store)
			<id> :Obj_SpawnScriptNow songlist_update_source_icon_alpha params = {id = <id> alpha = 1.0 time = 0.3}
		endif
	endif
	if NOT (<mode> = music_store)
		songlist_component :GetSingleTag \{savegame_device}
		get_savegame_from_controller controller = <savegame_device>
		<song_is_locked> = 0
		if issongselectable song = (<ui_struct>.song_checksum) savegame = <savegame>
			<item_focus_rgba> = ($g_songlist_item_focus_rgba)
			<sub_item_focus_rgba> = ($g_songlist_sub_item_focus_rgba)
			songlist_detail :se_setprops \{songlist_detail_not_selectable_cont_alpha = 0.0}
		else
			<item_focus_rgba> = ($g_songlist_invalid_item_focus_rgba)
			<sub_item_focus_rgba> = ($g_songlist_invalid_sub_item_focus_rgba)
			if (<song_is_locked> = 1)
				get_unlock_description_text song = (<ui_struct>.song_checksum)
				songlist_detail :se_setprops {
					songlist_detail_not_selectable_cont_alpha = 1.0
					songlist_detail_not_selectable_description_text = <unlock_description_text>
				}
			else
				songlist_detail :se_setprops \{songlist_detail_not_selectable_cont_alpha = 0.0}
			endif
		endif
	else
		<item_focus_rgba> = ($g_music_store_item_focus_rgba)
		<sub_item_focus_rgba> = ($g_music_store_sub_item_focus_rgba)
	endif
	<id> :se_setprops {
		songlist_item_text_rgba = <item_focus_rgba>
		songlist_item_sub_text_rgba = <sub_item_focus_rgba>
		songlist_item_highlight_bar_alpha = <highlight_bar_alpha>
		time = <time>
	}
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
			formatText TextName = genre_year_text qs(0xf7e765ed) g = <musicstudio_genre_text> y = (<ui_struct>.song_year)
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
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			if (<mode> = practice || <mode> = leaderboard)
				player_num = 1
			else
				get_local_in_game_player_num_from_controller {controller_index = <exclusive_device> allow_dropped_player = 1}
			endif
			if isSinglePlayerGame
				if (<player_num> = -1)
					ScriptAssert \{'player_num = -1'}
				endif
				getplayerinfo <player_num> part
				getplayerinfo <player_num> difficulty
			else
				<part> = Band
				get_highest_difficulty
				<difficulty> = <highest_difficulty>
			endif
			if (<mode> = leaderboard)
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
			if (<mode> = leaderboard)
				difficulty = beginner
				GetArraySize ($difficulty_list) param = diff_list_size
				diff_idx = (<diff_list_size> - 1)
				begin
				diff = ($difficulty_list [<diff_idx>])
				get_difficulty_text_nl difficulty = <diff>
				if ($g_include_debug_songs = 0)
					getglobaltagsonginfo {
						song = <song_checksum>
						difficulty = <diff>
						part = <part>
					}
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
				<difficulty_alpha> = 0
			else
				get_difficulty_text_nl difficulty = <difficulty>
				if ($g_include_debug_songs = 0)
					getglobaltagsonginfo {
						song = <song_checksum>
						difficulty = <difficulty>
						part = <part>
					}
				else
					<setlist_bestscore> = 0
					<setlist_beststars> = 0
					<setlist_bestpercentage> = 0
				endif
				<difficulty_alpha> = 1
			endif
			songlist_update_more_info {
				part = <part>
				song_checksum = <song_checksum>
			}
			ExtendCrc icon_difficulty_ <difficulty_text_nl> out = difficulty_icon
			songlist_detail :se_setprops {
				songlist_detail_difficulty_icon_texture = <difficulty_icon>
				songlist_detail_difficulty_icon_alpha = <difficulty_alpha>
				songlist_detail_intensity_cont_alpha = 1.0
				songlist_detail_jam_instruments_cont_alpha = 0.0
				intensity_text = qs(0x1e6a3a72)
			}
		else
			songlist_clear_more_info
			if (<ui_struct>.playback_track1 = -1)
				<guitar_alpha> = 0.1
			else
				<guitar_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track2 = -1)
				<bass_alpha> = 0.1
			else
				<bass_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track_drums = 0)
				<drum_alpha> = 0.1
			else
				<drum_alpha> = 1.0
			endif
			if (<ui_struct>.playback_track_vocals = 0)
				<vocal_alpha> = 0.1
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
		<text_dims> = (300.0, 0.0)
		songlist_detail :se_setprops {
			songlist_detail_album_text_dims = <text_dims>
			songlist_detail_genre_text_dims = <text_dims>
			songlist_detail_duration_text_dims = <text_dims>
			songlist_detail_artist_text_text = (<ui_struct>.song_artist)
			songlist_detail_song_text_text = (<ui_struct>.song_title)
			songlist_detail_genre_text_text = <line1>
			songlist_detail_album_text_text = <line0>
			songlist_detail_duration_text_text = <line2>
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
			audio_ui_menu_music_off
			songlist_update_song_preview song = <song_checksum>
		else
			SpawnScriptNow \{audio_ui_menu_music_on}
			songlist_update_song_preview \{song = None}
		endif
		if (<ui_struct>.song_double_kick = 1)
			songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 1.0}
		else
			songlist_detail :se_setprops \{icon_difficulty_expert_plus_alpha = 0.0}
		endif
	else
		if (<ui_struct>.patched = 0)
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
	else
		songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x0f9cf815)}
	endif
	if ((<mode> != playlist) && (<mode> != music_store))
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
		songlist_detail :se_setprops \{songlist_detail_mini_info_alpha = 0.0}
		songlist_detail :se_waitprops
		songlist_detail :se_setprops \{songlist_detail_mini_info_text = qs(0x03ac90f0)}
	endif
	if (<mode> != music_store)
		quickplay_songlist_update_awards {
			song_checksum = (<ui_struct>.song_checksum)
			song_is_locked = <song_is_locked>
		}
	endif
endscript

script songlist_update_source_icon_alpha \{id = !q1768515945
		alpha = !f1768515945
		time = !f1768515945}
	Wait <time> Seconds
	<id> :se_setprops songlist_source_icon_alpha = <alpha> time = <time>
endscript

script songlist_music_store_item_focus \{morph_time = 0.0
		ui_struct = 0x69696969}
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
	<line0> = (<ui_struct>.album)
	<line1> = <genre_year_text>
	<line2> = <duration_text>
	if (<ui_struct>.Type = pack)
		<title_array> = (<ui_struct>.title_strings)
		<artist_array> = (<ui_struct>.artist_strings)
		GetArraySize <title_array>
		<iters> = <array_Size>
		<more_than_2> = 0
		if (<array_Size> > 3)
			<iters> = 3
			<more_than_2> = (<array_Size> - 2)
		endif
		if (<iters> > 0)
			<i> = 0
			begin
			formatText checksumName = line 'line%i' i = <i>
			formatText TextName = title_artist_text qs(0x1f7bab4d) t = (<title_array> [<i>]) a = (<artist_array> [<i>])
			AddParam Name = <line> value = <title_artist_text>
			<i> = (<i> + 1)
			repeat <iters>
		endif
		if (<more_than_2> > 1)
			formatText TextName = more_songs qs(0x560b5eda) n = <more_than_2>
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
	elseif (<ui_struct>.Type = album)
		<line0> = (<ui_struct>.song_title)
		<line1> = (<ui_struct>.song_artist)
		<line2> = qs(0x73ab05d2)
	endif
	<text_dims> = (300.0, 0.0)
	<album_text_dims> = (375.0, 0.0)
	if isps3
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 1.0
		music_store_determine_currency
	else
		<money_icon_alpha> = 1.0
		<money_text_alpha> = 0.0
	endif
	<money_rgba> = gh6_gold
	<price_rgba> = gh6_gold
	if ((<ui_struct>.purchased) = 1)
		<money_icon_alpha> = 1.0
		<money_text_alpha> = 0.0
		<money_texture> = checkmark
		<price_text> = qs(0x03ac90f0)
		<money_rgba> = (($g_menu_colors).pure_white)
	elseif StructureContains structure = <ui_struct> album_pack_only
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 0.0
		<price_text> = qs(0x03ac90f0)
	else
		<money_texture> = xbl_symbol
		musicstore_format_price_text price = (<ui_struct>.price) currency_decimals = <currency_decimals>
	endif
	songlist_detail :se_setprops {
		songlist_detail_album_text_dims = <text_dims>
		songlist_detail_genre_text_dims = <text_dims>
		songlist_detail_duration_text_dims = <text_dims>
		songlist_detail_artist_text_text = (<ui_struct>.song_artist)
		songlist_detail_song_text_text = (<ui_struct>.song_title)
		songlist_detail_genre_text_text = <line1>
		songlist_detail_album_text_text = <line0>
		songlist_detail_duration_text_text = <line2>
		songlist_detail_cont_alpha = 1.0
		alpha = 1.0
		songlist_detail_info_0_text_text = <line0>
		songlist_detail_info_1_text_text = <line1>
		songlist_detail_info_2_text_text = <line2>
		songlist_detail_info_0_text_dims = <album_text_dims>
		songlist_detail_info_1_text_dims = <album_text_dims>
		songlist_detail_info_2_text_dims = <album_text_dims>
		music_store_song_price_text = <price_text>
		music_store_song_price_rgba = <price_rgba>
		music_store_money_icon_texture = <money_texture>
		music_store_money_icon_alpha = <money_icon_alpha>
		music_store_money_icon_rgba = <money_rgba>
		music_store_money_text_alpha = <money_text_alpha>
		music_store_money_text_text = <currency>
		music_store_money_text_rgba = <money_rgba>
	}
	if (<ui_struct>.patched = 1)
		if StructureContains structure = <ui_struct> song_preview_asset_name
			music_store_change_album_cover {
				texture_name = (<ui_struct>.song_preview_asset_name)
				desc = songlist_detail
			}
		endif
	endif
endscript

script songlist_music_store_check_scroll_text \{desc = songlist_detail
		item_type = !q1768515945
		hub_item_cycle = !i1768515945
		text_dims = 0x69696969}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
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
	formatText checksumName = songlist_detail_text_rgba 'songlist_detail_%c_text_rgba' c = <param>
	if ((<hub_item_cycle> = 1) || (<item_type> != song))
		formatText checksumName = songlist_detail_text 'songlist_detail_%c_text' c = <param>
	else
		formatText checksumName = songlist_detail_text 'songlist_detail_songs_%c_text' c = <param>
	endif
	formatText checksumName = line_text 'line%i' i = <i>
	if (((<...>.<songlist_detail_text_dims>).(1.0, 0.0)) > <max_x>)
		if ScreenElementExists id = <songlist_detail_cont>
			<songlist_detail_text> :Obj_KillSpawnedScript Name = scroll_ticker_text
			DestroyScreenElement id = <songlist_detail_cont>
		endif
		CreateScreenElement {
			Type = ContainerElement
			id = <songlist_detail_cont>
			parent = <songlist_detail_text>
		}
		<songlist_detail_text> :Obj_SpawnScriptLater scroll_ticker_text params = {
			ticker_text = (<...>.<line_text>)
			ticker_space = qs(0x8b73fd0e)
			ticker_pos = (0.0, 0.0)
			ticker_just = [left top]
			ticker_parent = <songlist_detail_cont>
			ticker_font = fontgrid_text_a1
			ticker_x_scale = 0.5
			ticker_y_scale = 0.5
			ticker_rgba1 = (<...>.<songlist_detail_text_rgba>)
			ticker_rgba2 = (<...>.<songlist_detail_text_rgba>)
			ticker_alpha = 1.0
			ticker_z_priority = 10
			time = 16
			use_shadow = 0
		}
		AddParam structure_name = my_blank_text Name = <songlist_detail_text_text> value = qs(0x03ac90f0)
		Wait \{1
			gameframe}
		<desc> :se_setprops {
			<my_blank_text>
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

script songlist_update_more_info \{part = !q1768515945
		song_checksum = !q1768515945}
	songlist_component :membfunc_songlist_uistack_getmode
	GetScreenElementChildren \{id = songlist_detail_more_info_rows}
	<rows> = <children>
	RemoveParameter \{children}
	if (<mode> = leaderboard)
		<loop_count> = 4
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
		(<rows> [<loop_count>]) :se_setprops alpha = 0.0
	else
		<loop_count> = 5
	endif
	<i> = 0
	begin
	if ($g_include_debug_songs = 0)
		getglobaltagsonginfo {
			song = <song_checksum>
			difficulty = ($difficulty_list [(4 - <i>)])
			part = <part>
		}
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
		formatText \{TextName = stars_text
			qs(0x03ac90f0)}
	elseif (<setlist_beststars> = -1)
		formatText \{TextName = stars_text
			qs(0xc9076467)}
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
	repeat <loop_count>
endscript

script songlist_item_unfocus \{time = 0.0}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers || (<ui_struct>.Type = import) || (<ui_struct>.Type = patch))
			<id> :se_setprops {
				songlist_item_text_rgba = ($g_music_store_item_unfocus_rgba)
				songlist_item_sub_text_rgba = ($g_music_store_sub_item_unfocus_rgba)
				music_store_song_price_rgba = [0 0 0 0]
				music_store_money_icon_rgba = [0 0 0 0]
				music_store_money_text_rgba = [0 0 0 0]
				songlist_item_highlight_bar_alpha = 0
				time = <time>
			}
			return
		endif
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	if NOT (<mode> = music_store)
		songlist_component :GetSingleTag \{savegame_device}
		get_savegame_from_controller controller = <savegame_device>
		if issongselectable song = (<ui_struct>.song_checksum) savegame = <savegame>
			<item_unfocus_rgba> = ($g_songlist_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_sub_item_unfocus_rgba)
		else
			<item_unfocus_rgba> = ($g_songlist_invalid_item_unfocus_rgba)
			<sub_item_unfocus_rgba> = ($g_songlist_invalid_sub_item_unfocus_rgba)
		endif
		if NOT (<mode> = music_store)
			<id> :Obj_KillSpawnedScript Name = songlist_update_source_icon_alpha
			<id> :Obj_SpawnScriptNow songlist_update_source_icon_alpha params = {id = <id> alpha = 0.0 time = 0.0}
		endif
	else
		music_store_kill_preview_music
		<item_unfocus_rgba> = ($g_music_store_item_unfocus_rgba)
		<sub_item_unfocus_rgba> = ($g_music_store_sub_item_unfocus_rgba)
	endif
	<id> :se_setprops {
		songlist_item_text_rgba = <item_unfocus_rgba>
		songlist_item_sub_text_rgba = <sub_item_unfocus_rgba>
		songlist_item_highlight_bar_alpha = 0.0
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
			songlist_item_highlight_bar_alpha = 0.0
		}
	endif
endscript

script songlist_clear_playlist 
	songlist_clear
	playlist_clear
endscript

script songlist_clear 
	Change \{current_playlist = [
		]}
	if ScreenElementExists \{id = SongList}
		SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	Change \{g_current_loaded_custom_playlist_index = -1}
endscript

script songlist_remove_first_song_in_playlist 
	if is_a_playlist_loaded
		Change g_songlist_current_pivot = (($current_playlist) [0])
		RemoveArrayElement array = ($current_playlist) index = 0
		Change current_playlist = <array>
		if ScreenElementExists \{id = SongList}
			SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
		endif
	endif
endscript

script songlist_display_non_patched_dialog 
	ui_event_wait_for_safe
	Change \{g_songlist_warning_active = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	songlist_component :GetSingleTag \{exclusive_device}
	create_dialog_box {
		heading_text = qs(0x24c5d3a9)
		body_text = qs(0xead101c5)
		player_device = <exclusive_device>
		options = [
			{
				func = songlist_destroy_dialog_box
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script songlist_item_add_to_playlist \{calculate_duration = 1}
	if NOT GotParam \{ui_struct}
		songlist_component :membfunc_songlist_uistack_getrangestruct
		<ui_struct> = <range_struct>
	endif
	if ScriptIsRunning \{songlist_item_focus}
		return
	endif
	current_menu :se_setprops \{block_events}
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_component :GetSingleTag \{savegame_device}
	get_savegame_from_controller controller = <savegame_device>
	if (<mode> != leaderboard)
		if NOT issongselectable song = (<ui_struct>.song_checksum) savegame = <savegame>
			current_menu :se_setprops \{unblock_events}
			ui_sfx \{menustate = setlist
				uitype = negativeselect}
			if GotParam \{song_not_patched}
				current_menu :Obj_SpawnScriptNow \{songlist_display_non_patched_dialog}
			endif
			return
		endif
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
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	AddArrayElement array = ($current_playlist) element = <song_checksum>
	Change current_playlist = <array>
	if (<calculate_duration> = 1)
		if ScreenElementExists \{id = SongList}
			SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
		endif
	endif
	printf \{channel = playlist
		qs(0xbe2ec1c9)}
	debug_songlist_print_playlist
	if (<mode> = play_song || <mode> = leaderboard || <mode> = practice)
		songlist_continue device_num = <device_num>
		current_menu :se_setprops \{unblock_events}
		return
	endif
	ui_sfx \{menustate = setlist
		uitype = addtoplaylist}
	songlist_is_song_in_playlist song = <song_checksum>
	if songlist_is_song_in_menu song = <song_checksum>
		if NOT GotParam \{id}
			Obj_GetID
			<id> = <objID>
		endif
		<song_options_struct> = {
			add_song = 0
			remove_song = 1
		}
		<pad_choose_script> = songlist_go_to_options
		<pad_choose_params> = {Type = main song_item_id = <id> song_options_struct = <song_options_struct>}
		<id> :se_setprops {
			event_handlers = [
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
		formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
		<id> :se_setprops {
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <playlist_index>
		gamemode_gettype
		if NOT ininternetmode
		elseif (<Type> = career)
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
				endif
			endif
		endif
	endif
	GetArraySize \{$current_playlist}
	formatText TextName = pos_text qs(0xc31d83ea) i = (<array_Size>)
	if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
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
	if ($g_songlist_force_num_songs_to_choose > 0)
		GetArraySize ($current_playlist)
		if (<array_Size> = $g_songlist_force_num_songs_to_choose)
			songlist_allow_continue
		endif
	else
		songlist_allow_continue
	endif
	current_menu :se_setprops \{unblock_events}
endscript

script songlist_play_song_shortcut 
	if NOT InNetGame
		if ScriptIsRunning \{songlist_item_focus}
			return
		endif
		songlist_component :membfunc_songlist_uistack_getrangestruct
		songlist_component :GetSingleTag \{savegame_device}
		get_savegame_from_controller controller = <savegame_device>
		if issongselectable song = (<range_struct>.song_checksum) savegame = <savegame>
			play_band_lobby_complete_sfx
			songlist_item_add_to_playlist \{calculate_duration = 0}
			songlist_continue
		else
			ui_sfx \{menustate = setlist
				uitype = negativeselect}
		endif
	endif
endscript

script songlist_allow_continue 
	if ($g_songlist_warning_active = 1)
		return
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				play_band_lobby_complete_sfx
			}
			{
				pad_start
				songlist_continue
			}
		]
		replace_handlers}
	current_menu :SetTags \{allow_continue = 1}
	if NOT user_control_helper_exists \{button = start}
		add_user_control_helper \{text = qs(0x25cd4a61)
			button = start
			z = 100000}
	endif
endscript

script songlist_disallow_continue 
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = play_song || <mode> = playlist)
		current_menu :se_setprops \{event_handlers = [
				{
					pad_start
					songlist_play_song_shortcut
				}
			]
			replace_handlers}
	else
		current_menu :se_setprops \{event_handlers = [
				{
					pad_start
					nullscript
				}
			]
			replace_handlers}
	endif
	current_menu :SetTags \{allow_continue = 0}
	user_control_destroy_helper \{button = start}
endscript

script songlist_item_remove_from_playlist 
	if NOT GotParam \{ui_struct}
		songlist_component :membfunc_songlist_uistack_getrangestruct
		<ui_struct> = <range_struct>
	endif
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
	ui_sfx \{menustate = setlist
		uitype = remove}
	if NOT GotParam \{id}
		Obj_GetID
		<my_id> = <objID>
	else
		<my_id> = <id>
	endif
	if ScreenElementExists id = <my_id>
		<song_options_struct> = {
			add_song = 1
			remove_song = 0
		}
		<pad_choose_script> = songlist_go_to_options
		<pad_choose_params> = {Type = main song_item_id = <my_id> song_options_struct = <song_options_struct>}
		<my_id> :se_setprops {
			songlist_item_text_rgba = ($g_songlist_item_focus_rgba)
			in_playlist_pos_alpha = 0.0
			event_handlers = [
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
		<my_id> :GetSingleTag playlist_index
	endif
	get_savegame_from_controller controller = ($primary_controller)
	songlist_get_song_playlist_detail_index playlist_index = <playlist_index> vmenu_id = songlist_detail_mini_playlist_vmenu
	if GotParam \{playlist_detail_index}
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		GetArraySize \{$current_playlist}
		if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
			formatText TextName = pos_text qs(0xc31d83ea) i = (<array_Size> - ($g_songlist_mini_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_Size> - ($g_songlist_mini_playlist_detail_items)) - 1)]) savegame = <savegame>
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
	if ScreenElementExists id = <my_id>
		<my_id> :RemoveTags playlist_index
	endif
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_mini_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = current_menu
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formatText TextName = text '%a' a = (<ui_struct>.FileName)
		formatText checksumName = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	RemoveArrayElement array = ($current_playlist) element = <song_checksum>
	Change current_playlist = <array>
	if ScreenElementExists \{id = SongList}
		SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	if ScreenElementExists id = <my_id>
		if NOT isscreenelementinfocus id = <my_id>
			<my_id> :Obj_SpawnScriptNow songlist_item_unfocus params = {ui_struct = <ui_struct>}
		endif
	endif
	GetArraySize ($current_playlist)
	if NOT (<array_Size> > 0)
		songlist_disallow_continue
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		if NOT (<array_Size> = $g_songlist_force_num_songs_to_choose)
			songlist_disallow_continue
		else
			songlist_allow_continue
		endif
	endif
	if NOT GotParam \{no_focus}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script songlist_continue \{autosave_playlist = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event_wait_for_safe
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> != leaderboard)
		songlist_update_song_preview \{song = None}
	endif
	current_menu :se_setprops \{block_events}
	if ininternetmode
		host_start_songlist_countdown
		return
	endif
	songlist_generate_song_array playlist = ($current_playlist)
	GetArraySize \{$current_playlist}
	Change g_songlist_beginning_playlist_size = <array_Size>
	playlist_clear
	playlist_addsongarray song_array = <song_array> additional_props_array = <additional_props_array>
	if (<mode> = leaderboard)
		if isps3
			if NOT GotParam \{no_restricted_check}
				if NOT NetSessionFunc \{func = isoldenoughforonline}
					<song> = ($current_playlist [0])
					ui_sfx \{menustate = leaderboard
						uitype = negativeselect}
					ui_leaderboard_get_error_text \{reason = content_restricted}
					generic_event_choose {
						state = uistate_generic_dialog_box
						data = {
							is_popup
							confirm_text = qs(0xaec82a2f)
							confirm_func = songlist_continue
							confirm_func_params = {<...> no_restricted_check}
							heading_text = qs(0xaa163738)
							body_text = <error_text>
							cancel_text = qs(0xf7723015)
							cancel_func = generic_event_back
						}
					}
					songlist_clear
					return
				endif
			endif
		endif
		ui_sfx \{menustate = setlist
			uitype = select}
		if NOT GotParam \{song}
			<song> = ($current_playlist [0])
		endif
		songlist_clear
		if GotParam \{no_restricted_check}
			generic_event_replace state = uistate_award_case data = {is_popup no_targeting song = <song> device_num = <device_num>}
		else
			generic_event_choose state = uistate_award_case data = {is_popup no_targeting song = <song> device_num = <device_num>}
		endif
		return
	elseif (<mode> = practice)
		ui_sfx \{menustate = setlist
			uitype = addtoplaylist}
		songlist_clear
		practice_setup_part_and_continue device_num = <device_num>
		return
	endif
	songlist_component :GetSingleTag \{tab_enabled}
	songlist_deinit_music_store
	<show_help_page> = 0
	gamemode_gettype
	switch (<Type>)
		case career
		gman_challengemanagerfunc goal = <Type> tool = challenges func = get_current_challenge
		gig_struct = ($<current_challenge>)
		venue = (<gig_struct>.venue)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			printstruct <gig_struct>
			ScriptAssert \{qs(0x2f9dfa76)}
		endif
		case quickplay
		universal_help_display_help_check help_context = quickplay_to_gameplay device_num = ($primary_controller)
		if (<show_help_page> = 1)
			generic_event_choose {
				state = uistate_universal_help
				band_lobby_continue_sfx
				data = {
					next_state_script = songlist_continue_for_quickplay
					next_state_params = {
						autosave_playlist = <autosave_playlist>
					}
					device_num = ($primary_controller)
					help_global_index = <help_index>
				}
			}
		else
			songlist_continue_for_quickplay autosave_playlist = <autosave_playlist>
		endif
		case freeplay
		destroy_friend_feed
		ui_sfx \{menustate = setlist
			uitype = complete}
		ui_event \{event = menu_back}
		return
		case competitive
		if ($game_mode = fest_mode || $game_mode = fest_mode_team)
			ui_sfx \{menustate = setlist
				uitype = select}
			display_competitive_rules_voting \{next_state = uistate_play_song
				voting_callback = songlist_voting_callback_continue}
			return
		else
			ui_sfx \{menustate = setlist
				uitype = complete}
			gman_startgamemodegoal
		endif
		Change current_level = ($g_band_lobby_current_level)
		venue = ($g_band_lobby_current_level)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
		case practice
		practice_setup_part_and_continue device_num = ($primary_controller)
		return
	endswitch
	if (<show_help_page> = 0)
		ui_event \{event = menu_change
			state = uistate_play_song}
	endif
endscript

script songlist_continue_for_quickplay \{autosave_playlist = !i1768515945}
	venue = ($g_band_lobby_current_level)
	gman_venuefunc {goal = quickplay tool = venue_handler func = set_venue params = {venue_name = <venue>}}
	gman_challengemanagerfunc \{goal = quickplay
		tool = challenges
		func = disable_power_score_challenge}
	if (<autosave_playlist> = 1)
		fill_auto_save_playlist
	endif
	if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
		create_venue_loading_screen movie_params = ($LevelZones.<venue>)
	else
		create_loading_screen
	endif
	ui_event \{event = menu_change
		state = uistate_play_song}
endscript

script songlist_voting_callback_continue \{Result = !q1768515945}
	printf \{qs(0x7d7081f8)}
	Change competitive_rules = <Result>
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
endscript

script songlist_generate_song_array 
	additional_props_array = []
	index = 0
	get_savegame_from_controller controller = ($primary_controller)
	GetArraySize ($current_playlist)
	if (<array_Size> > 0)
		begin
		get_ui_song_struct_items song = (<playlist> [<index>]) savegame = <savegame>
		additional_props = {}
		if StructureContains structure = <ui_struct> additional_props
			additional_props = (<ui_struct>.additional_props)
		endif
		if StructureContains structure = <additional_props> jam_index
			SetArrayElement ArrayName = playlist index = <index> NewValue = jamsession
		endif
		AddArrayElement array = <additional_props_array> element = <additional_props>
		additional_props_array = <array>
		index = (<index> + 1)
		repeat <array_Size>
	endif
	return additional_props_array = <array> song_array = <playlist>
endscript

script songlist_destroy 
	if ScreenElementExists \{id = songlist_component}
		songlist_component :membfunc_songlist_uistack_unregisterallcontentsources
		songlist_component :membfunc_songlist_uistack_getmode
		songlist_set_mode_sort_index mode = <mode>
	endif
	if ScriptIsRunning \{songlist_request_initial_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_initial_page_when_ready}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
endscript

script songlist_unregister_content_source \{list_name = !q1768515945}
	KillSpawnedScript \{Name = monitor_marketplace_persistence_for_error}
	contentmanfunc func = unregister_content_source Name = <list_name>
endscript

script songlist_get_first_visible_item_info 
	songlist_smenu :scrollingmenu_getfirstvisibleindex
	GetScreenElementChildren \{id = current_menu}
	if GotParam \{children}
		GetArraySize <children>
		if (<array_Size> > 0)
			<first_visible_id> = (<children> [<first_visible_index>])
			<first_visible_id> :GetSingleTag header
			<first_visible_id> :GetSingleTag song_checksum
			if (<header> = 0)
				return first_visible_song_checksum = <song_checksum> header = <header> first_visible_index = <first_visible_index>
			else
				<return_header> = <header>
				<first_visible_id> :GetSingleTag header_struct
				if (<first_visible_index> > 0)
					<i> = (<first_visible_index> - 1)
					begin
					if (<i> < 0)
						break
					endif
					<first_visible_id> = (<children> [<i>])
					<first_visible_id> :GetSingleTag header
					if (<header> = 0)
						<first_visible_id> :GetSingleTag song_checksum
						return header = <return_header> header_struct = <header_struct> first_visible_song_checksum = <song_checksum> first_visible_index = <first_visible_index>
					endif
					<i> = (<i> - 1)
					repeat <first_visible_index>
				endif
				return header = <return_header> header_struct = <header_struct> first_visible_index = <first_visible_index>
			endif
		endif
	endif
endscript

script songlist_get_last_visible_index 
	songlist_smenu :scrollingmenu_getlastvisibleindex
	return last_visible_index = <last_visible_index>
endscript

script songlist_get_tag_selected_index 
	current_menu :GetSingleTag \{tag_selected_index}
	return tag_selected_index = <tag_selected_index>
endscript

script songlist_scroll_down 
	if ScreenElementExists \{id = SongList}
		songlist_component :GetSingleTag \{list_dirty}
		songlist_component :membfunc_songlist_uistack_getlistname
		songlist_component :membfunc_songlist_uistack_getlistbottom
		songlist_component :membfunc_songlist_uistack_getlistpagesize
		songlist_component :membfunc_songlist_uistack_getmaxmenuelements
		SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
		if (<list_dirty> = true)
			return
		endif
		songlist_component :membfunc_songlist_uistack_scrolldown
		if (<scroll_result> = proceed_as_normal)
			current_menu :GetSingleTag \{tag_selected_index}
			songlist_component :membfunc_songlist_uistack_getmaxmenuelements
			if (<tag_selected_index> = (<max_menu_elements> - 1))
				if songlist_component :membfunc_songlist_uistack_isitemanheader
					songlist_component :membfunc_songlist_uistack_decrementlistindex
					songlist_insert_item_bottom \{focus = 0}
					OnExitRun \{songlist_scroll_down}
					return
				endif
				songlist_insert_item_bottom
			elseif (<tag_selected_index> = (<max_menu_elements> - 2))
				if songlist_component :membfunc_songlist_uistack_isitemanheader
					songlist_component :membfunc_songlist_uistack_decrementlistindex
					OnExitRun \{songlist_scroll_down
						params = {
							force_insert = 1
						}}
					return
				endif
				if GotParam \{force_insert}
					songlist_insert_item_bottom
					songlist_component :Obj_SpawnScriptNow \{songlist_wait_and_update_sticky_header}
				endif
			endif
			if songlist_component :membfunc_songlist_uistack_isitemanheader
				songlist_component :membfunc_songlist_uistack_incrementmastervectorindex
			endif
			if NOT GotParam \{dont_update_slider}
				generic_scrollbar_wgt_update_thumb_pos \{id = songlist_scrollbar_wgt
					Dir = down}
				songlist_scroll_sound
			endif
		elseif (<scroll_result> = request_data_range_down)
			songlist_component :membfunc_songlist_uistack_getlisttop
			songlist_component :membfunc_songlist_uistack_getlistbottom
			contentmanfunc {
				func = request_data
				Name = <list_name>
				start_index = <list_top>
				end_index = <list_bottom>
				callback = songlist_callback_data_range
			}
			generic_scrollbar_wgt_update_thumb_pos \{id = songlist_scrollbar_wgt
				Dir = down}
			songlist_scroll_sound
		elseif (<scroll_result> = request_page_down)
			<event_handlers> = [
				{pad_down nullscript}
			]
			current_menu :se_setprops {
				event_handlers = <event_handlers>
				replace_handlers
			}
			contentmanfunc {
				func = more_data
				Name = <list_name>
				page_down
				callback = songlist_callback_more_data_down
			}
		endif
	endif
endscript

script songlist_scroll_up 
	if ScreenElementExists \{id = SongList}
		songlist_component :GetSingleTag \{list_dirty}
		songlist_component :membfunc_songlist_uistack_getlistname
		songlist_component :membfunc_songlist_uistack_getlisttop
		songlist_component :membfunc_songlist_uistack_getlistpagesize
		songlist_component :membfunc_songlist_uistack_getmaxmenuelements
		if (<list_dirty> = true)
			return
		endif
		songlist_component :membfunc_songlist_uistack_scrollup
		if (<scroll_result> = proceed_as_normal)
			current_menu :GetSingleTag \{tag_selected_index}
			if (<tag_selected_index> = 0)
				if songlist_component :membfunc_songlist_uistack_isitemanheader
					songlist_component :membfunc_songlist_uistack_incrementlistindex
					songlist_insert_item_top \{focus = 0}
					songlist_component :GetSingleTag \{sticky_header_struct}
					songlist_component :membfunc_songlist_uistack_updatestickyheaderwithprevious curr_header_struct = <sticky_header_struct>
					OnExitRun \{songlist_scroll_up}
					return
				endif
				songlist_insert_item_top
			elseif (<tag_selected_index> = 1)
				if songlist_component :membfunc_songlist_uistack_isitemanheader
					songlist_component :membfunc_songlist_uistack_incrementlistindex
					songlist_component :GetSingleTag \{sticky_header_struct}
					songlist_component :membfunc_songlist_uistack_updatestickyheaderwithprevious curr_header_struct = <sticky_header_struct>
					OnExitRun \{songlist_scroll_up
						params = {
							force_insert = 1
						}}
					return
				endif
				if GotParam \{force_insert}
					songlist_insert_item_top
				endif
			endif
			if songlist_component :membfunc_songlist_uistack_isitemanheader
				songlist_component :membfunc_songlist_uistack_decrementmastervectorindex
			endif
			if NOT GotParam \{dont_update_slider}
				generic_scrollbar_wgt_update_thumb_pos \{id = songlist_scrollbar_wgt
					Dir = up}
				songlist_scroll_sound
			endif
		elseif (<scroll_result> = request_data_range_up)
			songlist_component :membfunc_songlist_uistack_getlisttop
			songlist_component :membfunc_songlist_uistack_getlistbottom
			contentmanfunc {
				func = request_data
				Name = <list_name>
				start_index = <list_top>
				end_index = <list_bottom>
				callback = songlist_callback_data_range
			}
			generic_scrollbar_wgt_update_thumb_pos \{id = songlist_scrollbar_wgt
				Dir = up}
			songlist_scroll_sound
		elseif (<scroll_result> = request_page_up)
			<event_handlers> = [
				{pad_up nullscript}
			]
			current_menu :se_setprops {
				event_handlers = <event_handlers>
				replace_handlers
			}
			contentmanfunc {
				func = more_data
				Name = <list_name>
				page_up
				callback = songlist_callback_more_data_up
			}
		endif
	endif
endscript

script songlist_scroll_sound 
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = play_song)
		audio_ui_play_songlist_scroll_sfx
	elseif (<mode> = playlist)
		audio_ui_play_playlist_scroll_sfx
	elseif (<mode> = music_store)
		music_store_scroll_sfx
	else
		audio_ui_play_songlist_scroll_sfx
	endif
endscript

script songlist_callback_more_data_down 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	if (<more_data> = true)
		<sortspec> = {
			key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
			alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
			(($g_songlist_sort_array [($g_songlist_sort_index)]).Progression)
		}
		songlist_component :membfunc_songlist_uistack_getlistname
		songlist_component :membfunc_songlist_uistack_getcurrentchecksum
		songlist_component :membfunc_songlist_uistack_getfilterspec
		contentmanfunc {
			func = request_page
			Name = <list_name>
			page_down
			Seek = <current_checksum>
			sortspec = <sortspec>
			filterspec = <filterspec>
			invert_filterspec = <invert_filterspec>
			callback = songlist_callback_have_page_down
		}
		songlist_component :SetTags \{list_dirty = true}
	else
		<event_handlers> = [
			{pad_down generic_blocking_execute_script params = {pad_script = songlist_scroll_down}}
		]
		current_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript

script songlist_callback_more_data_up 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	if (<more_data> = true)
		<sortspec> = {
			key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
			alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
			(($g_songlist_sort_array [($g_songlist_sort_index)]).Progression)
		}
		songlist_component :membfunc_songlist_uistack_getlistname
		songlist_component :membfunc_songlist_uistack_getcurrentchecksum
		songlist_component :membfunc_songlist_uistack_getfilterspec
		contentmanfunc {
			func = request_page
			Name = <list_name>
			page_up
			Seek = <current_checksum>
			sortspec = <sortspec>
			filterspec = <filterspec>
			invert_filterspec = <invert_filterspec>
			callback = songlist_callback_have_page_up
		}
		songlist_component :SetTags \{list_dirty = true}
	else
		<event_handlers> = [
			{pad_up generic_blocking_execute_script params = {pad_script = songlist_scroll_up}}
		]
		current_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript

script songlist_callback_have_page_up 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	songlist_request_new_data_range <...> Dir = up callback = songlist_callback_new_data_range_up
endscript

script songlist_callback_have_page_down 
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	songlist_request_new_data_range <...> Dir = down callback = songlist_callback_new_data_range_down
endscript

script songlist_request_new_data_range \{Dir = !q1768515945
		callback = !q1768515945}
	songlist_component :membfunc_songlist_uistack_getmode
	songlist_component :membfunc_songlist_uistack_getlistname
	songlist_component :membfunc_songlist_uistack_setlistindex list_index = <seek_index> seek_checksum = <seek_checksum>
	songlist_component :membfunc_songlist_uistack_setlistpagesize list_page_size = <page_size>
	songlist_component :SetTags \{list_dirty = FALSE}
	songlist_component :membfunc_songlist_uistack_getmaxcontentsize
	<offset> = (<max_content_size> / 2)
	<new_list_bottom> = (<seek_index> + <offset>)
	<new_list_top> = (<new_list_bottom> - <max_content_size> + 1)
	if (<Dir> = up)
		if (<page_size> > <max_content_size>)
			if (<new_list_top> < 0)
				<new_list_top> = 0
				<new_list_bottom> = (<max_content_size> - 1)
			endif
		else
			if (<new_list_top> < 0)
				<new_list_top> = 0
				<new_list_bottom> = (<page_size> - 1)
			endif
		endif
	else
		if (<page_size> > <max_content_size>)
			if (<new_list_bottom> > (<page_size> - 1))
				<new_list_bottom> = (<page_size> - 1)
				<new_list_top> = (<new_list_bottom> - (<max_content_size> - 1))
			endif
		else
			if (<new_list_bottom> > (<page_size> - 1))
				<new_list_bottom> = (<page_size> - 1)
				<new_list_top> = 0
			endif
		endif
	endif
	songlist_component :membfunc_songlist_uistack_setlisttop list_top = <new_list_top>
	songlist_component :membfunc_songlist_uistack_setlistbottom list_bottom = <new_list_bottom>
	songlist_component :membfunc_songlist_uistack_updateheaderarray
	if ($g_songlist_debug_output = 1)
		printf \{channel = SongList
			qs(0x30a6dd97)}
		printf \{channel = SongList
			qs(0xe76beaa4)}
		printstruct channel = SongList <...>
		printf \{channel = SongList
			qs(0xe76beaa4)}
	endif
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = <callback>
	}
endscript

script songlist_callback_new_data_range_up 
	songlist_callback_data_range <...>
	songlist_scroll_up
	<event_handlers> = [
		{pad_up generic_blocking_execute_script params = {pad_script = songlist_scroll_up}}
	]
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script songlist_callback_new_data_range_down 
	songlist_callback_data_range <...>
	songlist_scroll_down
	<event_handlers> = [
		{pad_down generic_blocking_execute_script params = {pad_script = songlist_scroll_down}}
	]
	current_menu :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script songlist_slide_scroll 
	getlogicframe
	last_change = <logicframe>
	last_button = 0
	CreateScreenElement \{parent = root_window
		Type = SpriteElement
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
	if guitargettouchpattern \{Player = 1}
		getlogicframe
		if (<touch_pattern> < <last_button>)
			last_button = <touch_pattern>
			if (<rate> >= 0)
				if NOT (<logicframe> = <last_change>)
					rate = ((<rate> + (<rate_scale> / (<logicframe> - <last_change>))) / 2)
				endif
			else
				rate = 0
			endif
			last_change = <logicframe>
			rot_angle = 0
		elseif (<touch_pattern> > <last_button>)
			last_button = <touch_pattern>
			if (<rate> <= 0)
				if NOT (<logicframe> = <last_change>)
					rate = ((<rate> + (<rate_scale> / (<last_change> - <logicframe>))) / 2)
				endif
			else
				rate = 0
			endif
			last_change = <logicframe>
			rot_angle = 180
		endif
	endif
	if ((<rate> > 0.1) || (<rate> < -0.1))
		rate = (<damper> * <rate>)
	else
		rate = 0
	endif
	MathFloor <rate>
	CastToInteger \{floor}
	SetScreenElementProps id = <id> Scale = ((0.0, 1.0) + ((1.0, 0.0) * <floor>)) rot_angle = <rot_angle>
	Wait \{5
		gameframes}
	repeat
endscript

script songlist_back_sfx \{menustate = setlist}
	if ((ininternetmode) && ($net_song_countdown = 1))
		return
	endif
	ui_sfx {
		menustate = <menustate>
		uitype = back
	}
endscript

script songlist_back 
	songlist_component :membfunc_songlist_uistack_getmode
	gamemode_gettype
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{visited_hub}
		if (<visited_hub> = 1)
			songlist_component :SetTags \{music_store_seek_override = true}
			songlist_music_store_disallow_sorting
			songlist_music_store_go_to_hub
		else
			destroy_dialog_box
			if ui_event_exists_in_stack \{Name = 'band_lobby'}
				<back_state> = uistate_band_lobby
			else
				<back_state> = uistate_mainmenu
			endif
			generic_event_back state = <back_state>
		endif
	elseif (<mode> = leaderboard)
		songlist_leaderboard_back
	elseif (<Type> = practice)
		ui_event \{event = menu_back
			data = {
				songlist_change_canceled = true
			}}
	elseif (<Type> = freeplay)
		if (<mode> = playlist)
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			songlist_component :GetSingleTag \{exclusive_device}
			create_dialog_box {
				heading_text = qs(0xaa163738)
				body_text = qs(0xbdfb6886)
				player_device = <exclusive_device>
				options = [
					{
						func = songlist_destroy_dialog_box
						text = qs(0xdba6e8b9)
					}
					{
						func = songlist_freeplay_revert_playlist
						text = qs(0x9894be22)
					}
				]
			}
		else
			songlist_freeplay_revert_playlist
			destroy_friend_feed
		endif
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
					ui_sfx \{menustate = Generic
						uitype = back}
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
						quit_online_now \{save = 0}
						return
					endif
				else
					state = uistate_band_lobby
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
			ui_sfx \{menustate = Generic
				uitype = back}
			generic_event_choose \{state = uistate_online_quit_warning
				data = {
					is_popup
				}}
		endif
		hide_glitch \{num_frames = 10}
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
					state = uistate_band_lobby
				}}
		endif
	endif
endscript

script songlist_freeplay_revert_playlist 
	destroy_dialog_box
	hide_glitch \{num_frames = 20}
	destroy_friend_feed
	ui_event \{event = menu_back
		data = {
			songlist_change_canceled = true
		}}
endscript

script songlist_sort \{index = !i1768515945}
	songlist_component :membfunc_songlist_uistack_getmode
	current_menu :GetSingleTag \{tag_selected_index}
	if NOT GotParam \{tag_selected_index}
		return
	endif
	if (<mode> = music_store)
		songlist_component :GetSingleTag \{visited_hub}
		if (<visited_hub> = 0)
			return
		endif
	endif
	current_menu :se_setprops \{block_events}
	songlist_change_sort_index index = <index>
	audio_ui_play_sort_songlist_sfx
	songlist_update_song_preview \{song = None}
	songlist_scrollbar_wgt :se_setprops \{alpha = 0.0}
	songlist_refresh_menus \{no_focus = 1}
endscript

script songlist_refresh_menus 
	songlist_clear_menus
	songlist_component :membfunc_songlist_uistack_getmode
	if NOT GotParam \{no_pivot}
		if NOT GotParam \{pivot_checksum}
			songlist_component :membfunc_songlist_uistack_getcurrentchecksum
			Change g_songlist_current_pivot = <current_checksum>
		else
			Change g_songlist_current_pivot = <pivot_checksum>
		endif
		songlist_component :membfunc_songlist_uistack_setlistindex \{list_index = 0}
		songlist_component :membfunc_songlist_uistack_setlisttop \{list_top = 0}
		songlist_component :membfunc_songlist_uistack_setlistbottom \{list_bottom = 0}
		songlist_component :membfunc_songlist_uistack_setlistpagesize \{list_page_size = 0}
		songlist_component :membfunc_songlist_uistack_zeromastervectorindex
	else
		Change \{g_songlist_current_pivot = NULL}
		songlist_component :membfunc_songlist_uistack_initialize
	endif
	songlist_component :SetTags \{list_dirty = FALSE
		requires_build = true}
	if (<mode> = playlist)
		songlist_detail :se_setprops \{songlist_detail_mini_playlistt_text_alpha = 1.0}
	else
	endif
	songlist_scrollbar_wgt :se_setprops \{scroll_thumb_pos = (0.0, 0.0)}
	songlist_update_ui
	songlist_pre_build
	if NOT GotParam \{no_focus}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script songlist_clear_menus 
	songlist_component :membfunc_songlist_uistack_getmode
	DestroyScreenElement \{id = current_menu
		preserve_parent}
	if NOT (<mode> = music_store)
		DestroyScreenElement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
	endif
	SetScreenElementLock \{id = current_menu
		OFF}
	SetScreenElementLock \{id = current_menu
		On}
	if NOT (<mode> = music_store)
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			OFF}
		SetScreenElementLock \{id = songlist_detail_mini_playlist_vmenu
			On}
	endif
endscript

script songlist_leaderboard_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	audio_ui_menu_music_on
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

script get_highest_difficulty 
	highest_difficulty = beginner
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		if difficulty_is_higher compare = <difficulty> against = <highest_difficulty>
			highest_difficulty = <difficulty>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return highest_difficulty = <highest_difficulty>
endscript

script difficulty_is_higher \{compare = !q1768515945
		against = !q1768515945}
	if (<against> = expert)
		return \{FALSE}
	endif
	if (<compare> = expert)
		return \{true}
	endif
	if (<against> = hard)
		return \{FALSE}
	endif
	if (<compare> = hard)
		return \{true}
	endif
	if (<against> = medium)
		return \{FALSE}
	endif
	if (<compare> = medium)
		return \{true}
	endif
	if (<against> = easy)
		return \{FALSE}
	endif
	if (<compare> = easy)
		return \{true}
	endif
	if (<against> != <compare>)
		ScriptAssert 'Improper compare %a vs %b' a = <against> b = <compare>
	endif
	if (<against> != beginner)
		ScriptAssert 'Unknown difficulty %a' a = <against>
	endif
	return \{FALSE}
endscript

script songlist_get_data_for_songlist_stats {
		0x54 toprockerssong = ($last_song_played)
	}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		getfirstplayer \{in_game
			local}
		<player_num> = <Player>
	endif
	get_highest_difficulty
	get_song_title song = <toprockerssong>
	getnumplayersingame
	if (<num_players> = 1)
		getplayerinfo <player_num> part
	else
		<part> = Band
	endif
	if faststructurecontains structure = ($debug_songlist_props) Name = <toprockerssong>
		return
	endif
	get_difficulty_text difficulty = <highest_difficulty>
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	if (<num_players> = 1)
		getscorefromdetailedstats Player = <player_num>
		getstarsfromdetailedstats Player = <player_num>
		get_percent_notes_hit player_index = <player_num> use_player_info = 0
	else
		getplayerinfo <player_num> Band
		score = ($song_stats_backup_band [(<Band> - 1)].score)
		stars = ($song_stats_backup_band [(<Band> - 1)].stars)
		get_percent_notes_hit_for_band Band = <Band>
	endif
	CastToInteger \{percent_notes_hit}
	if (<percent_notes_hit> < 0)
		percent_notes_hit = 0
	endif
	if (<percent_notes_hit> > 100)
		percent_notes_hit = 100
	endif
	CastToInteger \{score}
	return songname = <songname> score = <score> stars = <stars> percent_notes_hit = <percent_notes_hit>
endscript

script fix_song_id_suddendeath_hack \{song_id = !q1768515945}
	if (<song_id> = suddendeathgh6career)
		<song_id> = suddendeath
	endif
	return song_id = <song_id>
endscript

script increment_num_times_played \{song_id = !q1768515945}
	fix_song_id_suddendeath_hack song_id = <song_id>
	savegame_added_song = []
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		get_actual_controller Player = <Player>
		get_savegame_from_controller controller = <controller>
		if NOT ArrayContains array = <savegame_added_song> contains = <savegame>
			AddArrayElement array = <savegame_added_song> element = <savegame>
			<savegame_added_song> = <array>
			GetGlobalTags <song_id> param = num_times_played savegame = <savegame>
			if (<num_times_played> < ($g_max_song_globaltag_plays))
				SetGlobalTags <song_id> params = {num_times_played = (<num_times_played> + 1)} savegame = <savegame>
			endif
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script get_percent_notes_hit_for_band 
	<cumulative_percent_hit> = 0
	<num_members> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> Band out = this_band
		if (<Band> = <this_band>)
			get_percent_notes_hit player_index = <Player>
			<cumulative_percent_hit> = (<cumulative_percent_hit> + <percent_notes_hit>)
			<num_members> = (<num_members> + 1)
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	<percent_notes_hit> = 0
	if (<num_members> > 0)
		<percent_notes_hit> = (<cumulative_percent_hit> / <num_members>)
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script debug_songlist_print_playlist 
	printstruct channel = playlist ($current_playlist)
	printf \{channel = playlist
		qs(0xcb943ab3)}
endscript

script debug_songlist_print_tags 
	songlist_component :GetTags
	printstruct <...>
	printf \{qs(0xcb943ab3)}
endscript

script musicstore_format_price_text 
	if isxenonorwindx
		formatText TextName = price_text qs(0x581d2af2) p = <price>
	else
		formatdecimals integer = <price> fractional = <price_fraction> num_decimals = <currency_decimals>
	endif
	return price_text = <price_text>
endscript

script music_store_scroll_sfx 
	ui_sfx \{menustate = setlist
		uitype = scrollup}
endscript

script music_store_select_sfx 
	ui_sfx \{menustate = setlist
		uitype = select}
endscript

script music_store_back_sfx 
	if GotParam \{Generic}
		ui_sfx \{menustate = Generic
			uitype = back}
	else
		ui_sfx \{menustate = setlist
			uitype = back}
	endif
endscript

script music_store_determine_currency 
	if isps3
		if marketplacefunc \{func = get_currency_info}
			return true currency = <currency_code> currency_decimals = <currency_decimals>
		else
			ScriptAssert \{'Currency info fetch failed'}
		endif
	endif
	return \{FALSE}
endscript

script ui_move_playlist_friend_feed \{slot = 0
		time = 0.2}
	switch <slot>
		case 0
		ff_adjust_feed_pos Pos = (625.0, -76.0) time = <time>
		case 1
		ff_adjust_feed_pos Pos = (625.0, -46.0) time = <time>
		case 2
		ff_adjust_feed_pos Pos = (625.0, -16.0) time = <time>
		case 3
		ff_adjust_feed_pos Pos = (625.0, 15.0) time = <time>
		case 4
		ff_adjust_feed_pos Pos = (625.0, 44.0) time = <time>
		default
		ff_adjust_feed_pos Pos = (625.0, 74.0) time = <time>
	endswitch
endscript

script monitor_marketplace_persistence_for_error 
	begin
	if marketplacepersistencefunc \{func = encountered_error}
		songlist_component :membfunc_songlist_uistack_getmode
		if (<mode> = music_store)
			marketplacepersistencefunc \{func = handle_internal_error}
		else
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{event_handlers = [
						{
							pad_select
							nullscript
						}
					]
					replace_handlers}
			endif
			songlist_component :SetTags \{tab_enabled = 0}
			user_control_destroy_helper \{button = back}
		endif
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script play_band_lobby_complete_sfx 
	gamemode_gettype
	switch (<Type>)
		case quickplay
		universal_help_display_help_check help_context = quickplay_to_gameplay device_num = ($primary_controller)
		if (<show_help_page> = 1)
			ui_sfx \{menustate = Generic
				uitype = select}
		else
			ui_sfx \{menustate = setlist
				uitype = complete}
		endif
	endswitch
endscript

script songlist_sync_spot_callback 
	printf \{qs(0xcd400995)}
	if ui_event_exists_in_stack \{Name = 'sync_spot_warning'}
		printf \{qs(0x78d4386d)}
		generic_event_back \{state = uistate_songlist}
	else
		printf \{qs(0x38cd7801)}
		AssignAlias id = <menu> alias = current_menu
		current_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent Type = focus target = current_menu data = {child_index = <focus_index>}
	endif
	printf \{qs(0xb3c3a2ed)}
endscript
