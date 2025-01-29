store_songlist_respond_to_signin_changed = 0
store_songlist_respond_to_signin_changed_all_players = 0
store_songlist_respond_to_signin_changed_func = None

script songlist_signin_changed_func 
	ui_signin_changed_func <...>
	Change \{g_songlist_ignore_pivot_hack = 1}
	songlist :GetSingleTag \{list_name}
	if NOT ContentManFunc func = refresh name = <list_name>
		script_assert \{qs(0x849fd6f0)}
	endif
	destroy_dialog_box
	if ui_event_exists_in_stack \{name = 'songlist_manage_playlist'}
		songlist_manage_playlist_back
	else
		songlist_destroy_dialog_box
	endif
	songlist_refresh_menus
	songlist_remove_unavailable_songs_from_playlist
endscript

script ui_init_songlist \{mode = play_song}
	do_gh4_songlist_init
	if ($g_include_debug_songs = 1)
		EnableDuplicateSymbolWarning \{off}
		LoadPak \{'pak/test_songlist/test_songlist.pak'}
		EnableDuplicateSymbolWarning
	endif
	Change g_songlist_mode = <mode>
	GameMode_GetType
	if ((<type> = quickplay) || (<type> = competitive) || (<type> = freeplay) || <mode> = sing_a_long)
		songlist_clear_filterspec
		songlist_dont_force_num_songs
	endif
	if (<type> = freeplay)
		Change store_songlist_respond_to_signin_changed = ($respond_to_signin_changed)
		Change store_songlist_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
		Change store_songlist_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
		Change \{respond_to_signin_changed = 0}
		Change \{respond_to_signin_changed_all_players = 0}
		Change \{respond_to_signin_changed_func = songlist_signin_changed_func}
	endif
	if (<mode> = music_store)
		songlist_clear_filterspec
		Change \{g_songlist_last_visible_index = 4}
		Change \{g_music_store_current_pack_checksum = null}
		if IsPS3
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
		destroy_band
		destroy_song_and_musicstudio_heaps \{do_unloads}
		destroy_bink_sub_heaps
		FlushDeferredDeletes
		if IsPS3
			VMHeap \{func = swap_out}
			VMHeap \{func = alloc_commerce}
			MemPushContext \{heap_bink}
			MemInitHeap name = 'heap_preview_assets' size = (2200 * 1024) vram_size = (5700 * 1024)
			MemPopContext
			MemPushContext \{heap_bink}
			MemInitHeap name = 'heap_musicstore' size = (1000 * 1024) vram_size = (1000 * 1024)
			MemPopContext
		else
			MemPushContext \{heap_bink}
			MemInitHeap name = 'heap_preview_assets' size = (6400 * 1024)
			MemPopContext
			MemPushContext \{heap_bink}
			MemInitHeap name = 'heap_musicstore' size = (1 * 1024 * 1024)
			MemPopContext
		endif
		PreviewAssetCache {
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
	elseif (<mode> = import)
		songlist_clear_filterspec
		Change \{g_songlist_last_visible_index = 4}
	else
		Change \{g_songlist_last_visible_index = 5}
	endif
	if (<mode> = leaderboard)
		Change \{respond_to_signin_changed = 1}
	endif
endscript

script do_gh4_songlist_init 
	killspawnedscript \{name = Loading_Screen_Crowd_Swell}
	killspawnedscript \{name = Crowd_Loading_Whistle}
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
endscript

script ui_create_songlist \{mode = play_song
		locked = false}
	reset_song_loading_hack_global
	if ScreenElementExists \{id = songlist}
		ui_return_songlist
		return
	endif
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
	if InInternetMode
		songlist_clear_playlist
		spawn_player_drop_listeners \{drop_player_script = songlist_drop_player
			end_game_script = songlist_end_game}
		mode = playlist
		GameMode_GetType
		if (<type> = career)
			if ($g_net_leader_player_num > 0)
				if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 0
					printf \{qs(0xcc39ea85)}
					Change \{g_num_local_song_picks = 0}
				else
					printf \{qs(0xcb942ad6)}
					Change g_num_local_song_picks = ($g_songlist_force_num_songs_to_choose)
				endif
			endif
		else
			GetNumPlayersInGame \{local}
			Change g_num_local_song_picks = <num_players>
		endif
	else
		GameMode_GetType
		if NOT (<type> = career)
			songlist_create_all_jammode_arrays
		endif
	endif
	if NOT (<mode> = music_store || <mode> = leaderboard || <mode> = practice || <mode> = toprockers || <mode> = sing_a_long)
		if is_a_playlist_loaded
			mode = playlist
		endif
	endif
	if (<mode> = music_store)
		create_dialog_box \{heading_text = qs(0x131b4d0f)
			body_text = qs(0xf29f90c7)}
		dialog_box_container :Obj_SpawnScript \{jam_recording_animate_spinning_record}
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
	if InNetGame
		current_menu :Obj_SpawnScriptNow \{net_songlist_warning_msg}
	endif
	StartRendering
	if ui_event_exists_in_stack \{name = 'select_training'}
		spawnscriptnow \{reset_mainmenu_camera}
	endif
endscript

script ui_create_songlist_spawned 
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	songlist_update_song_preview \{song = None}
endscript

script songlist_create_default_user_control_helpers \{mode = play_song}
	<controller> = ($primary_controller)
	if ScreenElementExists \{id = songlist}
		songlist :GetSingleTag \{controller}
	endif
	if (<mode> = play_song)
		add_user_control_helper \{text = qs(0x56fbf662)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ((IsPS3) && (isdrumcontroller controller = <controller>))
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				force_pad_button = 1
				another_button = strumbar
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				another_button = strumbar
				z = 100000}
		endif
		if NOT InInternetMode
			GameMode_GetType
			if NOT (<type> = career)
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
		GameMode_GetType
		if ($net_song_countdown = 0)
			if InNetGame
				if ($g_num_local_song_picks > 0)
					if (<type> = career)
						if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
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
		if ((IsPS3) && (isdrumcontroller controller = <controller>))
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				force_pad_button = 1
				another_button = strumbar
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				another_button = strumbar
				z = 100000}
		endif
		if NOT InInternetMode
			if NOT (<type> = career)
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
		params = {}
		if (<mode> = sing_a_long)
			params = {all_buttons}
		endif
		add_user_control_helper text = qs(0x4d9ad28f) button = green z = 100000 <params>
		add_user_control_helper text = qs(0xaf4d5dd2) button = red z = 100000 <params>
		if ((IsPS3) && (isdrumcontroller controller = <controller>))
			add_user_control_helper text = qs(0x8032d15d) button = yellow force_pad_button = 1 another_button = strumbar z = 100000 <params>
		else
			add_user_control_helper text = qs(0x8032d15d) button = yellow another_button = strumbar z = 100000 <params>
		endif
		if ($g_songlist_show_more_info = 0)
			add_user_control_helper text = qs(0x6644ffc7) button = blue z = 100000 <params>
		else
			add_user_control_helper text = qs(0x0d424947) button = blue z = 100000 <params>
		endif
		add_user_control_helper text = qs(0x00a93373) button = orange z = 100000 <params>
	elseif (<mode> = music_store)
		add_user_control_helper \{text = qs(0xb7b2ba93)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ((IsPS3) && (isdrumcontroller controller = <controller>))
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				force_pad_button = 1
				another_button = strumbar
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				another_button = strumbar
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x43b287ab)
			button = blue
			z = 100000}
	elseif (<mode> = import)
		add_gamertag_helper exclusive_device = ($primary_controller)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ((IsPS3) && (isdrumcontroller controller = <controller>))
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				force_pad_button = 1
				another_button = strumbar
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x8032d15d)
				button = yellow
				another_button = strumbar
				z = 100000}
		endif
	endif
