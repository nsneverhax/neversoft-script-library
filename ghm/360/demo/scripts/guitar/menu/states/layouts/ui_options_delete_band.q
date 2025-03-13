
script ui_create_options_delete_band 
	text = [
		qs(0x7e925edf)
		qs(0x693fb0b2)
		qs(0x75472e4e)
	]
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		menu_pos = (640.0, 480.0)
		back_button_script = generic_event_back
		options = [
			{
				func = menu_confirm_band_delete_select_yes
				text = qs(0x271a1633)
				scale = (1.0, 1.0)
			}
			{
				func = generic_event_back
				text = qs(0xf7723015)
				scale = (1.0, 1.0)
			}
		]
	}
endscript

script ui_destroy_options_delete_band 
	destroy_popup_warning_menu
endscript
