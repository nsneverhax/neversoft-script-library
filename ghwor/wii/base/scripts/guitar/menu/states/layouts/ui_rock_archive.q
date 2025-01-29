
script ui_init_rock_archive \{source_mode = archive}
	printscriptinfo \{'ui_init_rock_archive'}
	Change \{g_songlist_last_visible_index = 4}
	songlist_component :RemoveTags \{music_store_mode}
	SongList :se_setprops \{alpha = 0.0}
	removealias \{SongList}
	removealias \{current_menu}
endscript

script ui_create_rock_archive 
	printscriptinfo \{'ui_create_rock_archive'}
	songlist_clear_playlist
	Change \{g_songlist_current_pivot = 0}
	destroy_friend_feed
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	Change \{g_songlist_archive_setup_complete = 0}
	songlist_component :membfunc_songlist_uistack_setmaxmenuelements \{max_menu_elements = 5}
	CreateScreenElement \{Type = descinterface
		desc = 'rock_archive'
		id = songlist_rock_archive
		parent = root_window}
	if ($wii_entering_music_store = 1)
		list_name = marketplace
	else
		list_name = gh_songlist
	endif
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		waitgameframes \{num_game_frames = 5}
		if contentmanfunc func = is_ready Name = <list_name>
			break
		endif
	endif
	WaitOneGameFrame
	repeat
	songlist_create {
		parent = <id>
		mode = archive
		list_name = archive_sd
		archive_source = sd
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	archive_setup_filterspec \{target = sd}
	songlist_refresh_menus \{no_pivot = 1}
	wait_until_songlist_is_built
	songlist_create {
		parent = <id>
		mode = archive
		list_name = archive_wii
		archive_source = wii
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	archive_setup_filterspec \{target = wii}
	songlist_refresh_menus \{no_pivot = 1}
	wait_until_songlist_is_built
	Change \{g_songlist_archive_setup_complete = 1}
	archive_refresh_menus
endscript

script wait_until_songlist_is_built 
	begin
	songlist_component :GetSingleTag \{initial_built}
	songlist_component :GetSingleTag \{requires_build}
	if (<initial_built> = true && <requires_build> = FALSE)
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script ui_deinit_rock_archive 
	printscriptinfo \{'ui_deinit_rock_archive'}
	songlist_change_sort_index index = ($g_saved_songlist_sort_index)
	songlist_component :membfunc_songlist_uistack_resetmaxmenuelements
	if ($wii_entering_music_store = 1)
		AssignAlias \{id = songlist_music_store
			alias = SongList}
		songlist_create_detail_desc \{mode = music_store}
		contentmanfunc \{func = refresh
			Name = marketplace
			no_enum}
		begin
		if contentmanfunc \{func = is_ready
				Name = marketplace}
			break
		endif
		WaitOneGameFrame
		repeat
	endif
	archive_songlist_destroy
endscript

script ui_destroy_rock_archive 
	clean_up_user_control_helpers
endscript
