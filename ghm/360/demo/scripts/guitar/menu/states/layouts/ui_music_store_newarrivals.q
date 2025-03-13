
script ui_create_music_store_newarrivals 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = [] new_entry = qs(0x225f56dc) <do_not_animate>
	music_store_rotate_sort previous_history = <previous_history> type = new presort
	music_store_build_new_arrival_list previous_history = <previous_history>
	spawnscriptnow \{music_store_fade_in_options}
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

script ui_destroy_music_store_newarrivals 
	destroy_music_store_menus
endscript

script ui_init_music_store_newarrivals 
	music_store_get_new_arrival_list
	music_store_preload_album_covers list = <list>
endscript
