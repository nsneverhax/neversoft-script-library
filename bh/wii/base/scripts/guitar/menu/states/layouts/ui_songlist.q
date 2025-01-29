
script music_store_load_venue 
	Change \{game_mode = music_studio}
	Change \{g_songlist_net_error_handling = throw_error}
	Change \{g_songlist_net_saved_error = None}
	begin
	if ($wii_current_mode = music_store)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{current_level = load_z_visualizer}
	Load_Venue \{block_scripts = 1}
	0xcb0276c2 \{load = true
		Heap = 0x28b22303}
	destroy_band
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE
		Heap = 0x28b22303}
	enablefullscreenvisualizer
endscript

script music_store_unload_venue 
	create_loading_screen
	0xb1970794
	Change \{game_mode = freeplay}
	Change \{encore_transitioned_played = FALSE}
	SetPakManCurrentBlock \{map = zones
		pak = None}
	begin
	if NOT ($wii_current_mode = music_store)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{g_songlist_net_error_handling = throw_error}
	Change \{g_songlist_net_saved_error = None}
	destroy_loading_screen
endscript

script wii_music_store_back 
	SpawnScriptNow \{wii_music_store_back_spawned}
endscript

script wii_music_store_back_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	create_loading_screen
	ui_event_wait_for_safe
	if ui_event_is_top_popup
		ui_event_block \{event = menu_back}
	endif
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :se_setprops \{songlist_detail_album_sprite_texture = logo_gh5_256}
	endif
	freestyle_back_to_gh_main_menu
endscript

script ui_init_songlist \{mode = play_song}
	do_gh4_songlist_init
	Change g_songlist_mode = <mode>
	if (<mode> = music_store)
		create_loading_screen
		Change music_store_on_enter_venue = ($current_level)
		SpawnScriptNow \{music_store_load_venue}
	endif
	if is_roadie_battle_mode
		rb_mode = 1
	else
		rb_mode = 0
	endif
	gamemode_gettype
	if ((<Type> = quickplay) || (<Type> = competitive) || (<Type> = freeplay) || <mode> = sing_a_long || (<rb_mode> = 1))
		songlist_clear_filterspec
		songlist_dont_force_num_songs
	endif
	if (<mode> = music_store)
		songlist_clear_filterspec
		Change \{g_songlist_last_visible_index = 4}
		Change \{g_music_store_current_pack_checksum = NULL}
		if isps3
			preview_asset_image_size = ($default_preview_asset_image_size_ps3)
			preview_asset_sound_size = ($default_preview_asset_sound_size_ps3)
			preview_asset_image_cache_size = ($default_preview_asset_image_cache_size_ps3)
			preview_asset_sound_cache_size = ($default_preview_asset_sound_cache_size_ps3)
		elseif isngc
		else
			preview_asset_image_size = ($default_preview_asset_image_size_xenon)
			preview_asset_sound_size = ($default_preview_asset_sound_size_xenon)
			preview_asset_image_cache_size = ($default_preview_asset_image_cache_size_xenon)
			preview_asset_sound_cache_size = ($default_preview_asset_sound_cache_size_xenon)
		endif
		if isps3
			vmheap \{func = swap_out}
			vmheap \{func = alloc_commerce}
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_preview_assets' size = (1536 * 1024) vram_size = (3072 * 1024)
			MemPopContext
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_musicstore' size = (980 * 1024) vram_size = (1000 * 1024)
			MemPopContext
		elseif isngc
		else
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_preview_assets' size = (4 * 1024 * 1024)
			MemPopContext
			MemPushContext \{heap_bink}
			MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024)
			MemPopContext
		endif
	elseif (<mode> = import)
		songlist_clear_filterspec
		Change \{g_songlist_last_visible_index = 4}
	elseif (<mode> = archive)
		Change \{g_songlist_last_visible_index = 4}
	else
		Change \{g_songlist_last_visible_index = 5}
	endif
	if (<mode> = leaderboard)
		Change \{respond_to_signin_changed = 1}
	endif
