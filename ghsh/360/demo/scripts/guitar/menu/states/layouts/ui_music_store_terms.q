
script ui_create_music_store_terms 
	old_history = <previous_history>
	music_store_set_previous_history previous_history = <previous_history> new_entry = qs(0x74595ab9)
	music_store_turn_on_terms
	music_store_add_terms_item purchase_struct = <purchase_struct> previous_history = <old_history>
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0bbc9ad9)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_terms 
	destroy_music_store_menus
	music_store_destroy_terms_item
	music_store_turn_off_terms
endscript

script ui_init_music_store_terms 
	music_store_turn_off_motd
endscript

script ui_deinit_music_store_terms 
	music_store_turn_on_motd
endscript
