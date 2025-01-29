store_songlist_respond_to_signin_changed = 0
store_songlist_respond_to_signin_changed_all_players = 0
store_songlist_respond_to_signin_changed_func = None

script songlist_signin_changed_func 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	if ScreenElementExists \{id = rank_capsule}
		rank_capsule :se_setprops \{gamerpic_texture = icon_gh6}
	endif
	ui_signin_changed_func <...>
	songlist_component :membfunc_songlist_uistack_getlistname
	if NOT contentmanfunc func = refresh Name = <list_name>
		script_assert \{qs(0x849fd6f0)}
	endif
	destroy_dialog_box
	if ui_event_exists_in_stack \{Name = 'songlist_options'}
		songlist_options_back
	endif
	songlist_component :membfunc_songlist_uistack_getmode
	attempt_to_add_friend_feed menu = SongList songlist_mode = <mode>
	songlist_refresh_menus
	songlist_remove_unavailable_songs_from_playlist
endscript

script ui_init_songlist \{mode = play_song}
	do_gh4_songlist_init
	if ($g_include_debug_songs = 1)
		EnableDuplicateSymbolWarning \{OFF}
		LoadPak \{'pak/test_songlist/test_songlist.pak'}
		EnableDuplicateSymbolWarning
	endif
	Change \{g_songlist_current_pivot = NULL}
	Change \{g_show_online_songlist_warning = 1}
	Change \{g_songlist_force_to_challenges = 0}
	gamemode_gettype
	if ((<Type> = quickplay) || (<Type> = competitive) || (<Type> = freeplay) || <mode> = sing_a_long)
		songlist_clear_filterspec
		songlist_dont_force_num_songs
	endif
	if (<Type> = freeplay)
		Change store_songlist_respond_to_signin_changed = ($respond_to_signin_changed)
		Change store_songlist_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
		Change store_songlist_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
		Change \{respond_to_signin_changed = 0}
		Change \{respond_to_signin_changed_all_players = 0}
		Change \{respond_to_signin_changed_func = songlist_signin_changed_func}
	endif
	if (<mode> = leaderboard)
		Change \{respond_to_signin_changed = 1}
		destroy_friend_feed
	endif
endscript

script songlist_allow_music_store_toggling 
	if NOT ininternetmode
		if NOT GotParam \{controller}
			songlist_component :GetSingleTag \{controller}
		endif
		if CheckForSignIn controller_index = <controller> network_platform_only
			songlist_component :membfunc_songlist_uistack_getmode
			gamemode_gettype
			if NOT ((<Type> = career) || (<Type> = freeplay) || (<mode> = leaderboard) || (<mode> = practice))
				if isps3
					if NetSessionFunc \{func = isoldenoughforonline}
						return \{true}
					endif
				else
					return \{true}
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script songlist_init_music_store 
	<continue> = 0
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		<continue> = 1
	else
		songlist_component :GetSingleTag \{controller}
		if songlist_allow_music_store_toggling controller = <controller>
			<continue> = 1
		else
			<continue> = 0
		endif
	endif
	songlist_component :GetSingleTag \{music_store_initialized}
	if GotParam \{music_store_initialized}
		if (<music_store_initialized> = 1)
			<continue> = 0
		endif
	endif
	if (<continue> = 1)
		if isps3
			preview_asset_image_size = ($default_preview_asset_image_size_ps3)
			preview_asset_sound_size = ($default_preview_asset_sound_size_ps3)
			preview_asset_image_cache_size = ($default_preview_asset_image_cache_size_ps3)
			preview_asset_sound_cache_size = ($default_preview_asset_sound_cache_size_ps3)
		else
			preview_asset_image_size = ($default_preview_asset_image_size_xenon)
			preview_asset_sound_size = ($default_preview_asset_sound_size_xenon)
			preview_asset_image_cache_size = ($default_preview_asset_image_cache_size_xenon)
			preview_asset_sound_cache_size = ($default_preview_asset_sound_cache_size_xenon)
		endif
		destroy_bink_sub_heaps
		flushdeferreddeletes
		if isps3
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_preview_assets' size = (2200 * 1024) vram_size = (5700 * 1024)
			MemPopContext
		else
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_preview_assets' size = (6400 * 1024)
			MemPopContext
		endif
		MemPushContext \{heap_musicstore}
		previewassetcache {
			func = init
			preview_asset_image_cache_size = <preview_asset_image_cache_size>
			preview_asset_sound_cache_size = <preview_asset_sound_cache_size>
			preview_asset_max_file_requests = ($default_preview_asset_max_file_requests)
			preview_asset_image_size = <preview_asset_image_size>
			preview_asset_sound_size = <preview_asset_sound_size>
			preview_asset_image_vram_size = ($default_preview_asset_image_vram_size)
			preview_asset_sound_vram_size = ($default_preview_asset_sound_vram_size)
			preview_asset_on_disc_assets = ($default_preview_asset_on_disc_assets)
		}
		MemPopContext
		songlist_component :SetTags \{music_store_initialized = 1}
	endif