endscript

script do_gh4_songlist_init 
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
endscript
songlist_hide_flares = 0

script ui_create_songlist \{mode = play_song
		locked = FALSE}
	reset_song_loading_hack_global
	if ScreenElementExists \{id = practice_sd_eject_listener}
		DestroyScreenElement \{id = practice_sd_eject_listener}
	endif
	if ($songlist_hide_flares = 0)
		push_hide_flares
		Change \{songlist_hide_flares = 1}
	endif
	reset_song_loading_hack_global
	if ScriptIsRunning \{wii_music_store_back_spawned}
		return
	endif
	if ScreenElementExists \{id = SongList}
		ui_return_songlist
		return
	endif
	sdcardmanagerfunc \{func = pop_lock_card}
	sdcardmanagerfunc \{func = 0xd21e2b32}
	sdcardmanagerfunc \{func = push_lock_card}
	Change \{g_songlist_create_playlist_menu_item_present = 0}
	Change \{g_songlist_current_pivot = 0}
	Change \{g_songlist_pivot_hilight_index = 0}
	Change \{g_songlist_current_page = 0}
	Change \{g_songlist_warning_active = 0}
	if (<mode> = sing_a_long)
		ui_sing_a_long_add_controllers_in_game
	endif
	if ((<mode> = leaderboard) || (<mode> = toprockers))
		Change \{rich_presence_context = presence_leaderboards}
	elseif (<mode> = music_store)
		Change \{rich_presence_context = presence_music_store}
	elseif (<mode> = import)
		Change \{rich_presence_context = presence_menus}
	else
		Change \{rich_presence_context = presence_gigboard_and_setlist}
	endif
	Change \{songlist_song_preview_changing = 0}
	if ininternetmode
		songlist_clear_playlist
		spawn_player_drop_listeners \{drop_player_script = songlist_drop_player
			end_game_script = songlist_end_game}
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
	if NOT (<mode> = music_store || <mode> = leaderboard || <mode> = practice || <mode> = toprockers || <mode> = archive || <mode> = sing_a_long)
		if is_a_playlist_loaded
			mode = playlist
			songlist_filter_jam mode = <mode>
		endif
	endif
	if (<mode> = music_store)
		create_dialog_box {
			heading_text = qs(0x131b4d0f)
			body_text = qs(0xf29f90c7)
			player_device = ($primary_controller)
		}
		SpawnScriptNow \{music_store_entry_dialog_script}
		dialog_box_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	endif
	if (<mode> = sing_a_long)
		exclusive_device = [0 1 2 3]
	endif
	songlist_create {
		list_name = gh_songlist
		mode = <mode>
		locked = <locked>
		lock_first_song = <lock_first_song>
		pad_back_script = <pad_back_script>
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	songlist_pre_build
	current_menu :Obj_SpawnScriptNow ui_create_songlist_spawned params = {<...>}
	career_gig_info_check_for_all_vocalists
	if NOT (<mode> = music_store)
		if InNetGame
			current_menu :Obj_SpawnScriptNow net_songlist_warning_msg params = {all_vocalists = <all_vocalists> local = 0}
		endif
	endif
	StartRendering
	if ui_event_exists_in_stack \{Name = 'select_training'}
		SpawnScriptNow \{reset_mainmenu_camera}
	endif
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
	destroy_loading_screen
	0x61906aac
endscript

script songlist_create_default_user_control_helpers \{mode = play_song}
	<controller> = ($primary_controller)
	if ScreenElementExists \{id = SongList}
		SongList :GetSingleTag \{controller}
	endif
	if (<mode> = play_song)
		add_user_control_helper \{text = qs(0x56fbf662)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x8032d15d)
			button = songlist_page
			another_button = strumbar
			z = 100000}
		if NOT ininternetmode
			gamemode_gettype
			if NOT (<Type> = career)
				add_user_control_helper \{text = qs(0x976cf9e7)
					button = blue
					z = 100000}
			else
				if ($g_songlist_show_more_info = 0)
					add_user_control_helper \{text = qs(0x6644ffc7)
						button = blue
						z = 100000}
				else
					add_user_control_helper \{text = qs(0x0d424947)
						button = blue
						z = 100000}
				endif
			endif
		endif
		add_user_control_helper \{text = qs(0x00a93373)
			button = orange
			z = 100000}
	elseif (<mode> = playlist)
		gamemode_gettype
		if ($net_song_countdown = 0)
			if InNetGame
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
				add_user_control_helper \{text = qs(0x562b9e24)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x8032d15d)
			button = songlist_page
			another_button = strumbar
			z = 100000}
		if NOT ininternetmode
			if NOT (<Type> = career)
				add_user_control_helper \{text = qs(0x976cf9e7)
					button = blue
					z = 100000}
			else
				if ($g_songlist_show_more_info = 0)
					add_user_control_helper \{text = qs(0x6644ffc7)
						button = blue
						z = 100000}
				else
					add_user_control_helper \{text = qs(0x0d424947)
						button = blue
						z = 100000}
				endif
			endif
		endif
		add_user_control_helper \{text = qs(0x00a93373)
			button = orange
			z = 100000}
	elseif (<mode> = leaderboard || <mode> = practice || <mode> = toprockers || <mode> = sing_a_long)
		add_user_control_helper \{text = qs(0x4d9ad28f)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x8032d15d)
			button = songlist_page
			another_button = strumbar
			z = 100000}
		if ($g_songlist_show_more_info = 0)
			add_user_control_helper \{text = qs(0x6644ffc7)
				button = blue
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x0d424947)
				button = blue
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x00a93373)
			button = orange
			z = 100000}
	elseif (<mode> = music_store)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x8032d15d)
			button = songlist_page
			another_button = strumbar
			z = 100000}
		SongList :GetSingleTag \{music_store_mode}
		if GotParam \{music_store_mode}
			if NOT (<music_store_mode> = special_offers)
				add_user_control_helper \{text = qs(0x43b287ab)
					button = blue
					z = 100000}
			endif
		endif
	elseif (<mode> = import)
		add_gamertag_helper exclusive_device = ($primary_controller)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x8032d15d)
			button = songlist_page
			another_button = strumbar
			z = 100000}
	elseif (<mode> = archive)
		if ($g_songlist_archive_setup_complete = 1)
			SongList :GetTags
			if (<archive_source> = wii)
				<other_source> = sd
			else
				<other_source> = wii
			endif
			if archive_songlist_has_data list = <archive_source>
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			if NOT (<list_page_size> <= ($g_songlist_last_visible_index + 1))
				add_user_control_helper \{text = qs(0x8032d15d)
					button = songlist_page
					another_button = strumbar
					z = 100000}
			endif
			if archive_songlist_has_data list = <other_source>
				add_user_control_helper \{text = qs(0x9566218a)
					button = blue
					z = 100000}
			endif
			if archive_songlist_has_data list = <archive_source>
				add_user_control_helper \{text = qs(0x00a93373)
					button = orange
					z = 100000}
			endif
		endif
	endif
