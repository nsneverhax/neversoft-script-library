
script ui_create_music_store_specialpacks_details 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = <previous_history> new_entry = (<pack_struct>.name) <do_not_animate>
	add_music_store_purchase_item {
		text = qs(0xf4a055f9)
		price = (<pack_struct>.price)
		choose_state = uistate_music_store_purchase
		choose_state_data = {previous_history = <previous_history> purchase_struct = <pack_struct>}
	}
	add_music_store_item \{text = qs(0xf4994161)}
	add_music_store_item {
		text = qs(0x14c06cc1)
		choose_state = uistate_music_store_songs_additional
		choose_state_data = {previous_history = <previous_history> list = [] pack_list = (<pack_struct>.name)}
	}
	spawnscriptnow \{music_store_fade_in_options}
	add_user_control_helper \{text = qs(0x52d4ae3c)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_specialpacks_details 
	destroy_music_store_menus
endscript
