
script ui_init_rock_archive \{source_mode = archive}
	printscriptinfo \{'ui_init_rock_archive'}
	Change \{g_songlist_last_visible_index = 4}
	SongList :se_setprops \{alpha = 0.0}
	removealias \{SongList}
	removealias \{current_menu}
endscript

script ui_create_rock_archive 
	printscriptinfo \{'ui_create_rock_archive'}
	songlist_clear_playlist
	Change \{g_songlist_create_playlist_menu_item_present = 0}
	Change \{g_songlist_current_pivot = 0}
	Change \{g_songlist_pivot_hilight_index = 0}
	SetMenuAutoRepeatTimes ((0.3, 0.0) + (($g_songlist_scroll_speed) * (0.0, 1.0)))
	Change \{g_songlist_archive_setup_complete = 0}
	if NOT ScreenElementExists \{id = songlist_music_store}
		songlist_create {
			list_name = gh_songlist
			mode = archive_entry
			pad_back_script = generic_event_back
			device_num = <device_num>
			exclusive_device = <exclusive_device>
		}
		songlist_pre_build
	endif
	CreateScreenElement \{Type = descinterface
		desc = 'rock_archive'
		id = songlist_rock_archive
		parent = root_window}
	archive_setup_filterspec \{target = sd}
	songlist_create {
		parent = <id>
		mode = archive
		list_name = gh_songlist
		archive_source = sd
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	SongList :SetTags \{cs_registered = true}
	archive_setup_filterspec \{target = wii}
	songlist_create {
		parent = <id>
		mode = archive
		list_name = gh_songlist
		archive_source = wii
		device_num = <device_num>
		exclusive_device = <exclusive_device>
	}
	SongList :SetTags \{cs_registered = true}
	archive_refresh_menus
endscript

script ui_deinit_rock_archive 
	printscriptinfo \{'ui_deinit_rock_archive'}
	if ScreenElementExists \{id = songlist_music_store}
		archive_choose_songlist \{target = music_store
			no_helpers}
		SongList :se_setprops \{alpha = 1.0}
	endif
	archive_songlist_destroy
endscript

script ui_destroy_rock_archive 
	printscriptinfo \{'ui_destroy_rock_archive'}
	archive_songlist_destroy
	clean_up_user_control_helpers
endscript