endscript

script ui_deinit_songlist \{mode = play_song}
	songlist_clean_up_spawned_scripts
	songlist_destroy
	destroy_dialog_box
	songlist_cleanup_scripts
	if (<mode> = music_store)
		Change \{g_marketplace_responding_to_error = 0}
		music_store_kill_preview_music
		if ScreenElementExists \{id = Songlist_detail}
			Songlist_detail :SE_SetProps \{songlist_detail_album_sprite_texture = white}
		endif
		PreviewAssetCache \{func = cancel_all_requests}
		PreviewAssetCache \{func = unload_all}
		PreviewAssetCache \{func = shutdown}
		MemDeleteHeap \{name = heap_musicstore}
		MemDeleteHeap \{name = heap_preview_assets}
		if IsPS3
			MemDeleteHeap \{name = heap_preview_assets_vram}
			MemDeleteHeap \{name = heap_musicstore_vram}
			VMHeap \{func = free_commerce}
			VMHeap \{func = swap_in}
		endif
		create_bink_sub_heaps
		create_song_and_musicstudio_heaps
	endif
	GameMode_GetType
	if (<type> = freeplay)
		Change respond_to_signin_changed = ($store_songlist_respond_to_signin_changed)
		Change respond_to_signin_changed_all_players = ($store_songlist_respond_to_signin_changed_all_players)
		Change respond_to_signin_changed_func = ($store_songlist_respond_to_signin_changed_func)
	endif
