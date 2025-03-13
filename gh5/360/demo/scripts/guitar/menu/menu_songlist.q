
script songlist_create \{pad_back_script = songlist_back
		locked = false
		exclusive_device = -1}
	requireparams \{[
			list_name
			mode
		]
		all}
	change g_songlist_sort_index = ($g_songlist_sort_indexes.<mode>)
	setmenuautorepeattimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	if (<mode> = music_store || <mode> = import)
		<desc> = 'music_store'
	else
		<desc> = 'songlist'
	endif
	createscreenelement {
		type = descinterface
		desc = <desc>
		id = songlist
		parent = root_window
	}
	if (<mode> = music_store || <mode> = import)
		songlist :se_setprops \{songlist_subheader_cont_alpha = 0.0}
	else
		<id> :obj_spawnscript songlist_do_physics_spawned
	endif
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	spawnscriptnow \{bg_crowd_front_end_silence}
	if songlist :desc_resolvealias \{name = alias_songlist_vmenu}
		assignalias id = <resolved_id> alias = current_menu
		controller = ($primary_controller)
		if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers)
			controller = <device_num>
		endif
		if (<controller> = -1)
			if gotparam \{device_num}
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
			scriptassert \{qs(0x6c9db444)}
		endif
		if (<exclusive_device> = -1)
			exclusive_device = <controller>
		endif
		<resolved_id> :se_setprops exclusive_device = <exclusive_device>
		songlist :settags savegame_device = <controller> exclusive_device = <exclusive_device>
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> songlist_options params = {show_more_info show_ghtunes}
		change g_songlist_show_more_info = <show_more_info>
		change g_songlist_show_ghtunes = <show_ghtunes>
		if allow_show_ghtunes_toggle
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
		scriptassert \{qs(0xd78eb9f9)}
	endif
	if NOT (<mode> = music_store || <mode> = import)
		if songlist :desc_resolvealias \{name = alias_songlist_detail_cont}
			assignalias id = <resolved_id> alias = songlist_detail_cont
		else
			scriptassert \{qs(0xf7d498a7)}
		endif
		if songlist :desc_resolvealias \{name = alias_songlist_slider_nub_cont}
			assignalias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			scriptassert \{qs(0x9a95e5a9)}
		endif
	else
		if songlist :desc_resolvealias \{name = alias_music_store_detail_cont}
			assignalias id = <resolved_id> alias = songlist_detail_cont
		else
			scriptassert \{qs(0x646b49e3)}
		endif
		if songlist :desc_resolvealias \{name = alias_music_store_slider_nub_cont}
			assignalias id = <resolved_id> alias = songlist_slider_nub_cont
		else
			scriptassert \{qs(0x47ccdd2f)}
		endif
		if (<mode> = import)
			if songlist :desc_resolvealias \{name = alias_music_store_ticker_window}
				<resolved_id> :se_setprops alpha = 0.0
			endif
		endif
	endif
	if songlist :desc_resolvealias \{name = alias_songlist_hilight_bar_cont}
		assignalias id = <resolved_id> alias = songlist_hilight_bar_cont
	else
		scriptassert \{qs(0xe42c78fa)}
	endif
	if NOT (<mode> = music_store || <mode> = import)
		if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers)
			player_num = 1
		else
			get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
		endif
		if issingleplayergame
			getplayerinfo <player_num> part
			getplayerinfo <player_num> difficulty
		else
			<part> = band
			get_highest_difficulty
			<difficulty> = <highest_difficulty>
		endif
		get_difficulty_text_nl difficulty = <difficulty>
		formattext checksumname = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
		formattext checksumname = instrument_out 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
		formattext checksumname = instrument_fill 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
		out_icon_alpha = 1
		band_icon_alpha = 0
		difficulty_alpha = 1
		if (<mode> = leaderboard || <mode> = toprockers)
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
				formattext checksumname = instrument_out 'icon_%i_out' i = <instrument_text_nl>
				formattext checksumname = instrument_fill 'icon_%i_fill' i = <instrument_text_nl>
			endif
			if (<mode> = leaderboard)
				difficulty_alpha = 0
			endif
		endif
	endif
	if (<mode> = music_store || <mode> = import)
		createscreenelement \{type = descinterface
			desc = 'songlist_detail_music_store'
			id = songlist_detail
			parent = songlist_detail_cont
			alpha = 0.0}
		songlist_music_store_assign_text_aliases
	else
		if NOT issingleplayergame
			out_icon_alpha = 0
			band_icon_alpha = 1
		endif
		createscreenelement {
			type = descinterface
			desc = 'songlist_detail'
			id = songlist_detail
			parent = songlist_detail_cont
			alpha = 0.0
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
			songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
				songlist_detail_frame_2_cont_alpha = 1.0}
		endif
		if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_stars_full_vmenu}
			assignalias id = <resolved_id> alias = songlist_detail_stars_full_vmenu
		else
			scriptassert \{qs(0x8030f42e)}
		endif
		if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_stars_empty_vmenu}
			assignalias id = <resolved_id> alias = songlist_detail_stars_empty_vmenu
		else
			scriptassert \{qs(0xc21dd60f)}
		endif
		if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_diff_inst_cont}
			assignalias id = <resolved_id> alias = songlist_detail_diff_inst_cont
		else
			scriptassert \{qs(0xa4036096)}
		endif
		if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_mini_playlist_vmenu}
			assignalias id = <resolved_id> alias = songlist_detail_mini_playlist_vmenu
		else
			scriptassert \{qs(0xbd105ffe)}
		endif
		if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_more_info_rows}
			assignalias id = <resolved_id> alias = songlist_detail_more_info_rows
		else
			scriptassert \{qs(0x17e03108)}
		endif
		createscreenelement \{type = descinterface
			desc = 'songlist_detail_playlist'
			id = songlist_detail_playlist
			parent = songlist_detail_cont
			alpha = 0.0}
		if songlist_detail_playlist :desc_resolvealias \{name = alias_songlist_detail_playlist_vmenu}
			assignalias id = <resolved_id> alias = songlist_detail_playlist_vmenu
		else
			scriptassert \{qs(0x09d998d8)}
		endif
		if screenelementexists \{id = songlist_detail_playlist}
			songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
		endif
		if songlist :desc_resolvealias \{name = alias_songlist_bg_illo
				param = anim1_id}
			<anim1_id> :obj_spawnscript ui_shakey_02
		else
			scriptassert \{'UI_art'}
		endif
		if songlist :desc_resolvealias \{name = alias_songlist_bg_illo
				param = anim1_id}
			<anim1_id> :obj_spawnscript ui_frazzmatazz_02
		else
			scriptassert \{'UI_art'}
		endif
		if songlist :desc_resolvealias \{name = alias_header_anim
				param = anim2_id}
			<anim2_id> :obj_spawnscript ui_shakey_02
		else
			scriptassert \{'UI_art'}
		endif
		if songlist :desc_resolvealias \{name = alias_header_anim
				param = anim2_id}
			<anim2_id> :obj_spawnscript ui_frazzmatazz_02
		else
			scriptassert \{'UI_art'}
		endif
	endif
	songlist_detail :settags \{prev_guitar_diff_rate = 0
		prev_bass_diff_rate = 0
		prev_drums_diff_rate = 0
		prev_vocals_diff_rate = 0
		prev_stars = 0}
	if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_difficulty_guitar_vmenu}
		assignalias id = <resolved_id> alias = songlist_detail_difficulty_guitar_vmenu
	else
		scriptassert \{qs(0xd483e01c)}
	endif
	if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_difficulty_bass_vmenu}
		assignalias id = <resolved_id> alias = songlist_detail_difficulty_bass_vmenu
	else
		scriptassert \{qs(0xab2daa8c)}
	endif
	if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_difficulty_drums_vmenu}
		assignalias id = <resolved_id> alias = songlist_detail_difficulty_drums_vmenu
	else
		scriptassert \{qs(0x3bfbfa01)}
	endif
	if songlist_detail :desc_resolvealias \{name = alias_songlist_detail_difficulty_vocals_vmenu}
		assignalias id = <resolved_id> alias = songlist_detail_difficulty_vocals_vmenu
	else
		scriptassert \{qs(0xb86d4f96)}
	endif
	<event_handlers> = [
		{pad_back generic_menu_pad_back_sound params = {mode = <mode>}}
		{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
	]
	if (<mode> = music_store || <mode> = import)
		<content_source> = marketplace
		<slider_pos> = (-14.0, 60.0)
		hilight_bar_res = 74
		songlist :settags \{music_store_mode = hub
			music_store_seek_override = true}
	else
		if NOT demobuild
			<sort_option> = {pad_l1 songlist_sort_toggle}
			addarrayelement array = <event_handlers> element = <sort_option>
			<event_handlers> = <array>
		endif
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
	songlist :settags {
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
	gamemode_gettype
	if NOT (<mode> = music_store || <mode> = import || <type> = freeplay)
		if (<mode> = leaderboard || <mode> = toprockers)
			songlist_determine_leaderboard_instrument_setup
		else
			songlist_determine_band_instrument_setup
		endif
		songlist :settags band_instrument_setup = <band_instrument_setup>
	endif
	songlist_update_ui
	songlist_slider_nub_cont :se_setprops pos = <slider_pos>
	if ininternetmode
		songlist :se_setprops \{songlist_net_cont_alpha = 1.0}
		net_songlist_leader_text
	endif
	if (<mode> = playlist)
		songlist_remove_unavailable_songs_from_playlist
	endif
endscript

script songlist_music_store_assign_text_aliases \{desc = songlist_detail}
	if screenelementexists id = <desc>
		if <desc> :desc_resolvealias name = alias_songlist_detail_album_text
			assignalias id = <resolved_id> alias = songlist_detail_album_text
		else
			scriptassert qs(0x9d4d64f5) d = <desc>
		endif
		if <desc> :desc_resolvealias name = alias_songlist_detail_genre_text
			assignalias id = <resolved_id> alias = songlist_detail_genre_text
		else
			scriptassert qs(0xae6b0c76) d = <desc>
		endif
		if <desc> :desc_resolvealias name = alias_songlist_detail_duration_text
			assignalias id = <resolved_id> alias = songlist_detail_duration_text
		else
			scriptassert qs(0x89329df5) d = <desc>
		endif
		if (<desc> = songlist_detail)
			if <desc> :desc_resolvealias name = alias_songlist_detail_songs_album_text
				assignalias id = <resolved_id> alias = songlist_detail_songs_album_text
			else
				scriptassert qs(0xe320c1cf) d = <desc>
			endif
			if <desc> :desc_resolvealias name = alias_songlist_detail_songs_genre_text
				assignalias id = <resolved_id> alias = songlist_detail_songs_genre_text
			else
				scriptassert qs(0x9f269a27) d = <desc>
			endif
			if <desc> :desc_resolvealias name = alias_songlist_detail_songs_duration_text
				assignalias id = <resolved_id> alias = songlist_detail_songs_duration_text
			else
				scriptassert qs(0x5c719b50) d = <desc>
			endif
		endif
	endif
endscript

script songlist_remove_unavailable_songs_from_playlist 
	songlist_manage_playlist_check_relevance
	if (<list_relevant> = false)
		change current_playlist = <override_array>
		change \{g_songlist_warning_active = 1}
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
			current_menu :se_setprops \{block_events}
		endif
		getnumplayersingame
		if (<num_players> > 1)
			formattext \{textname = body_text
				qs(0x44218325)}
		else
			formattext \{textname = body_text
				qs(0xfbc789d4)}
		endif
		songlist :getsingletag \{exclusive_device}
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
	songlist :getsingletag \{mode}
	songlist_create_default_user_control_helpers mode = <mode>
	change \{g_songlist_warning_active = 0}
	if NOT is_current_playlist_empty
		if NOT ininternetmode
			songlist_allow_continue
		endif
	endif
	if screenelementexists \{id = current_menu}
		songlist :getsingletag \{hilight_bar_index}
		current_menu :se_setprops \{unblock_events}
		launchevent \{type = unfocus
			target = current_menu}
		launchevent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
endscript

script songlist_calculate_playlist_duration 
	getarraysize \{$current_playlist}
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
		addarrayelement array = <time_array> element = <total_seconds>
		rr_get_time_string data = <array>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_duration_text = <data_text>
		}
	else
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_duration_text = qs(0x369c70d7)}
	endif
