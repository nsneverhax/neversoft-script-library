
script ui_create_music_store_songs_additional 
	if GotParam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	old_history = <previous_history>
	if GotParam \{pack_list}
		formatText TextName = hist_text qs(0x77584f63) a = <pack_list>
		music_store_set_previous_history previous_history = <previous_history> new_entry = <hist_text> <do_not_animate>
	elseif GotParam \{album_list}
		formatText TextName = hist_text qs(0x77584f63) a = <album_list>
		music_store_set_previous_history previous_history = <previous_history> new_entry = <hist_text> <do_not_animate>
	endif
	music_store_build_song_list list = <list> previous_history = <previous_history> no_additional_artist_album = 1 show_album_only
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x00a93373)
		button = yellow
		z = 100000}
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script ui_destroy_music_store_songs_additional 
	destroy_music_store_menus
endscript