endscript

script ui_deinit_songlist \{mode = play_song}
	if ScreenElementExists \{id = practice_sd_eject_listener}
		DestroyScreenElement \{id = practice_sd_eject_listener}
	endif
	songlist_destroy
	destroy_dialog_box
	songlist_cleanup_scripts
	if (<mode> = music_store)
		if ScriptIsRunning \{music_store_entry_dialog_script}
			printf \{'killing music_store_entry_dialog_script'}
			KillSpawnedScript \{Name = music_store_entry_dialog_script}
		endif
		music_store_kill_preview_music
		Change \{g_music_store_global_content_keys = NULL}
		if ScreenElementExists \{id = songlist_detail}
			songlist_detail :se_setprops \{songlist_detail_album_sprite_texture = white}
		endif
		if isps3
			memdeleteheap \{Name = heap_preview_assets_vram}
			memdeleteheap \{Name = heap_musicstore_vram}
			vmheap \{func = free_commerce}
			vmheap \{func = swap_in}
		endif
		SpawnScriptNow \{music_store_unload_venue}
		Change \{wii_entering_music_store = 0}
	endif
	audience_party_start_game \{paused = 1}
endscript

script ui_destroy_songlist 
	SpawnScriptNow \{destroy_songlist_song_preview}
	songlist_destroy
	if ($songlist_hide_flares = 1)
		pop_hide_flares
		Change \{songlist_hide_flares = 0}
	endif
	Change \{net_song_countdown = 0}
	clean_up_user_control_helpers
	sdcardmanagerfunc \{func = 0xd21e2b32
		level = 0}