endscript

script songlist_update_ui 
	songlist :getsingletag \{mode}
	if (<mode> = music_store)
		<title> = ($g_music_store_title)
	elseif (<mode> = import)
		offering = ($downloaded_offerings [($downloaded_offerings_index)])
		<title> = (<offering>.display_name)
		import_esrb_label_alpha = 0.0
		if NOT ((<offering>.rating) = none)
			import_esrb_label_alpha = 1.0
		endif
		songlist :se_setprops {
			music_store_title_alpha = 0.0
			music_store_slider_cont_alpha = 1.0
			songlist_title_text_alpha = 1.0
			import_esrb_label_alpha = <import_esrb_label_alpha>
		}
	else
		<title> = ($g_songlist_modes.<mode>.title)
	endif
	songlist :se_setprops {
		songlist_title_text_text = <title>
		songlist_sort_property_dims = (10.0, 32.0)
		songlist_sort_property_text = (($g_songlist_sort_array [($g_songlist_sort_index)]).text)
	}
	<event_handlers> = [
		{pad_up songlist_scroll_up}
		{pad_down songlist_scroll_down}
	]
	if NOT (<mode> = music_store || <mode> = import)
		if NOT ininternetmode
			if NOT demobuild
				gamemode_gettype
				if NOT ((<type> = career) || (<mode> = leaderboard) || (<mode> = toprockers) || (<mode> = practice))
					<mp_option> = {pad_btn_left songlist_manage_playlist}
					addarrayelement array = <event_handlers> element = <mp_option>
					<event_handlers> = <array>
				else
					<mp_option> = {pad_btn_left songlist_toggle_more_info}
					addarrayelement array = <event_handlers> element = <mp_option>
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
		songlist :getsingletag \{visited_band_hub}
		if gotparam \{visited_band_hub}
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :se_setprops \{music_store_slider_cont_alpha = 1.0
				songlist_title_text_alpha = 1.0}
		endif
	else
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers mode = <mode>
	endif
endscript

script songlist_toggle_more_info 
	if ($g_songlist_show_more_info = 0)
		change \{g_songlist_show_more_info = 1}
		user_control_helper_change_text \{button = blue
			text = qs(0x0d424947)}
	else
		change \{g_songlist_show_more_info = 0}
		user_control_helper_change_text \{button = blue
			text = qs(0x6644ffc7)}
	endif
	songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
		params = {
			desc = songlist_detail
			force_transition
			fade_time = 0
		}}
endscript

script songlist_create_playlist 
	current_menu :se_setprops \{block_events}
	songlist :obj_spawnscriptnow songlist_create_playlist_spawned params = {<...>}
endscript

script songlist_create_playlist_spawned 
	songlist_playlist_switch_sfx
	songlist :settags \{mode = playlist
		non_song_item_focused = false}
	if NOT gotparam \{no_detail_transition}
		songlist_detail_transition \{desc = songlist_detail}
	endif
	menu_music_off
	change \{g_songlist_create_playlist_menu_item_present = 0}
	songlist_refresh_menus
	current_menu :se_setprops \{unblock_events}
endscript

script songlist_create_play_song 
	printf \{qs(0xa7101acc)}
	songlist_playlist_switch_sfx
	songlist :settags \{mode = play_song}
	if NOT gotparam \{no_detail_transition}
		songlist_detail_transition \{desc = songlist_detail}
	endif
	change \{g_songlist_create_playlist_menu_item_present = 0}
	songlist_refresh_menus
endscript

script songlist_manage_playlist 
	current_menu :se_setprops \{block_events}
	if scriptisrunning \{songlist_continue}
		return
	endif
	wait \{1
		gameframe}
	songlist_update_song_preview \{song = none}
	songlist :getsingletag \{exclusive_device}
	songlist :getsingletag \{savegame_device}
	if gotparam \{exclusive_device}
		generic_event_choose state = uistate_songlist_manage_playlist data = {is_popup exclusive_device = <exclusive_device> savegame_device = <savegame_device>}
	else
		scriptassert \{qs(0x098ea72c)}
	endif
endscript

script songlist_music_store_go_to_hub 
	current_menu :se_setprops \{alpha = 0.0}
	songlist :getsingletag \{territory}
	if (<territory> != territory_us)
		<esrb_notice_alpha> = 0.0
	else
		<esrb_notice_alpha> = 1.0
	endif
	songlist :se_setprops {
		music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0
		songlist_title_text_alpha = 0.0
		pa_esrb_label_alpha = 0.0
		esrb_notice_alpha = <esrb_notice_alpha>
	}
	songlist :getsingletag \{exclusive_device}
	generic_event_choose no_sound state = uistate_music_store_hub data = {is_popup exclusive_device = <exclusive_device>}
endscript

script songlist_music_store_go_to_terms 
	requireparams \{[
			purchase_struct
		]
		all}
	current_menu :se_setprops \{alpha = 0.0}
	songlist :se_setprops \{music_store_slider_cont_alpha = 0.0
		songlist_subheader_cont_alpha = 0.0
		songlist_sort_cont_alpha = 0.0}
	songlist :getsingletag \{exclusive_device}
	songlist_slider_nub_cont :se_getprops \{pos}
	ui_event_wait event = menu_change data = {
		no_sound
		state = uistate_music_store_terms
		is_popup
		exclusive_device = <exclusive_device>
		purchase_struct = <purchase_struct>
		slider_pos = <pos>
	}
endscript

script songlist_do_physics_spawned 
	create_2d_spring_system \{desc_id = songlist
		num_springs = 2
		stiffness = 50
		rest_length = 1}
endscript

script songlist_pre_build 
	songlist :gettags
	if (<cs_registered> = false)
		if (<mode> = import)
			if NOT import_create_details_content_source list_name = <list_name>
				return
			endif
			contentmanfunc \{func = debug_print}
		else
			contentmanfunc func = register_content_source name = <list_name> type = <content_source>
		endif
		songlist :settags \{cs_registered = true}
	endif
	songlist :settags \{list_dirty = true}
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	songlist :obj_spawnscriptnow songlist_request_page_when_ready params = {cs_registered = <cs_registered> list_name = <list_name> sortspec = <sortspec>}
endscript

script songlist_request_page_when_ready 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	begin
	if contentmanfunc func = is_ready name = <list_name>
		songlist :getsingletag \{mode}
		if (<mode> = music_store || <mode> = import)
			destroy_dialog_box
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :getsingletag \{music_store_mode}
			if gotparam \{music_store_mode}
				if ($g_music_store_current_pack_checksum = null)
					if (<music_store_mode> = songs)
						songlist_music_store_allow_sorting
					endif
				endif
			endif
		endif
		if NOT gotparam \{seek_index}
			seek_index = 0
		endif
		if ($g_songlist_ignore_pivot_hack = 1)
			change \{g_songlist_ignore_pivot_hack = 0}
			change \{g_songlist_current_pivot = 0}
			change \{g_songlist_pivot_hilight_index = 0}
			removeparameter \{seek_index}
		endif
		if (($g_songlist_current_pivot) > 0)
			seek_index = (($g_songlist_current_pivot) - ($g_songlist_create_playlist_menu_item_present))
		endif
		contentmanfunc {
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
	wait \{3
		gameframes}
	repeat 1000
	songlist :getsingletag \{mode}
	if (<mode> = music_store || <mode> = import)
		destroy_dialog_box
	endif
	if (<mode> != music_store)
		scriptassert \{qs(0x161ded6e)}
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
	change \{g_marketplace_responding_to_error = 0}
	ui_event \{event = menu_back
		data = {
			state = uistate_mainmenu
		}}
endscript

script songlist_build_request_data_callback 
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist :gettags
	<current_page> = (<seek_global_index> / ($g_songlist_page_size))
	casttointeger \{current_page}
	change g_songlist_current_page = <current_page>
	<slider_count> = <seek_index>
	if (<non_song_item_focused> = true)
		seek_index = 0
		<slider_count> = 0
	endif
	if (<mode> = music_store)
		if (<music_store_seek_override> = true)
			seek_index = 0
			<slider_count> = 0
			songlist :settags \{music_store_seek_override = false}
		endif
	endif
	songlist_calculate_slider_nub_res page_size = <content_size>
	<passed_in_seek_index> = <seek_index>
	if (<seek_index> > 0)
		if (<seek_index> > $g_songlist_pivot_hilight_index)
			<seek_index> = (<seek_index> - $g_songlist_pivot_hilight_index)
			if (<seek_index> >= (<content_size> - $g_songlist_last_visible_index))
				change g_songlist_pivot_hilight_index = ($g_songlist_last_visible_index - ((<page_size> - 1) - <passed_in_seek_index>))
			endif
		else
			change \{g_songlist_pivot_hilight_index = 0}
		endif
		songlist :getsingletag \{mode}
		if (<mode> = play_song)
			gamemode_gettype
			if NOT (<type> = career)
				<slider_count> = (<slider_count> + 1)
			endif
		endif
		<callback> = songlist_pivot_data_request_callback
	else
		change \{g_songlist_pivot_hilight_index = 0}
		<callback> = songlist_data_request_callback
	endif
	songlist :settags {
		list_page_size = <page_size>
		slider_nub_res = <slider_nub_res>
		list_index = <passed_in_seek_index>
		list_dirty = false
	}
	songlist_update_slider_nub_pos dir = down count = <slider_count>
	if ($g_songlist_pivot_hilight_index = 0)
		<count> = 0
	else
		<count> = ($g_songlist_pivot_hilight_index)
	endif
	songlist_update_hilight_bar_pos dir = down count = <count>
	if ((<mode> = music_store) || (<mode> = import))
		songlist_hilight_bar_cont :se_setprops \{alpha = 0.5}
	else
		songlist_hilight_bar_cont :se_setprops \{alpha = 0.3}
	endif
	songlist_slider_nub_cont :se_setprops \{alpha = 1.0}
	change \{g_songlist_current_pivot = 0}
	change \{g_songlist_pivot_hilight_index = 0}
	if (<page_size> <= ($g_songlist_last_visible_index + 1))
		user_control_destroy_helper \{button = yellow}
	endif
	formattext textname = num_songs qs(0xc31d83ea) i = <content_size>
	songlist :se_setprops songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0xd20d2af6)}
		else
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x08cb5377)}
		else
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	if demobuild
		formattext textname = demo_songs qs(0x862202b8) a = <content_size> b = 85
		songlist :se_setprops songlist_songs_available_num_text = <demo_songs>
	endif
	<start_index> = <seek_index>
	if (<page_size> = 0)
		songlist_detail :se_setprops \{alpha = 0.0}
		songlist_disallow_continue
		if ($g_songlist_warning_active = 0)
			current_menu :se_setprops \{unblock_events}
			launchevent \{type = unfocus
				target = current_menu}
			launchevent \{type = focus
				target = current_menu}
		endif
		return
	elseif (<page_size> <= ($g_songlist_last_visible_index))
		<end_index> = ((<page_size> - 1) + <seek_index>)
		change g_songlist_last_visible_index = (<page_size> - 1)
	else
		<end_index> = (($g_songlist_last_visible_index) + <seek_index>)
		if (<end_index> >= <page_size>)
			<end_index> = (<page_size> - 1)
			<start_index> = (<end_index> - ($g_songlist_last_visible_index))
		endif
	endif
	songlist :settags {
		list_top = <start_index>
		list_bottom = <end_index>
	}
	contentmanfunc {
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
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist :gettags
	if (<mode> = music_store)
		previewassetcache \{func = cancel_all_requests}
		music_store_preload_album_covers list = <range>
		music_store_preload_preview_music list = <range>
	endif
	if (<initial_built> = false)
		if (<mode> = play_song)
			gamemode_gettype
			if (<type> = career)
				dont_add_non_song_item = 1
			endif
			if ($g_songlist_current_page > 0)
				dont_add_non_song_item = 1
			endif
			if demobuild
				dont_add_non_song_item = 1
			endif
			if NOT gotparam \{dont_add_non_song_item}
				songlist_add_non_song_item \{focus_script = songlist_item_create_playlist_focus
					unfocus_script = songlist_item_create_playlist_unfocus
					choose_script = songlist_create_playlist}
			else
				menu_music_off
				change \{g_songlist_create_playlist_menu_item_present = 0}
			endif
		else
			menu_music_off
		endif
		songlist_build <...>
		songlist :settags \{initial_built = true}
	else
		if ($g_songlist_create_playlist_menu_item_present = 1)
			<list_index> = (<list_index> - 1)
			songlist :settags list_index = <list_index>
			change \{g_songlist_create_playlist_menu_item_present = 0}
		endif
		if (<list_index> = <list_top>)
			songlist_insert_item_top <...>
		elseif (<list_index> = <list_bottom>)
			songlist_insert_item_bottom <...>
		endif
	endif
	if songlist :getsingletag \{need_unavailable_dialog}
		if (<need_unavailable_dialog> = 1)
			songlist :settags \{need_unavailable_dialog = 0}
			generic_event_choose \{state = uistate_songlist_popup
				data = {
					is_popup
					exclusive_device = 0
				}}
		endif
	endif
endscript

script songlist_add_non_song_item 
	requireparams \{[
			focus_script
			unfocus_script
			choose_script
		]
		all}
	createscreenelement {
		type = descinterface
		desc = 'songlist_create_playlist_item'
		parent = current_menu
		autosizedims = true
		event_handlers = [
			{focus <focus_script>}
			{unfocus <unfocus_script>}
			{pad_choose <choose_script>}
		]
	}
	change \{g_songlist_create_playlist_menu_item_present = 1}
endscript

script songlist_insert_item_top 
	<index> = 0
	songlist :gettags
	getscreenelementchildren \{id = current_menu}
	if gotparam \{children}
		getarraysize <children>
		if (<array_size> > ($g_songlist_last_visible_index))
			destroyscreenelement id = (<children> [($g_songlist_last_visible_index)])
		endif
	endif
	if NOT gotparam \{non_song_item}
		songlist_add_item {
			ui_struct = (<range> [<index>])
			index = 0
		}
		menu_music_off
	else
		songlist_add_non_song_item \{focus_script = songlist_item_create_playlist_focus
			unfocus_script = songlist_item_create_playlist_unfocus
			choose_script = songlist_create_playlist}
	endif
	current_menu :menu_setitemindex index = ($g_songlist_last_visible_index) newindex = 0
	launchevent \{type = unfocus
		target = current_menu}
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script songlist_insert_item_bottom 
	<index> = ($g_songlist_last_visible_index)
	songlist :gettags
	getscreenelementchildren \{id = current_menu}
	destroyscreenelement id = (<children> [0])
	songlist_add_item {
		ui_struct = (<range> [<index>])
		index = <index>
	}
	launchevent \{type = unfocus
		target = current_menu}
	launchevent type = focus target = current_menu data = {child_index = <index>}
endscript

script songlist_build 
	printf \{'songlist_build'}
	songlist :gettags
	if (<mode> = music_store)
		if NOT gotparam \{visited_band_hub}
			songlist :settags \{visited_band_hub = true}
			songlist_music_store_go_to_hub
			return
		endif
	endif
	getarraysize <range>
	if ((<array_size> - ($g_songlist_create_playlist_menu_item_present)) > 0)
		<i> = 0
		begin
		songlist_add_item {
			ui_struct = (<range> [<i>])
			index = <i>
		}
		<i> = (<i> + 1)
		repeat (<array_size> - ($g_songlist_create_playlist_menu_item_present))
	endif
	if ($g_songlist_warning_active = 0)
		current_menu :se_setprops \{unblock_events}
		launchevent \{type = unfocus
			target = current_menu}
		launchevent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
	if (<mode> = music_store || <mode> = import)
		songlist :settags \{list_dirty = false}
		return
	endif
	formattext textname = songs_required qs(0xc31d83ea) i = ($g_songlist_force_num_songs_to_choose)
	songlist_detail_playlist :se_setprops {
		songlist_detail_playlist_num_songs_required_text = <songs_required>
	}
	if ($g_songlist_force_num_songs_to_choose > 0)
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_songs_added_alpha = 1.0
			songlist_detail_playlist_duration_alpha = 0.0}
	endif
	getarraysize ($current_playlist)
	if (<array_size> > 0)
		<i> = 0
		<iters> = <array_size>
		if (<array_size> > ($g_songlist_playlist_detail_items))
			<i> = (<array_size> - ($g_songlist_playlist_detail_items))
			<iters> = ($g_songlist_playlist_detail_items)
		endif
		begin
		get_ui_song_struct_items song = ($current_playlist [<i>])
		formattext textname = pos_text qs(0xc31d83ea) i = (<i> + 1)
		createscreenelement {
			type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :settags playlist_index = <i>
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
		formattext textname = pos_text qs(0xc31d83ea) i = (<i> + 1)
		createscreenelement {
			type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :settags playlist_index = <i>
		<i> = (<i> + 1)
		repeat <iters>
		if ($g_songlist_force_num_songs_to_choose > 0)
			formattext textname = songs_added qs(0xc31d83ea) i = <array_size>
			songlist_detail_playlist :se_setprops {
				songlist_detail_playlist_num_songs_added_text = <songs_added>
			}
			if (<array_size> = $g_songlist_force_num_songs_to_choose)
				songlist_allow_continue
			endif
		elseif NOT ininternetmode
			songlist_allow_continue
		endif
	else
		songlist_disallow_continue
	endif
	songlist :settags \{list_dirty = false}
endscript

script songlist_add_item 
	requireparams \{[
			ui_struct
		]
		all}
	songlist :getsingletag \{mode}
	if (<mode> = import)
		formattext checksumname = song '%a' a = (<ui_struct>.song_title)
	elseif song_is_jamsession song = (<ui_struct>.song_checksum)
		formattext textname = text '%a' a = (<ui_struct>.filename)
		formattext checksumname = song '%i' i = <text>
	else
		song = (<ui_struct>.song_checksum)
	endif
	if (<mode> = music_store || <mode> = import)
		<desc> = 'music_store_item'
	else
		<desc> = 'songlist_item'
	endif
	extendcrc <song> '_sl_item' out = item_id
	if NOT structurecontains structure = <ui_struct> song_original_artist
		<sub_text> = (<ui_struct>.song_artist)
	else
		if (<ui_struct>.song_original_artist = 1)
			<sub_text> = (<ui_struct>.song_artist)
		else
			<sub_text> = $cover_artist_text
		endif
	endif
	createscreenelement {
		type = descinterface
		id = <item_id>
		desc = <desc>
		parent = current_menu
		songlist_item_text_text = (<ui_struct>.song_title)
		songlist_item_sub_text_text = <sub_text>
		autosizedims = true
	}
	if NOT ((<mode> = import) || (<mode> = music_store))
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
		if structurecontains \{structure = ui_struct
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
		songlist :getsingletag \{locked}
		if (<locked> = false)
			if innetgame
				gamemode_gettype
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
		if innetgame
			gamemode_gettype
			if (<type> = career || ($net_song_countdown = 1))
				<show_playlist_number> = 1
			endif
		else
			<show_playlist_number> = 1
		endif
		if (<show_playlist_number> = 1)
			formattext textname = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<id> :se_setprops {
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
		endif
		<id> :settags playlist_index = <playlist_index>
	else
		if (<mode> = import)
			<pad_choose_script> = nullscript
		elseif (<mode> = music_store)
			<allow_purchase> = 1
			if isps3
				if (<ui_struct>.purchased = 1)
					<allow_purchase> = 0
				endif
			endif
			if (<allow_purchase> = 1)
				<pad_choose_script> = songlist_music_store_proceed_to_pre_purchase
				<pad_choose_params> = {ui_struct = <ui_struct>}
			else
				<pad_choose_script> = nullscript
			endif
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
		addarrayelement array = <event_handlers> element = <option>
		<event_handlers> = <array>
	endif
	<id> :se_setprops event_handlers = <event_handlers>
	return id = <id>
endscript

script songlist_music_store_add_item 
	requireparams \{[
			id
			purchased
			price
		]
		all}
	if isps3
		<money_icon_alpha> = 0.0
		<money_text_alpha> = 1.0
		music_store_determine_currency
	endif
	if gotparam \{price}
		musicstore_format_price_text price = <price> currency_decimals = <currency_decimals>
	endif
	if (<purchased> = 1)
		<money_icon_alpha> = 1.0
		<money_text_alpha> = 0.0
		<money_texture> = checkmark
		<price_text> = qs(0x03ac90f0)
		<money_rgba> = (($g_menu_colors).pure_white)
	elseif gotparam \{album_pack_only}
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
	}
endscript

script songlist_music_store_proceed_to_pre_purchase 
	current_menu :se_setprops \{block_events}
	launchevent \{type = unfocus
		target = current_menu}
	songlist :getsingletag \{exclusive_device}
	if isxenon
		generic_event_choose no_sound state = uistate_music_store_purchase data = {is_popup exclusive_device = <exclusive_device> purchase_struct = <ui_struct>}
	else
		songlist_music_store_go_to_terms purchase_struct = <ui_struct>
	endif
endscript

script songlist_music_store_preview_song 
	music_store_request_preview_music music_name = <song_preview_asset_name>
endscript

script songlist_music_store_view_pack_songs 
	requireparams \{[
			ui_struct
		]
		all}
	if gotparam \{play_sfx}
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
	change \{g_songlist_last_visible_index = 4}
	if ((<ui_struct>.type) = pack)
		formattext textname = title qs(0xf987cdb7) t = (<ui_struct>.song_title)
		if ((<ui_struct>.purchased) = 1)
			<button_text> = qs(0xe8ec5f45)
		else
			<button_text> = qs(0x74fd0cf6)
		endif
	else
		formattext textname = title qs(0x690533a1) t = (<ui_struct>.song_title)
		if ((<ui_struct>.purchased) = 1)
			<button_text> = qs(0xaa94b42c)
		else
			<button_text> = qs(0xec8c85c0)
		endif
	endif
	change g_music_store_title = <title>
	change g_music_store_current_pack_checksum = (<ui_struct>.song_checksum)
	if gotparam \{no_pivot}
		songlist_refresh_menus \{no_pivot = 1}
	else
		songlist_refresh_menus
	endif
	<allow_purchase> = 1
	if isps3
		if (<ui_struct>.purchased = 1)
			<allow_purchase> = 0
		endif
	endif
	if (<allow_purchase> = 1)
		if NOT user_control_helper_exists \{button = orange}
			add_user_control_helper text = <button_text> button = orange z = 100000
		else
			user_control_helper_change_text button = orange text = <button_text>
		endif
		current_menu :se_setprops {
			event_handlers = [
				{pad_l1 songlist_music_store_proceed_to_pre_purchase params = {ui_struct = <ui_struct>}}
			]
			replace_handlers
		}
	else
		user_control_destroy_helper \{button = orange}
		current_menu :se_setprops \{event_handlers = [
				{
					pad_l1
					nullscript
				}
			]
			replace_handlers}
	endif
endscript

script songlist_music_store_disallow_sorting 
	if user_control_helper_exists \{button = orange}
		user_control_destroy_helper \{button = orange}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_l1
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
				pad_l1
				songlist_sort_toggle
			}
		]
		replace_handlers}