endscript

script songlist_deinit_music_store 
	<continue> = 0
	songlist_component :GetSingleTag \{music_store_initialized}
	if GotParam \{music_store_initialized}
		if (<music_store_initialized> = 1)
			<continue> = 1
		endif
	endif
	if (<continue> = 1)
		songlist_component :membfunc_songlist_uistack_getlistregistered \{list_name = marketplace}
		if (<list_registered> = 1)
			songlist_unregister_content_source \{list_name = marketplace}
			songlist_component :membfunc_songlist_uistack_setlistregistered \{list_name = marketplace
				list_registered = 0}
		endif
		Change \{g_marketplace_responding_to_error = 0}
		music_store_kill_preview_music
		if ScreenElementExists \{id = songlist_detail}
			songlist_detail :se_setprops \{songlist_detail_album_sprite_texture = mainmenu_logo_lrg}
		endif
		previewassetcache \{func = cancel_all_requests}
		previewassetcache \{func = unload_all}
		previewassetcache \{func = shutdown}
		if memheapexists \{Name = heap_preview_assets}
			memdeleteheap \{Name = heap_preview_assets}
		endif
		if isps3
			if memheapexists \{Name = heap_preview_assets_vram}
				memdeleteheap \{Name = heap_preview_assets_vram}
			endif
			vmheap \{func = free_commerce}
			vmheap \{func = swap_in}
		endif
		create_bink_sub_heaps
		create_song_and_musicstudio_heaps
		songlist_component :SetTags \{music_store_initialized = 0}
	endif
endscript

script do_gh4_songlist_init 
	KillSpawnedScript \{Name = audio_crowd_play_loading_screen_swell}
	KillSpawnedScript \{Name = audio_crowd_loading_whistle}
	KillSpawnedScript \{Name = audio_crowd_play_one_shots_between_songs}
	KillSpawnedScript \{Name = audio_crowd_play_surge_between_songs}
endscript

