onlinebetasongs = [
	areyougonnagomyway
	nevertoolate
	whativedone
]
tie_breaker = host
num_songs = num_1
net_song_countdown = 0
g_songlist_page_size = 0
0x4a37ada0 = false
g_num_local_song_picks = 0
g_songlist_warning_active = 0
g_online_songlist_warning_msg_ps3 = qs(0x67bd4b60)
g_online_songlist_warning_msg_xen = qs(0x9a494ced)
g_online_songlist_warning_title = qs(0x29815eae)
g_online_career_sl_warning_title = qs(0xd8b58345)
g_songlist_all_vocalists_warning = qs(0x2bb4f3ea)
current_songlist_song_preview = none
songlist_song_preview_changing = 0
target_songlist_song_preview = none
g_songlist_modes = {
	play_song = {
		title = qs(0x56fbf662)
	}
	playlist = {
		title = qs(0x188ec849)
	}
	music_store = {
		title = qs(0xa8e9637f)
	}
	leaderboard = {
		title = qs(0x4d9ad28f)
	}
	practice = {
		title = qs(0x4d9ad28f)
	}
	toprockers = {
		title = qs(0x4d9ad28f)
	}
	sing_a_long = {
		title = qs(0x51923839)
	}
}
g_songlist_sort_array = [
	{
		key = song_title
		text = qs(0xa8443859)
		alt_key = song_artist
	}
	{
		key = song_artist
		text = qs(0x16ace3e7)
		alt_key = song_title
	}
	{
		key = song_year
		text = qs(0x2404532a)
		alt_key = song_title
	}
	{
		key = song_genre_string
		text = qs(0xd83650ac)
		alt_key = song_title
	}
	{
		key = song_duration
		text = qs(0xbf2d8f52)
		alt_key = song_title
	}
	{
		key = song_source_txt
		text = qs(0xf851f58c)
		alt_key = song_title
	}
	{
		key = song_guitar_difficulty_rating
		text = qs(0xddd03b6f)
		alt_key = song_title
	}
	{
		key = song_bass_difficulty_rating
		text = qs(0xf5464675)
		alt_key = song_title
	}
	{
		key = song_drums_difficulty_rating
		text = qs(0x1ab278e5)
		alt_key = song_title
	}
	{
		key = song_vocals_difficulty_rating
		text = qs(0x45116eda)
		alt_key = song_title
	}
]
g_songlist_sort_indexes = {
	play_song = 0
	playlist = 0
	music_store = 0
	leaderboard = 0
	practice = 0
	toprockers = 0
	import = 0
	sing_a_long = 0
}
g_songlist_default_sort_index = 0
g_songlist_sort_index = 0
g_songlist_filterspec = [
]
g_songlist_invert_filterspec = 0
g_songlist_force_num_songs_to_choose = 0
g_songlist_ignore_pivot_hack = 0
g_songlist_current_pivot = 0
g_songlist_pivot_hilight_index = 0
g_songlist_last_visible_index = 6
g_songlist_playlist_detail_items = 12
g_songlist_mini_playlist_detail_items = 6
g_songlist_create_playlist_menu_item_present = 0
g_songlist_current_page = 0
g_max_playlist_size = 128
current_playlist = [
]
g_include_debug_songs = 0
g_songlist_mode = none
g_songlist_scroll_speed = 0.08
g_songlist_paging_speed = 0.04
g_songlist_detail_fade_time = 0.2
g_songlist_music_store_hilight_pos = (182.0, 180.0)
g_songlist_item_focus_rgba = [
	34
	20
	82
	255
]
g_songlist_item_unfocus_rgba = gh51_blue_lt
g_songlist_sub_item_focus_rgba = [
	0
	0
	0
	255
]
g_songlist_sub_item_unfocus_rgba = [
	127
	114
	196
	255
]
g_songlist_invalid_item_focus_rgba = [
	105
	105
	125
	185
]
g_songlist_invalid_item_unfocus_rgba = [
	105
	105
	125
	185
]
g_songlist_invalid_sub_item_focus_rgba = [
	110
	110
	130
	170
]
g_songlist_invalid_sub_item_unfocus_rgba = [
	110
	110
	130
	170
]
g_music_store_item_focus_rgba = [
	22
	26
	30
	255
]
g_music_store_item_unfocus_rgba = [
	113
	121
	133
	255
]
g_music_store_sub_item_focus_rgba = [
	22
	26
	30
	255
]
g_music_store_sub_item_unfocus_rgba = [
	113
	121
	133
	255
]
g_music_store_current_pack_checksum = null
g_music_store_patch_req_message = qs(0x8c609d9f)

script songlist_change_sort_index 
	requireparams \{[
			index
		]
		all}
	change g_songlist_sort_index = <index>
endscript

script songlist_reset_sort_index_to_default 
	change g_songlist_sort_index = ($g_songlist_default_sort_index)
endscript

script songlist_set_mode_sort_index 
	requireparams \{[
			mode
		]
		all}
	switch (<mode>)
		case play_song
		change structurename = g_songlist_sort_indexes play_song = ($g_songlist_sort_index)
		case playlist
		change structurename = g_songlist_sort_indexes playlist = ($g_songlist_sort_index)
		case music_store
		change structurename = g_songlist_sort_indexes music_store = ($g_songlist_sort_index)
		case leaderboard
		change structurename = g_songlist_sort_indexes leaderboard = ($g_songlist_sort_index)
		case practice
		change structurename = g_songlist_sort_indexes practice = ($g_songlist_sort_index)
		case toprockers
		change structurename = g_songlist_sort_indexes toprockers = ($g_songlist_sort_index)
		case sing_a_long
		change structurename = g_songlist_sort_indexes sing_a_long = ($g_songlist_sort_index)
	endswitch
endscript

script songlist_change_filterspec 
	requireparams \{[
			filterspec
		]
		all}
	change g_songlist_filterspec = <filterspec>
	if gotparam \{invert_filterspec}
		change \{g_songlist_invert_filterspec = 1}
	else
		change \{g_songlist_invert_filterspec = 0}
	endif
endscript

script songlist_clear_filterspec 
	change \{g_songlist_filterspec = [
		]}
	change \{g_songlist_invert_filterspec = 0}
endscript

script songlist_force_num_songs_to_choose 
	requireparams \{[
			num_songs
		]
		all}
	change g_songlist_force_num_songs_to_choose = <num_songs>
endscript

script songlist_dont_force_num_songs 
	change \{g_songlist_force_num_songs_to_choose = 0}
endscript

script is_a_playlist_loaded 
	getarraysize \{$current_playlist}
	if (<array_size> > 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script is_current_playlist_empty 
	if is_a_playlist_loaded
		return \{false}
	else
		return \{true}
	endif
endscript

script allow_songlist_manage_playlist_writes 
	gamemode_gettype
	if (<type> = freeplay)
		return \{false}
	endif
	band_lobby_get_is_guest device_num = ($g_gbm_savegame_device)
	if ((islocallysignedin controller = $g_gbm_savegame_device) && (<is_guest> = 0))
		get_savegame_from_controller controller = ($g_gbm_savegame_device)
		if get_savegame_has_saved_game savegame = <savegame>
			if is_autosave_on savegame = <savegame>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript
