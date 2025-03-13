
script ui_create_music_store_albums_details 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = <previous_history> new_entry = (<album_struct>.name) <do_not_animate>
	if NOT gotparam \{purchased}
		purchased = (<album_struct>.purchased)
		if (<purchased> = 0)
			if structurecontains structure = <album_struct> pack_contents
				music_store_pack_contents_purchased pack_contents = (<album_struct>.pack_contents)
			endif
		endif
	endif
	item_type = add_music_store_purchase_item
	if (<purchased> = 1)
		text = qs(0x40886130)
		contents_purchased = {contents_purchased}
		if NOT music_store_purchased_individually code = (<album_struct>.code)
			item_type = nullscript
		endif
	else
		text = qs(0xb7b2ba93)
	endif
	if isxenon
		choose_state = uistate_music_store_purchase
	else
		choose_state = uistate_music_store_terms
	endif
	if ((isxenon) || (<purchased> = 0))
		<item_type> {
			text = <text>
			price = (<album_struct>.price)
			price_fraction = (<album_struct>.price_fraction)
			purchased = <purchased>
			choose_state = <choose_state>
			choose_state_data = {previous_history = <previous_history> purchase_struct = {<album_struct> purchased = <purchased>}}
		}
	endif
	if gotparam \{purchase_item_id}
		if (<purchased> = 1)
			if marketplacefunc func = currently_downloading id = (<album_struct>.code)
				setscreenelementprops id = <purchase_item_id> options_list_item_text_text = qs(0x3ed675b6) options_list_item_text_rgba = [50 50 50 255]
				setscreenelementprops id = <purchase_item_id> not_focusable
				<purchase_item_id> :obj_spawnscriptnow music_store_check_download_status params = {id = (<album_struct>.code)}
			endif
		endif
	endif
	music_store_album_song_list pack_struct = <album_struct> <contents_purchased>
	music_store_sort_song_list list = <list>
	add_music_store_item {
		text = qs(0xa62cd1de)
		choose_state = uistate_music_store_songs_additional
		choose_state_data = {previous_history = <previous_history> list = <sorted_list> album_list = (<album_struct>.name)}
	}
	music_store_set_album_info_items option_struct = <album_struct>
	spawnscriptnow \{music_store_fade_in_options}
	spawnscriptnow music_store_request_album_cover_change params = {texture_name = (<album_struct>.asset_name) no_animation = 1}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script ui_destroy_music_store_albums_details 
	destroy_music_store_menus
endscript