endscript

script ui_return_songlist 
	if ScriptIsRunning \{wii_music_store_back_spawned}
		return
	endif
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	Change \{generic_menu_block_input = 0}
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
	else
		ScriptAssert \{qs(0xd78eb9f9)}
	endif
	current_menu :se_setprops \{alpha = 1.0}
	if GotParam \{bypass_return_script}
		ui_event_remove_params \{param = bypass_return_script}
		ui_event_remove_params \{param = ui_struct}
		ui_event_remove_params \{param = Type}
		<bypass_return_script> ui_struct = <ui_struct> no_pivot = 1 Type = <Type>
		return
	else
		SongList :GetSingleTag \{mode}
		if (($g_songlist_refresh_menus) = 1)
			Change \{g_songlist_refresh_menus = 0}
			if GotParam \{no_pivot}
				ui_event_remove_params \{param = no_pivot}
				songlist_refresh_menus \{no_pivot = 1
					no_focus = 1}
			else
				songlist_refresh_menus \{no_focus = 1}
			endif
			if NOT GotParam \{selected_index}
				<selected_index> = 0
			endif
			LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		else
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			SongList :GetSingleTag \{list_page_size}
			if (<list_page_size> <= ($g_songlist_last_visible_index + 1))
				user_control_destroy_helper \{button = songlist_page}
			endif
			current_menu :se_setprops \{unblock_events}
		endif
	endif
	if NOT (<mode> = music_store)
		if is_a_playlist_loaded
			songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
				params = {
					desc = songlist_detail
				}}
		endif
		current_menu :GetSingleTag \{allow_continue}
		if (<allow_continue> = 1)
			songlist_allow_continue
		else
			songlist_disallow_continue
		endif
	else
		songlist_destroy_dialog_box
		SongList :se_setprops \{songlist_subheader_cont_alpha = 1.0
			songlist_sort_cont_alpha = 1.0}
		SongList :GetSingleTag \{music_store_mode}
		if NOT (<music_store_mode> = download_list)
			Change \{g_songlist_sd_card_required = 0}
		endif
		SongList :GetSingleTag \{music_store_mode}
		if GotParam \{music_store_mode}
			if (<music_store_mode> = songs)
				songlist_music_store_allow_sorting
			endif
		endif
		if NOT ($g_music_store_current_pack_checksum = NULL)
			if (<music_store_mode> = songs)
				Change \{g_music_store_previous_menu = hub}
			endif
			if ScreenElementExists \{id = SongList}
				SongList :Obj_SpawnScriptNow \{songlist_update_sort_purchase_button}
			endif
		else
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = songs)
				songlist_music_store_allow_sorting
			elseif ((<music_store_mode> = special_offers) && (($0x6a97a08a) = 1))
				create_dialog_box {
					heading_text = qs(0xea124b1e)
					body_text = qs(0xb8a48518)
					player_device = ($primary_controller)
				}
			endif
		endif
	endif
endscript

script songlist_cleanup_scripts 
	if ScriptIsRunning \{create_music_store_purchase_spawned}
		KillSpawnedScript \{Name = create_music_store_purchase_spawned}
	endif
	if ScriptIsRunning \{songlist_request_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_page_when_ready}
	endif
