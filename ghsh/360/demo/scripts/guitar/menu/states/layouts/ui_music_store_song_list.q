
script ui_create_music_store_song_list 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	if gotparam \{more_artist}
		music_store_set_previous_history previous_history = <previous_history> new_entry = <more_artist> <do_not_animate>
	elseif gotparam \{more_album}
		music_store_set_previous_history previous_history = <previous_history> new_entry = <more_album> <do_not_animate>
	endif
	music_store_build_song_list list = <list> previous_history = <previous_history> no_additional_artist_album = 1
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
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script ui_destroy_music_store_song_list 
	destroy_music_store_menus
endscript