script ui_create_songlist \{mode = play_song
		locked = FALSE}
	if NOT (<mode> = music_store)
		if NOT ui_event_exists_in_stack \{Name = 'freeplay'}
			if NOT InNetGame
				if will_scan_dlc
					SpawnScriptNow \{songlist_dlc_scan_choose_scan_spawned}
					return
				endif
			endif
		endif
	endif
	if ScreenElementExists \{id = SongList}
		ui_return_songlist
		return
	endif
	Change \{g_songlist_seek_first = NULL}
	Change \{g_songlist_warning_active = 0}
	Change \{g_songlist_playlist_size = 0}
	Change \{g_songlist_beginning_playlist_size = 0}
	Change \{g_songlist_infinite_playlist = 0}
	Change \{g_songlist_random_playlist = 0}
	Change \{g_songlist_num_5star_songs = 0}
	if NOT (($g_songlist_targeted_song) = NULL)
		Change g_songlist_current_pivot = ($g_songlist_targeted_song)
	endif
	if ininternetmode
		Change \{g_songlist_current_pivot = NULL}
	endif
	if (<mode> = sing_a_long)
		ui_sing_a_long_add_controllers_in_game
	endif
	if ((<mode> = leaderboard) || (<mode> = toprockers))
		Change \{rich_presence_context = presence_leaderboards}
	elseif (<mode> = music_store)
		Change \{rich_presence_context = presence_music_store}
	else
		Change \{rich_presence_context = presence_gigboard_and_setlist}
	endif
	Change \{songlist_song_preview_changing = 0}
	if ininternetmode
		songlist_clear_playlist
		if NOT ScriptIsRunning \{song_breakdown_end_game}
			if NOT ScriptIsRunning \{song_breakdown_end_game_spawned}
				spawn_player_drop_listeners \{drop_player_script = songlist_drop_player
					end_game_script = songlist_end_game}
			endif
		endif
		mode = playlist
		gamemode_gettype
		if (<Type> = career)
			if ($g_net_leader_player_num > 0)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 0
					printf \{qs(0xcc39ea85)}
					Change \{g_num_local_song_picks = 0}
				else
					printf \{qs(0xcb942ad6)}
					Change g_num_local_song_picks = ($g_songlist_force_num_songs_to_choose)
				endif
			endif
		else
			getnumplayersingame \{local}
			Change g_num_local_song_picks = <num_players>
		endif
	else
		gamemode_gettype
		if NOT (<Type> = career)
			songlist_create_all_jammode_arrays
		endif
	endif
	if NOT (<mode> = music_store || <mode> = leaderboard || <mode> = practice || <mode> = sing_a_long)
		if is_a_playlist_loaded
			mode = playlist
		endif
	endif
	hide_glitch \{num_frames = 12}
	if (<mode> = music_store)
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
	endif
	songlist_create {
		list_name = gh_songlist
		mode = <mode>
		locked = <locked>
		lock_first_song = <lock_first_song>
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	songlist_pre_build
	current_menu :Obj_SpawnScriptNow ui_create_songlist_spawned params = {<...>}
	if InNetGame
		current_menu :Obj_SpawnScriptNow \{net_songlist_warning_msg}
	endif
	if demobuild
		if ($kiosk_demo = 1)
			current_menu :Obj_KillSpawnedScript \{Name = demo_timeout_check}
			current_menu :Obj_SpawnScriptNow \{demo_timeout_check
				params = {
					func = songlist_back
				}}
		endif
	endif
	if ui_event_exists_in_stack \{Name = 'select_training'}
		SpawnScriptNow \{reset_mainmenu_camera}
	endif
	if ($g_songlist_force_to_challenges = 1)
		songlist_component :Obj_SpawnScriptNow songlist_force_to_challenges params = {device_num = <device_num>}
	else
		Change \{g_songlist_targeted_song = NULL}
	endif
	SpawnScriptNow \{songlist_enable_rendering}
endscript

script songlist_enable_rendering 
	Wait \{8
		gameframes}
	popdisablerendering \{context = going_into_songlist
		Type = unchecked}
endscript

script songlist_force_to_challenges 
	Change \{g_songlist_force_to_challenges = 0}
	songlist_component :GetSingleTag \{savegame_device}
	<song> = ($g_songlist_targeted_song)
	Change \{g_songlist_targeted_song = NULL}
	ui_event_wait_for_safe
	begin
	songlist_component :GetSingleTag \{initial_built}
	if (<initial_built> = true)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	generic_event_choose state = uistate_award_case data = {is_popup song = <song> device_num = <savegame_device> return_from_song = 1}
endscript

script ui_create_songlist_spawned 
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	songlist_update_song_preview \{song = None}
endscript

script songlist_create_default_user_control_helpers \{mode = play_song}
	if ($g_songlist_warning_active = 1)
		return
	endif
	<controller> = ($primary_controller)
	if ScreenElementExists \{id = songlist_component}
		songlist_component :GetSingleTag \{controller}
	endif
	if (<mode> = play_song)
		songlist_component :GetSingleTag \{jump_enabled}
		if (<jump_enabled> = 1)
			add_user_control_helper \{text = qs(0xad06ba43)
				button = yellow
				z = 100000}
		endif
		if NOT ininternetmode
			if NOT demobuild
				gamemode_gettype
				if (<Type> = career)
					if ($g_songlist_show_more_info = 0)
						add_user_control_helper \{text = qs(0x6644ffc7)
							button = back
							z = 100000}
					else
						add_user_control_helper \{text = qs(0x0d424947)
							button = back
							z = 100000}
					endif
				endif
			endif
		endif
		if screenelementexistssimpleid \{id = friends_feed_desc_id}
			if news_feed_should_add_button_helper
				add_user_control_helper \{text = qs(0x226893e8)
					button = blue
					z = 100000}
			endif
		endif
		if NOT demobuild
			add_user_control_helper \{text = qs(0x00a93373)
				button = orange
				z = 100000}
		endif
		songlist_component :GetSingleTag \{tab_enabled}
		if (<tab_enabled> = 1)
			add_super_user_control_helper \{text = qs(0xdbb3498d)
				button = back}
		endif
	elseif (<mode> = playlist)
		gamemode_gettype
		if InNetGame
			add_gamertag_helper exclusive_device = ($primary_controller)
			if ($net_song_countdown = 0)
				if ($g_num_local_song_picks > 0)
					if (<Type> = career)
						if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
							add_user_control_helper \{text = qs(0x562b9e24)
								button = green
								z = 100000}
						endif
					else
						add_user_control_helper \{text = qs(0x562b9e24)
							button = green
							z = 100000}
					endif
				endif
			else
			endif
		else
		endif
		songlist_component :GetSingleTag \{jump_enabled}
		if (<jump_enabled> = 1)
			add_user_control_helper \{text = qs(0xad06ba43)
				button = yellow
				z = 100000}
		endif
		if screenelementexistssimpleid \{id = friends_feed_desc_id}
			if news_feed_should_add_button_helper
				add_user_control_helper \{text = qs(0x226893e8)
					button = blue
					z = 100000}
			endif
		endif
		if InNetGame
			if ($net_song_countdown = 0)
				if ($g_num_local_song_picks > 0)
					add_user_control_helper \{text = qs(0x00a93373)
						button = orange
						z = 100000}
				endif
			endif
		else
			add_user_control_helper \{text = qs(0x00a93373)
				button = orange
				z = 100000}
		endif
		if NOT ininternetmode
			if (<Type> = career)
				if ($g_songlist_show_more_info = 0)
					add_user_control_helper \{text = qs(0x6644ffc7)
						button = back
						z = 100000}
				else
					add_user_control_helper \{text = qs(0x0d424947)
						button = back
						z = 100000}
				endif
			endif
		endif
		songlist_component :GetSingleTag \{tab_enabled}
		if (<tab_enabled> = 1)
			add_super_user_control_helper \{text = qs(0xdbb3498d)
				button = back}
		endif
	elseif (<mode> = leaderboard || <mode> = practice || <mode> = sing_a_long)
		params = {}
		if (<mode> = sing_a_long)
			params = {all_buttons}
		endif
		songlist_component :GetSingleTag \{jump_enabled}
		if (<jump_enabled> = 1)
			add_user_control_helper \{text = qs(0xad06ba43)
				button = yellow
				z = 100000}
		endif
		if news_feed_should_add_button_helper
			add_user_control_helper \{text = qs(0x226893e8)
				button = blue
				z = 100000}
		endif
		add_user_control_helper text = qs(0x00a93373) button = orange z = 100000 <params>
		if NOT (<mode> = leaderboard)
			if ($g_songlist_show_more_info = 0)
				add_user_control_helper text = qs(0x6644ffc7) button = back z = 100000 <params>
			else
				add_user_control_helper text = qs(0x0d424947) button = back z = 100000 <params>
			endif
		endif
	elseif (<mode> = music_store)
		if NOT GotParam \{no_options}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		songlist_component :GetSingleTag \{jump_enabled}
		if (<jump_enabled> = 1)
			add_user_control_helper \{text = qs(0xad06ba43)
				button = yellow
				z = 100000}
		endif
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = songs)
			add_user_control_helper \{text = qs(0x00a93373)
				button = orange
				z = 100000}
		endif
		songlist_component :GetSingleTag \{tab_enabled}
		if (<tab_enabled> = 1)
			add_super_user_control_helper \{text = qs(0xae6cf896)
				button = back}
		endif
	endif
