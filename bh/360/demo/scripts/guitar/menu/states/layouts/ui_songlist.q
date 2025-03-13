store_songlist_respond_to_signin_changed = 0
store_songlist_respond_to_signin_changed_all_players = 0
store_songlist_respond_to_signin_changed_func = none

script songlist_signin_changed_func 
	ui_signin_changed_func <...>
	change \{g_songlist_ignore_pivot_hack = 1}
	songlist :getsingletag \{list_name}
	if NOT contentmanfunc func = refresh name = <list_name>
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
		enableduplicatesymbolwarning \{off}
		loadpak \{'pak/test_songlist/test_songlist.pak'}
		enableduplicatesymbolwarning
	endif
	change g_songlist_mode = <mode>
	if (<mode> = sing_a_long)
		change \{0x4a37ada0 = true}
	endif
	gamemode_gettype
	if ((<type> = quickplay) || (<type> = competitive) || (<type> = freeplay) || <mode> = sing_a_long)
		songlist_clear_filterspec
		songlist_dont_force_num_songs
	endif
	if (<type> = freeplay)
		change store_songlist_respond_to_signin_changed = ($respond_to_signin_changed)
		change store_songlist_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
		change store_songlist_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
		change \{respond_to_signin_changed = 0}
		change \{respond_to_signin_changed_all_players = 0}
		change \{respond_to_signin_changed_func = songlist_signin_changed_func}
	endif
	if (<mode> = music_store)
		songlist_clear_filterspec
		change \{g_songlist_last_visible_index = 4}
		change \{g_music_store_current_pack_checksum = null}
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
		destroy_band
		destroy_song_and_musicstudio_heaps \{do_unloads}
		destroy_bink_sub_heaps
		flushdeferreddeletes
		if isps3
			vmheap \{func = swap_out}
			vmheap \{func = alloc_commerce}
			mempushcontext \{heap_bink}
			meminitheap name = 'heap_preview_assets' size = (2200 * 1024) vram_size = (5700 * 1024)
			mempopcontext
			mempushcontext \{heap_bink}
			meminitheap name = 'heap_musicstore' size = (1000 * 1024) vram_size = (1000 * 1024)
			mempopcontext
		else
			mempushcontext \{heap_bink}
			meminitheap name = 'heap_preview_assets' size = (6400 * 1024)
			mempopcontext
			mempushcontext \{heap_bink}
			meminitheap name = 'heap_musicstore' size = (1 * 1024 * 1024)
			mempopcontext
		endif
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
	elseif (<mode> = import)
		songlist_clear_filterspec
		change \{g_songlist_last_visible_index = 4}
	else
		change \{g_songlist_last_visible_index = 5}
	endif
	if (<mode> = leaderboard)
		change \{respond_to_signin_changed = 1}
	endif
endscript

script do_gh4_songlist_init 
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
endscript

script ui_create_songlist \{mode = play_song
		locked = false}
	reset_song_loading_hack_global
	if screenelementexists \{id = songlist}
		ui_return_songlist
		return
	endif
	change \{g_songlist_create_playlist_menu_item_present = 0}
	change \{g_songlist_current_pivot = 0}
	change \{g_songlist_pivot_hilight_index = 0}
	change \{g_songlist_current_page = 0}
	change \{g_songlist_warning_active = 0}
	if (<mode> = sing_a_long)
		ui_sing_a_long_add_controllers_in_game
	endif
	if ((<mode> = leaderboard) || (<mode> = toprockers))
		change \{rich_presence_context = presence_leaderboards}
	elseif (<mode> = music_store)
		change \{rich_presence_context = presence_music_store}
	elseif (<mode> = import)
		change \{rich_presence_context = presence_menus}
	else
		change \{rich_presence_context = presence_gigboard_and_setlist}
	endif
	change \{songlist_song_preview_changing = 0}
	if ininternetmode
		songlist_clear_playlist
		spawn_player_drop_listeners \{drop_player_script = songlist_drop_player
			end_game_script = songlist_end_game}
		mode = playlist
		gamemode_gettype
		if (<type> = career)
			if ($g_net_leader_player_num > 0)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 0
					printf \{qs(0xcc39ea85)}
					change \{g_num_local_song_picks = 0}
				else
					printf \{qs(0xcb942ad6)}
					change g_num_local_song_picks = ($g_songlist_force_num_songs_to_choose)
				endif
			endif
		else
			getnumplayersingame \{local}
			change g_num_local_song_picks = <num_players>
		endif
	else
		gamemode_gettype
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
	current_menu :obj_spawnscriptnow ui_create_songlist_spawned params = {<...>}
	if innetgame
		current_menu :obj_spawnscriptnow \{net_songlist_warning_msg}
	endif
	if demobuild
		if ($kiosk_demo = 1)
			current_menu :obj_killspawnedscript \{name = demo_timeout_check}
			current_menu :obj_spawnscriptnow \{demo_timeout_check
				params = {
					func = songlist_back
				}}
		endif
	endif
	startrendering
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
	songlist_update_song_preview \{song = none}