endscript

script 0xc6532cd4 
	current_menu :se_setprops \{block_events}
	Change \{g_import_wait_for_download_content_list_count = 0}
	Change \{import_marketplace_init = 1}
	Change \{import_download_content_list_finished = 0}
	NetSessionFunc {
		Obj = content_unlock
		func = download_content_list
		params = {
			controller_index = ($primary_controller)
			callback = callback_import_download_content_list
		}
	}
	printf \{qs(0x46ac9f96)}
	import_wait_for_download_content_list
	printf \{qs(0x5fb7aed7)}
	if (($g_import_wait_for_download_content_list_count) < 50)
		Wait (50 - ($g_import_wait_for_download_content_list_count)) gameframes
	endif
	Change \{g_import_wait_for_download_content_list_count = 0}
	if NOT NetSessionFunc Obj = content_unlock func = get_content_list params = {controller_index = ($primary_controller)}
		ScriptAssert \{'ui_create_import was reached without download_content_list being completed!'}
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					import_up
				}
				{
					pad_down
					import_down
				}
			]}
	endif
	added_elements = 0
	GetArraySize \{$downloaded_offerings}
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = ($downloaded_offerings [<i>]) offer
			if import_get_product_code offer = (($downloaded_offerings [<i>]).offer)
				if ((($downloaded_offerings [<i>]).Type) = import)
					import_add_item {
						text = (($downloaded_offerings [<i>]).display_name)
						pad_choose_script = import_choose
						pad_choose_params = {code = <code> content_keys = <content_keys> offeringid = (($downloaded_offerings [<i>]).offeringid) display_name = (($downloaded_offerings [<i>]).display_name) title_name = (($downloaded_offerings [<i>]).title_name)}
						pad_option_script = import_choose_details
						pad_option_params = {index = <i>}
						($downloaded_offerings [<i>])
					}
					added_elements = 1
				elseif ((($downloaded_offerings [<i>]).Type) = patch)
					import_add_item {
						text = (($downloaded_offerings [<i>]).display_name)
						pad_choose_script = import_purchase_content
						pad_choose_params = {code = <code>}
						($downloaded_offerings [<i>])
					}
					added_elements = 1
				endif
			else
				printf 'unable to get code for %s' s = (($downloaded_offerings [<i>]).display_name)
			endif
		else
			printf 'no offer structure in %s' s = (($downloaded_offerings [<i>]).display_name)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<added_elements> = 0)
		import_setup_failed \{fail_text = qs(0x9d2e328d)
			heading_text = qs(0x03ac90f0)}
		return
	endif
	Change \{g_songlist_last_visible_index = 4}
	SongList :SetTags {
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_count = <array_Size>
		hilight_bar_res = 74
		slider_nub_res = (350.0 / (<array_Size> - 1))
		hilight_bar_index = 0
	}
	GetScreenElementChildren \{id = current_menu}
	if (<array_Size> > 0)
		if GotParam \{selected_index}
			if (<selected_index> > 0)
				begin
				import_down \{no_sound}
				repeat <selected_index>
			endif
			(<children> [<selected_index>]) :se_setprops item_rgba = ($g_music_store_item_focus_rgba)
		else
			(<children> [0]) :se_setprops item_rgba = ($g_music_store_item_focus_rgba)
		endif
	endif
endscript