endscript

script ui_deinit_songlist \{mode = play_song}
	songlist_clean_up_spawned_scripts
	songlist_destroy
	destroy_dialog_box
	songlist_cleanup_scripts
	songlist_deinit_music_store
	gamemode_gettype
	if (<Type> = freeplay)
		Change respond_to_signin_changed = ($store_songlist_respond_to_signin_changed)
		Change respond_to_signin_changed_all_players = ($store_songlist_respond_to_signin_changed_all_players)
		Change respond_to_signin_changed_func = ($store_songlist_respond_to_signin_changed_func)
	endif
endscript

script ui_destroy_songlist 
	SpawnScriptNow \{destroy_songlist_song_preview}
	songlist_destroy
	Change \{net_song_countdown = 0}
	clean_up_user_control_helpers
endscript

script ui_return_songlist 
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
	else
		ScriptAssert \{qs(0xd78eb9f9)}
	endif
	songlist_init_music_store
	current_menu :se_setprops \{alpha = 1.0}
	if GotParam \{initial_return_script}
		ui_event_remove_params \{param = initial_return_script}
		ui_event_remove_params \{param = initial_return_params}
		SongList :Obj_SpawnScriptNow <initial_return_script> params = <initial_return_params>
	endif
	if GotParam \{bypass_return_script}
		if (($g_songlist_refresh_menus) = 1)
			Change \{g_songlist_refresh_menus = 0}
		endif
		ui_event_remove_params \{param = bypass_return_script}
		ui_event_remove_params \{param = bypass_return_params}
		if GotParam \{no_pivot}
			ui_event_remove_params \{param = no_pivot}
		endif
		SongList :Obj_SpawnScriptNow <bypass_return_script> params = {<bypass_return_params> no_pivot = 1}
		return
	else
		songlist_component :membfunc_songlist_uistack_getmode
		if (music_store != <mode>)
			attempt_to_add_friend_feed menu = SongList songlist_mode = <mode>
		endif
		if (($g_songlist_refresh_menus) = 1)
			Change \{g_songlist_refresh_menus = 0}
			<refresh_params> = {
				no_focus = 1
			}
			if GotParam \{no_pivot}
				ui_event_remove_params \{param = no_pivot}
				<refresh_params> = {
					<refresh_params>
					no_pivot = 1
				}
			endif
			if GotParam \{pivot_checksum}
				ui_event_remove_params \{param = pivot_checksum}
				<refresh_params> = {
					<refresh_params>
					pivot_checksum = <pivot_checksum>
				}
			endif
			if GotParam \{pre_refresh_script}
				ui_event_remove_params \{param = pre_refresh_script}
				<pre_refresh_script>
			endif
			songlist_refresh_menus <refresh_params>
		else
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			if GotParam \{no_pivot}
				ui_event_remove_params \{param = no_pivot}
			endif
			current_menu :se_setprops \{unblock_events}
			if NOT GotParam \{no_focus}
				LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
			else
				ui_event_remove_params \{param = no_focus}
			endif
		endif
	endif
	if NOT (<mode> = music_store)
		current_menu :GetSingleTag \{allow_continue}
		if (<allow_continue> = 1)
			songlist_allow_continue
		else
			songlist_disallow_continue
		endif
	else
		SongList :se_setprops \{music_store_tab_subheader_alpha = 1.0}
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = songs)
			songlist_music_store_allow_sorting
		endif
	endif
	if GotParam \{additional_return_script}
		ui_event_remove_params \{param = additional_return_script}
		ui_event_remove_params \{param = additional_return_params}
		SongList :Obj_SpawnScriptNow <additional_return_script> params = <additional_return_params>
	endif
