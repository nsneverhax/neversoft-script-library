
script ui_create_music_store_specialpacks_details 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = <previous_history> new_entry = (<pack_struct>.name) <do_not_animate>
	if NOT gotparam \{purchased}
		purchased = (<pack_struct>.purchased)
		if (<purchased> = 0)
			if structurecontains structure = <pack_struct> pack_contents
				music_store_pack_contents_purchased pack_contents = (<pack_struct>.pack_contents)
			endif
		endif
	endif
	if isxenon
		choose_state = uistate_music_store_purchase
	else
		choose_state = uistate_music_store_terms
	endif
	if (<purchased> = 1)
		text = qs(0x40886130)
		contents_purchased = {contents_purchased}
	else
		text = qs(0xb7b2ba93)
	endif
	item_type = add_music_store_purchase_item
	if structurecontains structure = <pack_struct> album_pack_only
		text = qs(0x65cf77d8)
		not_focusable = {not_focusable}
		item_type = add_music_store_item
	endif
	if (<purchased> = 1)
		if NOT music_store_purchased_individually code = (<pack_struct>.code)
			item_type = nullscript
		endif
	endif
	if ((structurecontains structure = <pack_struct> album_pack_only) || (isxenon) || (<purchased> = 0))
		<item_type> {
			text = <text>
			price = (<pack_struct>.price)
			price_fraction = (<pack_struct>.price_fraction)
			purchased = <purchased>
			<not_focusable>
			choose_state = <choose_state>
			choose_state_data = {previous_history = <previous_history> purchase_struct = {<pack_struct> purchased = <purchased>}}
		}
	endif
	if gotparam \{purchase_item_id}
		if (<purchased> = 1)
			if marketplacefunc func = currently_downloading id = (<pack_struct>.code)
				setscreenelementprops id = <purchase_item_id> options_list_item_text_text = qs(0x3ed675b6) options_list_item_text_rgba = [50 50 50 255]
				setscreenelementprops id = <purchase_item_id> not_focusable
				<purchase_item_id> :obj_spawnscriptnow music_store_check_download_status params = {id = (<pack_struct>.code)}
			endif
		endif
	endif
	music_store_set_pack_info_items option_struct = <pack_struct>
	music_store_album_song_list pack_struct = <pack_struct> <contents_purchased>
	music_store_sort_song_list list = <list>
	add_music_store_item {
		text = qs(0xa62cd1de)
		choose_state = uistate_music_store_songs_additional
		choose_state_data = {previous_history = <previous_history> list = <sorted_list> pack_list = (<pack_struct>.name)}
	}
	spawnscriptnow \{music_store_fade_in_options}
	spawnscriptnow music_store_request_album_cover_change params = {texture_name = (<pack_struct>.asset_name) no_animation = 1}
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

script ui_destroy_music_store_specialpacks_details 
	destroy_music_store_menus
endscript