script setup_special_offers 
	music_store_start_saving_net_error
	NetSessionFunc \{func = is_leaderboard_lobby_available}
	current_menu :se_setprops \{block_events}
	Change \{g_import_wait_for_download_content_list_count = 0}
	Change \{import_marketplace_init = 1}
	Change \{import_download_content_list_finished = 0}
	NetSessionFunc {
		Obj = content_unlock
		func = download_content_list
		params = {
			controller_index = ($primary_controller)
			callback = callback_import_download_content_list
		}
	}
	printf \{qs(0x46ac9f96)}
	if NOT import_wait_for_download_content_list
		SetButtonEventMappings \{unblock_menu_input}
		current_menu :se_setprops \{unblock_events}
		return \{FALSE}
	endif
	printf \{qs(0x5fb7aed7)}
	if (($g_import_wait_for_download_content_list_count) < 50)
		Wait (50 - ($g_import_wait_for_download_content_list_count)) gameframes
	endif
	Change \{g_import_wait_for_download_content_list_count = 0}
	if NOT NetSessionFunc Obj = content_unlock func = get_content_list params = {controller_index = ($primary_controller)}
		ScriptAssert \{' setup_special_offers was reached without download_content_list being completed!'}
	endif
	printf \{'CHANGING THE GLOBAL CONTENT KEY STRUCTURE'}
	Change g_music_store_global_content_keys = (<content_keys>)
	Change \{0x6a97a08a = 0}
	if music_store_stop_saving_net_error
		return \{FALSE}
	endif
	current_menu :se_setprops \{unblock_events}
	return \{true}
endscript

script songlist_music_store_return_to_special_offers 
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
	if ($0x6a97a08a = 1)
		destroy_dialog_box
		create_dialog_box {
			dlg_z_priority = 1001
			heading_text = qs(0xea124b1e)
			body_text = qs(0xb8a48518)
			player_device = ($primary_controller)
		}
		setup_special_offers
	endif
	generic_event_back
endscript

script songlist_update_sort_purchase_button 
	SongList :GetSingleTag \{list_name}
	Change \{dlc_timeout_counter = 0}
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		contentmanfunc {
			func = request_page
			Name = <list_name>
			single_item
			Seek = ($g_music_store_current_pack_checksum)
			callback = songlist_update_sort_purchase_button_callback
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
	contentmanfunc func = cancel_request Name = <list_name>
	destroy_dialog_box
	music_store_start_saving_net_error
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

script songlist_update_sort_purchase_button_callback 
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
	SpawnScriptNow 0x3adf398d params = <...>
endscript

script 0x3adf398d 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
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
	songstoppreview
	songlist_update_song_preview \{song = None}
endscript

script songlist_create_all_jammode_arrays 
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
	if StructureContains structure = <jam_song_data> playback_track1
		if ((<jam_song_data>.playback_track1) > -1)
			<has_guitar_or_bass_track> = true
		endif
	endif
	if StructureContains structure = <jam_song_data> playback_track2
		if ((<jam_song_data>.playback_track2) > -1)
			<has_guitar_or_bass_track> = true
		endif
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
	printf \{'songlist_create_jammode_array'}
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
	if StructureContains structure = <jam_song_data> song_version
		if ((<jam_song_data>.song_version) = 0)
			<add_song> = 0
			printf ' --> JAM SONG: %a is placeholder' a = <i>
		else
			printf ' --> JAM SONG: %a is good' a = <i>
		endif
	endif
	if StructureContains structure = <jam_song_data> never_show_in_setlist
		<add_song> = 0
		printf ' --> JAM SONG: %a never show in setlist' a = <i>
	endif
	if (<add_song> = 1)
		songlist_create_check_jamsong_track_is_valid <...>
	endif
	if (<add_song> = 1)
		formatText TextName = text '%a' a = (<jam_song_data>.FileName)
		formatText checksumName = song '%i' i = <text>
		if (<example_songs> = 0)
			updatestructelement struct = <jam_song_data> element = jamsongindex value = <i>
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($jammode_songlist) element = <song>
			Change jammode_songlist = <array>
			appendstruct struct = jammode_songlist_props Field = <song> params = {<jam_song_data>} globalstruct
		else
			<index> = (<i> + 1000)
			updatestructelement struct = <jam_song_data> element = jamsongindex value = <index>
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($example_jam_songlist) element = <song>
			Change example_jam_songlist = <array>
			appendstruct struct = example_jam_songlist_props Field = <song> params = {<jam_song_data>} globalstruct
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_songs>
endscript