endscript

script ui_destroy_songlist 
	spawnscriptnow \{destroy_songlist_song_preview}
	songlist_destroy
	Change \{net_song_countdown = 0}
	clean_up_user_control_helpers
endscript

script ui_return_songlist 
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	Change \{generic_menu_block_input = 0}
	if songlist :Desc_ResolveAlias \{name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
	else
		ScriptAssert \{qs(0xd78eb9f9)}
	endif
	current_menu :SE_SetProps \{alpha = 1.0}
	if GotParam \{bypass_return_script}
		ui_event_remove_params \{param = bypass_return_script}
		ui_event_remove_params \{param = ui_struct}
		<bypass_return_script> ui_struct = <ui_struct> no_pivot = 1
		return
	else
		songlist :GetSingleTag \{mode}
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
			LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
		else
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :GetSingleTag \{list_page_size}
			if (<list_page_size> <= ($g_songlist_last_visible_index + 1))
				user_control_destroy_helper \{button = yellow}
			endif
			current_menu :SE_SetProps \{unblock_events}
		endif
	endif
	if NOT (<mode> = music_store)
		if is_a_playlist_loaded
			Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
				params = {
					desc = Songlist_detail
				}}
		endif
		current_menu :GetSingleTag \{allow_continue}
		if (<allow_continue> = 1)
			songlist_allow_continue
		else
			songlist_disallow_continue
		endif
	else
		songlist :SE_SetProps \{songlist_subheader_cont_alpha = 1.0
			songlist_sort_cont_alpha = 1.0}
		if NOT ($g_music_store_current_pack_checksum = null)
			if ScreenElementExists \{id = songlist}
				songlist :Obj_SpawnScriptNow \{songlist_update_sort_purchase_button}
			endif
		else
			songlist :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = songs)
				songlist_music_store_allow_sorting
			endif
		endif
	endif
endscript

script songlist_cleanup_scripts 
	if ScriptIsRunning \{create_music_store_purchase_spawned}
		killspawnedscript \{name = create_music_store_purchase_spawned}
	endif
	if ScriptIsRunning \{songlist_request_page_when_ready}
		killspawnedscript \{name = songlist_request_page_when_ready}
	endif
endscript

script songlist_update_sort_purchase_button 
	songlist :GetSingleTag \{list_name}
	begin
	if ContentManFunc func = is_ready name = <list_name>
		ContentManFunc {
			func = request_page
			name = <list_name>
			single_item
			seek = ($g_music_store_current_pack_checksum)
			callback = songlist_update_sort_purchase_button_callback
		}
		return
	endif
	wait \{3
		gameframes}
	repeat 1000
	destroy_dialog_box
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
	<allow_purchase> = 1
	if IsPS3
		if (<content_item>.purchased = 1)
			<allow_purchase> = 0
		endif
	endif
	if (<allow_purchase> = 1)
		if ((<content_item>.type) = pack)
			if ((<content_item>.purchased) = 1)
				<button_text> = qs(0xe8ec5f45)
			else
				<button_text> = qs(0x74fd0cf6)
			endif
		else
			if ((<content_item>.purchased) = 1)
				<button_text> = qs(0xaa94b42c)
			else
				<button_text> = qs(0xec8c85c0)
			endif
		endif
		if NOT user_control_helper_exists \{button = orange}
			add_user_control_helper text = <button_text> button = orange z = 100000
		else
			user_control_helper_change_text button = orange text = <button_text>
		endif
	else
		user_control_destroy_helper \{button = orange}
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_L1
					nullscript
				}
			]
			replace_handlers}
	endif
