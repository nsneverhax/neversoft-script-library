
script get_quickplay_song_score 
	if NOT GotParam \{difficulty_text_nl}
		if ($game_mode = p2_quickplay)
			get_difficulty_text_nl difficulty = ($current_difficulty_coop)
		else
			get_difficulty_text_nl difficulty = ($player1_status.difficulty)
		endif
	endif
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	GetGlobalTags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	GetGlobalTags <songname>
	return stars = <beststars> percent100 = <tr_percent100>
endscript
setlist_random_bg_images = 0x24d8810d
setlist_solid_lines = 0x24d8810d
setlist_dotted_lines = 0x24d8810d
setlist_loop_stars = 0x24d8810d
setlist_event_handlers = 0x24d8810d
set_song_icon = 0x24d8810d
get_tier_from_song = 0x24d8810d
clear_setlist_clip_and_art = 0x24d8810d
setlist_go_back = 0x24d8810d
create_setlist_menu = 0x24d8810d
create_setlist_scrolling_menu = 0x24d8810d
destroy_setlist_scrolling_menu = 0x24d8810d
destroy_setlist_songpreview_monitor = 0x24d8810d
destroy_setlist_menu = 0x24d8810d
setlist_choose_song = 0x24d8810d
setlist_debug_completesong = 0x24d8810d
setlist_debug_unlockall = 0x24d8810d
setlist_scroll = 0x24d8810d
setlist_display_random_bg_image = 0x24d8810d
change_tab = 0x24d8810d
reset_vars = 0x24d8810d
create_sl_assets = 0x24d8810d
setlist_show_helperbar = 0x24d8810d
setlist_return_to_2p_hub = 0x24d8810d