endscript

script songlist_cleanup_scripts 
	if ScriptIsRunning \{songlist_request_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_page_when_ready}
	endif
endscript

script songlist_stop_character_build 
	cascancelloading
	casblockforcomposite
	casblockforloading
endscript

script songlist_restart_character_build 
	persistent_band_refresh_changed_characters
endscript

script songlist_update_song_preview \{song = None}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT GotParam \{do_not_fade_preview}
		setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)} time = 1}
	endif
	if ($target_songlist_song_preview = <song>)
		return
	endif
	Change \{target_songlist_song_preview = None}
	Wait \{2
		gameframes}
	Change target_songlist_song_preview = <song>
endscript

script songlist_cycle_song_previews \{play_time = 7.0
		fade_time = 1.0}
	RequireParams \{[
			songs
		]
		all}
	GetArraySize <songs>
	if (<array_Size> > 0)
		begin
		<i> = 0
		begin
		<song> = (<songs> [<i>])
		Change target_songlist_song_preview = <song>
		Wait <play_time> Seconds
		Wait (<fade_time> + 0.1) Seconds
		<i> = (<i> + 1)
		repeat <array_Size>
		repeat
	endif
endscript

script songlist_kill_cycle_song_previews 
	KillSpawnedScript \{Name = songlist_cycle_song_previews}
	Change \{target_songlist_song_preview = None}