endscript

script songlist_is_song_in_playlist 
	requireparams \{[
			song
		]
		all}
	getarraysize ($current_playlist)
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
	requireparams \{[
			playlist_index
			vmenu_id
		]
		all}
	<my_playlist_index> = <playlist_index>
	if getscreenelementchildren id = <vmenu_id>
		getarraysize <children>
		<i> = 0
		begin
		(<children> [<i>]) :getsingletag playlist_index
		if (<playlist_index> = <my_playlist_index>)
			return true playlist_detail_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script songlist_do_maintenance_on_list 
	requireparams \{[
			playlist_index
			list
		]
		all}
	if getscreenelementchildren id = <list>
		getarraysize <children>
		<my_playlist_index> = <playlist_index>
		removeparameter \{playlist_index}
		<i> = 0
		begin
		(<children> [<i>]) :getsingletag playlist_index
		if gotparam \{playlist_index}
			if (<my_playlist_index> < <playlist_index>)
				<new_index> = <playlist_index>
				formattext textname = pos_text qs(0xc31d83ea) i = <new_index>
				(<children> [<i>]) :se_setprops {
					in_playlist_pos_text = <pos_text>
				}
				(<children> [<i>]) :settags playlist_index = (<new_index> - 1)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script songlist_update_instrument_difficulty_rating \{time = 0.025}
	requireparams \{[
			prev_diff_rate
		]
		all}
	if NOT gotparam \{diff_rate}
		diff_rate = 0
	endif
	if (<diff_rate> = 11)
		<diff_rate> = 0
	endif
	songlist :getsingletag \{mode}
	if (<mode> = music_store || <mode> = import)
		<on_rgba> = [113 121 133 255]
		<off_rgba> = [113 121 133 100]
	else
		<on_rgba> = [45 100 110 255]
		<off_rgba> = [190 225 230 255]
	endif
	<difference> = (<diff_rate> - <prev_diff_rate>)
	formattext checksumname = songlist_detail_difficulty_vmenu 'songlist_detail_difficulty_%i_vmenu' i = <instrument>
	getscreenelementchildren id = <songlist_detail_difficulty_vmenu>
	resolvescreenelementid id = [
		{id = <songlist_detail_difficulty_vmenu>}
		{local_id = songlist_detail_difficulty_sprite}
		{local_id = songlist_detail_difficulty_invalid}
	]
	if gotparam \{resolved_id}
		if (<diff_rate> = 0)
			<resolved_id> :se_setprops alpha = 1 time = 0.2
		else
			<resolved_id> :se_setprops alpha = 0 time = 0.2
		endif
	endif
	if (<difference> > 0)
		<i> = (9 - <prev_diff_rate>)
		formattext checksumname = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
		begin
		(<children> [<i>]) :se_setprops rgba = <on_rgba> alpha = 1.0
		addparam structure_name = my_diff_rate_struct name = <prev_diff_rate> value = (10 - <i>)
		songlist_detail :settags {
			<my_diff_rate_struct>
		}
		wait <time> seconds
		<i> = (<i> - 1)
		repeat <difference>
	else
		<difference> = (<difference> * -1)
		<i> = (10 - <prev_diff_rate>)
		if (<difference> > 0)
			formattext checksumname = prev_diff_rate 'prev_%i_diff_rate' i = <instrument>
			begin
			(<children> [<i>]) :se_setprops rgba = <off_rgba> alpha = 0.5
			addparam structure_name = my_diff_rate_struct name = <prev_diff_rate> value = (9 - <i>)
			songlist_detail :settags {
				<my_diff_rate_struct>
			}
			wait <time> seconds
			<i> = (<i> + 1)
			repeat <difference>
		endif
	endif
endscript

