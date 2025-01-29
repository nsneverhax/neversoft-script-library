
script ui_create_music_store_purchase 
	formatText TextName = text qs(0x3f136ba0) i = (<purchase_struct>.Name) a = (<purchase_struct>.artist)
	add_music_store_purchase_dialogue {
		text = <text>
		price = (<purchase_struct>.price)
	}
	add_music_store_item \{text = qs(0x642bc05f)
		pad_choose_script = generic_event_back}
	add_music_store_item \{text = qs(0x246547c5)}
	ui_music_store_purchase_add_info_items option_struct = <purchase_struct>
	SpawnScriptNow \{music_store_fade_in_options}
	music_store_set_previous_history previous_history = <previous_history> new_entry = qs(0xf4a055f9)
	add_user_control_helper \{text = qs(0x52d4ae3c)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_purchase 
	destroy_music_store_menus
endscript

script ui_music_store_purchase_add_info_items 
	RequireParams \{[
			option_struct
		]
		all}
	if ((<option_struct>.Type) = song)
		music_store_set_song_info_items option_struct = <option_struct>
	elseif ((<option_struct>.Type) = album)
		music_store_set_album_info_items option_struct = <option_struct>
	elseif ((<option_struct>.Type) = pack)
		music_store_set_pack_info_items option_struct = <option_struct>
	else
		ScriptAssert qs(0xda7bde3a) i = (<purchase_struct>.Name) donotresolve
	endif
endscript