endscript

script destroy_songlist_song_preview 
	setscriptcannotpause
	sap_stoppreview
	songlist_update_song_preview \{song = None}
	if ($g_include_debug_songs = 1)
		UnLoadPak \{'pak/test_songlist/test_songlist.pak'}
	endif
endscript

script songlist_create_all_jammode_arrays 
	jam_update_curr_directory_listing controller = ($primary_controller)
	songlist_create_jammode_array SongList = ($jam_curr_directory_listing)
	songlist_create_jammode_array SongList = ($jam_song_assets) example_songs = 1
endscript

script instrument_being_used 
	support_part = <part>
	<used> = FALSE
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> = <support_part>)
			<used> = true
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return <used>
endscript

script songlist_create_check_jamsong_track_is_valid 
	<guitar_or_bass_supported> = FALSE
	if instrument_being_used \{part = guitar}
		<guitar_or_bass_supported> = true
	endif
	if instrument_being_used \{part = bass}
		<guitar_or_bass_supported> = true
	endif
	<has_guitar_or_bass_track> = FALSE
	if ((<jam_song_data>.playback_track1) > -1)
		<has_guitar_or_bass_track> = true
	endif
	if ((<jam_song_data>.playback_track2) > -1)
		<has_guitar_or_bass_track> = true
	endif
	<add_song> = 1
	if (<guitar_or_bass_supported> = true && <has_guitar_or_bass_track> = FALSE)
		<add_song> = 0
	endif
	return add_song = <add_song>
endscript

script songlist_create_jammode_array \{example_songs = 0}
	RequireParams \{[
			SongList
		]
		all}
	if (<example_songs> = 0)
		Change \{jammode_songlist = [
			]}
		Change \{jammode_songlist_props = {
			}}
	else
		Change \{example_jam_songlist = [
			]}
		Change \{example_jam_songlist_props = {
			}}
	endif
	GetArraySize <SongList>
	if (<array_Size> = 0)
		return
	endif
	<total_songs> = <array_Size>
	<i> = 0
	begin
	<jam_song_data> = (<SongList> [<i>])
	<add_song> = 1
	if StructureContains structure = <jam_song_data> never_show_in_setlist
		<add_song> = 0
	endif
	if (<add_song> = 1)
		songlist_create_check_jamsong_track_is_valid <...>
	endif
	if (<add_song> = 1)
		formatText TextName = text '%a' a = (<jam_song_data>.FileName)
		formatText checksumName = song '%i' i = <text> AddToStringLookup = true
		if (<example_songs> = 0)
			updatestructelement struct = <jam_song_data> element = additional_props value = {jam_index = <i>}
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($jammode_songlist) element = <song>
			Change jammode_songlist = <array>
			appendstruct struct = jammode_songlist_props Field = <song> params = {<jam_song_data>} globalstruct
		else
			updatestructelement struct = <jam_song_data> element = additional_props value = {jam_index = <i> example_song = 1}
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($example_jam_songlist) element = <song>
			Change example_jam_songlist = <array>
			appendstruct struct = example_jam_songlist_props Field = <song> params = {<jam_song_data>} globalstruct
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_songs>
endscript

script songlist_dlc_scan_choose_scan_spawned 
	setscriptcannotpause
	pushunsafeforshutdown \{context = songlist_dlc_scan_choose_scan_spawned}
	get_savegame_from_controller controller = ($primary_controller)
	ui_event_wait_for_safe
	popunsafeforshutdown \{context = songlist_dlc_scan_choose_scan_spawned}
	generic_event_choose {
		state = uistate_boot_download_scan
		data = {
			savegame = <savegame>
			controller = ($primary_controller)
			Force = 1
			event_params = {
				event = menu_back
				data = {
					state = uistate_songlist
				}
			}
			show_mainmenu_bg = 1
		}
	}
endscript