endscript

script songlist_stop_character_build 
	CasCancelLoading
	CasBlockForComposite
	CasBlockForLoading
endscript

script songlist_restart_character_build 
	persistent_band_refresh_changed_characters
endscript

script songlist_update_song_preview \{song = None}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	SetSoundBussParams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	if ($target_songlist_song_preview = <song>)
		return
	endif
	Change \{target_songlist_song_preview = None}
	wait \{2
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
	if (<array_size> > 0)
		begin
		<i> = 0
		begin
		<song> = (<songs> [<i>])
		Change target_songlist_song_preview = <song>
		wait <play_time> seconds
		wait (<fade_time> + 0.1) seconds
		<i> = (<i> + 1)
		repeat <array_size>
		repeat
	endif
endscript

script songlist_kill_cycle_song_previews 
	killspawnedscript \{name = songlist_cycle_song_previews}
	Change \{target_songlist_song_preview = None}
endscript

script destroy_songlist_song_preview 
	SetScriptCannotPause
	SongStopPreview
	songlist_update_song_preview \{song = None}
	if ($g_include_debug_songs = 1)
		UnLoadPak \{'pak/test_songlist/test_songlist.pak'}
	endif
endscript

script songlist_create_all_jammode_arrays 
	jam_update_curr_directory_listing controller = ($primary_controller)
	songlist_create_jammode_array songlist = ($jam_curr_directory_listing)
	songlist_create_jammode_array songlist = ($jam_song_assets) example_songs = 1
endscript

script instrument_being_used 
	support_part = <part>
	<used> = false
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		if (<part> = <support_part>)
			<used> = true
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return <used>
endscript

script songlist_create_check_jamsong_track_is_valid 
	<guitar_or_bass_supported> = false
	if instrument_being_used \{part = guitar}
		<guitar_or_bass_supported> = true
	endif
	if instrument_being_used \{part = bass}
		<guitar_or_bass_supported> = true
	endif
	<has_guitar_or_bass_track> = false
	if ((<jam_song_data>.playback_track1) > -1)
		<has_guitar_or_bass_track> = true
	endif
	if ((<jam_song_data>.playback_track2) > -1)
		<has_guitar_or_bass_track> = true
	endif
	<add_song> = 1
	if (<guitar_or_bass_supported> = true && <has_guitar_or_bass_track> = false)
		<add_song> = 0
	endif
	return add_song = <add_song>
endscript

script songlist_create_jammode_array \{example_songs = 0}
	RequireParams \{[
			songlist
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
	GetArraySize <songlist>
	if (<array_size> = 0)
		return
	endif
	<total_songs> = <array_size>
	<i> = 0
	begin
	<jam_song_data> = (<songlist> [<i>])
	<add_song> = 1
	if StructureContains structure = <jam_song_data> never_show_in_setlist
		<add_song> = 0
	endif
	if (<add_song> = 1)
		songlist_create_check_jamsong_track_is_valid <...>
	endif
	if (<add_song> = 1)
		FormatText TextName = text '%a' a = (<jam_song_data>.FileName)
		FormatText checksumname = song '%i' i = <text>
		if (<example_songs> = 0)
			UpdateStructElement struct = <jam_song_data> element = jamsongindex value = <i>
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($jammode_songlist) element = <song>
			Change jammode_songlist = <array>
			AppendStruct struct = jammode_songlist_props Field = <song> params = {<jam_song_data>} GlobalStruct
		else
			<index> = (<i> + 1000)
			UpdateStructElement struct = <jam_song_data> element = jamsongindex value = <index>
			<jam_song_data> = <newstruct>
			AddArrayElement array = ($example_jam_songlist) element = <song>
			Change example_jam_songlist = <array>
			AppendStruct struct = example_jam_songlist_props Field = <song> params = {<jam_song_data>} GlobalStruct
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_songs>
endscript