endscript

script songlist_create_default_user_control_helpers \{mode = play_song}
	<controller> = ($primary_controller)
	if screenelementexists \{id = songlist}
		songlist :getsingletag \{controller}
	endif
	if (<mode> = play_song)
		add_user_control_helper \{text = qs(0x56fbf662)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if NOT demobuild
			if ((isps3) && (isdrumcontroller controller = <controller>))
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
		if NOT ininternetmode
			if NOT demobuild
				gamemode_gettype
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
		endif
		if NOT demobuild
			add_user_control_helper \{text = qs(0x00a93373)
				button = orange
				z = 100000}
		endif
	elseif (<mode> = playlist)
		gamemode_gettype
		if ($net_song_countdown = 0)
			if innetgame
				if ($g_num_local_song_picks > 0)
					if (<type> = career)
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
		if ((isps3) && (isdrumcontroller controller = <controller>))
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
		if NOT ininternetmode
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
		if NOT demobuild
			if ((isps3) && (isdrumcontroller controller = <controller>))
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
		endif
	elseif (<mode> = music_store)
		add_user_control_helper \{text = qs(0xb7b2ba93)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ((isps3) && (isdrumcontroller controller = <controller>))
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
		if ((isps3) && (isdrumcontroller controller = <controller>))
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
	change \{0x4a37ada0 = false}
	songlist_clean_up_spawned_scripts
	songlist_destroy
	destroy_dialog_box
	songlist_cleanup_scripts
	if (<mode> = music_store)
		change \{g_marketplace_responding_to_error = 0}
		music_store_kill_preview_music
		if screenelementexists \{id = songlist_detail}
			songlist_detail :se_setprops \{songlist_detail_album_sprite_texture = white}
		endif
		previewassetcache \{func = cancel_all_requests}
		previewassetcache \{func = unload_all}
		previewassetcache \{func = shutdown}
		memdeleteheap \{name = heap_musicstore}
		memdeleteheap \{name = heap_preview_assets}
		if isps3
			memdeleteheap \{name = heap_preview_assets_vram}
			memdeleteheap \{name = heap_musicstore_vram}
			vmheap \{func = free_commerce}
			vmheap \{func = swap_in}
		endif
		create_bink_sub_heaps
		create_song_and_musicstudio_heaps
	endif
	gamemode_gettype
	if (<type> = freeplay)
		change respond_to_signin_changed = ($store_songlist_respond_to_signin_changed)
		change respond_to_signin_changed_all_players = ($store_songlist_respond_to_signin_changed_all_players)
		change respond_to_signin_changed_func = ($store_songlist_respond_to_signin_changed_func)
	endif
endscript

script ui_destroy_songlist 
	spawnscriptnow \{destroy_songlist_song_preview}
	songlist_destroy
	change \{net_song_countdown = 0}
	clean_up_user_control_helpers
endscript

script ui_return_songlist 
	setmenuautorepeattimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	change \{generic_menu_block_input = 0}
	if songlist :desc_resolvealias \{name = alias_songlist_vmenu}
		assignalias id = <resolved_id> alias = current_menu
	else
		scriptassert \{qs(0xd78eb9f9)}
	endif
	current_menu :se_setprops \{alpha = 1.0}
	if gotparam \{bypass_return_script}
		ui_event_remove_params \{param = bypass_return_script}
		ui_event_remove_params \{param = ui_struct}
		<bypass_return_script> ui_struct = <ui_struct> no_pivot = 1
		return
	else
		songlist :getsingletag \{mode}
		if (($g_songlist_refresh_menus) = 1)
			change \{g_songlist_refresh_menus = 0}
			if gotparam \{no_pivot}
				ui_event_remove_params \{param = no_pivot}
				songlist_refresh_menus \{no_pivot = 1
					no_focus = 1}
			else
				songlist_refresh_menus \{no_focus = 1}
			endif
			if NOT gotparam \{selected_index}
				<selected_index> = 0
			endif
			launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		else
			clean_up_user_control_helpers
			songlist_create_default_user_control_helpers mode = <mode>
			songlist :getsingletag \{list_page_size}
			if (<list_page_size> <= ($g_songlist_last_visible_index + 1))
				user_control_destroy_helper \{button = yellow}
			endif
			current_menu :se_setprops \{unblock_events}
		endif
	endif
	if NOT (<mode> = music_store)
		if is_a_playlist_loaded
			songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
				params = {
					desc = songlist_detail
				}}
		endif
		current_menu :getsingletag \{allow_continue}
		if (<allow_continue> = 1)
			songlist_allow_continue
		else
			songlist_disallow_continue
		endif
	else
		songlist :se_setprops \{songlist_subheader_cont_alpha = 1.0
			songlist_sort_cont_alpha = 1.0}
		if NOT ($g_music_store_current_pack_checksum = null)
			if screenelementexists \{id = songlist}
				songlist :obj_spawnscriptnow \{songlist_update_sort_purchase_button}
			endif
		else
			songlist :getsingletag \{music_store_mode}
			if (<music_store_mode> = songs)
				songlist_music_store_allow_sorting
			endif
		endif
	endif
endscript

script songlist_cleanup_scripts 
	if scriptisrunning \{create_music_store_purchase_spawned}
		killspawnedscript \{name = create_music_store_purchase_spawned}
	endif
	if scriptisrunning \{songlist_request_page_when_ready}
		killspawnedscript \{name = songlist_request_page_when_ready}
	endif
endscript

script songlist_update_sort_purchase_button 
	songlist :getsingletag \{list_name}
	begin
	if contentmanfunc func = is_ready name = <list_name>
		contentmanfunc {
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
	if isps3
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
		current_menu :se_setprops \{event_handlers = [
				{
					pad_l1
					nullscript
				}
			]
			replace_handlers}
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

script songlist_update_song_preview \{song = none}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	if ($target_songlist_song_preview = <song>)
		return
	endif
	change \{target_songlist_song_preview = none}
	wait \{2
		gameframes}
	change target_songlist_song_preview = <song>
endscript

script songlist_cycle_song_previews \{play_time = 7.0
		fade_time = 1.0}
	requireparams \{[
			songs
		]
		all}
	getarraysize <songs>
	if (<array_size> > 0)
		begin
		<i> = 0
		begin
		<song> = (<songs> [<i>])
		change target_songlist_song_preview = <song>
		wait <play_time> seconds
		wait (<fade_time> + 0.1) seconds
		<i> = (<i> + 1)
		repeat <array_size>
		repeat
	endif
endscript

script songlist_kill_cycle_song_previews 
	killspawnedscript \{name = songlist_cycle_song_previews}
	change \{target_songlist_song_preview = none}
endscript

script destroy_songlist_song_preview 
	setscriptcannotpause
	songstoppreview
	songlist_update_song_preview \{song = none}
	if ($g_include_debug_songs = 1)
		unloadpak \{'pak/test_songlist/test_songlist.pak'}
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> = <support_part>)
			<used> = true
		endif
		getnextplayer player = <player>
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
	requireparams \{[
			songlist
		]
		all}
	if (<example_songs> = 0)
		change \{jammode_songlist = [
			]}
		change \{jammode_songlist_props = {
			}}
	else
		change \{example_jam_songlist = [
			]}
		change \{example_jam_songlist_props = {
			}}
	endif
	getarraysize <songlist>
	if (<array_size> = 0)
		return
	endif
	<total_songs> = <array_size>
	<i> = 0
	begin
	<jam_song_data> = (<songlist> [<i>])
	<add_song> = 1
	if structurecontains structure = <jam_song_data> never_show_in_setlist
		<add_song> = 0
	endif
	if (<add_song> = 1)
		songlist_create_check_jamsong_track_is_valid <...>
	endif
	if (<add_song> = 1)
		formattext textname = text '%a' a = (<jam_song_data>.filename)
		formattext checksumname = song '%i' i = <text>
		if (<example_songs> = 0)
			updatestructelement struct = <jam_song_data> element = jamsongindex value = <i>
			<jam_song_data> = <newstruct>
			addarrayelement array = ($jammode_songlist) element = <song>
			change jammode_songlist = <array>
			appendstruct struct = jammode_songlist_props field = <song> params = {<jam_song_data>} globalstruct
		else
			<index> = (<i> + 1000)
			updatestructelement struct = <jam_song_data> element = jamsongindex value = <index>
			<jam_song_data> = <newstruct>
			addarrayelement array = ($example_jam_songlist) element = <song>
			change example_jam_songlist = <array>
			appendstruct struct = example_jam_songlist_props field = <song> params = {<jam_song_data>} globalstruct
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_songs>
endscript