script songlist_update_stars \{time = 0.05}
	requireparams \{[
			prev_stars
			gold_stars
		]
		all}
	if NOT gotparam \{stars}
		stars = 0
	endif
	<difference> = (<stars> - <prev_stars>)
	getscreenelementchildren \{id = songlist_detail_stars_empty_vmenu}
	getarraysize <children>
	if (<stars> = 6)
		<max_stars> = 6
		if (<array_size> = 5)
			createscreenelement \{type = spriteelement
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
			createscreenelement \{type = spriteelement
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
			getscreenelementposition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :se_setprops pos = (<screenelementpos> + (0.0, 14.0))
		endif
	else
		<max_stars> = 5
		if (<array_size> = 6)
			destroyscreenelement id = (<children> [0])
			removeparameter \{children}
			getscreenelementchildren \{id = songlist_detail_stars_full_vmenu}
			destroyscreenelement id = (<children> [0])
			getscreenelementposition \{id = songlist_detail_diff_inst_cont}
			songlist_detail_diff_inst_cont :se_setprops pos = (<screenelementpos> + (0.0, -14.0))
		endif
	endif
	getscreenelementchildren \{id = songlist_detail_stars_full_vmenu}
	if (<difference> > 0)
		<i> = ((<max_stars> - 1) - <prev_stars>)
		begin
		(<children> [<i>]) :se_setprops alpha = 1.0
		songlist_detail :settags {
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
				songlist_detail :settags \{prev_stars = 5}
				<difference> = (<difference> - 1)
			endif
			if (<difference> > 0)
				<i> = (<max_stars> - <prev_stars>)
				begin
				(<children> [<i>]) :se_setprops alpha = 0.0
				songlist_detail :settags {
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
		<rgba> = (($g_menu_colors).gh5_gold_md)
	endif
	<star> = 0
	begin
	(<children> [<star>]) :se_setprops rgba = <rgba> time = 0.5
	<star> = (<star> + 1)
	repeat <max_stars>
endscript

script songlist_item_focus \{time = 0.0}
	requireparams \{[
			ui_struct
		]
		all}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	<rgba> = (($g_menu_colors).black)
	songlist :getsingletag \{mode}
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
		formattext textname = text '%a' a = (<ui_struct>.filename)
		formattext checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	songlist :getsingletag \{exclusive_device}
	if (<mode> = music_store)
		if (<ui_struct>.type = song)
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 1.0
				songlist_detail_albums_alpha = 0.0}
		else
			songlist_detail :se_setprops \{songlist_detail_songs_alpha = 0.0
				songlist_detail_albums_alpha = 1.0}
		endif
		if NOT (<ui_struct>.song_rating = none)
			<pa_alpha> = 1.0
			<esrb_notice_alpha> = 0.0
		else
			<pa_alpha> = 0.0
			songlist :getsingletag \{territory}
			if (<territory> != territory_us)
				<esrb_notice_alpha> = 0.0
			else
				<esrb_notice_alpha> = 1.0
			endif
		endif
		songlist :se_setprops {
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
		elseif (<type> = career)
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
						add_user_control_helper \{text = qs(0x40886130)
							button = green
							z = 100000}
						user_control_helper_reorder \{button = green
							new_index = 0}
					else
						user_control_helper_change_text \{button = green
							text = qs(0x40886130)}
					endif
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
			formattext textname = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
		else
			curr_musicstudio_genre = (<ui_struct>.musicstudio_genre)
			getarraysize ($jam_genre_list) param = genre_list_size
			if ((<curr_musicstudio_genre> >= 0) && (<curr_musicstudio_genre> < <genre_list_size>))
				musicstudio_genre_text = ($jam_genre_list [<curr_musicstudio_genre>].name_text)
			else
				musicstudio_genre_text = qs(0xd0ef7f05)
			endif
			formattext textname = genre_year_text qs(0xf7e765ed) g = <musicstudio_genre_text> y = (<ui_struct>.song_year)
		endif
		<total_seconds> = 0
		if structurecontains structure = <ui_struct> song_duration
			<total_seconds> = (<ui_struct>.song_duration)
		endif
		if (<total_seconds> > 0)
			seconds = 0
			minutes = 0
			mod a = <total_seconds> b = 60
			<seconds> = <mod>
			<total_seconds> = (<total_seconds> - <seconds>)
			if (<total_seconds> > 0)
				mod a = <total_seconds> b = (60 * 60)
				<minutes> = (<mod> / 60)
			endif
		else
			<seconds> = 0
			<minutes> = 0
		endif
		formattext textname = duration_text qs(0x81ca0519) m = <minutes> s = <seconds>
		songlist_detail_transition \{desc = songlist_detail
			fade_time = 0}
		if NOT song_is_jamsession song = (<ui_struct>.song_checksum)
			if (<mode> = practice || <mode> = leaderboard || <mode> = toprockers)
				player_num = 1
			else
				get_local_in_game_player_num_from_controller {controller_index = <exclusive_device> allow_dropped_player}
			endif
			if (<player_num> = -1)
				scriptassert \{'player_num = -1'}
			endif
			if issingleplayergame
				getplayerinfo <player_num> part
				getplayerinfo <player_num> difficulty
			else
				<part> = band
				get_highest_difficulty
				<difficulty> = <highest_difficulty>
			endif
			if (<mode> = toprockers)
				difficulty = ($current_leaderboard_difficulty)
			endif
			get_difficulty_text_nl difficulty = <difficulty>
			get_song_prefix song = <song_checksum>
			if (<mode> = leaderboard || <mode> = toprockers)
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
					part = band
				endswitch
			endif
			if (<mode> = leaderboard)
				difficulty = beginner
				get_difficulty_text_nl difficulty = <difficulty>
				getarraysize ($difficulty_list) param = diff_list_size
				diff_idx = (<diff_list_size> - 1)
				begin
				diff = ($difficulty_list [<diff_idx>])
				get_difficulty_text_nl difficulty = <diff>
				get_formatted_songname {
					song_prefix = <song_prefix>
					difficulty_text_nl = <difficulty_text_nl>
					part = ($instrument_list.<part>.text_nl)
				}
				getglobaltags <songname> param = setlist_beststars
				getglobaltags <songname> param = setlist_bestpercentage
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
				getglobaltags <songname> param = setlist_beststars
				getglobaltags <songname> param = setlist_bestpercentage
			endif
			songlist_update_more_info {
				part = <part>
				song_checksum = <song_checksum>
				mode = <mode>
			}
			formattext checksumname = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
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
		if NOT (<ui_struct>.type = song)
			<do_intensity> = 0
		endif
	endif
	songlist_detail :gettags
	if (<do_intensity> = 1)
		songlist_detail :obj_killspawnedscript \{name = songlist_update_instrument_difficulty_rating}
		songlist_detail :obj_spawnscriptnow songlist_update_instrument_difficulty_rating params = {
			instrument = 'guitar'
			diff_rate = (<ui_struct>.song_guitar_difficulty_rating)
			prev_diff_rate = <prev_guitar_diff_rate>
		}
		songlist_detail :obj_spawnscriptnow songlist_update_instrument_difficulty_rating params = {
			instrument = 'bass'
			diff_rate = (<ui_struct>.song_bass_difficulty_rating)
			prev_diff_rate = <prev_bass_diff_rate>
		}
		songlist_detail :obj_spawnscriptnow songlist_update_instrument_difficulty_rating params = {
			instrument = 'drums'
			diff_rate = (<ui_struct>.song_drums_difficulty_rating)
			prev_diff_rate = <prev_drums_diff_rate>
		}
		songlist_detail :obj_spawnscriptnow songlist_update_instrument_difficulty_rating params = {
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
		if gotparam \{setlist_bestpercentage}
			if (<setlist_bestpercentage> = 100)
				<gold_stars> = 1
			endif
		endif
		songlist_detail :obj_killspawnedscript \{name = songlist_update_stars}
		songlist_detail :obj_spawnscriptnow songlist_update_stars params = {
			stars = <setlist_beststars>
			prev_stars = <prev_stars>
			gold_stars = <gold_stars>
		}
		if NOT is_song_in_jammode_songlist song = <song_checksum>
			menu_music_off
			songlist :getsingletag \{mode}
			if NOT (<mode> = music_store)
				songlist_update_song_preview song = <song_checksum>
			endif
		else
			spawnscriptnow \{menu_music_on}
			songlist_update_song_preview \{song = none}
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
	endif
endscript

script songlist_music_store_item_focus \{hub_item_cycle = 0
		morph_time = 0.0}
	requireparams \{[
			ui_struct
		]
		all}
	songlist :getsingletag \{mode}
	song_checksum = (<ui_struct>.song_checksum)
	get_genre_text genre = (<ui_struct>.song_genre) song = <song_checksum>
	formattext textname = genre_year_text qs(0xf7e765ed) g = <genre> y = (<ui_struct>.song_year)
	<total_seconds> = 0
	if structurecontains structure = <ui_struct> song_duration
		<total_seconds> = (<ui_struct>.song_duration)
	endif
	if (<total_seconds> > 0)
		seconds = 0
		minutes = 0
		mod a = <total_seconds> b = 60
		<seconds> = <mod>
		<total_seconds> = (<total_seconds> - <seconds>)
		if (<total_seconds> > 0)
			mod a = <total_seconds> b = (60 * 60)
			<minutes> = (<mod> / 60)
		endif
	else
		<seconds> = 0
		<minutes> = 0
	endif
	formattext textname = duration_text qs(0x81ca0519) m = <minutes> s = <seconds>
	<line0> = (<ui_struct>.album)
	<line1> = <genre_year_text>
	<line2> = <duration_text>
	if (<ui_struct>.type = song)
		if (<hub_item_cycle> = 1)
			<line0> = (<ui_struct>.song_title)
			<line1> = (<ui_struct>.song_artist)
			formattext textname = album_year_text qs(0xfaf915aa) a = (<ui_struct>.album) y = (<ui_struct>.song_year)
			<line2> = <album_year_text>
		else
			<id> :se_setprops {
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
		getarraysize <array>
		<iters> = <array_size>
		<more_than_3> = 0
		if (<array_size> > 3)
			<iters> = 2
			<more_than_3> = (<array_size> - 2)
		endif
		<i> = 0
		begin
		formattext checksumname = line 'line%i' i = <i>
		addparam name = <line> value = (<array> [<i>])
		<i> = (<i> + 1)
		repeat <iters>
		if (<more_than_3> > 1)
			formattext textname = more_songs qs(0x560b5eda) n = <more_than_3>
			addparam name = line2 value = <more_songs>
		endif
		<empty_iters> = (3 - <array_size>)
		if (<empty_iters> > 0)
			<i> = <iters>
			begin
			formattext checksumname = line 'line%i' i = <i>
			addparam name = <line> value = qs(0x03ac90f0)
			<i> = (<i> + 1)
			repeat <empty_iters>
		endif
		if (<hub_item_cycle> = 0)
			<id> :se_setprops {
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
			<id> :se_setprops {
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
	<desc> = songlist_detail
	if (<hub_item_cycle> = 1)
		<desc> = music_store_hub
		<text_dims> = (530.0, 40.0)
		music_store_hub :se_setprops songlist_detail_cont_alpha = 0.0 time = <morph_time>
		wait <morph_time> seconds
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
		item_type = (<ui_struct>.type)
		hub_item_cycle = <hub_item_cycle>
		text_dims = <text_dims>
		line0 = <line0>
		line1 = <line1>
		line2 = <line2>
	}
	if ((<ui_struct>.patched = 1) || (<hub_item_cycle> = 1))
		if structurecontains structure = <ui_struct> song_preview_asset_name
			music_store_change_album_cover {
				texture_name = (<ui_struct>.song_preview_asset_name)
				desc = <desc>
			}
		endif
	endif
	if (<hub_item_cycle> = 1)
		music_store_hub :se_setprops songlist_detail_cont_alpha = 1.0 time = <morph_time>
	endif
endscript

script songlist_music_store_check_scroll_text \{desc = songlist_detail}
	requireparams \{[
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
	formattext checksumname = songlist_detail_text_dims 'songlist_detail_%c_text_dims' c = <param>
	formattext checksumname = songlist_detail_text_text 'songlist_detail_%c_text_text' c = <param>
	formattext checksumname = songlist_detail_cont 'songlist_detail_%c_cont' c = <param>
	if ((<hub_item_cycle> = 1) || (<item_type> != song))
		formattext checksumname = songlist_detail_text 'songlist_detail_%c_text' c = <param>
	else
		formattext checksumname = songlist_detail_text 'songlist_detail_songs_%c_text' c = <param>
	endif
	formattext checksumname = line_text 'line%i' i = <i>
	if (((<...>.<songlist_detail_text_dims>).(1.0, 0.0)) > <max_x>)
		addparam structure_name = my_blank_text name = <songlist_detail_text_text> value = qs(0x03ac90f0)
		<desc> :se_setprops {
			<my_blank_text>
		}
		if screenelementexists id = <songlist_detail_cont>
			<songlist_detail_text> :obj_killspawnedscript name = scroll_ticker_text
			destroyscreenelement id = <songlist_detail_cont>
		endif
		createscreenelement {
			type = containerelement
			id = <songlist_detail_cont>
			parent = <songlist_detail_text>
		}
		<songlist_detail_text> :obj_spawnscriptlater scroll_ticker_text params = {
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
		if screenelementexists id = <songlist_detail_cont>
			<songlist_detail_text> :obj_killspawnedscript name = scroll_ticker_text
			destroyscreenelement id = <songlist_detail_cont>
		endif
	endif
	<i> = (<i> + 1)
	repeat 3
endscript

script songlist_clear_more_info 
	getscreenelementchildren \{id = songlist_detail_more_info_rows}
	<rows> = <children>
	removeparameter \{children}
	<i> = 0
	begin
	getscreenelementchildren id = (<rows> [<i>])
	<stats> = <children>
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [1])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [2])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [3])
	<id> = (<children> [0])
	<id> :se_setprops text = qs(0x03ac90f0)
	removeparameter \{children}
	<i> = (<i> + 1)
	repeat 5
endscript

script songlist_update_more_info 
	requireparams \{[
			part
			song_checksum
		]
		all}
	getscreenelementchildren \{id = songlist_detail_more_info_rows}
	<rows> = <children>
	removeparameter \{children}
	<i> = 0
	begin
	if (<mode> = leaderboard || <mode> = toprockers)
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
			part = band
		endswitch
	endif
	get_difficulty_text_nl index = (4 - <i>)
	get_song_prefix song = <song_checksum>
	get_formatted_songname {
		song_prefix = <song_prefix>
		difficulty_text_nl = <difficulty_text_nl>
		part = ($instrument_list.<part>.text_nl)
	}
	getglobaltags <songname> param = setlist_beststars
	getglobaltags <songname> param = setlist_bestscore
	getglobaltags <songname> param = setlist_bestpercentage
	getscreenelementchildren id = (<rows> [<i>])
	<stats> = <children>
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [1])
	<id> = (<children> [0])
	if (<setlist_beststars> = 0)
		formattext \{textname = stars_text
			qs(0x03ac90f0)}
	else
		formattext textname = stars_text qs(0x73307931) s = <setlist_beststars>
	endif
	<id> :se_setprops text = <stars_text>
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [2])
	<id> = (<children> [0])
	if (<setlist_bestscore> = 0)
		formattext \{textname = score_text
			qs(0x03ac90f0)}
	else
		formattext textname = score_text qs(0x73307931) s = <setlist_bestscore> usecommas
	endif
	<id> :se_setprops text = <score_text>
	removeparameter \{children}
	getscreenelementchildren id = (<stats> [3])
	<id> = (<children> [0])
	if (<setlist_bestpercentage> = 0)
		formattext \{textname = notes_text
			qs(0x03ac90f0)}
	else
		formattext textname = notes_text qs(0x6cd5ba93) s = <setlist_bestpercentage>
	endif
	<id> :se_setprops text = <notes_text>
	removeparameter \{children}
	<i> = (<i> + 1)
	repeat 5
endscript

script songlist_item_unfocus \{time = 0.0}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	songlist :getsingletag \{mode}
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
		formattext textname = text '%a' a = (<ui_struct>.filename)
		formattext checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	if NOT (<mode> = music_store)
		if issongselectable song = (<ui_struct>.song_checksum)
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
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	songlist :settags \{non_song_item_focused = true}
	<id> :se_setprops {
		songlist_create_playlist_text_rgba = ($g_songlist_item_focus_rgba)
	}
	songlist_detail :se_setprops alpha = 0.0 time = <fade_time>
	user_control_helper_change_text \{button = green
		text = qs(0x188ec849)}
	spawnscriptnow \{menu_music_on}
	songlist_update_song_preview \{song = none}
endscript

script songlist_item_create_playlist_unfocus 
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	songlist :settags \{non_song_item_focused = false}
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
	change \{current_playlist = [
		]}
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
	endif
	change \{g_current_loaded_custom_playlist_index = -1}
endscript

script songlist_remove_first_song_in_playlist 
	if is_a_playlist_loaded
		removearrayelement array = ($current_playlist) index = 0
		change current_playlist = <array>
		if screenelementexists \{id = songlist_detail_playlist}
			songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
		endif
	endif
endscript

script songlist_display_non_patched_dialog 
	change \{g_songlist_warning_active = 1}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	songlist :getsingletag \{exclusive_device}
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
	if scriptisrunning \{songlist_item_focus}
		return
	endif
	current_menu :se_setprops \{block_events}
	if NOT issongselectable song = (<ui_struct>.song_checksum)
		current_menu :se_setprops \{unblock_events}
		soundevent \{event = ui_sfx_negative_select}
		if gotparam \{song_not_patched}
			songlist_display_non_patched_dialog
		endif
		return
	endif
	if ($is_network_game = 1)
		net_songlist_add_song song = (<ui_struct>.song_checksum)
		current_menu :se_setprops \{unblock_events}
		return
	endif
	getarraysize ($current_playlist)
	if (<array_size> >= $g_max_playlist_size)
		current_menu :se_setprops \{unblock_events}
		return
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		if (<array_size> >= $g_songlist_force_num_songs_to_choose)
			current_menu :se_setprops \{unblock_events}
			return
		endif
	endif
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formattext textname = text '%a' a = (<ui_struct>.filename)
		formattext checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	addarrayelement array = ($current_playlist) element = <song_checksum>
	change current_playlist = <array>
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
	endif
	printf \{channel = playlist
		qs(0xbe2ec1c9)}
	debug_songlist_print_playlist
	songlist :getsingletag \{mode}
	if (<mode> = play_song || <mode> = leaderboard || <mode> = practice || <mode> = toprockers)
		songlist_continue device_num = <device_num>
		current_menu :se_setprops \{unblock_events}
		return
	endif
	soundevent \{event = quickplay_select_song}
	<id> :se_setprops {
		event_handlers = [
			{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
		]
		replace_handlers
	}
	songlist_is_song_in_playlist song = <song_checksum>
	formattext textname = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
	<id> :se_setprops {
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :settags playlist_index = <playlist_index>
	gamemode_gettype
	if NOT ininternetmode
		user_control_helper_change_text \{button = green
			text = qs(0x34ff4910)}
	elseif (<type> = career)
		if ($g_net_leader_player_num != -1)
			if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
				user_control_helper_change_text \{button = green
					text = qs(0x34ff4910)}
			endif
		endif
	endif
	getarraysize \{$current_playlist}
	formattext textname = pos_text qs(0xc31d83ea) i = (<array_size>)
	if (<array_size> > ($g_songlist_playlist_detail_items))
		getscreenelementchildren \{id = songlist_detail_playlist_vmenu}
		destroyscreenelement id = (<children> [0])
	endif
	if (<array_size> > ($g_songlist_mini_playlist_detail_items))
		getscreenelementchildren \{id = songlist_detail_mini_playlist_vmenu}
		destroyscreenelement id = (<children> [0])
	endif
	createscreenelement {
		type = descinterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autosizedims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :settags playlist_index = <playlist_index>
	createscreenelement {
		type = descinterface
		desc = 'songlist_detail_playlist_item'
		parent = songlist_detail_mini_playlist_vmenu
		songlist_item_text_text = (<ui_struct>.song_title)
		autosizedims = true
		in_playlist_pos_alpha = 1.0
		in_playlist_pos_text = <pos_text>
	}
	<id> :settags playlist_index = <playlist_index>
	songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
			fade_time = 0
		}}
	if ($g_songlist_force_num_songs_to_choose > 0)
		getarraysize ($current_playlist)
		formattext textname = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
		getarraysize ($current_playlist)
		if (<array_size> = $g_songlist_force_num_songs_to_choose)
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
	songlist :getsingletag \{mode}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_start
				songlist_continue
			}
		]
		replace_handlers}
	current_menu :settags \{allow_continue = 1}
	if NOT user_control_helper_exists \{button = start}
		add_user_control_helper \{text = qs(0x182f0173)
			button = start
			z = 100000}
	endif
endscript

script songlist_disallow_continue 
	songlist :getsingletag \{mode}
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
	current_menu :settags \{allow_continue = 0}
	user_control_destroy_helper \{button = start}
endscript

script songlist_item_remove_from_playlist 
	if scriptisrunning \{songlist_item_focus}
		return
	endif
	if scriptisrunning \{songlist_continue}
		return
	endif
	if ($is_network_game = 1)
		gamemode_gettype
		if (<type> = career)
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
	soundevent \{event = quickplay_remove_song}
	if NOT gotparam \{id}
		obj_getid
		<my_id> = <objid>
	else
		<my_id> = <id>
	endif
	if screenelementexists id = <my_id>
		<my_id> :se_setprops {
			songlist_item_text_rgba = ($g_songlist_item_focus_rgba)
			in_playlist_pos_alpha = 0.0
			event_handlers = [
				{pad_choose songlist_item_add_to_playlist params = {ui_struct = <ui_struct>}}
			]
			replace_handlers
		}
		user_control_helper_change_text \{button = green
			text = qs(0x562b9e24)}
		<my_id> :getsingletag playlist_index
	endif
	songlist_get_song_playlist_detail_index playlist_index = <playlist_index> vmenu_id = songlist_detail_playlist_vmenu
	if gotparam \{playlist_detail_index}
		getscreenelementchildren \{id = songlist_detail_playlist_vmenu}
		getarraysize \{$current_playlist}
		if (<array_size> > ($g_songlist_playlist_detail_items))
			formattext textname = pos_text qs(0xc31d83ea) i = (<array_size> - ($g_songlist_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_size> - ($g_songlist_playlist_detail_items)) - 1)])
			createscreenelement {
				type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_playlist_vmenu :menu_setitemindex index = ($g_songlist_playlist_detail_items) newindex = 0
			<id> :settags playlist_index = ((<array_size> - ($g_songlist_playlist_detail_items)) - 1)
			<ui_struct> = <passed_in_ui_struct>
			removeparameter \{passed_in_ui_struct}
		endif
		destroyscreenelement id = (<children> [<playlist_detail_index>])
	endif
	removeparameter \{playlist_detail_index}
	songlist_get_song_playlist_detail_index playlist_index = <playlist_index> vmenu_id = songlist_detail_mini_playlist_vmenu
	if gotparam \{playlist_detail_index}
		getscreenelementchildren \{id = songlist_detail_mini_playlist_vmenu}
		getarraysize \{$current_playlist}
		if (<array_size> > ($g_songlist_mini_playlist_detail_items))
			formattext textname = pos_text qs(0xc31d83ea) i = (<array_size> - ($g_songlist_mini_playlist_detail_items))
			<passed_in_ui_struct> = <ui_struct>
			get_ui_song_struct_items song = ($current_playlist [((<array_size> - ($g_songlist_mini_playlist_detail_items)) - 1)])
			createscreenelement {
				type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			songlist_detail_mini_playlist_vmenu :menu_setitemindex index = ($g_songlist_mini_playlist_detail_items) newindex = 0
			<id> :settags playlist_index = ((<array_size> - ($g_songlist_mini_playlist_detail_items)) - 1)
			<ui_struct> = <passed_in_ui_struct>
			removeparameter \{passed_in_ui_struct}
		endif
		destroyscreenelement id = (<children> [<playlist_detail_index>])
	endif
	if screenelementexists id = <my_id>
		<my_id> :removetags playlist_index
	endif
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = songlist_detail_mini_playlist_vmenu
	songlist_do_maintenance_on_list playlist_index = <playlist_index> list = current_menu
	songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
		params = {
			desc = songlist_detail_playlist
		}}
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		formattext textname = text '%a' a = (<ui_struct>.filename)
		formattext checksumname = song_checksum '%i' i = <text>
	else
		song_checksum = (<ui_struct>.song_checksum)
	endif
	removearrayelement array = ($current_playlist) element = <song_checksum>
	change current_playlist = <array>
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
	endif
	printf \{channel = playlist
		qs(0x6cdde419)}
	debug_songlist_print_playlist
	if screenelementexists id = <my_id>
		if NOT isscreenelementinfocus id = <my_id>
			<my_id> :obj_spawnscriptnow songlist_item_unfocus params = {ui_struct = <ui_struct>}
		endif
	endif
	getarraysize ($current_playlist)
	if NOT (<array_size> > 0)
		songlist_disallow_continue
	endif
	if ($g_songlist_force_num_songs_to_choose > 0)
		getarraysize ($current_playlist)
		formattext textname = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :se_setprops {
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
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	songlist_update_song_preview \{song = none}
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
	songlist :getsingletag \{mode}
	if (<mode> = leaderboard)
		song = ($current_playlist [0])
		songlist_clear
		ui_event event = menu_change state = uistate_leaderboard data = {song = <song> device_num = <device_num>}
		return
	elseif (<mode> = practice)
		songlist_clear
		practice_setup_part_and_continue device_num = <device_num>
		return
	elseif (<mode> = toprockers)
		song = ($current_playlist [0])
		songlist_clear
		ui_event event = menu_change state = uistate_top_rockers data = {for_options = 1 toprockerssong = <song>}
		return
	endif
	gamemode_gettype
	switch (<type>)
		case career
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		gig_struct = ($<current_challenge>)
		venue = (<gig_struct>.venue)
		if structurecontains structure = ($levelzones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($levelzones.<venue>)
		else
			printstruct <gig_struct>
			scriptassert \{qs(0x2f9dfa76)}
		endif
		case quickplay
		change current_level = ($g_band_lobby_current_level)
		fill_auto_save_playlist
		venue = ($g_band_lobby_current_level)
		if structurecontains structure = ($levelzones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($levelzones.<venue>)
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
			gman_startgamemodegoal
		endif
		change current_level = ($g_band_lobby_current_level)
		venue = ($g_band_lobby_current_level)
		if structurecontains structure = ($levelzones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($levelzones.<venue>)
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
	requireparams \{[
			result
		]
		all}
	printf \{qs(0x7d7081f8)}
	change competitive_rules = <result>
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
endscript

script songlist_destroy 
	if screenelementexists \{id = songlist}
		songlist :gettags
		songlist_set_mode_sort_index mode = <mode>
		if (<cs_registered> = true)
			contentmanfunc func = unregister_content_source name = <list_name>
		endif
		destroyscreenelement \{id = songlist}
	endif
	if scriptisrunning \{songlist_request_page_when_ready}
		killspawnedscript \{name = songlist_request_page_when_ready}
	endif
	setmenuautorepeattimes \{(0.3, 0.1)}
endscript

script songlist_scroll_down 
	if screenelementexists \{id = songlist}
		songlist :gettags
		setmenuautorepeattimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
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
			if isps3
				<button> = square
			endif
			if NOT demobuild
				if controllerpressed <button> <exclusive_device>
					setmenuautorepeattimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
					songlist_page_down
					return
				endif
			endif
		endif
		if (<list_index> <= (<list_page_size> - 1))
			list_index = (<list_index> + 1)
			if (<list_index> > (<list_page_size> - 1))
				contentmanfunc {
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
					music_store_scroll_sfx
				else
					songlist_scroll_sfx
				endif
				songlist_update_slider_nub_pos \{dir = down}
				songlist_update_hilight_bar_pos \{dir = down}
				if (<list_index> > <list_bottom>)
					if (<list_bottom> < (<list_page_size> - 1))
						if ($g_songlist_create_playlist_menu_item_present = 0)
							list_top = (<list_top> + 1)
							list_bottom = (<list_bottom> + 1)
						endif
						contentmanfunc {
							func = request_data
							name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				songlist :settags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_down 
	songlist :gettags
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
		launchevent \{type = unfocus
			target = current_menu}
	endif
	songlist_clear_menus
	songlist :settags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = false
		list_dirty = true
	}
	contentmanfunc {
		func = request_data
		name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = songlist_fast_page_data_request_callback
	}
	songlist_update_slider_nub_pos dir = down count = (<jump>)
	songlist_reset_hilight_bar_pos
endscript

script songlist_fast_page_data_request_callback 
	songlist_data_request_callback <...> dont_add_non_song_item
endscript

script songlist_scroll_up 
	if screenelementexists \{id = songlist}
		songlist :gettags
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
			if isps3
				<button> = square
			endif
			if NOT demobuild
				if controllerpressed <button> <exclusive_device>
					setmenuautorepeattimes ((0.3, 0.0) + (($g_songlist_paging_speed) * (0.0, 1.0)))
					songlist_page_up
					return
				endif
			endif
		endif
		if (<list_index> >= 0)
			list_index = (<list_index> - 1)
			if (<list_index> < 0)
				contentmanfunc {
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
					music_store_scroll_sfx
				else
					songlist_scroll_sfx
				endif
				songlist_update_slider_nub_pos \{dir = up}
				songlist_update_hilight_bar_pos \{dir = up}
				if (<list_index> < <list_top>)
					if (<list_top> > 0)
						list_top = (<list_top> - 1)
						list_bottom = (<list_bottom> - 1)
						contentmanfunc {
							func = request_data
							name = <list_name>
							start_index = <list_top>
							end_index = <list_bottom>
							callback = songlist_data_request_callback
						}
					endif
				endif
				songlist :settags {
					list_index = <list_index>
					list_top = <list_top>
					list_bottom = <list_bottom>
				}
			endif
		endif
	endif
endscript

script songlist_page_up 
	songlist :gettags
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
			gamemode_gettype
			if NOT (<type> = career)
				<jump> = (<jump> + 1)
			endif
		endif
		<callback> = songlist_data_request_callback
	else
		<callback> = songlist_fast_page_data_request_callback
	endif
	songlist_clear_menus
	songlist :settags {
		list_index = <new_list_index>
		list_top = <new_list_top>
		list_bottom = <new_list_bottom>
		initial_built = false
		list_dirty = true
	}
	contentmanfunc {
		func = request_data
		name = <list_name>
		start_index = <new_list_top>
		end_index = <new_list_bottom>
		callback = <callback>
	}
	songlist_update_slider_nub_pos dir = up count = (<jump>)
	songlist_reset_hilight_bar_pos
	songlist_update_hilight_bar_pos dir = down count = ($g_songlist_last_visible_index)
	begin
	songlist :getsingletag \{list_dirty}
	if (<list_dirty> = false)
		launchevent \{type = unfocus
			target = current_menu}
		launchevent type = focus target = current_menu data = {child_index = ($g_songlist_last_visible_index)}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script songlist_more_data_down_callback 
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist :gettags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		change g_songlist_current_page = ($g_songlist_current_page + 1)
		contentmanfunc {
			func = request_page
			name = <list_name>
			page_down
			seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_down_callback
		}
		songlist :settags \{list_dirty = true}
	endif
endscript

script songlist_more_data_up_callback 
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist :gettags
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	if (<more_data> = true)
		change g_songlist_current_page = ($g_songlist_current_page - 1)
		contentmanfunc {
			func = request_page
			name = <list_name>
			page_up
			seek = <list_index>
			sortspec = <sortspec>
			filterspec = ($g_songlist_filterspec)
			invert_filterspec = ($g_songlist_invert_filterspec)
			callback = songlist_page_request_up_callback
		}
		songlist :settags \{list_dirty = true}
	else
		if (<mode> = play_song)
			gamemode_gettype
			if (<type> = career)
				return
			endif
			if demobuild
				return
			endif
			if ($g_songlist_create_playlist_menu_item_present = 0)
				songlist_insert_item_top \{non_song_item = 1}
				songlist_update_slider_nub_pos \{dir = up}
			endif
		endif
	endif
endscript

script songlist_page_request_up_callback 
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist_page_request <...> dir = up
	songlist_update_slider_nub_pos \{dir = up}
endscript

script songlist_page_request_down_callback 
	if NOT screenelementexists \{id = songlist}
		return
	endif
	songlist_page_request <...> dir = down
	songlist_update_slider_nub_pos \{dir = down}
endscript

script songlist_page_request 
	requireparams \{[
			dir
		]
		all}
	songlist :gettags
	songlist_calculate_slider_nub_res page_size = <content_size>
	formattext textname = num_songs qs(0xc31d83ea) i = <content_size>
	songlist :se_setprops songlist_songs_available_num_text = <num_songs>
	if (<content_size> = 1)
		if (<mode> = music_store)
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0xd20d2af6)}
		else
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x7b899ac6)}
		endif
	else
		if (<mode> = music_store)
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x08cb5377)}
		else
			songlist :se_setprops \{songlist_songs_available_text_text = qs(0x1cec7f8c)}
		endif
	endif
	if (<dir> = up)
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
		songlist :settags {
			list_page_size = <page_size>
			list_index = <seek_index>
			list_top = <list_top>
			list_bottom = <list_bottom>
			list_dirty = false
		}
		contentmanfunc {
			func = request_data
			name = <list_name>
			start_index = <list_top>
			end_index = <list_bottom>
			callback = songlist_data_request_callback
		}
	else
		scriptassert \{qs(0x869440a1)}
	endif
endscript

script songlist_calculate_slider_nub_res 
	songlist :getsingletag \{mode}
	if (<mode> = play_song)
		gamemode_gettype
		if NOT demobuild
			if NOT (<type> = career)
				<page_size> = (<page_size> + 1)
			endif
		endif
	endif
	if (<page_size> > 1)
		songlist :getsingletag \{mode}
		if NOT (<mode> = music_store || <mode> = import)
			<slider_nub_res> = (396.0 / (<page_size> - 1))
		else
			<slider_nub_res> = (350.0 / (<page_size> - 1))
		endif
	else
		<slider_nub_res> = 0.0
	endif
	return slider_nub_res = <slider_nub_res>
endscript

script songlist_update_slider_nub_pos \{dir = down
		count = 1}
	songlist :getsingletag \{slider_nub_res}
	songlist_slider_nub_cont :se_getprops \{pos}
	if (<dir> = down)
		songlist_slider_nub_cont :se_setprops pos = (<pos> + (<slider_nub_res> * (0.0, 1.0) * <count>))
	else
		songlist_slider_nub_cont :se_setprops pos = (<pos> - (<slider_nub_res> * (0.0, 1.0) * <count>))
	endif
endscript

script songlist_update_hilight_bar_pos \{dir = down
		count = 1}
	songlist :getsingletag \{hilight_bar_res}
	songlist :getsingletag \{hilight_bar_index}
	songlist_hilight_bar_cont :se_getprops \{pos}
	if (<dir> = down)
		if (<hilight_bar_index> = $g_songlist_last_visible_index)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> + <count>)
			songlist :settags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :se_setprops pos = (<pos> + (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	else
		if (<hilight_bar_index> = 0)
			return
		else
			<hilight_bar_index> = (<hilight_bar_index> - <count>)
			songlist :settags hilight_bar_index = <hilight_bar_index>
			songlist_hilight_bar_cont :se_setprops pos = (<pos> - (<hilight_bar_res> * (0.0, 1.0) * <count>))
		endif
	endif
endscript

script songlist_reset_hilight_bar_pos 
	songlist :settags \{hilight_bar_index = 0}
	songlist :getsingletag \{mode}
	if (<mode> = music_store || <mode> = import)
		songlist_hilight_bar_cont :se_setprops pos = ($g_songlist_music_store_hilight_pos)
	else
		songlist_hilight_bar_cont :se_setprops \{pos = (120.0, 192.0)}
	endif
endscript

script songlist_slide_scroll 
	getlogicframe
	last_change = <logicframe>
	last_button = 0
	createscreenelement \{parent = root_window
		type = spriteelement
		texture = white
		pos = (550.0, 500.0)
		dims = (20.0, 50.0)
		just = [
			left
			center
		]}
	rate = 0.0
	damper = 0.8
	rate_scale = 100.0
	begin
	if guitargettouchpattern \{player = 1}
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
	mathfloor <rate>
	casttointeger \{floor}
	setscreenelementprops id = <id> scale = ((0.0, 1.0) + ((1.0, 0.0) * <floor>)) rot_angle = <rot_angle>
	wait \{5
		gameframes}
	repeat
endscript

script songlist_back 
	songlist :getsingletag \{mode}
	gamemode_gettype
	if (<mode> = music_store)
		songlist :getsingletag \{visited_band_hub}
		if gotparam \{visited_band_hub}
			change \{g_music_store_current_pack_checksum = null}
			change \{g_songlist_last_visible_index = 4}
			songlist :settags \{music_store_seek_override = true}
			songlist_music_store_disallow_sorting
			songlist_music_store_go_to_hub
		else
			destroy_dialog_box
			generic_event_back \{state = uistate_mainmenu}
		endif
	elseif (<mode> = import)
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
			if screenelementexists \{id = current_menu}
				launchevent \{type = unfocus
					target = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			songlist :getsingletag \{exclusive_device}
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
		if innetgame
			if ($net_song_countdown = 0)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					net_career_songlist_back
				elseif ($primary_controller = <device_num>)
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
			if ui_event_exists_in_stack \{name = 'team_select'}
				state = uistate_team_select
			else
				if ininternetmode
					if ishost
						quit_online_now
						return
					endif
				else
					state = uistate_band_lobby_setup
				endif
			endif
			if ininternetmode
				sendstructure callback = ui_event data_to_send = {event = menu_back data = {state = <state>}}
			endif
			ui_event event = menu_back data = {state = <state>}
		elseif ($g_lobby_net_state = net_public && ($net_song_countdown = 0))
			generic_event_choose \{state = uistate_online_quit_warning
				data = {
					is_popup
				}}
		endif
		hide_glitch \{num_frames = 10}
	elseif ($primary_controller = <device_num>)
		if innetgame
			if ($net_song_countdown = 0)
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
	ui_event \{event = menu_back
		data = {
			songlist_change_canceled = true
		}}
endscript

script songlist_detail_transition fade_time = ($g_songlist_detail_fade_time)
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			desc
		]
		all}
	if (<desc> = songlist_detail)
		songlist_detail :se_getprops
		<do_transition> = 0
		if gotparam \{force_transition}
			<do_transition> = 1
		endif
		if NOT (<alpha> = 1.0)
			<do_transition> = 1
		endif
		if (<do_transition> = 1)
			songlist :getsingletag \{mode}
			if NOT (<mode> = music_store)
				songlist_detail_playlist :se_setprops \{alpha = 0.0}
				if ($g_songlist_show_more_info = 1)
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
		if gotparam \{force_transition}
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
	songlist :getsingletag \{mode}
	current_menu :getsingletag \{tag_selected_index}
	if NOT gotparam \{tag_selected_index}
		return
	endif
	if (<mode> = music_store)
		songlist :getsingletag \{visited_band_hub}
		if NOT gotparam \{visited_band_hub}
			return
		endif
	endif
	current_menu :se_setprops \{block_events}
	songlist_change_sort_index index = ($g_songlist_sort_index + 1)
	sort_songlist_sfx
	getarraysize \{$g_songlist_sort_array}
	if ($g_songlist_sort_index = <array_size>)
		songlist_change_sort_index \{index = 0}
	endif
	songlist_update_song_preview \{song = none}
	songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
	songlist_slider_nub_cont :se_setprops \{alpha = 0.0}
	songlist_refresh_menus
	current_menu :se_setprops \{unblock_events}
endscript

script songlist_refresh_menus 
	songlist_clear_menus
	songlist :getsingletag \{mode}
	if NOT gotparam \{no_pivot}
		songlist :getsingletag \{list_index}
		songlist :getsingletag \{hilight_bar_index}
		change g_songlist_current_pivot = <list_index>
		change g_songlist_pivot_hilight_index = <hilight_bar_index>
	else
		change \{g_songlist_current_pivot = 0}
		change \{g_songlist_pivot_hilight_index = 0}
	endif
	songlist :settags {
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
		songlist_detail :se_setprops \{songlist_detail_mini_playlistt_text_alpha = 1.0}
	else
		songlist_detail :se_setprops \{songlist_detail_mini_playlistt_text_alpha = 0.0}
	endif
	songlist_slider_nub_cont :se_setprops pos = <slider_pos>
	songlist_reset_hilight_bar_pos
	songlist_update_ui
	songlist_pre_build
	if NOT gotparam \{no_focus}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script songlist_clear_menus 
	songlist :getsingletag \{mode}
	destroyscreenelement \{id = current_menu
		preserve_parent}
	if NOT (<mode> = music_store)
		destroyscreenelement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		destroyscreenelement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
	endif
	setscreenelementlock \{id = current_menu
		off}
	setscreenelementlock \{id = current_menu
		on}
	if NOT (<mode> = music_store || <mode> = import)
		setscreenelementlock \{id = songlist_detail_playlist_vmenu
			off}
		setscreenelementlock \{id = songlist_detail_playlist_vmenu
			on}
		setscreenelementlock \{id = songlist_detail_mini_playlist_vmenu
			off}
		setscreenelementlock \{id = songlist_detail_mini_playlist_vmenu
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
		drum = {
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
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
			case drum
			band_contains_drum = true
			band_is_only_guitar = false
			band_is_only_bass = false
			band_is_only_vocals = false
		endswitch
		getnextplayer player = <player>
		repeat <num_players>
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
		drum = {
			contains = <band_contains_drum>
			only = <band_is_only_drum>
		}
		vocals = {
			contains = <band_contains_vocals>
			only = <band_is_only_vocals>
		}
	}
endscript

script debug_songlist_print_playlist 
	printstruct channel = playlist ($current_playlist)
	printf \{channel = playlist
		qs(0xcb943ab3)}
endscript

script debug_songlist_print_tags 
	songlist :gettags
	printstruct <...>
	printf \{qs(0xcb943ab3)}
endscript

script musicstore_format_price_text 
	if isxenonorwindx
		formattext textname = price_text qs(0x581d2af2) p = <price>
	else
		formatdecimals integer = <price> fractional = <price_fraction> num_decimals = <currency_decimals>
	endif
	return price_text = <price_text>
endscript

script music_store_scroll_sfx 
	soundevent \{event = ghmix2_scroll_sound_01}
endscript

script music_store_select_sfx 
	soundevent \{event = ghmix2_select_sound}
endscript

script music_store_back_sfx 
	soundevent \{event = ghmix2_back_sound}
endscript

script music_store_determine_currency 
	if isps3
		if marketplacefunc \{func = get_currency_info}
			return true currency = <currency_code> currency_decimals = <currency_decimals>
		else
			scriptassert \{'Currency info fetch failed'}
		endif
	endif
	return \{false}
endscript
