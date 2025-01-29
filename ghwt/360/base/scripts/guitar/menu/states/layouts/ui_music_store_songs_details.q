
script ui_create_music_store_songs_details 
	if GotParam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	old_history = <previous_history>
	music_store_set_previous_history previous_history = <previous_history> new_entry = (<song_struct>.Name) <do_not_animate>
	add_music_store_purchase_item {
		text = qs(0xf4a055f9)
		price = (<song_struct>.price)
		choose_state = uistate_music_store_purchase
		choose_state_data = {previous_history = <previous_history> purchase_struct = <song_struct>}
	}
	add_music_store_item \{text = qs(0xf4994161)}
	if NOT GotParam \{no_additional_artist_album}
		if StructureContains \{structure = song_struct
				album}
			music_store_filter_list list = <full_list> filter = album value = (<song_struct>.album)
		else
			filtered_list = <full_list>
		endif
		add_music_store_item {
			text = qs(0xbfa890c3)
			replace_state = uistate_music_store_song_list
			replace_state_data = {previous_history = <old_history> list = <filtered_list> more_album = (<song_struct>.album)}
		}
		if StructureContains \{structure = song_struct
				artist}
			music_store_filter_list list = <full_list> filter = artist value = (<song_struct>.artist)
		else
			filtered_list = <full_list>
		endif
		add_music_store_item {
			text = qs(0x896e5b8a)
			replace_state = uistate_music_store_song_list
			replace_state_data = {previous_history = <old_history> list = <filtered_list> more_artist = (<song_struct>.artist)}
		}
	endif
	music_store_set_song_info_items option_struct = <song_struct>
	SpawnScriptNow \{music_store_fade_in_options}
	add_user_control_helper \{text = qs(0x52d4ae3c)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_songs_details 
	destroy_music_store_menus
endscript
