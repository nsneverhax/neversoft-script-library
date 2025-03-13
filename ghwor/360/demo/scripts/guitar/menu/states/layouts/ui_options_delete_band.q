
script ui_create_options_delete_band 
	text = [
		qs(0x7e925edf)
		qs(0x693fb0b2)
		qs(0x75472e4e)
	]
	create_dialog_box {
		body_text = <text>
		back_button_script = generic_event_back
		options = [
			{
				func = menu_confirm_band_delete_select_yes
				text = qs(0x271a1633)
			}
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
		]
	}
endscript

script ui_destroy_options_delete_band 
	destroy_dialog_box
endscript
