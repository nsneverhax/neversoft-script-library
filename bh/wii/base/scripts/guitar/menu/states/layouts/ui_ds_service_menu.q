
script ui_create_ds_service_menu 
	make_generic_menu \{title = qs(0x16c03491)}
	add_generic_menu_text_item \{text = qs(0x76007943)
		pad_choose_script = ds_connection_helper
		pad_choose_params = {
			mode = freestyle
		}}
	add_generic_menu_text_item \{text = qs(0xc418623c)
		pad_choose_script = ds_connection_helper
		pad_choose_params = {
			mode = roadie_battle
		}}
	add_generic_menu_text_item \{text = qs(0x28336435)
		pad_choose_script = ds_connection_helper
		pad_choose_params = {
			mode = audience_party
		}}
	add_generic_menu_text_item \{text = qs(0x4c2cafda)
		pad_choose_script = end_ds_comm}
endscript

script ui_return_ds_service_menu 
	printf \{'ui_return_ds_service_menu'}
	printstruct <...>
	if GotParam \{canceled}
		create_new_generic_popup \{popup_type = ok_menu
			title = qs(0x4b5b86fa)
			text = qs(0x7d205436)
			ok_func = destroy_generic_popup}
	elseif GotParam \{error}
		create_new_generic_popup \{popup_type = error_menu
			error_func = destroy_generic_popup
			text = qs(0x0bdc3a1f)}
	else
	endif
endscript

script ui_destroy_ds_service_menu 
	generic_ui_destroy
endscript

script send_test_song_entry 
	ScriptAssert \{'send_test_song_entry: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
